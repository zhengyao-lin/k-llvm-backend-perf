module GARBAGECOLLECTION-SYNTAX

syntax RECNatResult

syntax RECNat ::= RECNatResult

syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recp()
syntax RECNatResult ::= recp()
syntax RECNat ::= recn()
syntax RECNatResult ::= recn()
syntax RECNat ::= recd1()
syntax RECNat ::= recf(RECNat, RECNat, RECNat, RECNat, RECNat) [seqstrict]
syntax RECNat ::= recc(RECNat, RECNat) [seqstrict]

endmodule

module GARBAGECOLLECTION
imports K-EQUAL
imports GARBAGECOLLECTION-SYNTAX

rule recd1() => recs(recd0())
rule recc(recd0(), REC_V_Y:RECNatResult) => REC_V_Y:RECNatResult
rule recc(recs(REC_V_X:RECNatResult), REC_V_Y:RECNatResult) => recs(recc(REC_V_X:RECNatResult, REC_V_Y:RECNatResult))
rule recf(REC_V_X:RECNatResult, REC_V_Y:RECNatResult, recs(REC_V_Z:RECNatResult), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, REC_V_Y:RECNatResult, REC_V_Z:RECNatResult, recc(REC_V_T:RECNatResult, REC_V_T:RECNatResult), REC_V_U:RECNatResult)
rule recf(REC_V_X:RECNatResult, recs(REC_V_Y:RECNatResult), recd0(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, REC_V_Y:RECNatResult, recp(), REC_V_T:RECNatResult, REC_V_T:RECNatResult)
rule recf(recs(REC_V_X:RECNatResult), recd0(), recd0(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, recn(), recp(), recd1(), recd0())
rule recf(recd0(), recd0(), recd0(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => REC_V_T:RECNatResult
rule recf(REC_V_X:RECNatResult, recs(REC_V_Y:RECNatResult), recp(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, REC_V_Y:RECNatResult, recp(), REC_V_T:RECNatResult, recs(REC_V_U:RECNatResult))
rule recf(REC_V_X:RECNatResult, recd0(), recp(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, recn(), recp(), recs(REC_V_T:RECNatResult), REC_V_U:RECNatResult)
rule recf(recs(REC_V_X:RECNatResult), recn(), recp(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => recf(REC_V_X:RECNatResult, recn(), recp(), REC_V_T:RECNatResult, REC_V_U:RECNatResult)
rule recf(recd0(), recn(), recp(), REC_V_T:RECNatResult, REC_V_U:RECNatResult) => REC_V_U:RECNatResult

// eval: recf(recs(recs(recs(recs(recs(recs(recd0())))))), recs(recs(recs(recs(recs(recd0()))))), recs(recs(recd0())), recd0(), recd1())
// eval: recf(recs(recs(recs(recs(recd0())))), recs(recs(recs(recd0()))), recs(recs(recs(recs(recs(recd0()))))), recd0(), recd1())

endmodule
