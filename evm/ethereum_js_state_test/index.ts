/**
 * Based on https://github.com/ethereumjs/ethereumjs-vm/tree/master/packages/vm/examples/run-blockchain
 */

import VM from "ethereumjs-vm"
import Account from "ethereumjs-account"
import Blockchain from "ethereumjs-blockchain"
import * as utils from "ethereumjs-util"
import { promisify } from "util"
import PStateManager from "ethereumjs-vm/dist/state/promisified"

const Block = require("ethereumjs-block")
const BlockHeader = require("ethereumjs-block/header.js")
const fs = require("fs")
const realpath = promisify(fs.realpath)
const readFile = promisify(fs.readFile)

async function main() {
  if (process.argv.length !== 3) {
    console.error("expecting exactly one argument: <state test file>")
    process.exit(1)
  }

  const testPath = await realpath(process.argv[2])
  console.log("running state test: " + testPath)
  const testDataBatch = JSON.parse(await readFile(testPath))

  for (const testName of Object.keys(testDataBatch)) {
    console.log("running test " + testName)
    await runTest(testDataBatch[testName])
  }
}

async function runTest(testData: any) {
  const hardfork = testData.network.toLowerCase()

  const blockchain = new Blockchain({
    hardfork,
    // This flag can be control whether the blocks are validated. This includes:
    //    * Verifying PoW
    //    * Validating each blocks's difficulty, uncles, tries, header and uncles.
    validate: false,
  })

  // When verifying PoW, setting this cache improves the performance of subsequent runs of this
  // script. It has no effect if the blockchain is initialized with `validate: false`.
  // setEthashCache(blockchain)

  const vm = new VM({
    blockchain: blockchain,
    hardfork,
  })

  await setupPreConditions(vm, testData)

  await setGenesisBlock(blockchain, hardfork, testData)

  await putBlocks(blockchain, hardfork, testData)

  await vm.runBlockchain(blockchain)

  const blockchainHead = await promisify<any>(vm.blockchain.getHead.bind(vm.blockchain))()

  const newHeadHash = "0x" + blockchainHead.hash().toString("hex")

  if (newHeadHash !== testData.lastblockhash) {
    console.log("unexpected hash " + newHeadHash + ", instead of " + testData.lastblockhash)
    process.exit(1)
  }
}

// function setEthashCache(blockchain: any) {
//   if (blockchain.validate) {
//     blockchain.ethash.cacheDB = level("./.cachedb")
//   }
// }

async function setupPreConditions(vm: VM, testData: any) {
  const psm = new PStateManager(vm.stateManager)

  await psm.checkpoint()

  for (const address of Object.keys(testData.pre)) {
    const addressBuf = utils.toBuffer(address)

    const acctData = testData.pre[address]
    const account = new Account({
      nonce: acctData.nonce,
      balance: acctData.balance,
    })

    await psm.putAccount(addressBuf, account)

    for (const hexStorageKey of Object.keys(acctData.storage)) {
      const val = utils.toBuffer(acctData.storage[hexStorageKey])
      const storageKey = utils.setLength(utils.toBuffer(hexStorageKey), 32)

      await psm.putContractStorage(addressBuf, storageKey, val)
    }

    const codeBuf = utils.toBuffer(acctData.code || "0x")

    await psm.putContractCode(addressBuf, codeBuf)
  }

  await psm.commit()
}

async function setGenesisBlock(blockchain: any, hardfork: string, testData: any) {
  const genesisBlock = new Block({ hardfork })
  genesisBlock.header = new BlockHeader(testData.genesisBlockHeader, { hardfork })

  await promisify(blockchain.putGenesis.bind(blockchain))(genesisBlock)
}

async function putBlocks(blockchain: any, hardfork: string, testData: any) {
  for (const blockData of testData.blocks) {
    const block = new Block(utils.toBuffer(blockData.rlp), { hardfork })
    await promisify(blockchain.putBlock.bind(blockchain))(block)
  }
}

main()
  .then(() => process.exit(0))
  .catch(err => {
    console.error(err)
    process.exit(1)
  })
