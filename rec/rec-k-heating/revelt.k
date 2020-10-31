module REVELT-SYNTAX

syntax RECEltResult
syntax RECListResult

syntax RECElt ::= RECEltResult
syntax RECList ::= RECListResult

syntax KResult ::= RECEltResult
syntax KResult ::= RECListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECList ::= recl(RECElt, RECList) [seqstrict]
syntax RECListResult ::= recl(RECEltResult, RECListResult)
syntax RECList ::= recnil()
syntax RECListResult ::= recnil()
syntax RECElt ::= reca()
syntax RECEltResult ::= reca()
syntax RECElt ::= recb()
syntax RECEltResult ::= recb()
syntax RECElt ::= recc()
syntax RECEltResult ::= recc()
syntax RECElt ::= recd()
syntax RECEltResult ::= recd()
syntax RECElt ::= rece()
syntax RECEltResult ::= rece()
syntax RECList ::= recconc(RECList, RECList) [seqstrict]
syntax RECList ::= recdup(RECList) [seqstrict]
syntax RECList ::= recrev(RECList) [seqstrict]

endmodule

module REVELT
imports K-EQUAL
imports REVELT-SYNTAX

rule recconc(recl(REC_V_E0:RECEltResult, REC_V_L1:RECListResult), REC_V_L2:RECListResult) => recl(REC_V_E0:RECEltResult, recconc(REC_V_L1:RECListResult, REC_V_L2:RECListResult))
rule recconc(recnil(), REC_V_L2:RECListResult) => REC_V_L2:RECListResult
rule recdup(REC_V_L1:RECListResult) => recconc(REC_V_L1:RECListResult, REC_V_L1:RECListResult)
rule recrev(recl(REC_V_E0:RECEltResult, REC_V_L1:RECListResult)) => recconc(recrev(REC_V_L1:RECListResult), recl(REC_V_E0:RECEltResult, recnil()))
rule recrev(recnil()) => recnil()

// eval: recrev(recdup(recl(reca(), recl(recb(), recl(recc(), recl(recd(), recl(rece(), recnil())))))))

endmodule
