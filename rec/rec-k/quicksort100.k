module QUICKSORT100-SYNTAX

syntax RECBool
syntax RECNat
syntax RECNatList
syntax RECNatListPair

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECNatList ::= recnil()
syntax RECNatList ::= reccons(RECNat, RECNatList)
syntax RECNatListPair ::= recpair(RECNatList, RECNatList)
syntax RECBool ::= recnot(RECBool) [function]
syntax RECNat ::= recd10() [function]
syntax RECBool ::= recst(RECNat, RECNat) [function]
syntax RECBool ::= recget(RECNat, RECNat) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= rectimes(RECNat, RECNat) [function]
syntax RECNatList ::= recrev(RECNat) [function]
syntax RECNatListPair ::= recsplit(RECNat, RECNatList) [function]
syntax RECNatList ::= recqsort(RECNatList) [function]
syntax RECNatList ::= recappend(RECNatList, RECNatList) [function]
syntax RECNatList ::= recp1(RECNatListPair) [function]
syntax RECNatList ::= recp2(RECNatListPair) [function]

endmodule

module QUICKSORT100
imports K-EQUAL
imports QUICKSORT100-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule recnot(rectrue()) => recfalse()
rule recnot(recfalse()) => rectrue()
rule recst(recd0(), recs(REC_V_N:RECNat)) => rectrue()
rule recst(recs(REC_V_N:RECNat), recd0()) => recfalse()
rule recst(recd0(), recd0()) => recfalse()
rule recst(recs(REC_V_N:RECNat), recs(REC_V_M:RECNat)) => recst(REC_V_N:RECNat, REC_V_M:RECNat)
rule recget(REC_V_N:RECNat, REC_V_M:RECNat) => recnot(recst(REC_V_N:RECNat, REC_V_M:RECNat))
rule recplus(recd0(), REC_V_N:RECNat) => REC_V_N:RECNat
rule recplus(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recs(recplus(REC_V_N:RECNat, REC_V_M:RECNat))
rule rectimes(recd0(), REC_V_N:RECNat) => recd0()
rule rectimes(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recplus(REC_V_M:RECNat, rectimes(REC_V_N:RECNat, REC_V_M:RECNat))
rule recrev(recs(REC_V_N:RECNat)) => reccons(recs(REC_V_N:RECNat), recrev(REC_V_N:RECNat))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recsplit(REC_V_N:RECNat, reccons(REC_V_M:RECNat, REC_V_L:RECNatList)) => recpair(recp1(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList)), reccons(REC_V_M:RECNat, recp2(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList))))
  requires recst(REC_V_N:RECNat, REC_V_M:RECNat) ==K rectrue()
rule recsplit(REC_V_N:RECNat, reccons(REC_V_M:RECNat, REC_V_L:RECNatList)) => recpair(reccons(REC_V_M:RECNat, recp1(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList))), recp2(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList)))
  requires recget(REC_V_N:RECNat, REC_V_M:RECNat) ==K rectrue()
rule recsplit(REC_V_N:RECNat, recnil()) => recpair(recnil(), recnil())
rule recappend(reccons(REC_V_N:RECNat, REC_V_L:RECNatList), REC_V_LT:RECNatList) => reccons(REC_V_N:RECNat, recappend(REC_V_L:RECNatList, REC_V_LT:RECNatList))
rule recappend(recnil(), REC_V_L:RECNatList) => REC_V_L:RECNatList
rule recqsort(recnil()) => recnil()
rule recqsort(reccons(REC_V_N:RECNat, REC_V_L:RECNatList)) => recappend(recqsort(recp1(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList))), reccons(REC_V_N:RECNat, recqsort(recp2(recsplit(REC_V_N:RECNat, REC_V_L:RECNatList)))))
rule recp1(recpair(REC_V_L1:RECNatList, REC_V_L2:RECNatList)) => REC_V_L1:RECNatList
rule recp2(recpair(REC_V_L1:RECNatList, REC_V_L2:RECNatList)) => REC_V_L2:RECNatList

// eval: recqsort(recrev(rectimes(recd10(), recd10())))

endmodule
