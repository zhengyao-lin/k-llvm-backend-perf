module CHECK1-SYNTAX

syntax RECUSingletonResult
syntax RECNatResult

syntax RECUSingleton ::= RECUSingletonResult
syntax RECNat ::= RECNatResult

syntax KResult ::= RECUSingletonResult
syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECUSingleton ::= recUcons(RECNat) [seqstrict]
syntax RECUSingletonResult ::= recUcons(RECNatResult)
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recsucc(RECNat) [seqstrict]
syntax RECNatResult ::= recsucc(RECNatResult)

endmodule

module CHECK1
imports K-EQUAL
imports CHECK1-SYNTAX


// eval: recd0()

endmodule
