KOMPILE = ../deps/k/k-distribution/bin/kompile
KRUN = ../deps/k/k-distribution/bin/krun

TIME = time -p

# lambda implementation in k
.PHONY: lambda-k
lambda-k: lambda-k-kompiled/timestamp

lambda-k-kompiled/timestamp: lambda-k.md
	$(KOMPILE) --backend llvm -O3 --main-module LAMBDA --syntax-module LAMBDA-SYNTAX $<

%.lambda.run-k: %.lambda lambda-k
	$(TIME) $(KRUN) $<

# lambda implementation in haskell
.PHONY: lambda-haskell
lambda-haskell:
	cd lambda-haskell && stack build --ghc-options -O3

%.lambda.run-haskell: %.lambda lambda-haskell
	cd lambda-haskell && $(TIME) stack run $(realpath $<)
