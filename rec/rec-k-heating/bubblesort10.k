module BUBBLESORT10-SYNTAX

syntax RECBoolResult
syntax RECNatResult
syntax RECNatListResult

syntax RECBool ::= RECBoolResult
syntax RECNat ::= RECNatResult
syntax RECNatList ::= RECNatListResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECNatResult
syntax KResult ::= RECNatListResult
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
syntax RECNat ::= recd10()
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECNatList ::= recbubsort(RECNat, RECNatList) [seqstrict]
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECNatList ::= recrev(RECNat) [seqstrict]
syntax RECNat ::= recfact(RECNat) [seqstrict]

endmodule

module BUBBLESORT10
imports K-EQUAL
imports BUBBLESORT10-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule reclt(recd0(), recd0()) => recfalse()
rule reclt(recd0(), recs(REC_V_N:RECNatResult)) => rectrue()
rule reclt(recs(REC_V_N:RECNatResult), recd0()) => recfalse()
rule reclt(recs(REC_V_N:RECNatResult), recs(REC_V_M:RECNatResult)) => reclt(REC_V_N:RECNatResult, REC_V_M:RECNatResult)
rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recfact(recd0()) => recs(recd0())
rule recfact(recs(REC_V_N:RECNatResult)) => rectimes(recs(REC_V_N:RECNatResult), recfact(REC_V_N:RECNatResult))
rule recrev(recs(REC_V_N:RECNatResult)) => recbubsort(recs(REC_V_N:RECNatResult), recrev(REC_V_N:RECNatResult))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recbubsort(REC_V_N:RECNatResult, recnil()) => reccons(REC_V_N:RECNatResult, recnil())
rule recbubsort(REC_V_N:RECNatResult, reccons(REC_V_M:RECNatResult, REC_V_L:RECNatListResult)) => reccons(REC_V_M:RECNatResult, recbubsort(REC_V_N:RECNatResult, REC_V_L:RECNatListResult))
  requires reclt(REC_V_M:RECNatResult, REC_V_N:RECNatResult) ==K rectrue()
rule recbubsort(REC_V_N:RECNatResult, reccons(REC_V_M:RECNatResult, REC_V_L:RECNatListResult)) => reccons(REC_V_N:RECNatResult, recbubsort(REC_V_M:RECNatResult, REC_V_L:RECNatListResult))
  requires reclt(REC_V_M:RECNatResult, REC_V_N:RECNatResult) ==K recfalse()

// eval: recrev(recd10())

endmodule
