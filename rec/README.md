# Testing K in REC benchmark

Rewriting Engine Competition (REC) is a competition and a collection of benchmarks designed
to test the performance of term rewriting. Many algebraic or functional languages implement
some level of term rewriting, and the aim of REC is to provide a common benchmark.

See these papers for more info

> Benchmarking Implementations of Term Rewriting and Pattern Matching in Algebraic, Functional, and Object-Oriented Languages – The 4th Rewrite Engines Competition  
> Hubert Garavel, Mohammad-Ali Tabikh, and Imad-Seddik Arrada

> The Rewrite Engines Competitions: A RECtrospective  
> Francisco Durán, Hubert Garavel

REC currently supports 13 languages including Haskell, Maude, and OCaml.
The benchmarks in REC are written in a custom language called REC-2017, featuring the most
basically functionalities common in all the 13 languages supported.

This repo is an attempt to implement the translation of REC-2017 to K, so that
we can compare the performance of the LLVM backend of K with the other tools/languages
already supported by REC.

## Fetching the benchmark

The benchmark is publically accessible by (as mentioned in the paper above)
```
svn checkout svn://scm.gforge.inria.fr/svnroot/rec
```

The benchmark in `deps/2015-CONVECS` is a copy of the svn source above

TODO
