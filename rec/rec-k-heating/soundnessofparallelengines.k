module SOUNDNESSOFPARALLELENGINES-SYNTAX

syntax RECNResult

syntax RECN ::= RECNResult

syntax KResult ::= RECNResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECN ::= recd0()
syntax RECNResult ::= recd0()
syntax RECN ::= recs(RECN) [seqstrict]
syntax RECNResult ::= recs(RECNResult)
syntax RECN ::= recg(RECN) [seqstrict]
syntax RECNResult ::= recg(RECNResult)
syntax RECN ::= recf(RECN) [seqstrict]

endmodule

module SOUNDNESSOFPARALLELENGINES
imports K-EQUAL
imports SOUNDNESSOFPARALLELENGINES-SYNTAX

rule recf(recg(recd0())) => recd0()
rule recf(recg(recs(REC_V_X:RECNResult))) => recf(recg(REC_V_X:RECNResult))

// eval: recf(recg(recs(recd0())))

endmodule
