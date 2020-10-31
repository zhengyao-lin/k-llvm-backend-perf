module MERGESORT100-SYNTAX

syntax RECBoolResult
syntax RECNatResult
syntax RECNatListResult
syntax RECListPairResult

syntax RECBool ::= RECBoolResult
syntax RECNat ::= RECNatResult
syntax RECNatList ::= RECNatListResult
syntax RECListPair ::= RECListPairResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECNatResult
syntax KResult ::= RECNatListResult
syntax KResult ::= RECListPairResult
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
syntax RECListPair ::= recpair(RECNatList, RECNatList) [seqstrict]
syntax RECListPairResult ::= recpair(RECNatListResult, RECNatListResult)
syntax RECNat ::= recd10()
syntax RECBool ::= reclte(RECNat, RECNat) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECNatList ::= recrev(RECNat) [seqstrict]
syntax RECListPair ::= recsplit(RECNatList) [seqstrict]
syntax RECNatList ::= recmerge(RECNatList, RECNatList) [seqstrict]
syntax RECNatList ::= recmergesort(RECNatList) [seqstrict]
syntax RECNatList ::= recp1(RECListPair) [seqstrict]
syntax RECNatList ::= recp2(RECListPair) [seqstrict]

endmodule

module MERGESORT100
imports K-EQUAL
imports MERGESORT100-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule reclte(recd0(), recs(REC_V_N:RECNatResult)) => rectrue()
rule reclte(recs(REC_V_N:RECNatResult), recd0()) => recfalse()
rule reclte(recd0(), recd0()) => rectrue()
rule reclte(recs(REC_V_N:RECNatResult), recs(REC_V_M:RECNatResult)) => reclte(REC_V_N:RECNatResult, REC_V_M:RECNatResult)
rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recrev(recs(REC_V_N:RECNatResult)) => reccons(recs(REC_V_N:RECNatResult), recrev(REC_V_N:RECNatResult))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recmerge(recnil(), REC_V_L:RECNatListResult) => REC_V_L:RECNatListResult
rule recmerge(REC_V_L:RECNatListResult, recnil()) => REC_V_L:RECNatListResult
rule recmerge(reccons(REC_V_X:RECNatResult, REC_V_L1:RECNatListResult), reccons(REC_V_Y:RECNatResult, REC_V_L2:RECNatListResult)) => reccons(REC_V_X:RECNatResult, recmerge(REC_V_L1:RECNatListResult, reccons(REC_V_Y:RECNatResult, REC_V_L2:RECNatListResult)))
  requires reclte(REC_V_X:RECNatResult, REC_V_Y:RECNatResult) ==K rectrue()
rule recmerge(reccons(REC_V_X:RECNatResult, REC_V_L1:RECNatListResult), reccons(REC_V_Y:RECNatResult, REC_V_L2:RECNatListResult)) => reccons(REC_V_Y:RECNatResult, recmerge(reccons(REC_V_X:RECNatResult, REC_V_L1:RECNatListResult), REC_V_L2:RECNatListResult))
  requires reclte(REC_V_X:RECNatResult, REC_V_Y:RECNatResult) ==K recfalse()
rule recsplit(reccons(REC_V_X:RECNatResult, reccons(REC_V_Y:RECNatResult, REC_V_L:RECNatListResult))) => recpair(reccons(REC_V_X:RECNatResult, recp1(recsplit(REC_V_L:RECNatListResult))), reccons(REC_V_Y:RECNatResult, recp2(recsplit(REC_V_L:RECNatListResult))))
rule recsplit(recnil()) => recpair(recnil(), recnil())
rule recsplit(reccons(REC_V_X:RECNatResult, recnil())) => recpair(reccons(REC_V_X:RECNatResult, recnil()), recnil())
rule recmergesort(recnil()) => recnil()
rule recmergesort(reccons(REC_V_X:RECNatResult, recnil())) => reccons(REC_V_X:RECNatResult, recnil())
rule recmergesort(reccons(REC_V_X:RECNatResult, reccons(REC_V_Y:RECNatResult, REC_V_L:RECNatListResult))) => recmerge(recmergesort(reccons(REC_V_X:RECNatResult, recp1(recsplit(REC_V_L:RECNatListResult)))), recmergesort(reccons(REC_V_Y:RECNatResult, recp2(recsplit(REC_V_L:RECNatListResult)))))
rule recp1(recpair(REC_V_L1:RECNatListResult, REC_V_L2:RECNatListResult)) => REC_V_L1:RECNatListResult
rule recp2(recpair(REC_V_L1:RECNatListResult, REC_V_L2:RECNatListResult)) => REC_V_L2:RECNatListResult

// eval: recmergesort(recrev(rectimes(recd10(), recd10())))

endmodule
