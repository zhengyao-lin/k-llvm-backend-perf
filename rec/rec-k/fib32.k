module FIB32-SYNTAX

syntax RECBool
syntax RECPos
syntax RECInt
syntax RECNat

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= recT()
syntax RECBool ::= recF()
syntax RECPos ::= recd1()
syntax RECPos ::= reccDub(RECBool, RECPos)
syntax RECInt ::= reccInt(RECNat)
syntax RECInt ::= reccNeg(RECPos)
syntax RECNat ::= recd0()
syntax RECNat ::= reccNat(RECPos)
syntax RECBool ::= recnot(RECBool) [function]
syntax RECBool ::= receqPos(RECPos, RECPos) [function]
syntax RECBool ::= reclePos(RECPos, RECPos) [function]
syntax RECBool ::= recltPos(RECPos, RECPos) [function]
syntax RECPos ::= recs(RECPos) [function]
syntax RECPos ::= recaddc(RECBool, RECPos, RECPos) [function]
syntax RECNat ::= recInt2Nat(RECInt) [function]
syntax RECInt ::= recminus(RECNat) [function]
syntax RECInt ::= recminus2(RECNat, RECNat) [function]
syntax RECBool ::= receq(RECNat, RECNat) [function]
syntax RECNat ::= recPos2Nat(RECPos) [function]
syntax RECPos ::= recNat2Pos(RECNat) [function]
syntax RECBool ::= recle(RECNat, RECNat) [function]
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECBool ::= recge(RECNat, RECNat) [function]
syntax RECBool ::= recgt(RECNat, RECNat) [function]
syntax RECNat ::= recpre(RECPos) [function]
syntax RECNat ::= recdub(RECBool, RECNat) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtPos(RECPos, RECPos) [function]
syntax RECNat ::= recgtesubt(RECNat, RECNat) [function]
syntax RECNat ::= recgtesubtb(RECBool, RECPos, RECPos) [function]
syntax RECNat ::= recfib(RECNat) [function]
syntax RECBool ::= receqBool(RECBool, RECBool) [function]
syntax RECBool ::= recand(RECBool, RECBool) [function]

endmodule

module FIB32
imports K-EQUAL
imports FIB32-SYNTAX

