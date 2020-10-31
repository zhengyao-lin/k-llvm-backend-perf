module CONFLUENCE-SYNTAX

syntax RECS

syntax KItem ::= then(KItem, KItem)
syntax RECS ::= recd0()
syntax RECS ::= recg(RECS)
syntax RECS ::= recf(RECS) [function]

endmodule

module CONFLUENCE
imports K-EQUAL
imports CONFLUENCE-SYNTAX

rule recf(recg(REC_V_X:RECS)) => REC_V_X:RECS
  requires REC_V_X:RECS ==K recd0()
rule recf(recg(recg(REC_V_X:RECS))) => recf(recg(REC_V_X:RECS))

// eval: recf(recg(recg(recd0())))

endmodule
