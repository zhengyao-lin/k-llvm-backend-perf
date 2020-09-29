# KEVM performance and comparison with other implementations

## Results

There are some performance test results in the `results/` directory.
These results were obtained in a laptop with an 8-core cpu Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz
and 16 gigs of memory.

## Benchmarking kevm

Build dependencies (`k` and `evm-semantics`)
```
make k evm-semantics
```

The general state tests in `tests/GeneralStateTests-kevm` also works
```
python3 -m evm.perf kevm deps/evm-semantics deps/ethereum-tests/BlockchainTests/GeneralStateTests -o <output csv file>
```

## Benchmarking geth

```
make geth
python3 -m evm.perf geth deps/go-ethereum deps/ethereum-tests/GeneralStateTests -o <output csv file>
```

## Benchmarking openethereum (parity)

Build dependencies
```
make openethereum
python3 -m evm.perf openethereum deps/openethereum deps/ethereum-tests/GeneralStateTests -o <output csv file>
```

## Benchmarking py-evm

Install py-evm
```
python3 -m pip install evm/requirements.txt
```

Then run the tests by
```
python3 -m evm.perf pyevm evm/py-evm-state-test.py deps/ethereum-tests/GeneralStateTests -o <output csv file>
```

## Benchmarking ethereum-js

Fetch ethereum-js
```
cd evm/ethereum_js_state_test
npm install
```

Then run the benchmark
```
python3 -m evm.perf ethereumjs evm/ethereum_js_state_test deps/ethereum-tests/BlockchainTests/GeneralStateTests -o <output csv file>
```

## Compare results

To compare the reulsts of different implementations, run
```
python3 -m evm.graph_ops_time evm/results/general-state-tests/total_ops.csv \
  evm/results/general-state-tests/geth-1.9.15-state-tests.csv \
  evm/results/general-state-tests/kevm-O3-d2de458-state-tests.csv \
  evm/results/general-state-tests/openethereum-11e40fa-state-tests.csv \
  evm/results/general-state-tests/pyevm-0.3.0a18-state-test.csv \
  evm/results/general-state-tests/ethereumjs-4.2.0-state-tests.csv
```
