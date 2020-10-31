module MISSIONARIES3-SYNTAX

syntax RECBool
syntax RECInt
syntax RECBank
syntax RECText
syntax RECPosition
syntax RECMove
syntax RECMoveList
syntax RECTextList
syntax RECPosList

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECInt ::= recd0()
syntax RECInt ::= recs(RECInt)
syntax RECInt ::= recp(RECInt)
syntax RECBank ::= recwest()
syntax RECBank ::= receast()
syntax RECText ::= recmissionaryrowseast()
syntax RECText ::= rectwomissionariesroweast()
syntax RECText ::= recmissionaryandcannibalroweast()
syntax RECText ::= reccannibalrowseast()
syntax RECText ::= rectwocannibalsroweast()
syntax RECText ::= recmissionaryrowswest()
syntax RECText ::= rectwomissionariesrowwest()
syntax RECText ::= recmissionaryandcannibalrowwest()
syntax RECText ::= reccannibalrowswest()
syntax RECText ::= rectwocannibalsrowwest()
syntax RECPosition ::= recpos(RECBank, RECInt, RECInt, RECInt, RECInt)
syntax RECMove ::= recmov(RECText, RECInt, RECInt, RECInt, RECInt, RECBank)
syntax RECMoveList ::= recnilml()
syntax RECMoveList ::= reccm(RECMove, RECMoveList)
syntax RECPosList ::= recnilpl()
syntax RECPosList ::= reccp(RECPosition, RECPosList)
syntax RECTextList ::= recniltl()
syntax RECTextList ::= recfail()
syntax RECTextList ::= recct(RECText, RECTextList)
syntax RECInt ::= recd1() [function]
syntax RECInt ::= recd2() [function]
syntax RECInt ::= recd3() [function]
syntax RECInt ::= recm1() [function]
syntax RECInt ::= recm2() [function]
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= recor(RECBool, RECBool) [function]
syntax RECInt ::= recplus(RECInt, RECInt) [function]
syntax RECBool ::= recgte(RECInt, RECInt) [function]
syntax RECBool ::= recequal(RECInt, RECInt) [function]
syntax RECMoveList ::= recmoves() [function]
syntax RECBool ::= recmember(RECPosition, RECPosList) [function]
syntax RECBool ::= recgtetl(RECTextList, RECTextList) [function]
syntax RECTextList ::= recsolve(RECPosition, RECPosition, RECPosList) [function]
syntax RECTextList ::= rectry(RECMoveList, RECPosition, RECPosition, RECPosList) [function]
syntax RECTextList ::= recapply(RECMove, RECPosition, RECPosition, RECPosList) [function]
syntax RECTextList ::= reccheck(RECText, RECPosition, RECPosition, RECPosList) [function]
syntax RECBool ::= recvalid(RECPosition) [function]
syntax RECTextList ::= recevalct(RECText, RECTextList) [function]
syntax RECTextList ::= recbest(RECTextList, RECTextList) [function]

endmodule

module MISSIONARIES3
imports K-EQUAL
imports MISSIONARIES3-SYNTAX

