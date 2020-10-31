module EVALEXPR-SYNTAX

syntax RECBoolResult
syntax RECPosResult
syntax RECENatResult
syntax RECSNatResult

syntax RECBool ::= RECBoolResult
syntax RECPos ::= RECPosResult
syntax RECENat ::= RECENatResult
syntax RECSNat ::= RECSNatResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECPosResult
syntax KResult ::= RECENatResult
syntax KResult ::= RECSNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECPos ::= recd1()
syntax RECPosResult ::= recd1()
syntax RECPos ::= reccDub(RECBool, RECPos) [seqstrict]
syntax RECPosResult ::= reccDub(RECBoolResult, RECPosResult)
syntax RECENat ::= recExz()
syntax RECENatResult ::= recExz()
syntax RECENat ::= recExs(RECENat) [seqstrict]
syntax RECENatResult ::= recExs(RECENatResult)
syntax RECENat ::= recExplus(RECENat, RECENat) [seqstrict]
syntax RECENatResult ::= recExplus(RECENatResult, RECENatResult)
syntax RECENat ::= recExmult(RECENat, RECENat) [seqstrict]
syntax RECENatResult ::= recExmult(RECENatResult, RECENatResult)
syntax RECENat ::= recExexp(RECENat, RECENat) [seqstrict]
syntax RECENatResult ::= recExexp(RECENatResult, RECENatResult)
syntax RECSNat ::= recZ()
syntax RECSNatResult ::= recZ()
syntax RECSNat ::= recS(RECSNat) [seqstrict]
syntax RECSNatResult ::= recS(RECSNatResult)
syntax RECBool ::= receqBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= receqPos(RECPos, RECPos) [seqstrict]
syntax RECBool ::= reclambda0(RECENat) [seqstrict]
syntax RECBool ::= receqENat(RECENat, RECENat) [function]
syntax RECBool ::= receq(RECSNat, RECSNat) [function]
syntax RECSNat ::= recsucc17(RECSNat) [seqstrict]
syntax RECSNat ::= recplus17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recmult17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recexp17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= receval17(RECENat) [seqstrict]
syntax RECSNat ::= recevalexp17(RECENat) [seqstrict]
syntax RECENat ::= recexpand(RECENat) [seqstrict]
syntax RECENat ::= rectwo()
syntax RECENat ::= recseventeen()
syntax RECBool ::= recf(RECENat) [seqstrict]

endmodule

module EVALEXPR
imports K-EQUAL
imports EVALEXPR-SYNTAX

