module CHECK2-SYNTAX

syntax RECBoolResult

syntax RECBool ::= RECBoolResult

syntax KResult ::= RECBoolResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECBool ::= recnotBool(RECBool) [seqstrict]
syntax RECBool ::= recandBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recorBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recxorBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recimpliesBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= reciffBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= receqBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recneBool(RECBool, RECBool) [seqstrict]

endmodule

module CHECK2
imports K-EQUAL
imports CHECK2-SYNTAX

rule recnotBool(rectrue()) => recfalse()
rule recnotBool(recfalse()) => rectrue()
rule recandBool(REC_V_P:RECBoolResult, rectrue()) => REC_V_P:RECBoolResult
rule recandBool(REC_V_P:RECBoolResult, recfalse()) => recfalse()
rule recorBool(REC_V_P:RECBoolResult, rectrue()) => rectrue()
rule recorBool(REC_V_P:RECBoolResult, recfalse()) => REC_V_P:RECBoolResult
rule recxorBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult) => recorBool(recandBool(REC_V_P:RECBoolResult, recnotBool(REC_V_Q:RECBoolResult)), recandBool(REC_V_Q:RECBoolResult, recnotBool(REC_V_P:RECBoolResult)))
rule recimpliesBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult) => recorBool(REC_V_Q:RECBoolResult, recnotBool(REC_V_P:RECBoolResult))
rule reciffBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult) => recandBool(recimpliesBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult), recimpliesBool(REC_V_Q:RECBoolResult, REC_V_P:RECBoolResult))
rule receqBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult) => reciffBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult)
rule recneBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult) => recxorBool(REC_V_P:RECBoolResult, REC_V_Q:RECBoolResult)

// eval: recneBool(recfalse(), rectrue())

endmodule
