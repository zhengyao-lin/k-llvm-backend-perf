module EVALEXPR-SYNTAX

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
syntax RECBool ::= receqENat(RECENat, RECENat) [function]
syntax RECBool ::= receq(RECSNat, RECSNat) [function]
syntax RECSNat ::= recsucc17(RECSNat) [function]
syntax RECSNat ::= recplus17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recmult17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recexp17(RECSNat, RECSNat) [function]
syntax RECSNat ::= receval17(RECENat) [function]
syntax RECSNat ::= recevalexp17(RECENat) [function]
syntax RECENat ::= recexpand(RECENat) [function]
syntax RECENat ::= rectwo() [function]
syntax RECENat ::= recseventeen() [function]
syntax RECBool ::= recf(RECENat) [function]

endmodule

module EVALEXPR
imports K-EQUAL
imports EVALEXPR-SYNTAX

rule receqBool(rectrue(), REC_V_b:RECBool) => REC_V_b:RECBool
rule receqBool(recfalse(), rectrue()) => recfalse()
rule receqBool(recfalse(), recfalse()) => rectrue()
rule recand(REC_V_b:RECBool, rectrue()) => REC_V_b:RECBool
rule recand(REC_V_b:RECBool, recfalse()) => recfalse()
rule receqPos(recd1(), recd1()) => rectrue()
rule receqPos(recd1(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recd1()) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recand(receqBool(REC_V_b:RECBool, REC_V_c:RECBool), receqPos(REC_V_p:RECPos, REC_V_q:RECPos))
rule reclambda0(REC_V_m:RECENat) => receq(receval17(REC_V_m:RECENat), recevalexp17(REC_V_m:RECENat))
rule receq(recZ(), recZ()) => rectrue()
rule receq(recZ(), recS(REC_V_r:RECSNat)) => recfalse()
rule receq(recS(REC_V_r:RECSNat), recZ()) => recfalse()
rule receq(recS(REC_V_r:RECSNat), recS(REC_V_t:RECSNat)) => receq(REC_V_r:RECSNat, REC_V_t:RECSNat)
rule receqENat(recExz(), recExz()) => rectrue()
rule receqENat(recExz(), recExs(REC_V_m:RECENat)) => recfalse()
rule receqENat(recExz(), recExplus(REC_V_m:RECENat, REC_V_n:RECENat)) => recfalse()
rule receqENat(recExz(), recExmult(REC_V_m:RECENat, REC_V_n:RECENat)) => recfalse()
rule receqENat(recExz(), recExexp(REC_V_m:RECENat, REC_V_n:RECENat)) => recfalse()
rule receqENat(recExs(REC_V_m:RECENat), recExz()) => recfalse()
rule receqENat(recExs(REC_V_n:RECENat), recExs(REC_V_m:RECENat)) => receqENat(REC_V_n:RECENat, REC_V_m:RECENat)
rule receqENat(recExs(REC_V_m:RECENat), recExplus(REC_V_n:RECENat, REC_V_o:RECENat)) => recfalse()
rule receqENat(recExs(REC_V_n:RECENat), recExmult(REC_V_m:RECENat, REC_V_o:RECENat)) => recfalse()
rule receqENat(recExs(REC_V_m:RECENat), recExexp(REC_V_n:RECENat, REC_V_o:RECENat)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENat, REC_V_m:RECENat), recExz()) => recfalse()
rule receqENat(recExplus(REC_V_m:RECENat, REC_V_n:RECENat), recExs(REC_V_o:RECENat)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENat, REC_V_m:RECENat), recExplus(REC_V_o:RECENat, REC_V_l:RECENat)) => recand(receqENat(REC_V_n:RECENat, REC_V_o:RECENat), receqENat(REC_V_m:RECENat, REC_V_l:RECENat))
rule receqENat(recExplus(REC_V_m:RECENat, REC_V_n:RECENat), recExmult(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENat, REC_V_m:RECENat), recExexp(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExmult(REC_V_m:RECENat, REC_V_n:RECENat), recExz()) => recfalse()
rule receqENat(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), recExs(REC_V_o:RECENat)) => recfalse()
rule receqENat(recExmult(REC_V_m:RECENat, REC_V_n:RECENat), recExplus(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), recExmult(REC_V_o:RECENat, REC_V_l:RECENat)) => recand(receqENat(REC_V_n:RECENat, REC_V_o:RECENat), receqENat(REC_V_m:RECENat, REC_V_l:RECENat))
rule receqENat(recExmult(REC_V_m:RECENat, REC_V_n:RECENat), recExexp(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), recExz()) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENat, REC_V_n:RECENat), recExs(REC_V_o:RECENat)) => recfalse()
rule receqENat(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), recExplus(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENat, REC_V_n:RECENat), recExmult(REC_V_o:RECENat, REC_V_l:RECENat)) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENat, REC_V_n:RECENat), recExexp(REC_V_o:RECENat, REC_V_l:RECENat)) => recand(receqENat(REC_V_m:RECENat, REC_V_o:RECENat), receqENat(REC_V_n:RECENat, REC_V_l:RECENat))
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
rule recevalexp17(REC_V_n:RECENat) => receval17(recexpand(REC_V_n:RECENat))
rule recexpand(recExz()) => recExz()
rule recexpand(recExs(REC_V_n:RECENat)) => recExplus(recExs(recExz()), REC_V_n:RECENat)
rule recexpand(recExplus(REC_V_n:RECENat, REC_V_m:RECENat)) => recExplus(recexpand(REC_V_n:RECENat), recexpand(REC_V_m:RECENat))
rule recexpand(recExmult(REC_V_n:RECENat, recExz())) => recExz()
rule recexpand(recExmult(REC_V_n:RECENat, recExs(recExz()))) => recexpand(REC_V_n:RECENat)
rule recexpand(recExmult(REC_V_n:RECENat, recExplus(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExplus(recExmult(REC_V_n:RECENat, REC_V_m:RECENat), recExmult(REC_V_n:RECENat, REC_V_o:RECENat)))
rule recexpand(recExmult(REC_V_n:RECENat, recExmult(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExmult(REC_V_n:RECENat, recexpand(recExmult(REC_V_m:RECENat, REC_V_o:RECENat))))
rule recexpand(recExmult(REC_V_n:RECENat, recExexp(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExmult(REC_V_n:RECENat, recexpand(recExexp(REC_V_m:RECENat, REC_V_o:RECENat))))
rule recexpand(recExexp(REC_V_n:RECENat, recExz())) => recExs(recExz())
rule recexpand(recExexp(REC_V_n:RECENat, recExs(REC_V_m:RECENat))) => recexpand(REC_V_n:RECENat)
  requires receqENat(REC_V_m:RECENat, recExz()) ==K rectrue()
rule recexpand(recExexp(REC_V_n:RECENat, recExs(REC_V_m:RECENat))) => recexpand(recExexp(REC_V_n:RECENat, recexpand(recExs(REC_V_m:RECENat))))
  requires receqENat(REC_V_m:RECENat, recExz()) ==K recfalse()
rule recexpand(recExexp(REC_V_n:RECENat, recExplus(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExmult(recExexp(REC_V_n:RECENat, REC_V_m:RECENat), recExexp(REC_V_n:RECENat, REC_V_o:RECENat)))
rule recexpand(recExexp(REC_V_n:RECENat, recExmult(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExexp(REC_V_n:RECENat, recexpand(recExmult(REC_V_m:RECENat, REC_V_o:RECENat))))
rule recexpand(recExexp(REC_V_n:RECENat, recExexp(REC_V_m:RECENat, REC_V_o:RECENat))) => recexpand(recExexp(REC_V_n:RECENat, recexpand(recExexp(REC_V_m:RECENat, REC_V_o:RECENat))))
rule rectwo() => recExs(recExs(recExz()))
rule recseventeen() => recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExz())))))))))))))))))))
rule recf(REC_V_m:RECENat) => reclambda0(recExexp(rectwo(), REC_V_m:RECENat))

// eval: recf(recseventeen())

endmodule
