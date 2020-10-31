module CALLS-SYNTAX

syntax RECSResult

syntax RECS ::= RECSResult

syntax KResult ::= RECSResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECS ::= recnullaryconstructor()
syntax RECSResult ::= recnullaryconstructor()
syntax RECS ::= recunaryconstructor(RECS) [seqstrict]
syntax RECSResult ::= recunaryconstructor(RECSResult)
syntax RECS ::= recnaryconstructor(RECS, RECS, RECS) [seqstrict]
syntax RECSResult ::= recnaryconstructor(RECSResult, RECSResult, RECSResult)
syntax RECS ::= recnullaryfunction()
syntax RECS ::= recunaryfunction(RECS) [seqstrict]
syntax RECS ::= recnaryfunction(RECS, RECS, RECS) [seqstrict]
syntax RECS ::= reca()
syntax RECS ::= recb()
syntax RECS ::= recc()
syntax RECS ::= recd()
syntax RECS ::= rece()
syntax RECS ::= recf()

endmodule

module CALLS
imports K-EQUAL
imports CALLS-SYNTAX

rule recnullaryfunction() => recnullaryconstructor()
rule recunaryfunction(REC_V_x:RECSResult) => recunaryconstructor(REC_V_x:RECSResult)
rule recnaryfunction(REC_V_x:RECSResult, REC_V_y:RECSResult, REC_V_z:RECSResult) => recnaryconstructor(REC_V_x:RECSResult, REC_V_y:RECSResult, REC_V_z:RECSResult)
rule reca() => recnullaryconstructor()
rule recb() => recunaryconstructor(recnullaryconstructor())
rule recc() => recnaryconstructor(recnullaryconstructor(), recnullaryconstructor(), recnullaryconstructor())
rule recd() => recnullaryfunction()
rule rece() => recunaryfunction(recnullaryfunction())
rule recf() => recnaryfunction(recnullaryfunction(), recnullaryfunction(), recnullaryfunction())

// eval: recnullaryconstructor()
// eval: recunaryconstructor(recnullaryconstructor())
// eval: recnaryconstructor(recnullaryconstructor(), recnullaryconstructor(), recnullaryconstructor())
// eval: recnullaryfunction()
// eval: recunaryfunction(recnullaryfunction())
// eval: recnaryfunction(recnullaryfunction(), recnullaryfunction(), recnullaryfunction())

endmodule
