import os
import csv
import enum
import time
import json
import shlex
import tempfile
import argparse
import resource
import subprocess
import multiprocessing


class TestType(enum.Enum):
    UNKNOWN = 0
    VM = 1
    STATE = 2
    BLOCKCHAIN = 3


class Utils:
    @staticmethod
    def quote_command(args):
        return " ".join([ shlex.quote(arg) for arg in args ])

    @staticmethod
    def trim_long_string(s, max_len, trimmed_symbol="..."):
        if len(s) > max_len:
            return s[:max_len] + trimmed_symbol
        return s

    @staticmethod
    def popen_with_log(cmd, *args, **kwargs):
        print("\033[90m+ " + Utils.trim_long_string(Utils.quote_command(cmd), 256) + "\033[0m")
        return subprocess.Popen(cmd, *args, **kwargs)

    @staticmethod
    def popen_with_timing(cmd, *args, **kwargs):
        fd, path = tempfile.mkstemp()
        os.close(fd)

        def get_stats():
            with open(path) as stats_file:
                real_time, sys_time, user_time, max_mem, avg_mem = [ float(item) for item in stats_file.read().split() ]
                return {
                    "user_time": user_time,
                    "sys_time": sys_time,
                    "real_time": real_time,
                    "max_mem": max_mem,
                    "avg_mem": avg_mem,
                }

        timer = [
            "/usr/bin/time",
            # see https://linux.die.net/man/1/time
            "-f", "%e %S %U %M %t",
            "-o", path,
        ]

        return Utils.popen_with_log(timer + cmd, *args, **kwargs), get_stats

    """
    In the ethereum/test repo, there are (unfortunately) a few different test format:
    1. vmtest (present in /VMTests)
    2. state test (present in /GeneralStateTests)
    3. blockchain test (present in /BlockchainTests, same as /GeneralStateTests but different format)

    geth only supports 2
    openethereum only supports 1 and 2
    kevm only supports 1 and 3

    this function loads the test file and checks the type of the test
    """
    @staticmethod
    def load_and_check_test_format(json_path):
        with open(json_path) as json_file:
            test = json.load(json_file)

        if len(test) == 0:
            return test, TestType.UNKNOWN

        first_test = list(test.values())[0]

        if "exec" in first_test:
            return test, TestType.VM
        elif "env" in first_test:
            return test, TestType.STATE
        elif "genesisBlockHeader" in first_test:
            return test, TestType.BLOCKCHAIN
        else:
            return test, TestType.UNKNOWN

    @staticmethod
    def strip_0x(dat):
        return dat[2:] if dat.startswith("0x") else dat


