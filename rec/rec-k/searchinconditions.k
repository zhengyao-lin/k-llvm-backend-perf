module SEARCHINCONDITIONS-SYNTAX

syntax RECBool

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBool ::= reca() [function]
syntax RECBool ::= recnot(RECBool) [function]

endmodule

module SEARCHINCONDITIONS
imports K-EQUAL
imports SEARCHINCONDITIONS-SYNTAX

rule reca() => rectrue()
rule recnot(REC_V_X:RECBool) => rectrue()
  requires REC_V_X:RECBool ==K recfalse()
rule recnot(REC_V_X:RECBool) => recfalse()
  requires REC_V_X:RECBool ==K rectrue()

// eval: recnot(reca())

endmodule
