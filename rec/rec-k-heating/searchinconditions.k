module SEARCHINCONDITIONS-SYNTAX

syntax RECBoolResult

syntax RECBool ::= RECBoolResult

syntax KResult ::= RECBoolResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECBool ::= reca()
syntax RECBool ::= recnot(RECBool) [seqstrict]

endmodule

module SEARCHINCONDITIONS
imports K-EQUAL
imports SEARCHINCONDITIONS-SYNTAX

rule reca() => rectrue()
rule recnot(REC_V_X:RECBoolResult) => rectrue()
  requires REC_V_X:RECBoolResult ==K recfalse()
rule recnot(REC_V_X:RECBoolResult) => recfalse()
  requires REC_V_X:RECBoolResult ==K rectrue()

// eval: recnot(reca())

endmodule
