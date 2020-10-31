module CONFLUENCE-SYNTAX

syntax RECSResult

syntax RECS ::= RECSResult

syntax KResult ::= RECSResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECS ::= recd0()
syntax RECSResult ::= recd0()
syntax RECS ::= recg(RECS) [seqstrict]
syntax RECSResult ::= recg(RECSResult)
syntax RECS ::= recf(RECS) [seqstrict]

endmodule

module CONFLUENCE
imports K-EQUAL
imports CONFLUENCE-SYNTAX

rule recf(recg(REC_V_X:RECSResult)) => REC_V_X:RECSResult
  requires REC_V_X:RECSResult ==K recd0()
rule recf(recg(recg(REC_V_X:RECSResult))) => recf(recg(REC_V_X:RECSResult))

// eval: recf(recg(recg(recd0())))

endmodule
