module ORDER-SYNTAX

syntax RECNatResult

syntax RECNat ::= RECNatResult

syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recf(RECNat) [seqstrict]
syntax RECNat ::= recg(RECNat) [seqstrict]

endmodule

module ORDER
imports K-EQUAL
imports ORDER-SYNTAX

rule recg(recd0()) => recd0()
rule recg(recs(REC_V_x:RECNatResult)) => REC_V_x:RECNatResult
rule recf(recs(REC_V_x:RECNatResult)) => recd0()
  requires REC_V_x:RECNatResult ==K recd0()
rule recf(recs(REC_V_x:RECNatResult)) => REC_V_x:RECNatResult
  requires REC_V_x:RECNatResult =/=K recd0()
rule recf(recd0()) => recs(recd0())

// eval: recf(recg(recd0()))

endmodule
