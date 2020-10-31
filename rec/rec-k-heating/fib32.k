module FIB32-SYNTAX

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
syntax RECPos ::= recd1()
syntax RECPosResult ::= recd1()
syntax RECPos ::= reccDub(RECBool, RECPos) [seqstrict]
syntax RECPosResult ::= reccDub(RECBoolResult, RECPosResult)
syntax RECInt ::= reccInt(RECNat) [seqstrict]
syntax RECIntResult ::= reccInt(RECNatResult)
syntax RECInt ::= reccNeg(RECPos) [seqstrict]
syntax RECIntResult ::= reccNeg(RECPosResult)
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= reccNat(RECPos) [seqstrict]
syntax RECNatResult ::= reccNat(RECPosResult)
syntax RECBool ::= recnot(RECBool) [seqstrict]
syntax RECBool ::= receqPos(RECPos, RECPos) [seqstrict]
syntax RECBool ::= reclePos(RECPos, RECPos) [function]
syntax RECBool ::= recltPos(RECPos, RECPos) [function]
syntax RECPos ::= recs(RECPos) [seqstrict]
syntax RECPos ::= recaddc(RECBool, RECPos, RECPos) [seqstrict]
syntax RECNat ::= recInt2Nat(RECInt) [seqstrict]
syntax RECInt ::= recminus(RECNat) [seqstrict]
syntax RECInt ::= recminus2(RECNat, RECNat) [seqstrict]
syntax RECBool ::= receq(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recPos2Nat(RECPos) [seqstrict]
syntax RECPos ::= recNat2Pos(RECNat) [seqstrict]
syntax RECBool ::= recle(RECNat, RECNat) [function]
syntax RECBool ::= reclt(RECNat, RECNat) [seqstrict]
syntax RECBool ::= recge(RECNat, RECNat) [function]
syntax RECBool ::= recgt(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recpre(RECPos) [seqstrict]
syntax RECNat ::= recdub(RECBool, RECNat) [seqstrict]
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recgtesubtPos(RECPos, RECPos) [seqstrict]
syntax RECNat ::= recgtesubt(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recgtesubtb(RECBool, RECPos, RECPos) [seqstrict]
syntax RECNat ::= recfib(RECNat) [seqstrict]
syntax RECBool ::= receqBool(RECBool, RECBool) [seqstrict]
syntax RECBool ::= recand(RECBool, RECBool) [seqstrict]

endmodule

module FIB32
imports K-EQUAL
imports FIB32-SYNTAX

rule receqBool(recT(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule receqBool(recF(), recT()) => recF()
rule receqBool(recF(), recF()) => recT()
rule recand(recT(), REC_V_b:RECBoolResult) => REC_V_b:RECBoolResult
rule recand(recF(), REC_V_b:RECBoolResult) => recF()
rule recnot(recT()) => recF()
rule recnot(recF()) => recT()
rule receqPos(recd1(), recd1()) => recT()
rule receqPos(recd1(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recF()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recd1()) => recF()
rule receqPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recand(receqBool(REC_V_b:RECBoolResult, REC_V_c:RECBoolResult), receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule reclePos(recd1(), REC_V_p:RECPosResult) => recT()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), recd1()) => recF()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult ==K REC_V_c:RECBoolResult
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recF()
rule reclePos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recT()
rule recltPos(REC_V_p:RECPosResult, recd1()) => recF()
rule recltPos(recd1(), reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)) => recT()
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult ==K REC_V_c:RECBoolResult
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recF()
rule recltPos(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_c:RECBoolResult, REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
  requires REC_V_b:RECBoolResult =/=K REC_V_c:RECBoolResult
   andBool REC_V_b:RECBoolResult ==K recT()
rule recs(recd1()) => reccDub(recF(), recd1())
rule recs(reccDub(recF(), REC_V_p:RECPosResult)) => reccDub(recT(), REC_V_p:RECPosResult)
rule recs(reccDub(recT(), REC_V_p:RECPosResult)) => reccDub(recF(), recs(REC_V_p:RECPosResult))
rule recaddc(recF(), recd1(), REC_V_p:RECPosResult) => recs(REC_V_p:RECPosResult)
rule recaddc(recT(), recd1(), REC_V_p:RECPosResult) => recs(recs(REC_V_p:RECPosResult))
rule recaddc(recF(), REC_V_p:RECPosResult, recd1()) => recs(REC_V_p:RECPosResult)
rule recaddc(recT(), REC_V_p:RECPosResult, recd1()) => recs(recs(REC_V_p:RECPosResult))
rule recaddc(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => reccDub(REC_V_b:RECBoolResult, recaddc(REC_V_c:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult ==K REC_V_d:RECBoolResult
rule recaddc(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => reccDub(recnot(REC_V_b:RECBoolResult), recaddc(REC_V_c:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult =/=K REC_V_d:RECBoolResult
rule recInt2Nat(reccInt(REC_V_n:RECNatResult)) => REC_V_n:RECNatResult
rule recminus(recd0()) => reccInt(recd0())
rule recminus(reccNat(REC_V_p:RECPosResult)) => reccNeg(REC_V_p:RECPosResult)
rule recminus2(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => reccInt(recgtesubt(REC_V_m:RECNatResult, REC_V_n:RECNatResult))
  requires recge(REC_V_m:RECNatResult, REC_V_n:RECNatResult) ==K recT()
rule recminus2(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => recminus(recgtesubt(REC_V_n:RECNatResult, REC_V_m:RECNatResult))
  requires recge(REC_V_m:RECNatResult, REC_V_n:RECNatResult) ==K recF()
rule recPos2Nat(REC_V_p:RECPosResult) => reccNat(REC_V_p:RECPosResult)
rule recNat2Pos(reccNat(REC_V_p:RECPosResult)) => REC_V_p:RECPosResult
rule receq(recd0(), recd0()) => recT()
rule receq(recd0(), reccNat(REC_V_p:RECPosResult)) => recF()
rule receq(reccNat(REC_V_p:RECPosResult), recd0()) => recF()
rule receq(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => receqPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recle(recd0(), REC_V_n:RECNatResult) => recT()
rule recle(reccNat(REC_V_p:RECPosResult), recd0()) => recF()
rule recle(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => reclePos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule reclt(REC_V_n:RECNatResult, recd0()) => recF()
rule reclt(recd0(), reccNat(REC_V_p:RECPosResult)) => recT()
rule reclt(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => recltPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recge(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => recle(REC_V_n:RECNatResult, REC_V_m:RECNatResult)
rule recgt(REC_V_m:RECNatResult, REC_V_n:RECNatResult) => reclt(REC_V_n:RECNatResult, REC_V_m:RECNatResult)
rule recpre(recd1()) => recd0()
rule recpre(reccDub(recT(), REC_V_p:RECPosResult)) => reccNat(reccDub(recF(), REC_V_p:RECPosResult))
rule recpre(reccDub(recF(), REC_V_p:RECPosResult)) => recdub(recT(), recpre(REC_V_p:RECPosResult))
rule recdub(recF(), recd0()) => recd0()
rule recdub(recT(), recd0()) => reccNat(recd1())
rule recdub(REC_V_b:RECBoolResult, reccNat(REC_V_p:RECPosResult)) => reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult))
rule recplus(recd0(), REC_V_n:RECNatResult) => REC_V_n:RECNatResult
rule recplus(REC_V_n:RECNatResult, recd0()) => REC_V_n:RECNatResult
rule recplus(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => reccNat(recaddc(recF(), REC_V_p:RECPosResult, REC_V_q:RECPosResult))
rule recgtesubtPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult) => recgtesubtb(recF(), REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recgtesubt(REC_V_n:RECNatResult, recd0()) => REC_V_n:RECNatResult
rule recgtesubt(reccNat(REC_V_p:RECPosResult), reccNat(REC_V_q:RECPosResult)) => recgtesubtPos(REC_V_p:RECPosResult, REC_V_q:RECPosResult)
rule recgtesubtb(recF(), REC_V_p:RECPosResult, recd1()) => recpre(REC_V_p:RECPosResult)
rule recgtesubtb(recT(), REC_V_p:RECPosResult, recd1()) => recpre(recNat2Pos(recpre(REC_V_p:RECPosResult)))
rule recgtesubtb(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => recdub(REC_V_b:RECBoolResult, recgtesubtb(REC_V_b:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult ==K REC_V_d:RECBoolResult
rule recgtesubtb(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => recdub(recnot(REC_V_b:RECBoolResult), recgtesubtb(recT(), REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult =/=K REC_V_d:RECBoolResult
   andBool REC_V_c:RECBoolResult ==K recF()
rule recgtesubtb(REC_V_b:RECBoolResult, reccDub(REC_V_c:RECBoolResult, REC_V_p:RECPosResult), reccDub(REC_V_d:RECBoolResult, REC_V_q:RECPosResult)) => recdub(recnot(REC_V_b:RECBoolResult), recgtesubtb(REC_V_d:RECBoolResult, REC_V_p:RECPosResult, REC_V_q:RECPosResult))
  requires REC_V_c:RECBoolResult =/=K REC_V_d:RECBoolResult
   andBool REC_V_c:RECBoolResult ==K recT()
rule recfib(recd0()) => recd0()
rule recfib(reccNat(recd1())) => reccNat(recd1())
rule recfib(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult))) => recplus(recfib(recInt2Nat(recminus2(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)), recPos2Nat(recd1())))), recfib(recInt2Nat(recminus2(reccNat(reccDub(REC_V_b:RECBoolResult, REC_V_p:RECPosResult)), recPos2Nat(reccDub(recF(), recd1()))))))

// eval: recfib(recPos2Nat(reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), reccDub(recF(), recd1())))))))

endmodule
