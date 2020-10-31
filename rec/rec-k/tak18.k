module TAK18-SYNTAX

syntax RECBool
syntax RECNat
syntax RECInt

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECInt ::= recPos(RECNat)
syntax RECInt ::= recNeg(RECNat)
syntax RECBool ::= recgte(RECNat, RECNat) [function]
syntax RECBool ::= recgteInt(RECInt, RECInt) [function]
syntax RECInt ::= recpred(RECInt) [function]
syntax RECInt ::= recsucc(RECInt) [function]
syntax RECInt ::= rectak(RECInt, RECInt, RECInt) [function]

endmodule

module TAK18
imports K-EQUAL
imports TAK18-SYNTAX

rule recgte(recd0(), recd0()) => rectrue()
rule recgte(recs(REC_V_X:RECNat), recd0()) => rectrue()
rule recgte(recd0(), recs(REC_V_X:RECNat)) => recfalse()
rule recgte(recs(REC_V_X:RECNat), recs(REC_V_Y:RECNat)) => recgte(REC_V_X:RECNat, REC_V_Y:RECNat)
rule recgteInt(recPos(REC_V_X:RECNat), recPos(REC_V_Y:RECNat)) => recgte(REC_V_X:RECNat, REC_V_Y:RECNat)
rule recgteInt(recNeg(REC_V_X:RECNat), recNeg(REC_V_Y:RECNat)) => recgte(REC_V_Y:RECNat, REC_V_X:RECNat)
rule recgteInt(recPos(REC_V_X:RECNat), recNeg(REC_V_Y:RECNat)) => rectrue()
rule recgteInt(recNeg(REC_V_X:RECNat), recPos(REC_V_Y:RECNat)) => recfalse()
rule recpred(recPos(recd0())) => recNeg(recd0())
rule recpred(recPos(recs(REC_V_X:RECNat))) => recPos(REC_V_X:RECNat)
rule recpred(recNeg(REC_V_X:RECNat)) => recNeg(recs(REC_V_X:RECNat))
rule recsucc(recNeg(recd0())) => recPos(recd0())
rule recsucc(recNeg(recs(REC_V_X:RECNat))) => recNeg(REC_V_X:RECNat)
rule recsucc(recPos(REC_V_X:RECNat)) => recPos(recs(REC_V_X:RECNat))
rule rectak(REC_V_I:RECInt, REC_V_J:RECInt, REC_V_K:RECInt) => REC_V_K:RECInt
  requires recgteInt(REC_V_J:RECInt, REC_V_I:RECInt) ==K rectrue()
rule rectak(REC_V_I:RECInt, REC_V_J:RECInt, REC_V_K:RECInt) => rectak(rectak(recpred(REC_V_I:RECInt), REC_V_J:RECInt, REC_V_K:RECInt), rectak(recpred(REC_V_J:RECInt), REC_V_K:RECInt, REC_V_I:RECInt), rectak(recpred(REC_V_K:RECInt), REC_V_I:RECInt, REC_V_J:RECInt))
  requires recgteInt(REC_V_J:RECInt, REC_V_I:RECInt) ==K recfalse()

// eval: rectak(recPos(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))))), recPos(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))), recPos(recs(recs(recs(recs(recs(recs(recd0()))))))))

endmodule