rule receqBool(recT(), REC_V_b:RECBool) => REC_V_b:RECBool
rule receqBool(recF(), recT()) => recF()
rule receqBool(recF(), recF()) => recT()
rule recand(recT(), REC_V_b:RECBool) => REC_V_b:RECBool
rule recand(recF(), REC_V_b:RECBool) => recF()
rule recnot(recT()) => recF()
rule recnot(recF()) => recT()
rule receqPos(recd1(), recd1()) => recT()
rule receqPos(recd1(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recF()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recd1()) => recF()
rule receqPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recand(receqBool(REC_V_b:RECBool, REC_V_c:RECBool), receqPos(REC_V_p:RECPos, REC_V_q:RECPos))
rule reclePos(recd1(), REC_V_p:RECPos) => recT()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), recd1()) => recF()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool ==K REC_V_c:RECBool
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recF()
rule reclePos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recT()
rule recltPos(REC_V_p:RECPos, recd1()) => recF()
rule recltPos(recd1(), reccDub(REC_V_b:RECBool, REC_V_p:RECPos)) => recT()
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool ==K REC_V_c:RECBool
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recF()
rule recltPos(reccDub(REC_V_b:RECBool, REC_V_p:RECPos), reccDub(REC_V_c:RECBool, REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
  requires REC_V_b:RECBool =/=K REC_V_c:RECBool
   andBool REC_V_b:RECBool ==K recT()
rule recs(recd1()) => reccDub(recF(), recd1())
rule recs(reccDub(recF(), REC_V_p:RECPos)) => reccDub(recT(), REC_V_p:RECPos)
rule recs(reccDub(recT(), REC_V_p:RECPos)) => reccDub(recF(), recs(REC_V_p:RECPos))
rule recaddc(recF(), recd1(), REC_V_p:RECPos) => recs(REC_V_p:RECPos)
rule recaddc(recT(), recd1(), REC_V_p:RECPos) => recs(recs(REC_V_p:RECPos))
rule recaddc(recF(), REC_V_p:RECPos, recd1()) => recs(REC_V_p:RECPos)
rule recaddc(recT(), REC_V_p:RECPos, recd1()) => recs(recs(REC_V_p:RECPos))
rule recaddc(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => reccDub(REC_V_b:RECBool, recaddc(REC_V_c:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool ==K REC_V_d:RECBool
rule recaddc(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => reccDub(recnot(REC_V_b:RECBool), recaddc(REC_V_c:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool =/=K REC_V_d:RECBool
rule recInt2Nat(reccInt(REC_V_n:RECNat)) => REC_V_n:RECNat
rule recminus(recd0()) => reccInt(recd0())
rule recminus(reccNat(REC_V_p:RECPos)) => reccNeg(REC_V_p:RECPos)
rule recminus2(REC_V_m:RECNat, REC_V_n:RECNat) => reccInt(recgtesubt(REC_V_m:RECNat, REC_V_n:RECNat))
  requires recge(REC_V_m:RECNat, REC_V_n:RECNat) ==K recT()
rule recminus2(REC_V_m:RECNat, REC_V_n:RECNat) => recminus(recgtesubt(REC_V_n:RECNat, REC_V_m:RECNat))
  requires recge(REC_V_m:RECNat, REC_V_n:RECNat) ==K recF()
rule recPos2Nat(REC_V_p:RECPos) => reccNat(REC_V_p:RECPos)
rule recNat2Pos(reccNat(REC_V_p:RECPos)) => REC_V_p:RECPos
rule receq(recd0(), recd0()) => recT()
rule receq(recd0(), reccNat(REC_V_p:RECPos)) => recF()
rule receq(reccNat(REC_V_p:RECPos), recd0()) => recF()
rule receq(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => receqPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recle(recd0(), REC_V_n:RECNat) => recT()
rule recle(reccNat(REC_V_p:RECPos), recd0()) => recF()
rule recle(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => reclePos(REC_V_p:RECPos, REC_V_q:RECPos)
rule reclt(REC_V_n:RECNat, recd0()) => recF()
rule reclt(recd0(), reccNat(REC_V_p:RECPos)) => recT()
rule reclt(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => recltPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recge(REC_V_m:RECNat, REC_V_n:RECNat) => recle(REC_V_n:RECNat, REC_V_m:RECNat)
rule recgt(REC_V_m:RECNat, REC_V_n:RECNat) => reclt(REC_V_n:RECNat, REC_V_m:RECNat)
rule recpre(recd1()) => recd0()
rule recpre(reccDub(recT(), REC_V_p:RECPos)) => reccNat(reccDub(recF(), REC_V_p:RECPos))
rule recpre(reccDub(recF(), REC_V_p:RECPos)) => recdub(recT(), recpre(REC_V_p:RECPos))
rule recdub(recF(), recd0()) => recd0()
rule recdub(recT(), recd0()) => reccNat(recd1())
rule recdub(REC_V_b:RECBool, reccNat(REC_V_p:RECPos)) => reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos))
rule recplus(recd0(), REC_V_n:RECNat) => REC_V_n:RECNat
rule recplus(REC_V_n:RECNat, recd0()) => REC_V_n:RECNat
rule recplus(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => reccNat(recaddc(recF(), REC_V_p:RECPos, REC_V_q:RECPos))
rule recgtesubtPos(REC_V_p:RECPos, REC_V_q:RECPos) => recgtesubtb(recF(), REC_V_p:RECPos, REC_V_q:RECPos)
rule recgtesubt(REC_V_n:RECNat, recd0()) => REC_V_n:RECNat
rule recgtesubt(reccNat(REC_V_p:RECPos), reccNat(REC_V_q:RECPos)) => recgtesubtPos(REC_V_p:RECPos, REC_V_q:RECPos)
rule recgtesubtb(recF(), REC_V_p:RECPos, recd1()) => recpre(REC_V_p:RECPos)
rule recgtesubtb(recT(), REC_V_p:RECPos, recd1()) => recpre(recNat2Pos(recpre(REC_V_p:RECPos)))
rule recgtesubtb(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => recdub(REC_V_b:RECBool, recgtesubtb(REC_V_b:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool ==K REC_V_d:RECBool
rule recgtesubtb(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => recdub(recnot(REC_V_b:RECBool), recgtesubtb(recT(), REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool =/=K REC_V_d:RECBool
   andBool REC_V_c:RECBool ==K recF()
rule recgtesubtb(REC_V_b:RECBool, reccDub(REC_V_c:RECBool, REC_V_p:RECPos), reccDub(REC_V_d:RECBool, REC_V_q:RECPos)) => recdub(recnot(REC_V_b:RECBool), recgtesubtb(REC_V_d:RECBool, REC_V_p:RECPos, REC_V_q:RECPos))
  requires REC_V_c:RECBool =/=K REC_V_d:RECBool
   andBool REC_V_c:RECBool ==K recT()
rule recfib(recd0()) => recd0()
rule recfib(reccNat(recd1())) => reccNat(recd1())
rule recfib(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos))) => recplus(recfib(recInt2Nat(recminus2(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos)), recPos2Nat(recd1())))), recfib(recInt2Nat(recminus2(reccNat(reccDub(REC_V_b:RECBool, REC_V_p:RECPos)), recPos2Nat(reccDub(recF(), recd1()))))))

// eval: recfib(recPos2Nat(reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), recd1())))))))

endmodule
