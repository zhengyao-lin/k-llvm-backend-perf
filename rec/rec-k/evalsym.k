module EVALSYM-SYNTAX

syntax RECBool
syntax RECPos
syntax RECENat
syntax RECSNat

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECPos ::= recd1()
syntax RECPos ::= reccDub(RECBool, RECPos)
syntax RECENat ::= recExz()
syntax RECENat ::= recExs(RECENat)
syntax RECENat ::= recExplus(RECENat, RECENat)
syntax RECENat ::= recExmult(RECENat, RECENat)
syntax RECENat ::= recExexp(RECENat, RECENat)
syntax RECSNat ::= recZ()
syntax RECSNat ::= recS(RECSNat)
syntax RECBool ::= receqBool(RECBool, RECBool) [function]
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= receqPos(RECPos, RECPos) [function]
syntax RECBool ::= reclambda0(RECENat) [function]
syntax RECBool ::= receq(RECSNat, RECSNat) [function]
syntax RECSNat ::= recsucc17(RECSNat) [function]
syntax RECSNat ::= recplus17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recmult17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recexp17(RECSNat, RECSNat) [function]
syntax RECSNat ::= receval17(RECENat) [function]
syntax RECSNat ::= recevalsym17(RECENat) [function]
syntax RECENat ::= recdec(RECENat) [function]
syntax RECENat ::= rectwo() [function]
syntax RECENat ::= recseventeen() [function]
syntax RECBool ::= recf(RECENat) [function]

endmodule

module EVALSYM
imports K-EQUAL
imports EVALSYM-SYNTAX

