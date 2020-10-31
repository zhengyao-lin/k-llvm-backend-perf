module ORDER-SYNTAX

syntax RECNat

syntax KItem ::= then(KItem, KItem)
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECNat ::= recf(RECNat) [function]
syntax RECNat ::= recg(RECNat) [function]

endmodule

module ORDER
imports K-EQUAL
imports ORDER-SYNTAX

rule recg(recd0()) => recd0()
rule recg(recs(REC_V_x:RECNat)) => REC_V_x:RECNat
rule recf(recs(REC_V_x:RECNat)) => recd0()
  requires REC_V_x:RECNat ==K recd0()
rule recf(recs(REC_V_x:RECNat)) => REC_V_x:RECNat
  requires REC_V_x:RECNat =/=K recd0()
rule recf(recd0()) => recs(recd0())

// eval: recf(recg(recd0()))

endmodule