rule recand(REC_V_L:RECBool, rectrue()) => REC_V_L:RECBool
rule recand(REC_V_L:RECBool, recfalse()) => recfalse()
rule recor(REC_V_L:RECBool, rectrue()) => rectrue()
rule recor(REC_V_L:RECBool, recfalse()) => REC_V_L:RECBool
rule recplus(REC_V_X:RECInt, recd0()) => REC_V_X:RECInt
rule recplus(recd0(), REC_V_Y:RECInt) => REC_V_Y:RECInt
rule recplus(recs(REC_V_X:RECInt), recs(REC_V_Y:RECInt)) => recs(recs(recplus(REC_V_X:RECInt, REC_V_Y:RECInt)))
rule recplus(recp(REC_V_X:RECInt), recp(REC_V_Y:RECInt)) => recp(recp(recplus(REC_V_X:RECInt, REC_V_Y:RECInt)))
rule recplus(recs(REC_V_X:RECInt), recp(REC_V_Y:RECInt)) => recplus(REC_V_X:RECInt, REC_V_Y:RECInt)
rule recplus(recp(REC_V_X:RECInt), recs(REC_V_Y:RECInt)) => recplus(REC_V_X:RECInt, REC_V_Y:RECInt)
rule recgte(recd0(), recd0()) => rectrue()
rule recgte(recd0(), recs(REC_V_Y:RECInt)) => recfalse()
rule recgte(recd0(), recp(REC_V_Y:RECInt)) => rectrue()
rule recgte(recs(REC_V_X:RECInt), recd0()) => rectrue()
rule recgte(recs(REC_V_X:RECInt), recs(REC_V_Y:RECInt)) => recgte(REC_V_X:RECInt, REC_V_Y:RECInt)
rule recgte(recs(REC_V_X:RECInt), recp(REC_V_Y:RECInt)) => rectrue()
rule recgte(recp(REC_V_X:RECInt), recd0()) => recfalse()
rule recgte(recp(REC_V_X:RECInt), recs(REC_V_Y:RECInt)) => recfalse()
rule recgte(recp(REC_V_X:RECInt), recp(REC_V_Y:RECInt)) => recgte(REC_V_X:RECInt, REC_V_Y:RECInt)
rule recequal(REC_V_X:RECInt, REC_V_Y:RECInt) => recand(recgte(REC_V_X:RECInt, REC_V_Y:RECInt), recgte(REC_V_Y:RECInt, REC_V_X:RECInt))
rule recd1() => recs(recd0())
rule recd2() => recs(recs(recd0()))
rule recd3() => recs(recs(recs(recd0())))
rule recm1() => recp(recd0())
rule recm2() => recp(recp(recd0()))
rule recmoves() => reccm(recmov(recmissionaryrowseast(), recm1(), recd0(), recd1(), recd0(), receast()), reccm(recmov(rectwomissionariesroweast(), recm2(), recd0(), recd2(), recd0(), receast()), reccm(recmov(recmissionaryandcannibalroweast(), recm1(), recm1(), recd1(), recd1(), receast()), reccm(recmov(reccannibalrowseast(), recd0(), recm1(), recd0(), recd1(), receast()), reccm(recmov(rectwocannibalsroweast(), recd0(), recm2(), recd0(), recd2(), receast()), reccm(recmov(recmissionaryrowswest(), recd1(), recd0(), recm1(), recd0(), recwest()), reccm(recmov(rectwomissionariesrowwest(), recd2(), recd0(), recm2(), recd0(), recwest()), reccm(recmov(recmissionaryandcannibalrowwest(), recd1(), recd1(), recm1(), recm1(), recwest()), reccm(recmov(reccannibalrowswest(), recd0(), recd1(), recd0(), recm1(), recwest()), reccm(recmov(rectwocannibalsrowwest(), recd0(), recd2(), recd0(), recm2(), recwest()), recnilml()))))))))))
rule recmember(REC_V_NP:RECPosition, recnilpl()) => recfalse()
rule recmember(REC_V_NP:RECPosition, reccp(REC_V_Posi:RECPosition, REC_V_Prev:RECPosList)) => rectrue()
  requires REC_V_NP:RECPosition ==K REC_V_Posi:RECPosition
rule recmember(REC_V_NP:RECPosition, reccp(REC_V_Posi:RECPosition, REC_V_Prev:RECPosList)) => recmember(REC_V_NP:RECPosition, REC_V_Prev:RECPosList)
  requires REC_V_NP:RECPosition =/=K REC_V_Posi:RECPosition
rule recevalct(REC_V_T:RECText, recfail()) => recfail()
rule recevalct(REC_V_T:RECText, REC_V_TL:RECTextList) => recct(REC_V_T:RECText, REC_V_TL:RECTextList)
  requires REC_V_TL:RECTextList =/=K recfail()
rule recgtetl(REC_V_TL:RECTextList, recniltl()) => rectrue()
rule recgtetl(recniltl(), recct(REC_V_T:RECText, REC_V_TL:RECTextList)) => recfalse()
rule recgtetl(recct(REC_V_T:RECText, REC_V_TL:RECTextList), recct(REC_V_T2:RECText, REC_V_TL2:RECTextList)) => recgtetl(REC_V_TL:RECTextList, REC_V_TL2:RECTextList)
rule recbest(recfail(), REC_V_TL:RECTextList) => REC_V_TL:RECTextList
rule recbest(REC_V_TL:RECTextList, recfail()) => REC_V_TL:RECTextList
rule recbest(REC_V_TL:RECTextList, REC_V_TL2:RECTextList) => REC_V_TL2:RECTextList
  requires recgtetl(REC_V_TL:RECTextList, REC_V_TL2:RECTextList) ==K rectrue()
   andBool REC_V_TL:RECTextList =/=K recfail()
   andBool REC_V_TL2:RECTextList =/=K recfail()