rule receqBool(rectrue(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule receqBool(recfalse(), rectrue()) => recfalse()
rule receqBool(recfalse(), recfalse()) => rectrue()
rule recand(REC_V_b:RECBoolResult, rectrue()) => REC_V_b:RECBoolResult
rule recand(REC_V_b:RECBoolResult, recfalse()) => recfalse()
rule receqPos(recd1(), recd1()) => rectrue()
rule receqPos(recd1(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recd1()) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recand(receqBool(REC_V_b:RECBoolResult, REC_V_c:RECBoolResult), receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule reclambda0(REC_V_m:RECENatResult) => receq(receval17(REC_V_m:RECENatResult), recevalexp17(REC_V_m:RECENatResult))
rule receq(recZ(), recZ()) => rectrue()
rule receq(recZ(), recS(REC_V_r:RECSNatResult)) => recfalse()
rule receq(recS(REC_V_r:RECSNatResult), recZ()) => recfalse()
rule receq(recS(REC_V_r:RECSNatResult), recS(REC_V_t:RECSNatResult)) => receq(REC_V_r:RECSNatResult, REC_V_t:RECSNatResult)
rule receqENat(recExz(), recExz()) => rectrue()
rule receqENat(recExz(), recExs(REC_V_m:RECENatResult)) => recfalse()
rule receqENat(recExz(), recExplus(REC_V_m:RECENatResult, REC_V_n:RECENatResult)) => recfalse()
rule receqENat(recExz(), recExmult(REC_V_m:RECENatResult, REC_V_n:RECENatResult)) => recfalse()
rule receqENat(recExz(), recExexp(REC_V_m:RECENatResult, REC_V_n:RECENatResult)) => recfalse()
rule receqENat(recExs(REC_V_m:RECENatResult), recExz()) => recfalse()
rule receqENat(recExs(REC_V_n:RECENatResult), recExs(REC_V_m:RECENatResult)) => receqENat(REC_V_n:RECENatResult, REC_V_m:RECENatResult)
rule receqENat(recExs(REC_V_m:RECENatResult), recExplus(REC_V_n:RECENatResult, REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExs(REC_V_n:RECENatResult), recExmult(REC_V_m:RECENatResult, REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExs(REC_V_m:RECENatResult), recExexp(REC_V_n:RECENatResult, REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExz()) => recfalse()
rule receqENat(recExplus(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExs(REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExplus(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recand(receqENat(REC_V_n:RECENatResult, REC_V_o:RECENatResult), receqENat(REC_V_m:RECENatResult, REC_V_l:RECENatResult))
rule receqENat(recExplus(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExmult(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExplus(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExexp(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExmult(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExz()) => recfalse()
rule receqENat(recExmult(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExs(REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExmult(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExplus(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExmult(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExmult(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recand(receqENat(REC_V_n:RECENatResult, REC_V_o:RECENatResult), receqENat(REC_V_m:RECENatResult, REC_V_l:RECENatResult))
rule receqENat(recExmult(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExexp(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExexp(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExz()) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExs(REC_V_o:RECENatResult)) => recfalse()
rule receqENat(recExexp(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExplus(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExmult(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recfalse()
rule receqENat(recExexp(REC_V_m:RECENatResult, REC_V_n:RECENatResult), recExexp(REC_V_o:RECENatResult, REC_V_l:RECENatResult)) => recand(receqENat(REC_V_m:RECENatResult, REC_V_o:RECENatResult), receqENat(REC_V_n:RECENatResult, REC_V_l:RECENatResult))
rule recsucc17(REC_V_r:RECSNatResult) => recZ()
  requires receq(REC_V_r:RECSNatResult, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K rectrue()
rule recsucc17(REC_V_r:RECSNatResult) => recS(REC_V_r:RECSNatResult)
  requires receq(REC_V_r:RECSNatResult, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K recfalse()
rule recplus17(REC_V_r:RECSNatResult, recZ()) => REC_V_r:RECSNatResult
rule recplus17(REC_V_r:RECSNatResult, recS(REC_V_t:RECSNatResult)) => recsucc17(recplus17(REC_V_r:RECSNatResult, REC_V_t:RECSNatResult))
rule recmult17(REC_V_r:RECSNatResult, recZ()) => recZ()
rule recmult17(REC_V_r:RECSNatResult, recS(REC_V_t:RECSNatResult)) => recplus17(REC_V_r:RECSNatResult, recmult17(REC_V_r:RECSNatResult, REC_V_t:RECSNatResult))
rule recexp17(REC_V_r:RECSNatResult, recZ()) => recsucc17(recZ())
rule recexp17(REC_V_r:RECSNatResult, recS(REC_V_t:RECSNatResult)) => recmult17(REC_V_r:RECSNatResult, recexp17(REC_V_r:RECSNatResult, REC_V_t:RECSNatResult))
rule receval17(recExz()) => recZ()
rule receval17(recExs(REC_V_n:RECENatResult)) => recsucc17(receval17(REC_V_n:RECENatResult))
rule receval17(recExplus(REC_V_n:RECENatResult, REC_V_m:RECENatResult)) => recplus17(receval17(REC_V_n:RECENatResult), receval17(REC_V_m:RECENatResult))
rule receval17(recExmult(REC_V_n:RECENatResult, REC_V_m:RECENatResult)) => recmult17(receval17(REC_V_n:RECENatResult), receval17(REC_V_m:RECENatResult))
rule receval17(recExexp(REC_V_n:RECENatResult, REC_V_m:RECENatResult)) => recexp17(receval17(REC_V_n:RECENatResult), receval17(REC_V_m:RECENatResult))
rule recevalexp17(REC_V_n:RECENatResult) => receval17(recexpand(REC_V_n:RECENatResult))
rule recexpand(recExz()) => recExz()
rule recexpand(recExs(REC_V_n:RECENatResult)) => recExplus(recExs(recExz()), REC_V_n:RECENatResult)
rule recexpand(recExplus(REC_V_n:RECENatResult, REC_V_m:RECENatResult)) => recExplus(recexpand(REC_V_n:RECENatResult), recexpand(REC_V_m:RECENatResult))
rule recexpand(recExmult(REC_V_n:RECENatResult, recExz())) => recExz()
rule recexpand(recExmult(REC_V_n:RECENatResult, recExs(recExz()))) => recexpand(REC_V_n:RECENatResult)
rule recexpand(recExmult(REC_V_n:RECENatResult, recExplus(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExplus(recExmult(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExmult(REC_V_n:RECENatResult, REC_V_o:RECENatResult)))
rule recexpand(recExmult(REC_V_n:RECENatResult, recExmult(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExmult(REC_V_n:RECENatResult, recexpand(recExmult(REC_V_m:RECENatResult, REC_V_o:RECENatResult))))
rule recexpand(recExmult(REC_V_n:RECENatResult, recExexp(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExmult(REC_V_n:RECENatResult, recexpand(recExexp(REC_V_m:RECENatResult, REC_V_o:RECENatResult))))
rule recexpand(recExexp(REC_V_n:RECENatResult, recExz())) => recExs(recExz())
rule recexpand(recExexp(REC_V_n:RECENatResult, recExs(REC_V_m:RECENatResult))) => recexpand(REC_V_n:RECENatResult)
  requires receqENat(REC_V_m:RECENatResult, recExz()) ==K rectrue()
rule recexpand(recExexp(REC_V_n:RECENatResult, recExs(REC_V_m:RECENatResult))) => recexpand(recExexp(REC_V_n:RECENatResult, recexpand(recExs(REC_V_m:RECENatResult))))
  requires receqENat(REC_V_m:RECENatResult, recExz()) ==K recfalse()
rule recexpand(recExexp(REC_V_n:RECENatResult, recExplus(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExmult(recExexp(REC_V_n:RECENatResult, REC_V_m:RECENatResult), recExexp(REC_V_n:RECENatResult, REC_V_o:RECENatResult)))
rule recexpand(recExexp(REC_V_n:RECENatResult, recExmult(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExexp(REC_V_n:RECENatResult, recexpand(recExmult(REC_V_m:RECENatResult, REC_V_o:RECENatResult))))
rule recexpand(recExexp(REC_V_n:RECENatResult, recExexp(REC_V_m:RECENatResult, REC_V_o:RECENatResult))) => recexpand(recExexp(REC_V_n:RECENatResult, recexpand(recExexp(REC_V_m:RECENatResult, REC_V_o:RECENatResult))))
rule rectwo() => recExs(recExs(recExz()))
rule recseventeen() => recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExs(recExz())))))))))))))))))))
rule recf(REC_V_m:RECENatResult) => reclambda0(recExexp(rectwo(), REC_V_m:RECENatResult))

// eval: recf(recseventeen())

endmodule
