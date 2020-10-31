module MERGESORT1000-SYNTAX

syntax RECBool
syntax RECNat
syntax RECNatList
syntax RECListPair

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECNatList ::= recnil()
syntax RECNatList ::= reccons(RECNat, RECNatList)
syntax RECListPair ::= recpair(RECNatList, RECNatList)
syntax RECNat ::= recd10() [function]
syntax RECBool ::= reclte(RECNat, RECNat) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= rectimes(RECNat, RECNat) [function]
syntax RECNatList ::= recrev(RECNat) [function]
syntax RECListPair ::= recsplit(RECNatList) [function]
syntax RECNatList ::= recmerge(RECNatList, RECNatList) [function]
syntax RECNatList ::= recmergesort(RECNatList) [function]
syntax RECNatList ::= recp1(RECListPair) [function]
syntax RECNatList ::= recp2(RECListPair) [function]

endmodule

module MERGESORT1000
imports K-EQUAL
imports MERGESORT1000-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule reclte(recd0(), recs(REC_V_N:RECNat)) => rectrue()
rule reclte(recs(REC_V_N:RECNat), recd0()) => recfalse()
rule reclte(recd0(), recd0()) => rectrue()
rule reclte(recs(REC_V_N:RECNat), recs(REC_V_M:RECNat)) => reclte(REC_V_N:RECNat, REC_V_M:RECNat)
rule recplus(recd0(), REC_V_N:RECNat) => REC_V_N:RECNat
rule recplus(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recs(recplus(REC_V_N:RECNat, REC_V_M:RECNat))
rule rectimes(recd0(), REC_V_N:RECNat) => recd0()
rule rectimes(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recplus(REC_V_M:RECNat, rectimes(REC_V_N:RECNat, REC_V_M:RECNat))
rule recrev(recs(REC_V_N:RECNat)) => reccons(recs(REC_V_N:RECNat), recrev(REC_V_N:RECNat))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recmerge(recnil(), REC_V_L:RECNatList) => REC_V_L:RECNatList
rule recmerge(REC_V_L:RECNatList, recnil()) => REC_V_L:RECNatList
rule recmerge(reccons(REC_V_X:RECNat, REC_V_L1:RECNatList), reccons(REC_V_Y:RECNat, REC_V_L2:RECNatList)) => reccons(REC_V_X:RECNat, recmerge(REC_V_L1:RECNatList, reccons(REC_V_Y:RECNat, REC_V_L2:RECNatList)))
  requires reclte(REC_V_X:RECNat, REC_V_Y:RECNat) ==K rectrue()
rule recmerge(reccons(REC_V_X:RECNat, REC_V_L1:RECNatList), reccons(REC_V_Y:RECNat, REC_V_L2:RECNatList)) => reccons(REC_V_Y:RECNat, recmerge(reccons(REC_V_X:RECNat, REC_V_L1:RECNatList), REC_V_L2:RECNatList))
  requires reclte(REC_V_X:RECNat, REC_V_Y:RECNat) ==K recfalse()
rule recsplit(reccons(REC_V_X:RECNat, reccons(REC_V_Y:RECNat, REC_V_L:RECNatList))) => recpair(reccons(REC_V_X:RECNat, recp1(recsplit(REC_V_L:RECNatList))), reccons(REC_V_Y:RECNat, recp2(recsplit(REC_V_L:RECNatList))))
rule recsplit(recnil()) => recpair(recnil(), recnil())
rule recsplit(reccons(REC_V_X:RECNat, recnil())) => recpair(reccons(REC_V_X:RECNat, recnil()), recnil())
rule recmergesort(recnil()) => recnil()
rule recmergesort(reccons(REC_V_X:RECNat, recnil())) => reccons(REC_V_X:RECNat, recnil())
rule recmergesort(reccons(REC_V_X:RECNat, reccons(REC_V_Y:RECNat, REC_V_L:RECNatList))) => recmerge(recmergesort(reccons(REC_V_X:RECNat, recp1(recsplit(REC_V_L:RECNatList)))), recmergesort(reccons(REC_V_Y:RECNat, recp2(recsplit(REC_V_L:RECNatList)))))
rule recp1(recpair(REC_V_L1:RECNatList, REC_V_L2:RECNatList)) => REC_V_L1:RECNatList
rule recp2(recpair(REC_V_L1:RECNatList, REC_V_L2:RECNatList)) => REC_V_L2:RECNatList

// eval: recmergesort(recrev(rectimes(recd10(), rectimes(recd10(), recd10()))))

endmodule
