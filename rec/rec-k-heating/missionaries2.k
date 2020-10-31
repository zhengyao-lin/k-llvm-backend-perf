module MISSIONARIES2-SYNTAX

syntax RECBoolResult
syntax RECIntResult
syntax RECBankResult
syntax RECTextResult
syntax RECPositionResult
syntax RECMoveResult
syntax RECMoveListResult
syntax RECTextListResult
syntax RECPosListResult

syntax RECBool ::= RECBoolResult
syntax RECInt ::= RECIntResult
syntax RECBank ::= RECBankResult
syntax RECText ::= RECTextResult
syntax RECPosition ::= RECPositionResult
syntax RECMove ::= RECMoveResult
syntax RECMoveList ::= RECMoveListResult
syntax RECTextList ::= RECTextListResult
syntax RECPosList ::= RECPosListResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECIntResult
syntax KResult ::= RECBankResult
syntax KResult ::= RECTextResult
syntax KResult ::= RECPositionResult
syntax KResult ::= RECMoveResult
syntax KResult ::= RECMoveListResult
syntax KResult ::= RECTextListResult
syntax KResult ::= RECPosListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECInt ::= recd0()
syntax RECIntResult ::= recd0()
syntax RECInt ::= recs(RECInt) [seqstrict]
syntax RECIntResult ::= recs(RECIntResult)
syntax RECInt ::= recp(RECInt) [seqstrict]
syntax RECIntResult ::= recp(RECIntResult)
syntax RECBank ::= recwest()
syntax RECBankResult ::= recwest()
syntax RECBank ::= receast()
syntax RECBankResult ::= receast()
syntax RECText ::= recmissionaryrowseast()
syntax RECTextResult ::= recmissionaryrowseast()
syntax RECText ::= rectwomissionariesroweast()
syntax RECTextResult ::= rectwomissionariesroweast()
syntax RECText ::= recmissionaryandcannibalroweast()
syntax RECTextResult ::= recmissionaryandcannibalroweast()
syntax RECText ::= reccannibalrowseast()
syntax RECTextResult ::= reccannibalrowseast()
syntax RECText ::= rectwocannibalsroweast()
syntax RECTextResult ::= rectwocannibalsroweast()
syntax RECText ::= recmissionaryrowswest()
syntax RECTextResult ::= recmissionaryrowswest()
syntax RECText ::= rectwomissionariesrowwest()
syntax RECTextResult ::= rectwomissionariesrowwest()
syntax RECText ::= recmissionaryandcannibalrowwest()
syntax RECTextResult ::= recmissionaryandcannibalrowwest()
syntax RECText ::= reccannibalrowswest()
syntax RECTextResult ::= reccannibalrowswest()
syntax RECText ::= rectwocannibalsrowwest()
syntax RECTextResult ::= rectwocannibalsrowwest()
syntax RECPosition ::= recpos(RECBank, RECInt, RECInt, RECInt, RECInt) [seqstrict]
syntax RECPositionResult ::= recpos(RECBankResult, RECIntResult, RECIntResult, RECIntResult, RECIntResult)
syntax RECMove ::= recmov(RECText, RECInt, RECInt, RECInt, RECInt, RECBank) [seqstrict]
syntax RECMoveResult ::= recmov(RECTextResult, RECIntResult, RECIntResult, RECIntResult, RECIntResult, RECBankResult)
syntax RECMoveList ::= recnilml()
syntax RECMoveListResult ::= recnilml()
syntax RECMoveList ::= reccm(RECMove, RECMoveList) [seqstrict]
syntax RECMoveListResult ::= reccm(RECMoveResult, RECMoveListResult)
syntax RECPosList ::= recnilpl()
syntax RECPosListResult ::= recnilpl()
syntax RECPosList ::= reccp(RECPosition, RECPosList) [seqstrict]
syntax RECPosListResult ::= reccp(RECPositionResult, RECPosListResult)
syntax RECTextList ::= recniltl()
syntax RECTextListResult ::= recniltl()
syntax RECTextList ::= recfail()
syntax RECTextListResult ::= recfail()
syntax RECTextList ::= recct(RECText, RECTextList) [seqstrict]
syntax RECTextListResult ::= recct(RECTextResult, RECTextListResult)
syntax RECInt ::= recd1()
syntax RECInt ::= recd2()
syntax RECInt ::= recd3()
syntax RECInt ::= recm1()
syntax RECInt ::= recm2()
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= recor(RECBool, RECBool) [function]
syntax RECInt ::= recplus(RECInt, RECInt) [seqstrict]
syntax RECBool ::= recgte(RECInt, RECInt) [function]
syntax RECBool ::= recequal(RECInt, RECInt) [function]
syntax RECMoveList ::= recmoves()
syntax RECBool ::= recmember(RECPosition, RECPosList) [function]
syntax RECBool ::= recgtetl(RECTextList, RECTextList) [function]
syntax RECTextList ::= recsolve(RECPosition, RECPosition, RECPosList) [seqstrict]
syntax RECTextList ::= rectry(RECMoveList, RECPosition, RECPosition, RECPosList) [seqstrict]
syntax RECTextList ::= recapply(RECMove, RECPosition, RECPosition, RECPosList) [seqstrict]
syntax RECTextList ::= reccheck(RECText, RECPosition, RECPosition, RECPosList) [seqstrict]
syntax RECBool ::= recvalid(RECPosition) [function]
syntax RECTextList ::= recevalct(RECText, RECTextList) [seqstrict]
syntax RECTextList ::= recbest(RECTextList, RECTextList) [seqstrict]

