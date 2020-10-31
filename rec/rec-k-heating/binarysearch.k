module BINARYSEARCH-SYNTAX

syntax RECBoolResult
syntax RECPosResult
syntax RECIntResult
syntax RECNatResult

syntax RECBool ::= RECBoolResult
syntax RECPos ::= RECPosResult
syntax RECInt ::= RECIntResult
syntax RECNat ::= RECNatResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECPosResult
syntax KResult ::= RECIntResult
syntax KResult ::= RECNatResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= recT()
syntax RECBoolResult ::= recT()
syntax RECBool ::= recF()
syntax RECBoolResult ::= recF()
syntax RECPos ::= recOne()
syntax RECPosResult ::= recOne()
syntax RECPos ::= reccDub(RECBool, RECPos) [seqstrict]
syntax RECPosResult ::= reccDub(RECBoolResult, RECPosResult)
syntax RECInt ::= reccInt(RECNat) [seqstrict]
syntax RECIntResult ::= reccInt(RECNatResult)
syntax RECInt ::= reccNeg(RECPos) [seqstrict]
syntax RECIntResult ::= reccNeg(RECPosResult)
syntax RECNat ::= recZero()
syntax RECNatResult ::= recZero()
syntax RECNat ::= reccNat(RECPos) [seqstrict]
syntax RECNatResult ::= reccNat(RECPosResult)
syntax RECBool ::= receqBool(RECBool, RECBool) [function]
syntax RECBool ::= recnot(RECBool) [function]
syntax RECBool ::= recand(RECBool, RECBool) [function]
syntax RECBool ::= receqPos(RECPos, RECPos) [function]
syntax RECBool ::= reclePos(RECPos, RECPos) [function]
syntax RECBool ::= recltPos(RECPos, RECPos) [function]
syntax RECBool ::= recgePos(RECPos, RECPos) [function]
syntax RECPos ::= recsucc2Pos(RECPos) [function]
syntax RECPos ::= recplusPos(RECPos, RECPos) [function]
syntax RECPos ::= recaddc(RECBool, RECPos, RECPos) [function]
syntax RECNat ::= reclambda0(RECNat, RECNat, RECNat, RECNat) [seqstrict]
syntax RECNat ::= recmax2Int(RECInt, RECNat) [function]
syntax RECInt ::= recmin2(RECNat) [function]
syntax RECInt ::= recminus(RECNat, RECNat) [function]
syntax RECBool ::= receq(RECNat, RECNat) [function]
syntax RECNat ::= recite(RECBool, RECNat, RECNat) [function]
syntax RECNat ::= recPos2Nat(RECPos) [function]
syntax RECPos ::= recNat2Pos(RECNat) [function]
syntax RECBool ::= recle(RECNat, RECNat) [function]
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECBool ::= recge(RECNat, RECNat) [function]
syntax RECNat ::= recmax2(RECNat, RECNat) [function]
syntax RECPos ::= recsucc2(RECNat) [seqstrict]
syntax RECNat ::= recpred2(RECPos) [function]
syntax RECNat ::= recdub(RECBool, RECNat) [function]
syntax RECPos ::= recplusNatPos(RECNat, RECPos) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtp(RECPos, RECPos) [function]
syntax RECNat ::= recgtesubtn(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtb(RECBool, RECPos, RECPos) [function]
syntax RECNat ::= recdividePos(RECPos, RECPos) [seqstrict]
syntax RECNat ::= recdivide(RECNat, RECPos) [seqstrict]
syntax RECNat ::= recf(RECNat) [function]
syntax RECNat ::= recbs(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recbs2(RECNat, RECNat, RECNat) [seqstrict]

endmodule

module BINARYSEARCH
imports K-EQUAL
imports BINARYSEARCH-SYNTAX

rule receqBool(recT(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule receqBool(recF(), recT()) => recF()
rule receqBool(recF(), recF()) => recT()
rule recand(recT(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule recand(recF(), REC_V_b:RECBoolResult) => recF()
rule recnot(recT()) => recF()
rule recnot(recF()) => recT()
rule receqPos(recOne(), recOne()) => recT()
rule receqPos(recOne(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recF()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recOne()) => recF()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recand(receqBool(REC_V_b:RECBoolResult, REC_V_c:RECBoolResult), receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule reclePos(recOne(), REC_V_p:RECPosResult) => recT()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recOne()) => recF()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult ==K REC_V_c:RECBoolResult
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recF()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recT()
rule recltPos(REC_V_p:RECPosResult, recOne()) => recF()
rule recltPos(recOne(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recT()
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult ==K REC_V_c:RECBoolResult
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recF()
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recT()
rule recgePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => reclePos(REC_V_q:RECPosResult, REC_V_p:RECPosResult)
rule recsucc2Pos(recOne()) => reccDub(recF(), recOne())
rule recsucc2Pos(reccDub(recF(), REC_V_p:RECPosResult)) => reccDub(recT(), REC_V_p:RECPosResult)
rule recsucc2Pos(reccDub(recT(), REC_V_p:RECPosResult)) => reccDub(recF(), recsucc2Pos(REC_V_p:RECPosResult))
rule recplusPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => recaddc(recF(), REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recaddc(recF(), recOne(), REC_V_p:RECPosResult) => recsucc2Pos(REC_V_p:RECPosResult)
rule recaddc(recT(), recOne(), REC_V_p:RECPosResult) => recsucc2Pos(recsucc2Pos(REC_V_p:RECPosResult))
rule recaddc(recF(), REC_V_p:RECPosResult, recOne()) => recsucc2Pos(REC_V_p:RECPosResult)
rule recaddc(recT(), REC_V_p:RECPosResult, recOne()) => recsucc2Pos(recsucc2Pos(REC_V_p:RECPosResult))
rule recaddc(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => reccDub(REC_V_b:RECBoolResult, recaddc(REC_V_c:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult ==K REC_V_d:RECBoolResult
rule recaddc(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => reccDub(recnot(REC_V_b:RECBoolResult), recaddc(REC_V_b:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult =/=K REC_V_d:RECBoolResult
rule reclambda0(REC_V_n:RECNatResult, REC_V_y:RECNatResult, REC_V_x:RECNatResult, REC_V_h:RECNatResult) => recbs2(REC_V_n:RECNatResult, REC_V_h:RECNatResult, REC_V_y:RECNatResult)
  requires reclt(recf(REC_V_h:RECNatResult), REC_V_n:RECNatResult) ==K recT()
rule reclambda0(REC_V_n:RECNatResult, REC_V_y:RECNatResult, REC_V_x:RECNatResult, REC_V_h:RECNatResult) => recbs2(REC_V_n:RECNatResult, REC_V_x:RECNatResult, REC_V_h:RECNatResult)
  requires reclt(recf(REC_V_h:RECNatResult), REC_V_n:RECNatResult) ==K recF()
rule recmax2Int(reccInt(REC_V_m:RECNatResult), REC_V_n:RECNatResult) => recmax2(REC_V_m:RECNatResult, REC_V_n:RECNatResult)
rule recmax2Int(reccNeg(REC_V_p:RECPosResult), REC_V_n:RECNatResult) => REC_V_n:RECNatResult
rule recmin2(recZero()) => reccInt(recZero())
rule recmin2(reccNat(REC_V_p:RECPosResult)) => reccNeg(REC_V_p:RECPosResult)
rule recminus(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => reccInt(recgtesubtn(REC_V_m:RECNatResult, REC_V_n:RECNatResult))
  requires recge(REC_V_m:RECNatResult, REC_V_n:RECNatResult) ==K recT()
rule recminus(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => recmin2(recgtesubtn(REC_V_n:RECNatResult, REC_V_m:RECNatResult))
  requires reclt(REC_V_m:RECNatResult, REC_V_n:RECNatResult) ==K recT()
rule receq(recZero(), recZero()) => recT()
rule receq(recZero(), reccNat(REC_V_p:RECPosResult)) => recF()
rule receq(reccNat(REC_V_p:RECPosResult), recZero()) => recF()
rule receq(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recite(recT(), REC_V_m:RECNatResult, REC_V_n:RECNatResult) => REC_V_m:RECNatResult
rule recite(recF(), REC_V_m:RECNatResult, REC_V_n:RECNatResult) => REC_V_n:RECNatResult
rule recPos2Nat(REC_V_p:RECPosResult) => reccNat(REC_V_p:RECPosResult)
rule recNat2Pos(reccNat(REC_V_p:RECPosResult)) => REC_V_p:RECPosResult
rule recle(recZero(), REC_V_n:RECNatResult) => recT()
rule recle(reccNat(REC_V_p:RECPosResult), recZero()) => recF()
rule recle(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule reclt(REC_V_n:RECNatResult, recZero()) => recF()
rule reclt(recZero(), reccNat(REC_V_p:RECPosResult)) => recT()
rule reclt(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recge(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => recle(REC_V_n:RECNatResult, REC_V_m:RECNatResult)
rule recmax2(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => recite(recle(REC_V_m:RECNatResult, REC_V_n:RECNatResult), REC_V_n:RECNatResult, REC_V_m:RECNatResult)
rule recsucc2(recZero()) => recOne()
rule recsucc2(reccNat(REC_V_p:RECPosResult)) => recsucc2Pos(REC_V_p:RECPosResult)
rule recpred2(recOne()) => recZero()
rule recpred2(reccDub(recT(), REC_V_p:RECPosResult)) => reccNat(reccDub(recF(), REC_V_p:RECPosResult))
rule recpred2(reccDub(recF(), REC_V_p:RECPosResult)) => recdub(recT(), recpred2(REC_V_p:RECPosResult))
rule recdub(recF(), recZero()) => recZero()
rule recdub(recT(), recZero()) => reccNat(recOne())
rule recdub(REC_V_b:RECBoolResult, reccNat(REC_V_p:RECPosResult)) => reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult))
rule recplusNatPos(recZero(), REC_V_p:RECPosResult) => REC_V_p:RECPosResult
rule recplusNatPos(reccNat(REC_V_p:RECPosResult), REC_V_q:RECPosResult) => recplusPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recplus(recZero(), REC_V_n:RECNatResult) => REC_V_n:RECNatResult
rule recplus(REC_V_n:RECNatResult, recZero()) => REC_V_n:RECNatResult
rule recplus(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => reccNat(recaddc(recF(), REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule recgtesubtp(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => recgtesubtb(recF(), REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recgtesubtn(REC_V_n:RECNatResult, recZero()) => REC_V_n:RECNatResult
rule recgtesubtn(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => recgtesubtp(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recgtesubtb(recF(), REC_V_p:RECPosResult, recOne()) => recpred2(REC_V_p:RECPosResult)
rule recgtesubtb(recT(), REC_V_p:RECPosResult, recOne()) => recpred2(recNat2Pos(recpred2(REC_V_p:RECPosResult)))
rule recgtesubtb(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => recdub(REC_V_b:RECBoolResult, recgtesubtb(REC_V_b:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult ==K REC_V_d:RECBoolResult
rule recgtesubtb(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => recdub(recnot(REC_V_b:RECBoolResult), recgtesubtb(REC_V_d:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult =/=K REC_V_d:RECBoolResult
rule recdividePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => reccNat(recsucc2(recdivide(recgtesubtp(REC_V_p:RECPosResult, REC_V_q:RECPosResult), REC_V_q:RECPosResult)))
  requires recgePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) ==K recT()
rule recdividePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => recZero()
  requires recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) ==K recT()
rule recdivide(recZero(), REC_V_p:RECPosResult) => recZero()
rule recdivide(reccNat(REC_V_p:RECPosResult), REC_V_q:RECPosResult) => recdividePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recf(recZero()) => recZero()
rule recf(reccNat(recOne())) => reccNat(recOne())
rule recf(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult))) => recplus(recf(recmax2Int(recminus(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)), recPos2Nat(recOne())), recZero())), recf(recmax2Int(recminus(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)), recPos2Nat(reccDub(recF(), recOne()))), recZero())))
rule recbs(REC_V_n:RECNatResult, REC_V_m:RECNatResult) => recbs2(REC_V_n:RECNatResult, recZero(), REC_V_m:RECNatResult)
rule recbs2(REC_V_n:RECNatResult, REC_V_x:RECNatResult, REC_V_y:RECNatResult) => REC_V_x:RECNatResult
  requires receq(recPos2Nat(recplusNatPos(REC_V_x:RECNatResult, recOne())), REC_V_y:RECNatResult) ==K recT()
rule recbs2(REC_V_n:RECNatResult, REC_V_x:RECNatResult, REC_V_y:RECNatResult) => reclambda0(REC_V_n:RECNatResult, REC_V_y:RECNatResult, REC_V_x:RECNatResult, recdivide(recplus(REC_V_x:RECNatResult, REC_V_y:RECNatResult), reccDub(recF(), recOne())))
  requires receq(recPos2Nat(recplusNatPos(REC_V_x:RECNatResult, recOne())), REC_V_y:RECNatResult) ==K recF()

// eval: recbs(recPos2Nat(reccDub(recT(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recF(), reccDub(recT(), recOne())))))))))))), recPos2Nat(reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), recOne()))))))))

endmodule
