#! /bin/bash

set -euxo pipefail

N=$1
OUTPUT=$2

if ! [ -d $OUTPUT ]; then
    echo $OUTPUT is not a directory
    exit 1
fi

for file in tests/*.imp; do
    echo -n > $OUTPUT/haskell-$(basename $file).time
    echo -n > $OUTPUT/k-$(basename $file).time
    echo -n > $OUTPUT/bc-$(basename $file).time
    echo -n > $OUTPUT/ocaml-$(basename $file).time
    for i in $(seq 1 $N); do
        echo ">>> running test $file, trial $i"
        make $file.run-haskell 2>>$OUTPUT/haskell-$(basename $file).time
        make $file.run-k 2>>$OUTPUT/k-$(basename $file).time
        make $file.run-bc 2>>$OUTPUT/bc-$(basename $file).time
        make $file.run-ocaml 2>>$OUTPUT/ocaml-$(basename $file).time
    done
done