endmodule

module MISSIONARIES2
imports K-EQUAL
imports MISSIONARIES2-SYNTAX

rule recand(REC_V_L:RECBoolResult, rectrue()) => REC_V_L:RECBoolResult
rule recand(REC_V_L:RECBoolResult, recfalse()) => recfalse()
rule recor(REC_V_L:RECBoolResult, rectrue()) => rectrue()
rule recor(REC_V_L:RECBoolResult, recfalse()) => REC_V_L:RECBoolResult
rule recplus(REC_V_X:RECIntResult, recd0()) => REC_V_X:RECIntResult
rule recplus(recd0(), REC_V_Y:RECIntResult) => REC_V_Y:RECIntResult
rule recplus(recs(REC_V_X:RECIntResult), recs(REC_V_Y:RECIntResult)) => recs(recs(recplus(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)))
rule recplus(recp(REC_V_X:RECIntResult), recp(REC_V_Y:RECIntResult)) => recp(recp(recplus(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)))
rule recplus(recs(REC_V_X:RECIntResult), recp(REC_V_Y:RECIntResult)) => recplus(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)
rule recplus(recp(REC_V_X:RECIntResult), recs(REC_V_Y:RECIntResult)) => recplus(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)
rule recgte(recd0(), recd0()) => rectrue()
rule recgte(recd0(), recs(REC_V_Y:RECIntResult)) => recfalse()
rule recgte(recd0(), recp(REC_V_Y:RECIntResult)) => rectrue()
rule recgte(recs(REC_V_X:RECIntResult), recd0()) => rectrue()
rule recgte(recs(REC_V_X:RECIntResult), recs(REC_V_Y:RECIntResult)) => recgte(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)
rule recgte(recs(REC_V_X:RECIntResult), recp(REC_V_Y:RECIntResult)) => rectrue()
rule recgte(recp(REC_V_X:RECIntResult), recd0()) => recfalse()
rule recgte(recp(REC_V_X:RECIntResult), recs(REC_V_Y:RECIntResult)) => recfalse()
rule recgte(recp(REC_V_X:RECIntResult), recp(REC_V_Y:RECIntResult)) => recgte(REC_V_X:RECIntResult, REC_V_Y:RECIntResult)
rule recequal(REC_V_X:RECIntResult, REC_V_Y:RECIntResult) => recand(recgte(REC_V_X:RECIntResult, REC_V_Y:RECIntResult), recgte(REC_V_Y:RECIntResult, REC_V_X:RECIntResult))
rule recd1() => recs(recd0())
rule recd2() => recs(recs(recd0()))
rule recd3() => recs(recs(recs(recd0())))
rule recm1() => recp(recd0())
rule recm2() => recp(recp(recd0()))
rule recmoves() => reccm(recmov(recmissionaryrowseast(), recm1(), recd0(), recd1(), recd0(), receast()), reccm(recmov(rectwomissionariesroweast(), recm2(), recd0(), recd2(), recd0(), receast()), reccm(recmov(recmissionaryandcannibalroweast(), recm1(), recm1(), recd1(), recd1(), receast()), reccm(recmov(reccannibalrowseast(), recd0(), recm1(), recd0(), recd1(), receast()), reccm(recmov(rectwocannibalsroweast(), recd0(), recm2(), recd0(), recd2(), receast()), reccm(recmov(recmissionaryrowswest(), recd1(), recd0(), recm1(), recd0(), recwest()), reccm(recmov(rectwomissionariesrowwest(), recd2(), recd0(), recm2(), recd0(), recwest()), reccm(recmov(recmissionaryandcannibalrowwest(), recd1(), recd1(), recm1(), recm1(), recwest()), reccm(recmov(reccannibalrowswest(), recd0(), recd1(), recd0(), recm1(), recwest()), reccm(recmov(rectwocannibalsrowwest(), recd0(), recd2(), recd0(), recm2(), recwest()), recnilml()))))))))))
rule recmember(REC_V_NP:RECPositionResult, recnilpl()) => recfalse()
rule recmember(REC_V_NP:RECPositionResult, reccp(REC_V_Posi:RECPositionResult, REC_V_Prev:RECPosListResult)) => rectrue()
  requires REC_V_NP:RECPositionResult ==K REC_V_Posi:RECPositionResult