class KEVMWrapper:
    def __init__(self, repo, schedule="DEFAULT", chain_id=1):
        self.repo = repo
        self.schedule = schedule
        self.chain_id = chain_id

        self.llvm_k_directory = os.path.join(repo, ".build", "defn", "llvm")
        self.llvm_k_interpreter = os.path.join(self.llvm_k_directory, "driver-kompiled", "interpreter")
        self.json_to_kore_script = os.path.join(repo, "kore-json.py")

        assert os.path.isdir(self.llvm_k_directory), "could not find kompiled directory"
        assert os.path.isfile(self.llvm_k_interpreter), "could not find kompiled directory"
        assert os.path.isfile(self.json_to_kore_script), "could not find json-to-kore script"

    def get_schedule_kast(self):
        return f"`{self.schedule}_EVM`(.KList)"

    def get_mode_kast(self, mode):
        return f"`{mode}`(.KList)"

    def run_vmtest(self, json_path):
        _, test_type = Utils.load_and_check_test_format(json_path)

        assert test_type != TestType.STATE, "kevm does not support the state test format"

        # run json to kore script
        proc = Utils.popen_with_log([
            "python",
            self.json_to_kore_script,
            json_path,
            self.get_schedule_kast(),
            self.get_mode_kast("NORMAL" if test_type == TestType.BLOCKCHAIN else "VMTESTS"),
            str(self.chain_id),
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        input_kore_source = proc.stdout.read()
        stderr = proc.stderr.read().decode()
        exitcode = proc.wait()
        if exitcode != 0:
            raise Exception(f"json-to-kore script {self.json_to_kore_script} returned non-zero exitcode {exitcode} and stderr:\n{stderr}")

        # run interpreter in the llvm_k_directory to get output state
        with tempfile.NamedTemporaryFile() as input_kore_file:
            with tempfile.NamedTemporaryFile() as output_kore_file:
                input_kore_file.write(input_kore_source)
                input_kore_file.flush()

                proc, get_stats = Utils.popen_with_timing([
                    self.llvm_k_interpreter,
                    input_kore_file.name,
                    "-1",
                    "/dev/null", # output_kore_file.name,
                ], stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL)

                # print(proc.stdout.read())
                # print(proc.stderr.read())

                exitcode = proc.wait()
                # print(open(output_kore_file.name).read())
                if exitcode != 0:
                    raise Exception(f"interpreter {self.llvm_k_interpreter} returned non-zero exitcode {exitcode}")

                return get_stats()


class GethWrapper:
    def __init__(self, repo):
        self.repo = repo
        self.evm_binary = os.path.join(repo, "build", "bin", "evm")
        assert os.path.isfile(self.evm_binary), f"could not find compiled evm binary {self.evm_binary}"

    def run_vmtest(self, json_path):
        # geth evm doesn't natively support the vmtest format
        # (https://ethdocs.org/en/latest/contracts-and-transactions/ethereum-tests/vm_tests/)
        # so we are manually setting up the account info and transaction info etc.

        test_config, test_type = Utils.load_and_check_test_format(json_path)

        # a VERY coarse approximation right now
        # only set the code and input data

        assert test_type != TestType.BLOCKCHAIN, "geth does not support full blockchain tests"

        total_ops = 0
        total_gas = 0
        def process_trace(line):
            nonlocal total_ops
            nonlocal total_gas
            # if line.startswith(b"{\"pc\""):
            #     total_ops += 1
            #     print("\r" + str(total_ops), end="")
            # else:
            #     print(line)
            try:
                obj = json.loads(line)
                if "op" in obj:
                    total_ops += 1
                    # print("\r" + str(total_ops), end="")
                if "gasCost" in obj:
                    total_gas += int(obj["gasCost"], 16)
            except:
                pass

        if test_type == TestType.VM:
            with tempfile.NamedTemporaryFile() as code_file:
                with tempfile.NamedTemporaryFile() as data_file:
                    # note: this is an approximation of
                    # what the test actually describes
                    assert len(test_config) == 1
                    (_, test_config), = test_config.items()

                    code_file.write(test_config["exec"]["code"].encode())
                    code_file.flush()

                    data_file.write(test_config["exec"]["data"].encode())
                    data_file.flush()

                    proc, get_stats = Utils.popen_with_timing([
                        self.evm_binary,
                        # "--json",
                        # "--nomemory",
                        # "--nostack",
                        "--codefile", code_file.name,
                        "--inputfile", data_file.name,
                        "run",
                    ], stderr=subprocess.PIPE, stdout=subprocess.DEVNULL)
                    while True:
                        line = proc.stderr.readline()
                        if line == b"": break
                        process_trace(line)
                    exitcode = proc.wait()
        else:
            # STATE or UNKNOWN test
            proc, get_stats = Utils.popen_with_timing([
                self.evm_binary,
                # "--json",
                # "--nomemory",
                # "--nostack",
                "statetest",
                json_path,
            ], stderr=subprocess.PIPE, stdout=subprocess.DEVNULL)
            while True:
                line = proc.stderr.readline()
                if line == b"": break
                process_trace(line)
            exitcode = proc.wait()

        if exitcode != 0:
            raise Exception(f"geth evm {self.evm_binary} returned non-zero exitcode {exitcode}")

        return { "total_ops": total_ops, "total_gas": total_gas, **get_stats() }


class OpenEthereumWrapper:
    def __init__(self, repo):
        self.repo = repo
        self.evm_binary = os.path.join(repo, "target", "debug", "openethereum-evm")
        assert os.path.isfile(self.evm_binary), f"could not find compiled binary {self.evm_binary}"

    def run_vmtest(self, json_path):
        test_config, test_type = Utils.load_and_check_test_format(json_path)

        assert test_type != TestType.BLOCKCHAIN, "openethereum does not support full blockchain tests"

        proc, get_stats = Utils.popen_with_timing([
            self.evm_binary,
            "stats-jsontests-vm" if test_type == TestType.VM else "state-test",
            json_path,
        ], stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL)

        exitcode = proc.wait()
        if exitcode != 0:
            raise Exception(f"openethereum evmbin {self.evm_binary} returned non-zero exitcode {exitcode}")

        return get_stats()


class PyEVMWrapper:
    def __init__(self, script):
        self.script = script
        assert os.path.isfile(self.script), f"could not find py-evm state test script {self.script}"

    def run_vmtest(self, json_path):
        test_config, test_type = Utils.load_and_check_test_format(json_path)

        assert test_type == TestType.STATE, "py-evm does not support this type of test"

        proc, get_stats = Utils.popen_with_timing([
            "python3",
            self.script,
            json_path,
        ], stderr=subprocess.DEVNULL)

        exitcode = proc.wait()
        if exitcode != 0:
            raise Exception(f"py-evm script {self.script} returned non-zero exitcode {exitcode}")

        return get_stats()


def main():
    parser = argparse.ArgumentParser(description="compare the performance of kevm with other evm implementations")
    parser.add_argument("impl", help="implementation to test, choose from: kevm, geth")
    parser.add_argument("repo", help="path to the evm-semantics repo")
    parser.add_argument("test", help="path to the test file or test directory")
    parser.add_argument("-o", help="output csv file")
    args = parser.parse_args()

    implementations = {
        "kevm": KEVMWrapper,
        "geth": GethWrapper,
        "openethereum": OpenEthereumWrapper,
        "pyevm": PyEVMWrapper,
    }

    assert args.impl in implementations, f"implementation {args.impl} not supported"

    wrapper = implementations[args.impl](args.repo)
    results = []

    header_written = False

    def run_one_test(path):
        nonlocal header_written

        result = wrapper.run_vmtest(path)
        print(result)

        if args.o is not None:
            with open(args.o, "a") as output:
                fields = [ "test_name" ] + list(result.keys())
                writer = csv.DictWriter(output, fieldnames=fields)

                if not header_written:
                    writer.writeheader()
                    header_written = True

                if os.path.isdir(args.test):
                    # remove the directory name if possible
                    test_name = path[len(args.test):]
                    if test_name.startswith("/"):
                        test_name = test_name[1:]
                else:
                    test_name = path

                row = { "test_name": test_name, **result }
                writer.writerow(row)

    if os.path.isdir(args.test):
        tests = [
            os.path.join(root, file_name)
            for root, dirs, files in os.walk(args.test)
            for file_name in files
            if file_name.endswith(".json")
        ]
    else:
        tests = [ args.test ]

    # clear output file if it exists
    if args.o is not None:
        open(args.o, "w").close()

    for i, test in enumerate(tests):
        _, test_type = Utils.load_and_check_test_format(test)
        print(f">>> [{i + 1}/{len(tests)}] testing {test} (type: {test_type})")
        try:
            run_one_test(test)
        except Exception as e:
            print("failed: " + repr(e))


if __name__ == "__main__":
    main()
