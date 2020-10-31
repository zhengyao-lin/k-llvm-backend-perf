module EVALTREE-SYNTAX

syntax RECBoolResult
syntax RECPosResult
syntax RECTreeResult
syntax RECSNatResult

syntax RECBool ::= RECBoolResult
syntax RECPos ::= RECPosResult
syntax RECTree ::= RECTreeResult
syntax RECSNat ::= RECSNatResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECPosResult
syntax KResult ::= RECTreeResult
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
syntax RECTree ::= recleaf(RECSNat) [seqstrict]
syntax RECTreeResult ::= recleaf(RECSNatResult)
syntax RECTree ::= recnode(RECSNat, RECSNat, RECTree, RECTree) [seqstrict]
syntax RECTreeResult ::= recnode(RECSNatResult, RECSNatResult, RECTreeResult, RECTreeResult)
syntax RECSNat ::= recZ()
syntax RECSNatResult ::= recZ()
syntax RECSNat ::= recS(RECSNat) [seqstrict]
syntax RECSNatResult ::= recS(RECSNatResult)
syntax RECBool ::= receqBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recand(RECBool, RECBool) [seqstrict]
syntax RECBool ::= receqPos(RECPos, RECPos) [seqstrict]
syntax RECBool ::= receq(RECSNat, RECSNat) [function]
syntax RECBool ::= recf(RECSNat) [seqstrict]
syntax RECBool ::= reclambda6(RECSNat) [seqstrict]
syntax RECTree ::= reclambda5(RECSNat, RECTree) [seqstrict]
syntax RECTree ::= reclambda4(RECSNat, RECTree, RECSNat, RECSNat) [seqstrict]
syntax RECTree ::= reclambda3(RECSNat, RECTree, RECTree) [seqstrict]
syntax RECTree ::= reclambda2(RECSNat, RECTree, RECTree, RECSNat, RECSNat) [seqstrict]
syntax RECTree ::= reclambda1(RECSNat, RECTree, RECTree, RECSNat) [seqstrict]
syntax RECTree ::= recbuildtree(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= reclambda0(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recsucc17(RECSNat) [seqstrict]
syntax RECSNat ::= recpred17(RECSNat) [seqstrict]
syntax RECSNat ::= recplus17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recmult17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recexp17(RECSNat, RECSNat) [seqstrict]
syntax RECSNat ::= recevaltree17(RECSNat) [seqstrict]
syntax RECSNat ::= recgetval(RECTree) [seqstrict]
syntax RECSNat ::= recgetmax(RECTree) [seqstrict]
syntax RECSNat ::= recseventeen()

endmodule

module EVALTREE
imports K-EQUAL
imports EVALTREE-SYNTAX

rule receqBool(rectrue(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule receqBool(recfalse(), rectrue()) => recfalse()
rule receqBool(recfalse(), recfalse()) => rectrue()
rule recand(REC_V_b:RECBoolResult, rectrue()) => REC_V_b:RECBoolResult
rule recand(REC_V_b:RECBoolResult, recfalse()) => recfalse()
rule receqPos(recd1(), recd1()) => rectrue()
rule receqPos(recd1(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recd1()) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recand(receqBool(REC_V_b:RECBoolResult, REC_V_c:RECBoolResult), receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule reclambda6(REC_V_n:RECSNatResult) => receq(recevaltree17(REC_V_n:RECSNatResult), recgetval(recbuildtree(REC_V_n:RECSNatResult, recZ())))
rule reclambda5(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult) => reclambda4(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult, recgetmax(REC_V_left:RECTreeResult), recgetval(REC_V_left:RECTreeResult))
rule reclambda4(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult, REC_V_max:RECSNatResult, REC_V_o:RECSNatResult) => reclambda3(REC_V_o:RECSNatResult, REC_V_left:RECTreeResult, recbuildtree(REC_V_n:RECSNatResult, recsucc17(REC_V_max:RECSNatResult)))
rule reclambda3(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult) => reclambda2(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult, recgetval(REC_V_right:RECTreeResult), recgetmax(REC_V_right:RECTreeResult))
rule reclambda2(REC_V_n:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult, REC_V_o:RECSNatResult, REC_V_max:RECSNatResult) => reclambda1(REC_V_max:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult, recplus17(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult))
rule reclambda1(REC_V_max:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult, REC_V_n:RECSNatResult) => recnode(REC_V_n:RECSNatResult, REC_V_max:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult)
rule reclambda0(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult) => recmult17(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult)
rule receq(recZ(), recZ()) => rectrue()
rule receq(recZ(), recS(REC_V_n:RECSNatResult)) => recfalse()
rule receq(recS(REC_V_n:RECSNatResult), recZ()) => recfalse()
rule receq(recS(REC_V_n:RECSNatResult), recS(REC_V_o:RECSNatResult)) => receq(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult)
rule recsucc17(REC_V_n:RECSNatResult) => recZ()
  requires receq(REC_V_n:RECSNatResult, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K rectrue()
rule recsucc17(REC_V_n:RECSNatResult) => recS(REC_V_n:RECSNatResult)
  requires receq(REC_V_n:RECSNatResult, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K recfalse()
rule recpred17(recZ()) => recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))
rule recpred17(recS(REC_V_n:RECSNatResult)) => REC_V_n:RECSNatResult
rule recplus17(REC_V_n:RECSNatResult, recZ()) => REC_V_n:RECSNatResult
rule recplus17(REC_V_n:RECSNatResult, recS(REC_V_o:RECSNatResult)) => recsucc17(recplus17(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult))
rule recmult17(REC_V_n:RECSNatResult, recZ()) => recZ()
rule recmult17(REC_V_n:RECSNatResult, recS(REC_V_o:RECSNatResult)) => recplus17(REC_V_n:RECSNatResult, recmult17(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult))
rule recexp17(REC_V_n:RECSNatResult, recZ()) => recsucc17(recZ())
rule recexp17(REC_V_n:RECSNatResult, recS(REC_V_o:RECSNatResult)) => recmult17(REC_V_n:RECSNatResult, recexp17(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult))
rule recevaltree17(REC_V_n:RECSNatResult) => reclambda0(recexp17(recS(recS(recZ())), recpred17(REC_V_n:RECSNatResult)), recpred17(recexp17(recS(recS(recZ())), REC_V_n:RECSNatResult)))
rule recgetval(recleaf(REC_V_n:RECSNatResult)) => REC_V_n:RECSNatResult
rule recgetval(recnode(REC_V_n:RECSNatResult, REC_V_max:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult)) => REC_V_n:RECSNatResult
rule recgetmax(recleaf(REC_V_n:RECSNatResult)) => REC_V_n:RECSNatResult
rule recgetmax(recnode(REC_V_n:RECSNatResult, REC_V_max:RECSNatResult, REC_V_left:RECTreeResult, REC_V_right:RECTreeResult)) => REC_V_max:RECSNatResult
rule recbuildtree(recZ(), REC_V_n:RECSNatResult) => recleaf(REC_V_n:RECSNatResult)
rule recbuildtree(recS(REC_V_n:RECSNatResult), REC_V_o:RECSNatResult) => reclambda5(REC_V_n:RECSNatResult, recbuildtree(REC_V_n:RECSNatResult, REC_V_o:RECSNatResult))
rule recseventeen() => recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ())))))))))))))))))))
rule recf(REC_V_n:RECSNatResult) => reclambda6(recseventeen())

// eval: recf(recseventeen())

endmodule