rule receqBool(rectrue(), REC_V_b:RECBool) => REC_V_b:RECBool
rule receqBool(recfalse(), rectrue()) => recfalse()
rule receqBool(recfalse(), recfalse()) => rectrue()
rule recand(REC_V_b:RECBool, rectrue()) => REC_V_b:RECBool
rule recand(REC_V_b:RECBool, recfalse()) => recfalse()
rule receqPos(recd1(), recd1()) => rectrue()
rule receqPos(recd1(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recd1()) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recand(receqBool(REC_V_b:RECBool, REC_V_c:RECBool), receqPos(REC_V_p:RECPos, REC_V_q:RECPos))
rule reclambda0(REC_V_m:RECENat) => receq(receval17(REC_V_m:RECENat), recevalsym17(REC_V_m:RECENat))
rule receq(recZ(), recZ()) => rectrue()
rule receq(recZ(), recS(REC_V_r:RECSNat)) => recfalse()
rule receq(recS(REC_V_r:RECSNat), recZ()) => recfalse()
rule receq(recS(REC_V_r:RECSNat), recS(REC_V_t:RECSNat)) => receq(REC_V_r:RECSNat, REC_V_t:RECSNat)
rule recsucc17(REC_V_r:RECSNat) => recZ()
  requires receq(REC_V_r:RECSNat, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K rectrue()
rule recsucc17(REC_V_r:RECSNat) => recS(REC_V_r:RECSNat)
  requires receq(REC_V_r:RECSNat, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K recfalse()
rule recplus17(REC_V_r:RECSNat, recZ()) => REC_V_r:RECSNat
rule recplus17(REC_V_r:RECSNat, recS(REC_V_t:RECSNat)) => recsucc17(recplus17(REC_V_r:RECSNat, REC_V_t:RECSNat))
rule recmult17(REC_V_r:RECSNat, recZ()) => recZ()
rule recmult17(REC_V_r:RECSNat, recS(REC_V_t:RECSNat)) => recplus17(REC_V_r:RECSNat, recmult17(REC_V_r:RECSNat, REC_V_t:RECSNat))
rule recexp17(REC_V_r:RECSNat, recZ()) => recsucc17(recZ())
rule recexp17(REC_V_r:RECSNat, recS(REC_V_t:RECSNat)) => recmult17(REC_V_r:RECSNat, recexp17(REC_V_r:RECSNat, REC_V_t:RECSNat))
rule receval17(recExz()) => recZ()
rule receval17(recExs(REC_V_n:RECENat)) => recsucc17(receval17(REC_V_n:RECENat))
rule receval17(recExplus(REC_V_n:RECENat, REC_V_m:RECENat)) => recplus17(receval17(REC_V_n:RECENat), receval17(REC_V_m:RECENat))
rule receval17(recExmult(REC_V_n:RECENat, REC_V_m:RECENat)) => recmult17(receval17(REC_V_n:RECENat), receval17(REC_V_m:RECENat))
rule receval17(recExexp(REC_V_n:RECENat, REC_V_m:RECENat)) => recexp17(receval17(REC_V_n:RECENat), receval17(REC_V_m:RECENat))
rule recevalsym17(recExz()) => recZ()
rule recevalsym17(recExs(REC_V_n:RECENat)) => recsucc17(recevalsym17(REC_V_n:RECENat))
rule recevalsym17(recExplus(REC_V_n:RECENat, REC_V_m:RECENat)) => recplus17(recevalsym17(REC_V_n:RECENat), recevalsym17(REC_V_m:RECENat))
rule recevalsym17(recExmult(REC_V_n:RECENat, recExz())) => recZ()
rule recevalsym17(recExmult(REC_V_n:RECENat, recExs(REC_V_m:RECENat))) => recevalsym17(recExplus(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_n:RECENat))
rule recevalsym17(recExmult(REC_V_n:RECENat, recExplus(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExplus(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), recExmult(REC_V_n:RECENat, REC_V_o:RECENat)))
rule recevalsym17(recExmult(REC_V_n:RECENat, recExmult(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExmult(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_o:RECENat))
rule recevalsym17(recExmult(REC_V_n:RECENat, recExexp(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExmult(REC_V_n:RECENat, recdec(recExexp(REC_V_m:RECENat, REC_V_o:RECENat))))
rule recevalsym17(recExexp(REC_V_n:RECENat, recExz())) => recsucc17(recZ())
rule recevalsym17(recExexp(REC_V_n:RECENat, recExs(REC_V_m:RECENat))) => recevalsym17(recExmult(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_n:RECENat))
rule recevalsym17(recExexp(REC_V_n:RECENat, recExplus(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExmult(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), recExexp(REC_V_n:RECENat, REC_V_o:RECENat)))
rule recevalsym17(recExexp(REC_V_n:RECENat, recExmult(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExexp(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_o:RECENat))
rule recevalsym17(recExexp(REC_V_n:RECENat, recExexp(REC_V_m:RECENat, REC_V_o:RECENat))) => recevalsym17(recExexp(REC_V_n:RECENat, recdec(recExexp(REC_V_m:RECENat, REC_V_o:RECENat))))
rule recdec(recExexp(REC_V_n:RECENat, recExz())) => recExs(recExz())
rule recdec(recExexp(REC_V_n:RECENat, recExs(REC_V_m:RECENat))) => recExmult(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_n:RECENat)
rule recdec(recExexp(REC_V_n:RECENat, recExplus(REC_V_m:RECENat, REC_V_o:RECENat))) => recExmult(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), recExexp(REC_V_n:RECENat, REC_V_o:RECENat))
rule recdec(recExexp(REC_V_n:RECENat, recExmult(REC_V_m:RECENat, REC_V_o:RECENat))) => recdec(recExexp(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), REC_V_o:RECENat))
rule recdec(recExexp(REC_V_n:RECENat, recExexp(REC_V_m:RECENat, REC_V_o:RECENat))) => recdec(recExexp(REC_V_n:RECENat, recdec(recExexp(REC_V_m:RECENat, REC_V_o:RECENat))))
rule rectwo() => recExs(recExs(recExz()))
rule recseventeen() => recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExz()))))))))))))))))))))))))
rule recf(REC_V_m:RECENat) => reclambda0(recExexp(rectwo(), REC_V_m:RECENat))

// eval: recf(recseventeen())

endmodule
