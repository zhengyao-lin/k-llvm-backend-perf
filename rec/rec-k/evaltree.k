module EVALTREE-SYNTAX

syntax RECBool
syntax RECPos
syntax RECTree
syntax RECSNat

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECPos ::= recd1()
syntax RECPos ::= reccDub(RECBool, RECPos)
syntax RECTree ::= recleaf(RECSNat)
syntax RECTree ::= recnode(RECSNat, RECSNat, RECTree, RECTree)
syntax RECSNat ::= recZ()
syntax RECSNat ::= recS(RECSNat)
syntax RECBool ::= receqBool(RECBool, RECBool) [function]
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= receqPos(RECPos, RECPos) [function]
syntax RECBool ::= receq(RECSNat, RECSNat) [function]
syntax RECBool ::= recf(RECSNat) [function]
syntax RECBool ::= reclambda6(RECSNat) [function]
syntax RECTree ::= reclambda5(RECSNat, RECTree) [function]
syntax RECTree ::= reclambda4(RECSNat, RECTree, RECSNat, RECSNat) [function]
syntax RECTree ::= reclambda3(RECSNat, RECTree, RECTree) [function]
syntax RECTree ::= reclambda2(RECSNat, RECTree, RECTree, RECSNat, RECSNat) [function]
syntax RECTree ::= reclambda1(RECSNat, RECTree, RECTree, RECSNat) [function]
syntax RECTree ::= recbuildtree(RECSNat, RECSNat) [function]
syntax RECSNat ::= reclambda0(RECSNat, RECSNat) [function]
syntax RECSNat ::= recsucc17(RECSNat) [function]
syntax RECSNat ::= recpred17(RECSNat) [function]
syntax RECSNat ::= recplus17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recmult17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recexp17(RECSNat, RECSNat) [function]
syntax RECSNat ::= recevaltree17(RECSNat) [function]
syntax RECSNat ::= recgetval(RECTree) [function]
syntax RECSNat ::= recgetmax(RECTree) [function]
syntax RECSNat ::= recseventeen() [function]

endmodule

module EVALTREE
imports K-EQUAL
imports EVALTREE-SYNTAX

rule receqBool(rectrue(), REC_V_b:RECBool) => REC_V_b:RECBool
rule receqBool(recfalse(), rectrue()) => recfalse()
rule receqBool(recfalse(), recfalse()) => rectrue()
rule recand(REC_V_b:RECBool, rectrue()) => REC_V_b:RECBool
rule recand(REC_V_b:RECBool, recfalse()) => recfalse()
rule receqPos(recd1(), recd1()) => rectrue()
rule receqPos(recd1(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recd1()) => recfalse()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recand(receqBool(REC_V_b:RECBool, REC_V_c:RECBool), receqPos(REC_V_p:RECPos, REC_V_q:RECPos))
rule reclambda6(REC_V_n:RECSNat) => receq(recevaltree17(REC_V_n:RECSNat), recgetval(recbuildtree(REC_V_n:RECSNat, recZ())))
rule reclambda5(REC_V_n:RECSNat, REC_V_left:RECTree) => reclambda4(REC_V_n:RECSNat, REC_V_left:RECTree, recgetmax(REC_V_left:RECTree), recgetval(REC_V_left:RECTree))
rule reclambda4(REC_V_n:RECSNat, REC_V_left:RECTree, REC_V_max:RECSNat, REC_V_o:RECSNat) => reclambda3(REC_V_o:RECSNat, REC_V_left:RECTree, recbuildtree(REC_V_n:RECSNat, recsucc17(REC_V_max:RECSNat)))
rule reclambda3(REC_V_n:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree) => reclambda2(REC_V_n:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree, recgetval(REC_V_right:RECTree), recgetmax(REC_V_right:RECTree))
rule reclambda2(REC_V_n:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree, REC_V_o:RECSNat, REC_V_max:RECSNat) => reclambda1(REC_V_max:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree, recplus17(REC_V_n:RECSNat, REC_V_o:RECSNat))
rule reclambda1(REC_V_max:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree, REC_V_n:RECSNat) => recnode(REC_V_n:RECSNat, REC_V_max:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree)
rule reclambda0(REC_V_n:RECSNat, REC_V_o:RECSNat) => recmult17(REC_V_n:RECSNat, REC_V_o:RECSNat)
rule receq(recZ(), recZ()) => rectrue()
rule receq(recZ(), recS(REC_V_n:RECSNat)) => recfalse()
rule receq(recS(REC_V_n:RECSNat), recZ()) => recfalse()
rule receq(recS(REC_V_n:RECSNat), recS(REC_V_o:RECSNat)) => receq(REC_V_n:RECSNat, REC_V_o:RECSNat)
rule recsucc17(REC_V_n:RECSNat) => recZ()
  requires receq(REC_V_n:RECSNat, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K rectrue()
rule recsucc17(REC_V_n:RECSNat) => recS(REC_V_n:RECSNat)
  requires receq(REC_V_n:RECSNat, recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))) ==K recfalse()
rule recpred17(recZ()) => recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ()))))))))))))))))
rule recpred17(recS(REC_V_n:RECSNat)) => REC_V_n:RECSNat
rule recplus17(REC_V_n:RECSNat, recZ()) => REC_V_n:RECSNat
rule recplus17(REC_V_n:RECSNat, recS(REC_V_o:RECSNat)) => recsucc17(recplus17(REC_V_n:RECSNat, REC_V_o:RECSNat))
rule recmult17(REC_V_n:RECSNat, recZ()) => recZ()
rule recmult17(REC_V_n:RECSNat, recS(REC_V_o:RECSNat)) => recplus17(REC_V_n:RECSNat, recmult17(REC_V_n:RECSNat, REC_V_o:RECSNat))
rule recexp17(REC_V_n:RECSNat, recZ()) => recsucc17(recZ())
rule recexp17(REC_V_n:RECSNat, recS(REC_V_o:RECSNat)) => recmult17(REC_V_n:RECSNat, recexp17(REC_V_n:RECSNat, REC_V_o:RECSNat))
rule recevaltree17(REC_V_n:RECSNat) => reclambda0(recexp17(recS(recS(recZ())), recpred17(REC_V_n:RECSNat)), recpred17(recexp17(recS(recS(recZ())), REC_V_n:RECSNat)))
rule recgetval(recleaf(REC_V_n:RECSNat)) => REC_V_n:RECSNat
rule recgetval(recnode(REC_V_n:RECSNat, REC_V_max:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree)) => REC_V_n:RECSNat
rule recgetmax(recleaf(REC_V_n:RECSNat)) => REC_V_n:RECSNat
rule recgetmax(recnode(REC_V_n:RECSNat, REC_V_max:RECSNat, REC_V_left:RECTree, REC_V_right:RECTree)) => REC_V_max:RECSNat
rule recbuildtree(recZ(), REC_V_n:RECSNat) => recleaf(REC_V_n:RECSNat)
rule recbuildtree(recS(REC_V_n:RECSNat), REC_V_o:RECSNat) => reclambda5(REC_V_n:RECSNat, recbuildtree(REC_V_n:RECSNat, REC_V_o:RECSNat))
rule recseventeen() => recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recS(recZ())))))))))))))))))))
rule recf(REC_V_n:RECSNat) => reclambda6(recseventeen())

// eval: recf(recseventeen())

endmodule
