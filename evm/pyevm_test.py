"""
This script reads in a json file
with format described here
https://ethereum-tests.readthedocs.io/en/latest/test_types/gstate_tests.html

and perform a state test using the py-evm implementation

In addition, we also support running the VM tests (with a slightly different format)
"""

import json
import argparse

from eth_keys import keys
from eth import constants
# from eth.vm.base
from eth.vm.forks import IstanbulVM
from eth.vm.chain_context import ChainContext
from eth.chains.mainnet import BaseMainnetChain, MainnetChain, BlockHeader, BlockNumber
from eth.chains.mainnet.constants import MAINNET_CHAIN_ID
from eth.db.atomic import AtomicDB
from eth_utils import encode_hex, decode_hex
from eth._utils.db import apply_state_dict


def decode_storage(storage):
    return { int(k, 16): int(v, 16) for k, v in storage.items() }


def decode_account_state(pre_state):
    account_state = {}

    for account_hex in pre_state:
        account_hash = decode_hex(account_hex)
        account_info = pre_state[account_hex]
        
        account = {
            "balance": int(account_info["balance"], 16),
            "code": decode_hex(account_info["code"]),
            "nonce": int(account_info["nonce"], 16),
            "storage": decode_storage(account_info["storage"]),
        }

        account_state[account_hash] = account

    return account_state


def decode_current_block_params(env):
    return {
        "uncles_hash": constants.EMPTY_UNCLE_HASH,
        "transaction_root": constants.BLANK_ROOT_HASH,
        "nonce": constants.GENESIS_NONCE,
        "extra_data": constants.GENESIS_EXTRA_DATA,
        "receipt_root": constants.BLANK_ROOT_HASH,

        "coinbase": decode_hex(env["currentCoinbase"]),
        "difficulty": int(env["currentDifficulty"], 16),
        "block_number": int(env["currentNumber"], 16),
        "gas_limit": int(env["currentGasLimit"], 16),
        "timestamp": int(env.get("currentTimestamp", "0x0"), 16),
    }


def decode_transaction(vm, tx_config, indexes={ "data": 0, "gas": 0, "value": 0 }):
    priv_key = keys.PrivateKey(decode_hex(tx_config["secretKey"]))

    tx_params = {
        "nonce": int(tx_config["nonce"], 16),
        "gas_price": int(tx_config["gasPrice"], 16),
        "to": decode_hex(tx_config["to"]),
        
        # pick a combination of gas, data, value by the indices given
        "gas": int(tx_config["gasLimit"][indexes["gas"]], 16),
        "data": decode_hex(tx_config["data"][indexes["data"]]),
        "value": int(tx_config["value"][indexes["value"]], 16),
    }

    return vm.create_unsigned_transaction(**tx_params).as_signed_transaction(priv_key)


def decode_exec(exec_config):
    return {
        "origin": decode_hex(exec_config["origin"]),
        "gas_price": int(exec_config["gasPrice"], 16),
        "gas": int(exec_config["gas"], 16),
        "to": decode_hex(exec_config["address"]),
        "sender": decode_hex(exec_config["caller"]),
        "value": int(exec_config["value"], 16),
        "data": decode_hex(exec_config["data"]),
        "code": decode_hex(exec_config["code"]),
    }


def initialize_vm_and_state(state_test):
    account_state = decode_account_state(state_test["pre"])
    # print(account_state)

    base_db = AtomicDB()
    chain = MainnetChain(base_db)

    pre_genesis_header = BlockHeader(difficulty=0, block_number=-1, gas_limit=0)
    chain_context = ChainContext(MAINNET_CHAIN_ID)
    state = IstanbulVM.build_state(base_db, pre_genesis_header, chain_context)

    # apply custom state
    apply_state_dict(state, account_state)
    state.persist()

    # print("initial state", encode_hex(state.make_state_root()))

    current_block_params = decode_current_block_params(state_test["env"])
    current_block_header = BlockHeader(**current_block_params)

    # vm = chain.get_vm()
    vm = IstanbulVM(
        header=pre_genesis_header,
        chaindb=chain.chaindb,
        chain_context=chain_context,
        consensus_context=chain.consensus_context,
    )

    return vm, state, current_block_header


def perform_one_state_test(name, state_test):
    # print(f"testing {name}")

    vm, state, current_block_header = initialize_vm_and_state(state_test)

    if "exec" in state_test:
        # acutally the vm test format
        computation = vm.execute_bytecode(**decode_exec(state_test["exec"]))
        print(computation.get_gas_used())
    else:
        for fork_name in state_test["post"]:
            for test_config in state_test["post"][fork_name]:
                snapshot = state.snapshot()

                tx = decode_transaction(vm, state_test["transaction"], test_config["indexes"])

                # apply transaction to the curretn state
                vm.validate_transaction_against_header(current_block_header, tx)
                computation = state.apply_transaction(tx)

                # receipt = vm.make_receipt(current_block_header, tx, computation, state)
                # vm.validate_receipt(receipt)

                print(computation.get_gas_used())

                state.revert(snapshot)

                # TODO: fix the state root check
                # receipt, computation = vm.apply_transaction(current_block_header, tx)
                # print(receipt)
                # print(encode_hex(state.state_root))
                # print("gas used", computation.get_gas_used())
                # print("end state", encode_hex(state.make_state_root()))
                # print(encode_hex(state.get_code_hash(decode_hex("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b"))))
                # print(encode_hex(state.get_code_hash(decode_hex("0x095e7baea6a6c7c4c2dfeb977efac326af552d87"))))
                # state.commit
                # print("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", state.get_balance(decode_hex("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b")))
                # print("0x095e7baea6a6c7c4c2dfeb977efac326af552d87", state.get_balance(decode_hex("0x095e7baea6a6c7c4c2dfeb977efac326af552d87")))


    # header, receipts, computations = vm.apply_all_transactions(txns, current_block_header)

    # print(receipts)
    # print(computations[0].is_success)


def perform_all_state_test(state_tests):
    for name in state_tests:
        perform_one_state_test(name, state_tests[name])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("json", help="state test json file")
    args = parser.parse_args()

    with open(args.json) as json_file:
        state_tests = json.load(json_file)

    perform_all_state_test(state_tests)


if __name__ == "__main__":
    main()
