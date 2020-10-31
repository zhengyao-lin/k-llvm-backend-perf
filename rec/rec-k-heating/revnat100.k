module REVNAT100-SYNTAX

syntax RECNatResult
syntax RECListResult

syntax RECNat ::= RECNatResult
syntax RECList ::= RECListResult

syntax KResult ::= RECNatResult
syntax KResult ::= RECListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECList ::= recl(RECNat, RECList) [seqstrict]
syntax RECListResult ::= recl(RECNatResult, RECListResult)
syntax RECList ::= recnil()
syntax RECListResult ::= recnil()
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recd10()
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECList ::= recgen(RECNat) [seqstrict]
syntax RECList ::= recconc(RECList, RECList) [seqstrict]
syntax RECList ::= recrev(RECList) [seqstrict]

endmodule

module REVNAT100
imports K-EQUAL
imports REVNAT100-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recgen(recs(REC_V_N:RECNatResult)) => recl(recs(REC_V_N:RECNatResult), recgen(REC_V_N:RECNatResult))
rule recgen(recd0()) => recl(recd0(), recnil())
rule recconc(recl(REC_V_E:RECNatResult, REC_V_L1:RECListResult), REC_V_L2:RECListResult) => recl(REC_V_E:RECNatResult, recconc(REC_V_L1:RECListResult, REC_V_L2:RECListResult))
rule recconc(recnil(), REC_V_L2:RECListResult) => REC_V_L2:RECListResult
rule recrev(recl(REC_V_E:RECNatResult, REC_V_L1:RECListResult)) => recconc(recrev(REC_V_L1:RECListResult), recl(REC_V_E:RECNatResult, recnil()))
rule recrev(recnil()) => recnil()

// eval: recrev(recgen(rectimes(recd10(), recd10())))

endmodule
