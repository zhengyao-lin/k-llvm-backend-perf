module QUICKSORT100-SYNTAX

syntax RECBoolResult
syntax RECNatResult
syntax RECNatListResult
syntax RECNatListPairResult

syntax RECBool ::= RECBoolResult
syntax RECNat ::= RECNatResult
syntax RECNatList ::= RECNatListResult
syntax RECNatListPair ::= RECNatListPairResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECNatResult
syntax KResult ::= RECNatListResult
syntax KResult ::= RECNatListPairResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNatList ::= recnil()
syntax RECNatListResult ::= recnil()
syntax RECNatList ::= reccons(RECNat, RECNatList) [seqstrict]
syntax RECNatListResult ::= reccons(RECNatResult, RECNatListResult)
syntax RECNatListPair ::= recpair(RECNatList, RECNatList) [seqstrict]
syntax RECNatListPairResult ::= recpair(RECNatListResult, RECNatListResult)
syntax RECBool ::= recnot(RECBool) [function]
syntax RECNat ::= recd10()
syntax RECBool ::= recst(RECNat, RECNat) [function]
syntax RECBool ::= recget(RECNat, RECNat) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECNatList ::= recrev(RECNat) [seqstrict]
syntax RECNatListPair ::= recsplit(RECNat, RECNatList) [seqstrict]
syntax RECNatList ::= recqsort(RECNatList) [seqstrict]
syntax RECNatList ::= recappend(RECNatList, RECNatList) [seqstrict]
syntax RECNatList ::= recp1(RECNatListPair) [seqstrict]
syntax RECNatList ::= recp2(RECNatListPair) [seqstrict]

endmodule

module QUICKSORT100
imports K-EQUAL
imports QUICKSORT100-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule recnot(rectrue()) => recfalse()
rule recnot(recfalse()) => rectrue()
rule recst(recd0(), recs(REC_V_N:RECNatResult)) => rectrue()
rule recst(recs(REC_V_N:RECNatResult), recd0()) => recfalse()
rule recst(recd0(), recd0()) => recfalse()
rule recst(recs(REC_V_N:RECNatResult), recs(REC_V_M:RECNatResult)) => recst(REC_V_N:RECNatResult, REC_V_M:RECNatResult)
rule recget(REC_V_N:RECNatResult, REC_V_M:RECNatResult) => recnot(recst(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recrev(recs(REC_V_N:RECNatResult)) => reccons(recs(REC_V_N:RECNatResult), recrev(REC_V_N:RECNatResult))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recsplit(REC_V_N:RECNatResult, reccons(REC_V_M:RECNatResult, REC_V_L:RECNatListResult)) => recpair(recp1(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult)), reccons(REC_V_M:RECNatResult, recp2(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult))))
  requires recst(REC_V_N:RECNatResult, REC_V_M:RECNatResult) ==K rectrue()
rule recsplit(REC_V_N:RECNatResult, reccons(REC_V_M:RECNatResult, REC_V_L:RECNatListResult)) => recpair(reccons(REC_V_M:RECNatResult, recp1(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult))), recp2(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult)))
  requires recget(REC_V_N:RECNatResult, REC_V_M:RECNatResult) ==K rectrue()
rule recsplit(REC_V_N:RECNatResult, recnil()) => recpair(recnil(), recnil())
rule recappend(reccons(REC_V_N:RECNatResult, REC_V_L:RECNatListResult), REC_V_LT:RECNatListResult) => reccons(REC_V_N:RECNatResult, recappend(REC_V_L:RECNatListResult, REC_V_LT:RECNatListResult))
rule recappend(recnil(), REC_V_L:RECNatListResult) => REC_V_L:RECNatListResult
rule recqsort(recnil()) => recnil()
rule recqsort(reccons(REC_V_N:RECNatResult, REC_V_L:RECNatListResult)) => recappend(recqsort(recp1(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult))), reccons(REC_V_N:RECNatResult, recqsort(recp2(recsplit(REC_V_N:RECNatResult, REC_V_L:RECNatListResult)))))
rule recp1(recpair(REC_V_L1:RECNatListResult, REC_V_L2:RECNatListResult)) => REC_V_L1:RECNatListResult
rule recp2(recpair(REC_V_L1:RECNatListResult, REC_V_L2:RECNatListResult)) => REC_V_L2:RECNatListResult

// eval: recqsort(recrev(rectimes(recd10(), recd10())))

endmodule
