module EMPTY-SYNTAX

syntax RECNatResult

syntax RECNat ::= RECNatResult

syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recsucc(RECNat) [seqstrict]
syntax RECNatResult ::= recsucc(RECNatResult)

endmodule

module EMPTY
imports K-EQUAL
imports EMPTY-SYNTAX


// eval: recd0()

endmodule
