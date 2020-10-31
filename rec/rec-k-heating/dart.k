module DART-SYNTAX

syntax RECNatResult
syntax RECSetResult

syntax RECNat ::= RECNatResult
syntax RECSet ::= RECSetResult

syntax KResult ::= RECNatResult
syntax KResult ::= RECSetResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECNat ::= recd0()
syntax RECNatResult ::= recd0()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECSet ::= recempty()
syntax RECSetResult ::= recempty()
syntax RECSet ::= recsingleton(RECNat) [seqstrict]
syntax RECSetResult ::= recsingleton(RECNatResult)
syntax RECSet ::= recunion(RECSet, RECSet) [seqstrict]
syntax RECSetResult ::= recunion(RECSetResult, RECSetResult)
syntax RECNat ::= recplus(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectimes(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recfive()
syntax RECNat ::= recten()
syntax RECNat ::= recfifteen()
syntax RECNat ::= rectwentyfive()
syntax RECNat ::= recfifty()
syntax RECSet ::= recu(RECSet, RECSet) [seqstrict]
syntax RECSet ::= recflat(RECSet, RECSet) [seqstrict]
syntax RECSet ::= recadd(RECSet, RECSet) [seqstrict]
syntax RECSet ::= recmult(RECSet, RECSet) [seqstrict]
syntax RECSet ::= recsingles()
syntax RECSet ::= recdoubles()
syntax RECSet ::= rectriples()
syntax RECSet ::= recallops()
syntax RECSet ::= recfinish()

endmodule

module DART
imports K-EQUAL
imports DART-SYNTAX

rule recplus(recd0(), REC_V_N:RECNatResult) => REC_V_N:RECNatResult
rule recplus(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recs(recplus(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule rectimes(recd0(), REC_V_N:RECNatResult) => recd0()
rule rectimes(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult) => recplus(REC_V_M:RECNatResult, rectimes(REC_V_N:RECNatResult, REC_V_M:RECNatResult))
rule recu(recempty(), REC_V_S0:RECSetResult) => REC_V_S0:RECSetResult
rule recu(REC_V_S0:RECSetResult, recempty()) => REC_V_S0:RECSetResult
rule recu(REC_V_S0:RECSetResult, REC_V_S1:RECSetResult) => REC_V_S0:RECSetResult
  requires REC_V_S0:RECSetResult ==K REC_V_S1:RECSetResult
rule recu(REC_V_S0:RECSetResult, REC_V_S1:RECSetResult) => recflat(REC_V_S0:RECSetResult, recflat(REC_V_S1:RECSetResult, recempty()))
  requires REC_V_S0:RECSetResult =/=K REC_V_S1:RECSetResult
rule recflat(recempty(), REC_V_S0:RECSetResult) => REC_V_S0:RECSetResult
rule recflat(recsingleton(REC_V_I:RECNatResult), REC_V_S0:RECSetResult) => recunion(recsingleton(REC_V_I:RECNatResult), REC_V_S0:RECSetResult)
rule recflat(recunion(REC_V_S1:RECSetResult, REC_V_S2:RECSetResult), REC_V_S0:RECSetResult) => recflat(REC_V_S1:RECSetResult, recflat(REC_V_S2:RECSetResult, REC_V_S0:RECSetResult))
rule recadd(recempty(), REC_V_S0:RECSetResult) => REC_V_S0:RECSetResult
rule recadd(REC_V_S0:RECSetResult, recempty()) => REC_V_S0:RECSetResult
rule recadd(recsingleton(REC_V_I:RECNatResult), recsingleton(REC_V_J:RECNatResult)) => recsingleton(recplus(REC_V_I:RECNatResult, REC_V_J:RECNatResult))
rule recadd(recsingleton(REC_V_I:RECNatResult), recunion(recsingleton(REC_V_J:RECNatResult), REC_V_S0:RECSetResult)) => recadd(recsingleton(recplus(REC_V_I:RECNatResult, REC_V_J:RECNatResult)), REC_V_S0:RECSetResult)
rule recadd(recunion(recsingleton(REC_V_I:RECNatResult), REC_V_S1:RECSetResult), REC_V_S2:RECSetResult) => recu(recadd(recsingleton(REC_V_I:RECNatResult), REC_V_S2:RECSetResult), recadd(REC_V_S1:RECSetResult, REC_V_S2:RECSetResult))
rule recmult(recempty(), REC_V_S0:RECSetResult) => REC_V_S0:RECSetResult
rule recmult(REC_V_S0:RECSetResult, recempty()) => REC_V_S0:RECSetResult
rule recmult(recsingleton(REC_V_I:RECNatResult), recsingleton(REC_V_J:RECNatResult)) => recsingleton(rectimes(REC_V_I:RECNatResult, REC_V_J:RECNatResult))
rule recmult(recunion(recsingleton(REC_V_I:RECNatResult), REC_V_S1:RECSetResult), REC_V_S2:RECSetResult) => recu(recmult(recsingleton(REC_V_I:RECNatResult), REC_V_S2:RECSetResult), recmult(REC_V_S1:RECSetResult, REC_V_S2:RECSetResult))
rule recfive() => recs(recs(recs(recs(recs(recd0())))))
rule recten() => recs(recs(recs(recs(recs(recfive())))))
rule recfifteen() => recs(recs(recs(recs(recs(recten())))))
rule rectwentyfive() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recfifteen()))))))))))
rule recfifty() => recplus(rectwentyfive(), rectwentyfive())
rule recsingles() => recadd(recsingleton(recs(recd0())), recadd(recsingleton(recs(recs(recd0()))), recadd(recsingleton(recs(recs(recs(recd0())))), recadd(recsingleton(recs(recs(recs(recs(recd0()))))), recadd(recsingleton(recfive()), recadd(recsingleton(recs(recfive())), recadd(recsingleton(recs(recs(recfive()))), recadd(recsingleton(recs(recs(recs(recfive())))), recadd(recsingleton(recs(recs(recs(recs(recfive()))))), recadd(recsingleton(recten()), recadd(recsingleton(recs(recten())), recadd(recsingleton(recs(recs(recten()))), recadd(recsingleton(recs(recs(recs(recten())))), recadd(recsingleton(recs(recs(recs(recs(recten()))))), recadd(recsingleton(recfifteen()), recadd(recsingleton(recs(recfifteen())), recadd(recsingleton(recs(recs(recfifteen()))), recadd(recsingleton(recs(recs(recs(recfifteen())))), recadd(recsingleton(recs(recs(recs(recs(recfifteen()))))), recsingleton(recplus(recfive(), recfifteen())))))))))))))))))))))
rule recdoubles() => recmult(recsingles(), recsingleton(recs(recs(recd0()))))
rule rectriples() => recmult(recsingles(), recsingleton(recs(recs(recs(recd0())))))
rule recallops() => recu(recu(recu(recu(recu(recsingles(), recdoubles()), rectriples()), recsingleton(rectwentyfive())), recsingleton(recfifty())), recsingleton(recd0()))
rule recfinish() => recadd(recu(recdoubles(), recsingleton(recfifty())), recadd(recallops(), recallops()))

// eval: recfinish()

endmodule
