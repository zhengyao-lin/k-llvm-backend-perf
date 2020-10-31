module DART-SYNTAX

syntax RECNat
syntax RECSet

syntax KItem ::= then(KItem, KItem)
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECSet ::= recempty()
syntax RECSet ::= recsingleton(RECNat)
syntax RECSet ::= recunion(RECSet, RECSet)
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= rectimes(RECNat, RECNat) [function]
syntax RECNat ::= recfive() [function]
syntax RECNat ::= recten() [function]
syntax RECNat ::= recfifteen() [function]
syntax RECNat ::= rectwentyfive() [function]
syntax RECNat ::= recfifty() [function]
syntax RECSet ::= recu(RECSet, RECSet) [function]
syntax RECSet ::= recflat(RECSet, RECSet) [function]
syntax RECSet ::= recadd(RECSet, RECSet) [function]
syntax RECSet ::= recmult(RECSet, RECSet) [function]
syntax RECSet ::= recsingles() [function]
syntax RECSet ::= recdoubles() [function]
syntax RECSet ::= rectriples() [function]
syntax RECSet ::= recallops() [function]
syntax RECSet ::= recfinish() [function]

endmodule

module DART
imports K-EQUAL
imports DART-SYNTAX

rule recplus(recd0(), REC_V_N:RECNat) => REC_V_N:RECNat
rule recplus(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recs(recplus(REC_V_N:RECNat, REC_V_M:RECNat))
rule rectimes(recd0(), REC_V_N:RECNat) => recd0()
rule rectimes(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recplus(REC_V_M:RECNat, rectimes(REC_V_N:RECNat, REC_V_M:RECNat))
rule recu(recempty(), REC_V_S0:RECSet) => REC_V_S0:RECSet
rule recu(REC_V_S0:RECSet, recempty()) => REC_V_S0:RECSet
rule recu(REC_V_S0:RECSet, REC_V_S1:RECSet) => REC_V_S0:RECSet
  requires REC_V_S0:RECSet ==K REC_V_S1:RECSet
rule recu(REC_V_S0:RECSet, REC_V_S1:RECSet) => recflat(REC_V_S0:RECSet, recflat(REC_V_S1:RECSet, recempty()))
  requires REC_V_S0:RECSet =/=K REC_V_S1:RECSet
rule recflat(recempty(), REC_V_S0:RECSet) => REC_V_S0:RECSet
rule recflat(recsingleton(REC_V_I:RECNat), REC_V_S0:RECSet) => recunion(recsingleton(REC_V_I:RECNat), REC_V_S0:RECSet)
rule recflat(recunion(REC_V_S1:RECSet, REC_V_S2:RECSet), REC_V_S0:RECSet) => recflat(REC_V_S1:RECSet, recflat(REC_V_S2:RECSet, REC_V_S0:RECSet))
rule recadd(recempty(), REC_V_S0:RECSet) => REC_V_S0:RECSet
rule recadd(REC_V_S0:RECSet, recempty()) => REC_V_S0:RECSet
rule recadd(recsingleton(REC_V_I:RECNat), recsingleton(REC_V_J:RECNat)) => recsingleton(recplus(REC_V_I:RECNat, REC_V_J:RECNat))
rule recadd(recsingleton(REC_V_I:RECNat), recunion(recsingleton(REC_V_J:RECNat), REC_V_S0:RECSet)) => recadd(recsingleton(recplus(REC_V_I:RECNat, REC_V_J:RECNat)), REC_V_S0:RECSet)
rule recadd(recunion(recsingleton(REC_V_I:RECNat), REC_V_S1:RECSet), REC_V_S2:RECSet) => recu(recadd(recsingleton(REC_V_I:RECNat), REC_V_S2:RECSet), recadd(REC_V_S1:RECSet, REC_V_S2:RECSet))
rule recmult(recempty(), REC_V_S0:RECSet) => REC_V_S0:RECSet
rule recmult(REC_V_S0:RECSet, recempty()) => REC_V_S0:RECSet
rule recmult(recsingleton(REC_V_I:RECNat), recsingleton(REC_V_J:RECNat)) => recsingleton(rectimes(REC_V_I:RECNat, REC_V_J:RECNat))
rule recmult(recunion(recsingleton(REC_V_I:RECNat), REC_V_S1:RECSet), REC_V_S2:RECSet) => recu(recmult(recsingleton(REC_V_I:RECNat), REC_V_S2:RECSet), recmult(REC_V_S1:RECSet, REC_V_S2:RECSet))
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