rule recbest(REC_V_TL:RECTextList, REC_V_TL2:RECTextList) => REC_V_TL:RECTextList
  requires recgtetl(REC_V_TL:RECTextList, REC_V_TL2:RECTextList) ==K recfalse()
   andBool REC_V_TL:RECTextList =/=K recfail()
   andBool REC_V_TL2:RECTextList =/=K recfail()
rule recsolve(REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recniltl()
  requires REC_V_Posi:RECPosition ==K REC_V_Final:RECPosition
rule recsolve(REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => rectry(recmoves(), REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList)
  requires REC_V_Posi:RECPosition =/=K REC_V_Final:RECPosition
rule rectry(recnilml(), REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recfail()
rule rectry(reccm(REC_V_M:RECMove, REC_V_ML:RECMoveList), REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recbest(recapply(REC_V_M:RECMove, REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList), rectry(REC_V_ML:RECMoveList, REC_V_Posi:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList))
rule recapply(recmov(REC_V_T:RECText, REC_V_DMW:RECInt, REC_V_DCW:RECInt, REC_V_DME:RECInt, REC_V_DCE:RECInt, REC_V_D:RECBank), recpos(REC_V_B:RECBank, REC_V_MW:RECInt, REC_V_CW:RECInt, REC_V_ME:RECInt, REC_V_CE:RECInt), REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => reccheck(REC_V_T:RECText, recpos(REC_V_D:RECBank, recplus(REC_V_MW:RECInt, REC_V_DMW:RECInt), recplus(REC_V_CW:RECInt, REC_V_DCW:RECInt), recplus(REC_V_ME:RECInt, REC_V_DME:RECInt), recplus(REC_V_CE:RECInt, REC_V_DCE:RECInt)), REC_V_Final:RECPosition, REC_V_Prev:RECPosList)
  requires REC_V_D:RECBank =/=K REC_V_B:RECBank
rule recapply(recmov(REC_V_T:RECText, REC_V_DMW:RECInt, REC_V_DCW:RECInt, REC_V_DME:RECInt, REC_V_DCE:RECInt, REC_V_D:RECBank), recpos(REC_V_B:RECBank, REC_V_MW:RECInt, REC_V_CW:RECInt, REC_V_ME:RECInt, REC_V_CE:RECInt), REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recfail()
  requires REC_V_D:RECBank ==K REC_V_B:RECBank
rule reccheck(REC_V_T:RECText, REC_V_NP:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recevalct(REC_V_T:RECText, recsolve(REC_V_NP:RECPosition, REC_V_Final:RECPosition, reccp(REC_V_NP:RECPosition, REC_V_Prev:RECPosList)))
  requires recmember(REC_V_NP:RECPosition, REC_V_Prev:RECPosList) ==K recfalse()
   andBool recvalid(REC_V_NP:RECPosition) ==K rectrue()
rule reccheck(REC_V_T:RECText, REC_V_NP:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recfail()
  requires recmember(REC_V_NP:RECPosition, REC_V_Prev:RECPosList) ==K rectrue()
rule reccheck(REC_V_T:RECText, REC_V_NP:RECPosition, REC_V_Final:RECPosition, REC_V_Prev:RECPosList) => recfail()
  requires recvalid(REC_V_NP:RECPosition) ==K recfalse()
rule recvalid(recpos(REC_V_B:RECBank, REC_V_MW:RECInt, REC_V_CW:RECInt, REC_V_ME:RECInt, REC_V_CE:RECInt)) => recand(recgte(REC_V_MW:RECInt, recd0()), recand(recgte(REC_V_CW:RECInt, recd0()), recand(recgte(REC_V_ME:RECInt, recd0()), recand(recgte(REC_V_CE:RECInt, recd0()), recand(recor(recequal(REC_V_MW:RECInt, recd0()), recgte(REC_V_MW:RECInt, REC_V_CW:RECInt)), recor(recequal(REC_V_ME:RECInt, recd0()), recgte(REC_V_ME:RECInt, REC_V_CE:RECInt)))))))

// eval: recsolve(recpos(recwest(), recd3(), recd3(), recd0(), recd0()), recpos(receast(), recd0(), recd0(), recd3(), recd3()), recnilpl())

endmodule
