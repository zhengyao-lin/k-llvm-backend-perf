module ODDEVEN-SYNTAX

syntax RECNat
syntax RECBool

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECBool ::= recodd(RECNat) [function]
syntax RECBool ::= receven(RECNat) [function]

endmodule

module ODDEVEN
imports K-EQUAL
imports ODDEVEN-SYNTAX

rule recodd(recd0()) => recfalse()
rule recodd(recs(REC_V_N:RECNat)) => rectrue()
  requires receven(REC_V_N:RECNat) ==K rectrue()
rule recodd(recs(REC_V_N:RECNat)) => recfalse()
  requires receven(REC_V_N:RECNat) ==K recfalse()
rule receven(recd0()) => rectrue()
rule receven(recs(REC_V_N:RECNat)) => rectrue()
  requires recodd(REC_V_N:RECNat) ==K rectrue()
rule receven(recs(REC_V_N:RECNat)) => recfalse()
  requires recodd(REC_V_N:RECNat) ==K recfalse()

// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))
// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0())))))))))))))))))))))
// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))))))))))))

endmodule