rule recmember(REC_V_NP:RECPositionResult, reccp(REC_V_Posi:RECPositionResult, REC_V_Prev:RECPosListResult)) => recmember(REC_V_NP:RECPositionResult, REC_V_Prev:RECPosListResult)
  requires REC_V_NP:RECPositionResult =/=K REC_V_Posi:RECPositionResult
rule recevalct(REC_V_T:RECTextResult, recfail()) => recfail()
rule recevalct(REC_V_T:RECTextResult, REC_V_TL:RECTextListResult) => recct(REC_V_T:RECTextResult, REC_V_TL:RECTextListResult)
  requires REC_V_TL:RECTextListResult =/=K recfail()
rule recgtetl(REC_V_TL:RECTextListResult, recniltl()) => rectrue()
rule recgtetl(recniltl(), recct(REC_V_T:RECTextResult, REC_V_TL:RECTextListResult)) => recfalse()
rule recgtetl(recct(REC_V_T:RECTextResult, REC_V_TL:RECTextListResult), recct(REC_V_T2:RECTextResult, REC_V_TL2:RECTextListResult)) => recgtetl(REC_V_TL:RECTextListResult, REC_V_TL2:RECTextListResult)
rule recbest(recfail(), REC_V_TL:RECTextListResult) => REC_V_TL:RECTextListResult
rule recbest(REC_V_TL:RECTextListResult, recfail()) => REC_V_TL:RECTextListResult
rule recbest(REC_V_TL:RECTextListResult, REC_V_TL2:RECTextListResult) => REC_V_TL2:RECTextListResult
  requires recgtetl(REC_V_TL:RECTextListResult, REC_V_TL2:RECTextListResult) ==K rectrue()
   andBool REC_V_TL:RECTextListResult =/=K recfail()
   andBool REC_V_TL2:RECTextListResult =/=K recfail()
rule recbest(REC_V_TL:RECTextListResult, REC_V_TL2:RECTextListResult) => REC_V_TL:RECTextListResult
  requires recgtetl(REC_V_TL:RECTextListResult, REC_V_TL2:RECTextListResult) ==K recfalse()
   andBool REC_V_TL:RECTextListResult =/=K recfail()
   andBool REC_V_TL2:RECTextListResult =/=K recfail()
