module TRICKY-SYNTAX

syntax RECNSingletonResult
syntax RECUSingletonResult
syntax RECNatResult

syntax RECNSingleton ::= RECNSingletonResult
syntax RECUSingleton ::= RECUSingletonResult
syntax RECNat ::= RECNatResult

syntax KResult ::= RECNSingletonResult
syntax KResult ::= RECUSingletonResult
syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNSingleton ::= recNcons()
syntax RECNSingletonResult ::= recNcons()
syntax RECUSingleton ::= recUcons(RECNat) [seqstrict]
syntax RECUSingletonResult ::= recUcons(RECNatResult)
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recsucc(RECNat) [seqstrict]
syntax RECNatResult ::= recsucc(RECNatResult)
syntax RECNat ::= recd1()
syntax RECNat ::= recd2()
syntax RECNat ::= recd3()
syntax RECNat ::= recf(RECNat) [seqstrict]

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
rule recf(REC_V_N:RECNatResult) => REC_V_N:RECNatResult
  requires REC_V_N:RECNatResult =/=K recd0()
   andBool REC_V_N:RECNatResult =/=K recsucc(recd0())

// eval: recNcons()
// eval: recUcons(recd0())
// eval: recd1()
// eval: recd2()
// eval: recd3()

endmodule
