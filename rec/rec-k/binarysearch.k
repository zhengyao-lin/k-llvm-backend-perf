module BINARYSEARCH-SYNTAX

syntax RECBool
syntax RECPos
syntax RECInt
syntax RECNat

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= recT()
syntax RECBool ::= recF()
syntax RECPos ::= recOne()
syntax RECPos ::= reccDub(RECBool, RECPos)
syntax RECInt ::= reccInt(RECNat)
syntax RECInt ::= reccNeg(RECPos)
syntax RECNat ::= recZero()
syntax RECNat ::= reccNat(RECPos)
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
syntax RECNat ::= reclambda0(RECNat, RECNat, RECNat, RECNat) [function]
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
syntax RECPos ::= recsucc2(RECNat) [function]
syntax RECNat ::= recpred2(RECPos) [function]
syntax RECNat ::= recdub(RECBool, RECNat) [function]
syntax RECPos ::= recplusNatPos(RECNat, RECPos) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtp(RECPos, RECPos) [function]
syntax RECNat ::= recgtesubtn(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtb(RECBool, RECPos, RECPos) [function]
syntax RECNat ::= recdividePos(RECPos, RECPos) [function]
syntax RECNat ::= recdivide(RECNat, RECPos) [function]
syntax RECNat ::= recf(RECNat) [function]
syntax RECNat ::= recbs(RECNat, RECNat) [function]
syntax RECNat ::= recbs2(RECNat, RECNat, RECNat) [function]

endmodule

module BINARYSEARCH
imports K-EQUAL
imports BINARYSEARCH-SYNTAX

rule receqBool(recT(), REC_V_b:RECBool) => REC_V_b:RECBool
rule receqBool(recF(), recT()) => recF()
rule receqBool(recF(), recF()) => recT()
rule recand(recT(), REC_V_b:RECBool) => REC_V_b:RECBool
rule recand(recF(), REC_V_b:RECBool) => recF()
rule recnot(recT()) => recF()
rule recnot(recF()) => recT()
rule receqPos(recOne(), recOne()) => recT()
rule receqPos(recOne(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recF()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recOne()) => recF()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recand(receqBool(REC_V_b:RECBool, REC_V_c:RECBool), receqPos(REC_V_p:RECPos, REC_V_q:RECPos))
rule reclePos(recOne(), REC_V_p:RECPos) => recT()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recOne()) => recF()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool ==K REC_V_c:RECBool
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recF()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recT()
rule recltPos(REC_V_p:RECPos, recOne()) => recF()
rule recltPos(recOne(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recT()
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool ==K REC_V_c:RECBool
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recF()
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recT()
rule recgePos(REC_V_p:RECPos, REC_V_q:RECPos) => reclePos(REC_V_q:RECPos, REC_V_p:RECPos)
rule recsucc2Pos(recOne()) => reccDub(recF(), recOne())
rule recsucc2Pos(reccDub(recF(), REC_V_p:RECPos)) => reccDub(recT(), REC_V_p:RECPos)
rule recsucc2Pos(reccDub(recT(), REC_V_p:RECPos)) => reccDub(recF(), recsucc2Pos(REC_V_p:RECPos))
rule recplusPos(REC_V_p:RECPos, REC_V_q:RECPos) => recaddc(recF(), REC_V_p:RECPos, REC_V_q:RECPos)
rule recaddc(recF(), recOne(), REC_V_p:RECPos) => recsucc2Pos(REC_V_p:RECPos)
rule recaddc(recT(), recOne(), REC_V_p:RECPos) => recsucc2Pos(recsucc2Pos(REC_V_p:RECPos))
rule recaddc(recF(), REC_V_p:RECPos, recOne()) => recsucc2Pos(REC_V_p:RECPos)
rule recaddc(recT(), REC_V_p:RECPos, recOne()) => recsucc2Pos(recsucc2Pos(REC_V_p:RECPos))
rule recaddc(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => reccDub(REC_V_b:RECBool, recaddc(REC_V_c:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool ==K REC_V_d:RECBool
rule recaddc(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => reccDub(recnot(REC_V_b:RECBool), recaddc(REC_V_b:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool =/=K REC_V_d:RECBool
rule reclambda0(REC_V_n:RECNat, REC_V_y:RECNat, REC_V_x:RECNat, REC_V_h:RECNat) => recbs2(REC_V_n:RECNat, REC_V_h:RECNat, REC_V_y:RECNat)
  requires reclt(recf(REC_V_h:RECNat), REC_V_n:RECNat) ==K recT()
rule reclambda0(REC_V_n:RECNat, REC_V_y:RECNat, REC_V_x:RECNat, REC_V_h:RECNat) => recbs2(REC_V_n:RECNat, REC_V_x:RECNat, REC_V_h:RECNat)
  requires reclt(recf(REC_V_h:RECNat), REC_V_n:RECNat) ==K recF()
rule recmax2Int(reccInt(REC_V_m:RECNat), REC_V_n:RECNat) => recmax2(REC_V_m:RECNat, REC_V_n:RECNat)
rule recmax2Int(reccNeg(REC_V_p:RECPos), REC_V_n:RECNat) => REC_V_n:RECNat
rule recmin2(recZero()) => reccInt(recZero())
rule recmin2(reccNat(REC_V_p:RECPos)) => reccNeg(REC_V_p:RECPos)
rule recminus(REC_V_m:RECNat, REC_V_n:RECNat) => reccInt(recgtesubtn(REC_V_m:RECNat, REC_V_n:RECNat))
  requires recge(REC_V_m:RECNat, REC_V_n:RECNat) ==K recT()
rule recminus(REC_V_m:RECNat, REC_V_n:RECNat) => recmin2(recgtesubtn(REC_V_n:RECNat, REC_V_m:RECNat))
  requires reclt(REC_V_m:RECNat, REC_V_n:RECNat) ==K recT()
rule receq(recZero(), recZero()) => recT()
rule receq(recZero(), reccNat(REC_V_p:RECPos)) => recF()
rule receq(reccNat(REC_V_p:RECPos), recZero()) => recF()
rule receq(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => receqPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recite(recT(), REC_V_m:RECNat, REC_V_n:RECNat) => REC_V_m:RECNat
rule recite(recF(), REC_V_m:RECNat, REC_V_n:RECNat) => REC_V_n:RECNat
rule recPos2Nat(REC_V_p:RECPos) => reccNat(REC_V_p:RECPos)
rule recNat2Pos(reccNat(REC_V_p:RECPos)) => REC_V_p:RECPos
rule recle(recZero(), REC_V_n:RECNat) => recT()
rule recle(reccNat(REC_V_p:RECPos), recZero()) => recF()
rule recle(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
rule reclt(REC_V_n:RECNat, recZero()) => recF()
rule reclt(recZero(), reccNat(REC_V_p:RECPos)) => recT()
rule reclt(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recge(REC_V_m:RECNat, REC_V_n:RECNat) => recle(REC_V_n:RECNat, REC_V_m:RECNat)
rule recmax2(REC_V_m:RECNat, REC_V_n:RECNat) => recite(recle(REC_V_m:RECNat, REC_V_n:RECNat), REC_V_n:RECNat, REC_V_m:RECNat)
rule recsucc2(recZero()) => recOne()
rule recsucc2(reccNat(REC_V_p:RECPos)) => recsucc2Pos(REC_V_p:RECPos)
rule recpred2(recOne()) => recZero()
rule recpred2(reccDub(recT(), REC_V_p:RECPos)) => reccNat(reccDub(recF(), REC_V_p:RECPos))
rule recpred2(reccDub(recF(), REC_V_p:RECPos)) => recdub(recT(), recpred2(REC_V_p:RECPos))
rule recdub(recF(), recZero()) => recZero()
rule recdub(recT(), recZero()) => reccNat(recOne())
rule recdub(REC_V_b:RECBool, reccNat(REC_V_p:RECPos)) => reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos))
rule recplusNatPos(recZero(), REC_V_p:RECPos) => REC_V_p:RECPos
rule recplusNatPos(reccNat(REC_V_p:RECPos), REC_V_q:RECPos) => recplusPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recplus(recZero(), REC_V_n:RECNat) => REC_V_n:RECNat
rule recplus(REC_V_n:RECNat, recZero()) => REC_V_n:RECNat
rule recplus(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => reccNat(recaddc(recF(), REC_V_p:RECPos, REC_V_q:RECPos))
rule recgtesubtp(REC_V_p:RECPos, REC_V_q:RECPos) => recgtesubtb(recF(), REC_V_p:RECPos, REC_V_q:RECPos)
rule recgtesubtn(REC_V_n:RECNat, recZero()) => REC_V_n:RECNat
rule recgtesubtn(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => recgtesubtp(REC_V_p:RECPos, REC_V_q:RECPos)
rule recgtesubtb(recF(), REC_V_p:RECPos, recOne()) => recpred2(REC_V_p:RECPos)
rule recgtesubtb(recT(), REC_V_p:RECPos, recOne()) => recpred2(recNat2Pos(recpred2(REC_V_p:RECPos)))
rule recgtesubtb(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => recdub(REC_V_b:RECBool, recgtesubtb(REC_V_b:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool ==K REC_V_d:RECBool
rule recgtesubtb(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => recdub(recnot(REC_V_b:RECBool), recgtesubtb(REC_V_d:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool =/=K REC_V_d:RECBool
rule recdividePos(REC_V_p:RECPos, REC_V_q:RECPos) => reccNat(recsucc2(recdivide(recgtesubtp(REC_V_p:RECPos, REC_V_q:RECPos), REC_V_q:RECPos)))
  requires recgePos(REC_V_p:RECPos, REC_V_q:RECPos) ==K recT()
rule recdividePos(REC_V_p:RECPos, REC_V_q:RECPos) => recZero()
  requires recltPos(REC_V_p:RECPos, REC_V_q:RECPos) ==K recT()
rule recdivide(recZero(), REC_V_p:RECPos) => recZero()
rule recdivide(reccNat(REC_V_p:RECPos), REC_V_q:RECPos) => recdividePos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recf(recZero()) => recZero()
rule recf(reccNat(recOne())) => reccNat(recOne())
rule recf(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos))) => recplus(recf(recmax2Int(recminus(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos)), recPos2Nat(recOne())), recZero())), recf(recmax2Int(recminus(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos)), recPos2Nat(reccDub(recF(), recOne()))), recZero())))
rule recbs(REC_V_n:RECNat, REC_V_m:RECNat) => recbs2(REC_V_n:RECNat, recZero(), REC_V_m:RECNat)
rule recbs2(REC_V_n:RECNat, REC_V_x:RECNat, REC_V_y:RECNat) => REC_V_x:RECNat
  requires receq(recPos2Nat(recplusNatPos(REC_V_x:RECNat, recOne())), REC_V_y:RECNat) ==K recT()
rule recbs2(REC_V_n:RECNat, REC_V_x:RECNat, REC_V_y:RECNat) => reclambda0(REC_V_n:RECNat, REC_V_y:RECNat, REC_V_x:RECNat, recdivide(recplus(REC_V_x:RECNat, REC_V_y:RECNat), reccDub(recF(), recOne())))
  requires receq(recPos2Nat(recplusNatPos(REC_V_x:RECNat, recOne())), REC_V_y:RECNat) ==K recF()

// eval: recbs(recPos2Nat(reccDub(recT(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recT(), reccDub(recF(), reccDub(recT(), reccDub(recF(), reccDub(recT(), recOne())))))))))))), recPos2Nat(reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), recOne()))))))))

endmodule
