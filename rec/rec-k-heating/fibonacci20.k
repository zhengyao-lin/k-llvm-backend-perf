module FIBONACCI20-SYNTAX

syntax RECNatResult

syntax RECNat ::= RECNatResult

syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recfibb(RECNat) [seqstrict]

endmodule

module FIBONACCI20
imports K-EQUAL
imports FIBONACCI20-SYNTAX

rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recfibb(recd0()) => recd0()
rule recfibb(recs(recd0())) => recs(recd0())
rule recfibb(recs(recs(REC_V_N:RECNatResult))) => recplus(recfibb(recs(REC_V_N:RECNatResult)), recfibb(REC_V_N:RECNatResult))

// eval: recfibb(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0())))))))))))))))))))))

endmodule
