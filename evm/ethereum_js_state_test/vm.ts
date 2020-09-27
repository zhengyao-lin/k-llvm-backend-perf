/**
 * Based on https://github.com/ethereumjs/ethereumjs-vm/tree/master/packages/vm/examples/run-blockchain
 */

import VM from "ethereumjs-vm"
import Blockchain from "ethereumjs-blockchain"
import * as utils from "ethereumjs-util"
import { promisify } from "util"

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
  const blockchain = new Blockchain({
    validate: false,
  })

  const vm = new VM({
    blockchain: blockchain,
  })

  const result = await vm.runCode({
    gasPrice: utils.toBuffer(testData.exec.gasPrice),
    gasLimit: new utils.BN(utils.toBuffer(testData.exec.gas)),
    origin: utils.toBuffer(testData.exec.origin),
    caller: utils.toBuffer(testData.exec.caller),
    code: utils.toBuffer(testData.exec.code),
    data: utils.toBuffer(testData.exec.data),
    value: utils.toBuffer(testData.exec.value),
    address: utils.toBuffer(testData.exec.address),
  } as any)

  console.log("gas used: " + result.gasUsed.toNumber())
}

main()
  .then(() => process.exit(0))
  .catch(err => {
    console.error(err)
    process.exit(1)
  })