rule recsolve(REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recniltl()
  requires REC_V_Posi:RECPositionResult ==K REC_V_Final:RECPositionResult
rule recsolve(REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => rectry(recmoves(), REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult)
  requires REC_V_Posi:RECPositionResult =/=K REC_V_Final:RECPositionResult
rule rectry(recnilml(), REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recfail()
rule rectry(reccm(REC_V_M:RECMoveResult, REC_V_ML:RECMoveListResult), REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recbest(recapply(REC_V_M:RECMoveResult, REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult), rectry(REC_V_ML:RECMoveListResult, REC_V_Posi:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult))
rule recapply(recmov(REC_V_T:RECTextResult, REC_V_DMW:RECIntResult, REC_V_DCW:RECIntResult, REC_V_DME:RECIntResult, REC_V_DCE:RECIntResult, REC_V_D:RECBankResult), recpos(REC_V_B:RECBankResult, REC_V_MW:RECIntResult, REC_V_CW:RECIntResult, REC_V_ME:RECIntResult, REC_V_CE:RECIntResult), REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => reccheck(REC_V_T:RECTextResult, recpos(REC_V_D:RECBankResult, recplus(REC_V_MW:RECIntResult, REC_V_DMW:RECIntResult), recplus(REC_V_CW:RECIntResult, REC_V_DCW:RECIntResult), recplus(REC_V_ME:RECIntResult, REC_V_DME:RECIntResult), recplus(REC_V_CE:RECIntResult, REC_V_DCE:RECIntResult)), REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult)
  requires REC_V_D:RECBankResult =/=K REC_V_B:RECBankResult
rule recapply(recmov(REC_V_T:RECTextResult, REC_V_DMW:RECIntResult, REC_V_DCW:RECIntResult, REC_V_DME:RECIntResult, REC_V_DCE:RECIntResult, REC_V_D:RECBankResult), recpos(REC_V_B:RECBankResult, REC_V_MW:RECIntResult, REC_V_CW:RECIntResult, REC_V_ME:RECIntResult, REC_V_CE:RECIntResult), REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recfail()
  requires REC_V_D:RECBankResult ==K REC_V_B:RECBankResult
rule reccheck(REC_V_T:RECTextResult, REC_V_NP:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recevalct(REC_V_T:RECTextResult, recsolve(REC_V_NP:RECPositionResult, REC_V_Final:RECPositionResult, reccp(REC_V_NP:RECPositionResult, REC_V_Prev:RECPosListResult)))
  requires recmember(REC_V_NP:RECPositionResult, REC_V_Prev:RECPosListResult) ==K recfalse()
   andBool recvalid(REC_V_NP:RECPositionResult) ==K rectrue()
rule reccheck(REC_V_T:RECTextResult, REC_V_NP:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recfail()
  requires recmember(REC_V_NP:RECPositionResult, REC_V_Prev:RECPosListResult) ==K rectrue()
rule reccheck(REC_V_T:RECTextResult, REC_V_NP:RECPositionResult, REC_V_Final:RECPositionResult, REC_V_Prev:RECPosListResult) => recfail()
  requires recvalid(REC_V_NP:RECPositionResult) ==K recfalse()
rule recvalid(recpos(REC_V_B:RECBankResult, REC_V_MW:RECIntResult, REC_V_CW:RECIntResult, REC_V_ME:RECIntResult, REC_V_CE:RECIntResult)) => recand(recgte(REC_V_MW:RECIntResult, recd0()), recand(recgte(REC_V_CW:RECIntResult, recd0()), recand(recgte(REC_V_ME:RECIntResult, recd0()), recand(recgte(REC_V_CE:RECIntResult, recd0()), recand(recor(recequal(REC_V_MW:RECIntResult, recd0()), recgte(REC_V_MW:RECIntResult, REC_V_CW:RECIntResult)), recor(recequal(REC_V_ME:RECIntResult, recd0()), recgte(REC_V_ME:RECIntResult, REC_V_CE:RECIntResult)))))))

// eval: recsolve(recpos(recwest(), recd2(), recd2(), recd0(), recd0()), recpos(receast(), recd0(), recd0(), recd2(), recd2()), recnilpl())

endmodule
