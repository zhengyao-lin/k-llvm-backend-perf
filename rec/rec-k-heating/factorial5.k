module FACTORIAL5-SYNTAX

syntax RECNatResult

syntax RECNat ::= RECNatResult

syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recfact(RECNat) [seqstrict]

endmodule

module FACTORIAL5
imports K-EQUAL
imports FACTORIAL5-SYNTAX

rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recfact(recd0()) => recs(recd0())
rule recfact(recs(REC_V_N:RECNatResult)) => rectimes(recs(REC_V_N:RECNatResult), recfact(REC_V_N:RECNatResult))

// eval: recfact(recs(recs(recs(recs(recs(recd0()))))))

endmodule
