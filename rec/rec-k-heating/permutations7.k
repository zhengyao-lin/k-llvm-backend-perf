module PERMUTATIONS7-SYNTAX

syntax RECNatResult
syntax RECNatListResult
syntax RECNatListListResult

syntax RECNat ::= RECNatResult
syntax RECNatList ::= RECNatListResult
syntax RECNatListList ::= RECNatListListResult

syntax KResult ::= RECNatResult
syntax KResult ::= RECNatListResult
syntax KResult ::= RECNatListListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNatList ::= recnil()
syntax RECNatListResult ::= recnil()
syntax RECNatList ::= recl(RECNat) [seqstrict]
syntax RECNatListResult ::= recl(RECNatResult)
syntax RECNatList ::= recll(RECNatList, RECNatList) [seqstrict]
syntax RECNatListResult ::= recll(RECNatListResult, RECNatListResult)
syntax RECNatListList ::= recnilP()
syntax RECNatListListResult ::= recnilP()
syntax RECNatListList ::= recp(RECNatList) [seqstrict]
syntax RECNatListListResult ::= recp(RECNatListResult)
syntax RECNatListList ::= recpp(RECNatListList, RECNatListList) [seqstrict]
syntax RECNatListListResult ::= recpp(RECNatListListResult, RECNatListListResult)
syntax RECNatListList ::= recperm(RECNat) [seqstrict]
syntax RECNatListList ::= recinsert1(RECNat, RECNatListList) [seqstrict]
syntax RECNatListList ::= recinsert0(RECNat, RECNatList) [seqstrict]
syntax RECNatListList ::= recmapcons(RECNat, RECNatListList) [seqstrict]
syntax RECNatListList ::= recppreduce(RECNatListList, RECNatListList) [seqstrict]
syntax RECNatListList ::= recppflat(RECNatListList, RECNatListList) [seqstrict]

endmodule

module PERMUTATIONS7
imports K-EQUAL
imports PERMUTATIONS7-SYNTAX

rule recperm(recd0()) => recppreduce(recp(recnil()), recnilP())
rule recperm(recs(recd0())) => recppreduce(recp(recll(recl(recs(recd0())), recnil())), recnilP())
rule recperm(recs(REC_V_N:RECNatResult)) => recinsert1(recs(REC_V_N:RECNatResult), recperm(REC_V_N:RECNatResult))
rule recinsert1(REC_V_N:RECNatResult, recpp(recp(REC_V_P1:RECNatListResult), REC_V_Ps:RECNatListListResult)) => recppreduce(recinsert0(REC_V_N:RECNatResult, REC_V_P1:RECNatListResult), recinsert1(REC_V_N:RECNatResult, REC_V_Ps:RECNatListListResult))
rule recinsert1(REC_V_N:RECNatResult, recp(REC_V_P1:RECNatListResult)) => recinsert0(REC_V_N:RECNatResult, REC_V_P1:RECNatListResult)
rule recinsert1(REC_V_N:RECNatResult, recnilP()) => recnilP()
rule recinsert0(REC_V_N:RECNatResult, recll(recl(REC_V_M:RECNatResult), REC_V_P2:RECNatListResult)) => recppreduce(recp(recll(recl(REC_V_N:RECNatResult), recll(recl(REC_V_M:RECNatResult), REC_V_P2:RECNatListResult))), recmapcons(REC_V_M:RECNatResult, recinsert0(REC_V_N:RECNatResult, REC_V_P2:RECNatListResult)))
rule recinsert0(REC_V_N:RECNatResult, recnil()) => recppreduce(recp(recll(recl(REC_V_N:RECNatResult), recnil())), recnilP())
rule recmapcons(REC_V_M:RECNatResult, recpp(recp(REC_V_P1:RECNatListResult), REC_V_Ps:RECNatListListResult)) => recppreduce(recp(recll(recl(REC_V_M:RECNatResult), REC_V_P1:RECNatListResult)), recmapcons(REC_V_M:RECNatResult, REC_V_Ps:RECNatListListResult))
rule recmapcons(REC_V_M:RECNatResult, recp(REC_V_P1:RECNatListResult)) => recp(recll(recl(REC_V_M:RECNatResult), REC_V_P1:RECNatListResult))
rule recmapcons(REC_V_M:RECNatResult, recnilP()) => recnilP()
rule recppreduce(recnilP(), REC_V_Ps2:RECNatListListResult) => REC_V_Ps2:RECNatListListResult
rule recppreduce(REC_V_Ps1:RECNatListListResult, recnilP()) => REC_V_Ps1:RECNatListListResult
rule recppreduce(REC_V_Ps1:RECNatListListResult, REC_V_Ps2:RECNatListListResult) => recppflat(REC_V_Ps1:RECNatListListResult, recppflat(REC_V_Ps2:RECNatListListResult, recnilP()))
rule recppflat(recnilP(), REC_V_accumulator:RECNatListListResult) => REC_V_accumulator:RECNatListListResult
rule recppflat(recp(REC_V_P1:RECNatListResult), REC_V_accumulator:RECNatListListResult) => recpp(recp(REC_V_P1:RECNatListResult), REC_V_accumulator:RECNatListListResult)
rule recppflat(recpp(REC_V_Ps1:RECNatListListResult, REC_V_Ps2:RECNatListListResult), REC_V_accumulator:RECNatListListResult) => recppflat(REC_V_Ps1:RECNatListListResult, recppflat(REC_V_Ps2:RECNatListListResult, REC_V_accumulator:RECNatListListResult))

// eval: recperm(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))

endmodule
