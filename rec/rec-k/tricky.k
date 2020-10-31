module TRICKY-SYNTAX

syntax RECNSingleton
syntax RECUSingleton
syntax RECNat

syntax KItem ::= then(KItem, KItem)
syntax RECNSingleton ::= recNcons()
syntax RECUSingleton ::= recUcons(RECNat)
syntax RECNat ::= recd0()
syntax RECNat ::= recsucc(RECNat)
syntax RECNat ::= recd1() [function]
syntax RECNat ::= recd2() [function]
syntax RECNat ::= recd3() [function]
syntax RECNat ::= recf(RECNat) [function]

endmodule

module TRICKY
imports K-EQUAL
imports TRICKY-SYNTAX

rule recd1() => recsucc(recd0())
rule recd2() => recd0()
  requires recd0() ==K recd0()
rule recd3() => recd0()
  requires recd0() =/=K recd0()
rule recd3() => recd0()
  requires recsucc(recd0()) ==K recd0()
rule recd3() => recsucc(recd0())
  requires recsucc(recd0()) =/=K recd0()
rule recf(REC_V_N:RECNat) => REC_V_N:RECNat
  requires REC_V_N:RECNat =/=K recd0()
   andBool REC_V_N:RECNat =/=K recsucc(recd0())

// eval: recNcons()
// eval: recUcons(recd0())
// eval: recd1()
// eval: recd2()
// eval: recd3()

endmodule
