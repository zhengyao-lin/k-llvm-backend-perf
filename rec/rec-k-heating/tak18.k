module TAK18-SYNTAX

syntax RECBoolResult
syntax RECNatResult
syntax RECIntResult

syntax RECBool ::= RECBoolResult
syntax RECNat ::= RECNatResult
syntax RECInt ::= RECIntResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECNatResult
syntax KResult ::= RECIntResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECInt ::= recPos(RECNat) [seqstrict]
syntax RECIntResult ::= recPos(RECNatResult)
syntax RECInt ::= recNeg(RECNat) [seqstrict]
syntax RECIntResult ::= recNeg(RECNatResult)
syntax RECBool ::= recgte(RECNat, RECNat) [function]
syntax RECBool ::= recgteInt(RECInt, RECInt) [function]
syntax RECInt ::= recpred(RECInt) [seqstrict]
syntax RECInt ::= recsucc(RECInt) [seqstrict]
syntax RECInt ::= rectak(RECInt, RECInt, RECInt) [seqstrict]

endmodule

module TAK18
imports K-EQUAL
imports TAK18-SYNTAX

rule recgte(recd0(), recd0()) => rectrue()
rule recgte(recs(REC_V_X:RECNatResult), recd0()) => rectrue()
rule recgte(recd0(), recs(REC_V_X:RECNatResult)) => recfalse()
rule recgte(recs(REC_V_X:RECNatResult), recs(REC_V_Y:RECNatResult)) => recgte(REC_V_X:RECNatResult, REC_V_Y:RECNatResult)
rule recgteInt(recPos(REC_V_X:RECNatResult), recPos(REC_V_Y:RECNatResult)) => recgte(REC_V_X:RECNatResult, REC_V_Y:RECNatResult)
rule recgteInt(recNeg(REC_V_X:RECNatResult), recNeg(REC_V_Y:RECNatResult)) => recgte(REC_V_Y:RECNatResult, REC_V_X:RECNatResult)
rule recgteInt(recPos(REC_V_X:RECNatResult), recNeg(REC_V_Y:RECNatResult)) => rectrue()
rule recgteInt(recNeg(REC_V_X:RECNatResult), recPos(REC_V_Y:RECNatResult)) => recfalse()
rule recpred(recPos(recd0())) => recNeg(recd0())
rule recpred(recPos(recs(REC_V_X:RECNatResult))) => recPos(REC_V_X:RECNatResult)
rule recpred(recNeg(REC_V_X:RECNatResult)) => recNeg(recs(REC_V_X:RECNatResult))
rule recsucc(recNeg(recd0())) => recPos(recd0())
rule recsucc(recNeg(recs(REC_V_X:RECNatResult))) => recNeg(REC_V_X:RECNatResult)
rule recsucc(recPos(REC_V_X:RECNatResult)) => recPos(recs(REC_V_X:RECNatResult))
rule rectak(REC_V_I:RECIntResult, REC_V_J:RECIntResult, REC_V_K:RECIntResult) => REC_V_K:RECIntResult
  requires recgteInt(REC_V_J:RECIntResult, REC_V_I:RECIntResult) ==K rectrue()
rule rectak(REC_V_I:RECIntResult, REC_V_J:RECIntResult, REC_V_K:RECIntResult) => rectak(rectak(recpred(REC_V_I:RECIntResult), REC_V_J:RECIntResult, REC_V_K:RECIntResult), rectak(recpred(REC_V_J:RECIntResult), REC_V_K:RECIntResult, REC_V_I:RECIntResult), rectak(recpred(REC_V_K:RECIntResult), REC_V_I:RECIntResult, REC_V_J:RECIntResult))
  requires recgteInt(REC_V_J:RECIntResult, REC_V_I:RECIntResult) ==K recfalse()

// eval: rectak(recPos(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))))), recPos(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))), recPos(recs(recs(recs(recs(recs(recs(recd0()))))))))

endmodule
