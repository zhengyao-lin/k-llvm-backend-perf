module BUBBLESORT20-SYNTAX

syntax RECBool
syntax RECNat
syntax RECNatList

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recd0()
syntax RECNat ::= recs(RECNat)
syntax RECNatList ::= recnil()
syntax RECNatList ::= reccons(RECNat, RECNatList)
syntax RECNat ::= recd10() [function]
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECNatList ::= recbubsort(RECNat, RECNatList) [function]
syntax RECNat ::= recplus(RECNat, RECNat) [function]
syntax RECNat ::= rectimes(RECNat, RECNat) [function]
syntax RECNatList ::= recrev(RECNat) [function]
syntax RECNat ::= recfact(RECNat) [function]

endmodule

module BUBBLESORT20
imports K-EQUAL
imports BUBBLESORT20-SYNTAX

rule recd10() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0()))))))))))
rule reclt(recd0(), recd0()) => recfalse()
rule reclt(recd0(), recs(REC_V_N:RECNat)) => rectrue()
rule reclt(recs(REC_V_N:RECNat), recd0()) => recfalse()
rule reclt(recs(REC_V_N:RECNat), recs(REC_V_M:RECNat)) => reclt(REC_V_N:RECNat, REC_V_M:RECNat)
rule recplus(recd0(), REC_V_N:RECNat) => REC_V_N:RECNat
rule recplus(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recs(recplus(REC_V_N:RECNat, REC_V_M:RECNat))
rule rectimes(recd0(), REC_V_N:RECNat) => recd0()
rule rectimes(recs(REC_V_N:RECNat), REC_V_M:RECNat) => recplus(REC_V_M:RECNat, rectimes(REC_V_N:RECNat, REC_V_M:RECNat))
rule recfact(recd0()) => recs(recd0())
rule recfact(recs(REC_V_N:RECNat)) => rectimes(recs(REC_V_N:RECNat), recfact(REC_V_N:RECNat))
rule recrev(recs(REC_V_N:RECNat)) => recbubsort(recs(REC_V_N:RECNat), recrev(REC_V_N:RECNat))
rule recrev(recd0()) => reccons(recd0(), recnil())
rule recbubsort(REC_V_N:RECNat, recnil()) => reccons(REC_V_N:RECNat, recnil())
rule recbubsort(REC_V_N:RECNat, reccons(REC_V_M:RECNat, REC_V_L:RECNatList)) => reccons(REC_V_M:RECNat, recbubsort(REC_V_N:RECNat, REC_V_L:RECNatList))
  requires reclt(REC_V_M:RECNat, REC_V_N:RECNat) ==K rectrue()
rule recbubsort(REC_V_N:RECNat, reccons(REC_V_M:RECNat, REC_V_L:RECNatList)) => reccons(REC_V_N:RECNat, recbubsort(REC_V_M:RECNat, REC_V_L:RECNatList))
  requires reclt(REC_V_M:RECNat, REC_V_N:RECNat) ==K recfalse()

// eval: recrev(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recd0())))))))))))))))))))))

endmodule
