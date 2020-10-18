KOMPILE = ../deps/k/k-distribution/bin/kompile
KRUN = ../deps/k/k-distribution/bin/krun

TIME = time -p

# imp implementation in k
.PHONY: imp-k
imp-k: imp-k-kompiled/timestamp

imp-k-kompiled/timestamp: imp-k.md
	$(KOMPILE) --backend llvm -O3 --main-module IMP --syntax-module IMP-SYNTAX $<

%.imp.run-k: %.imp imp-k
	$(TIME) $(KRUN) $<

# imp implmenetation in haskell
.PHONY: imp-haskell
imp-haskell:
	cd imp-haskell && stack build --ghc-options -O3

%.imp.run-haskell: %.imp imp-haskell
	cd imp-haskell && $(TIME) stack run $(realpath $<)

# imp implementation in bc
%.imp.run-bc: %.imp
	cat $< | sed 's/int .*;//g' | sed 's/\/\/[^\n]*//g' | $(TIME) bc

# imp implementation in ocaml
imp-ocaml/_build/main.native: imp-ocaml/*.ml imp-ocaml/*.mly imp-ocaml/*.mll
	cd imp-ocaml && oasis setup && make

%.imp.run-ocaml: %.imp imp-ocaml/_build/main.native
	$(TIME) imp-ocaml/_build/main.native < $<
