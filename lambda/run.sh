#! /bin/bash

set -euxo pipefail

N=$1
OUTPUT=$2

if ! [ -d $OUTPUT ]; then
    echo $OUTPUT is not a directory
    exit 1
fi

for file in tests/ackermann-church.lambda tests/collatz-church.lambda tests/fib-church.lambda; do
    echo -n > $OUTPUT/haskell-$(basename $file).time
    echo -n > $OUTPUT/k-$(basename $file).time
    for i in $(seq 1 $N); do
        echo ">>> running test $file, trial $i"
        make $file.run-haskell 2>>$OUTPUT/haskell-$(basename $file).time
        make $file.run-k 2>>$OUTPUT/k-$(basename $file).time
    done
done
