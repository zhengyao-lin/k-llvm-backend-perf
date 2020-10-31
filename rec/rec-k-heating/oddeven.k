module ODDEVEN-SYNTAX

syntax RECNatResult
syntax RECBoolResult

syntax RECNat ::= RECNatResult
syntax RECBool ::= RECBoolResult

syntax KResult ::= RECNatResult
syntax KResult ::= RECBoolResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECBool ::= recodd(RECNat) [function]
syntax RECBool ::= receven(RECNat) [function]

endmodule

module ODDEVEN
imports K-EQUAL
imports ODDEVEN-SYNTAX

rule recodd(recd0()) => recfalse()
rule recodd(recs(REC_V_N:RECNatResult)) => rectrue()
  requires receven(REC_V_N:RECNatResult) ==K rectrue()
rule recodd(recs(REC_V_N:RECNatResult)) => recfalse()
  requires receven(REC_V_N:RECNatResult) ==K recfalse()
rule receven(recd0()) => rectrue()
rule receven(recs(REC_V_N:RECNatResult)) => rectrue()
  requires recodd(REC_V_N:RECNatResult) ==K rectrue()
rule receven(recs(REC_V_N:RECNatResult)) => recfalse()
  requires recodd(REC_V_N:RECNatResult) ==K recfalse()

// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))
// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0())))))))))))))))))))))
// eval: recodd(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))))))))))))))))))

endmodule
