module SIEVE2000-SYNTAX

syntax RECBool
syntax RECList
syntax RECNat
syntax RECDigit

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECNat ::= recs(RECNat)
syntax RECNat ::= recz()
syntax RECDigit ::= recd0()
syntax RECDigit ::= recd1()
syntax RECDigit ::= recd2()
syntax RECDigit ::= recd3()
syntax RECDigit ::= recd4()
syntax RECDigit ::= recd5()
syntax RECDigit ::= recd6()
syntax RECDigit ::= recd7()
syntax RECDigit ::= recd8()
syntax RECDigit ::= recd9()
syntax RECList ::= recnil()
syntax RECList ::= recd(RECDigit)
syntax RECList ::= recdl(RECDigit, RECList)
syntax RECList ::= recl(RECNat, RECList)
syntax RECList ::= recll(RECList, RECList)
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECNat ::= recsub(RECNat, RECNat) [function]
syntax RECNat ::= recdiv(RECNat, RECNat) [function]
syntax RECNat ::= recrem(RECNat, RECNat) [function]
syntax RECNat ::= recadd(RECNat, RECNat) [function]
syntax RECBool ::= recdivides(RECNat, RECNat) [function]
syntax RECNat ::= recmult(RECNat, RECNat) [function]
syntax RECNat ::= rectwo() [function]
syntax RECNat ::= recten() [function]
syntax RECDigit ::= recfind(RECList, RECNat) [function]
syntax RECList ::= recdigitList() [function]
syntax RECList ::= recap(RECList, RECList) [function]
syntax RECList ::= recconv(RECNat) [function]
syntax RECDigit ::= recdigit(RECNat) [function]
syntax RECNat ::= recfact(RECNat) [function]
syntax RECBool ::= recauxdiv(RECNat, RECNat, RECNat) [function]
syntax RECNat ::= recifNat(RECBool, RECNat, RECNat) [function]
syntax RECList ::= recintsBetween(RECNat, RECNat) [function]
syntax RECList ::= recsieve(RECList) [function]
syntax RECList ::= recfilter(RECList, RECNat) [function]
syntax RECList ::= rece(RECNat, RECList) [function]

endmodule

module SIEVE2000
imports K-EQUAL
imports SIEVE2000-SYNTAX

rule rectwo() => recs(recs(recz()))
rule recten() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recz()))))))))))
rule recdigitList() => recdl(recd0(), recdl(recd1(), recdl(recd2(), recdl(recd3(), recdl(recd4(), recdl(recd5(), recdl(recd6(), recdl(recd7(), recdl(recd8(), recdl(recd9(), recnil()))))))))))
rule recifNat(rectrue(), REC_V_N:RECNat, REC_V_M:RECNat) => REC_V_N:RECNat
rule recifNat(recfalse(), REC_V_N:RECNat, REC_V_M:RECNat) => REC_V_M:RECNat
rule recconv(REC_V_X:RECNat) => recdl(recdigit(REC_V_X:RECNat), recnil())
  requires reclt(REC_V_X:RECNat, recten()) ==K rectrue()
rule recconv(REC_V_X:RECNat) => recap(recconv(recdiv(REC_V_X:RECNat, recten())), recconv(recrem(REC_V_X:RECNat, recten())))
  requires reclt(REC_V_X:RECNat, recten()) ==K recfalse()
rule recrem(REC_V_X:RECNat, REC_V_Y:RECNat) => recifNat(reclt(REC_V_X:RECNat, REC_V_Y:RECNat), REC_V_X:RECNat, recrem(recsub(REC_V_X:RECNat, REC_V_Y:RECNat), REC_V_Y:RECNat))
  requires REC_V_Y:RECNat =/=K recz()
rule recdiv(REC_V_X:RECNat, REC_V_Y:RECNat) => recifNat(reclt(REC_V_X:RECNat, REC_V_Y:RECNat), recz(), recs(recdiv(recsub(REC_V_X:RECNat, REC_V_Y:RECNat), REC_V_Y:RECNat)))
  requires REC_V_Y:RECNat =/=K recz()
rule reclt(recz(), recs(REC_V_X:RECNat)) => rectrue()
rule reclt(REC_V_X:RECNat, recz()) => recfalse()
rule reclt(recs(REC_V_X:RECNat), recs(REC_V_Y:RECNat)) => reclt(REC_V_X:RECNat, REC_V_Y:RECNat)
rule recsub(recz(), recs(REC_V_Y:RECNat)) => recz()
rule recsub(REC_V_X:RECNat, recz()) => REC_V_X:RECNat
rule recsub(recs(REC_V_X:RECNat), recs(REC_V_Y:RECNat)) => recsub(REC_V_X:RECNat, REC_V_Y:RECNat)
rule recdigit(REC_V_X:RECNat) => recfind(recdigitList(), REC_V_X:RECNat)
rule recfind(recdl(REC_V_Dig:RECDigit, REC_V_L1:RECList), recz()) => REC_V_Dig:RECDigit
rule recfind(recdl(REC_V_Dig:RECDigit, REC_V_L1:RECList), recs(REC_V_X:RECNat)) => recfind(REC_V_L1:RECList, REC_V_X:RECNat)
rule recap(recnil(), REC_V_L1:RECList) => REC_V_L1:RECList
rule recap(recdl(REC_V_Dig:RECDigit, REC_V_L1:RECList), REC_V_L2:RECList) => recdl(REC_V_Dig:RECDigit, recap(REC_V_L1:RECList, REC_V_L2:RECList))
rule recadd(recz(), REC_V_Y:RECNat) => REC_V_Y:RECNat
rule recadd(recs(REC_V_X:RECNat), REC_V_Y:RECNat) => recs(recadd(REC_V_X:RECNat, REC_V_Y:RECNat))
rule recmult(recz(), REC_V_Y:RECNat) => recz()
rule recmult(recs(REC_V_X:RECNat), REC_V_Y:RECNat) => recadd(REC_V_Y:RECNat, recmult(REC_V_X:RECNat, REC_V_Y:RECNat))
rule recfact(recz()) => recs(recz())
rule recfact(recs(REC_V_X:RECNat)) => recmult(recs(REC_V_X:RECNat), recfact(REC_V_X:RECNat))
rule recdivides(REC_V_N:RECNat, REC_V_M:RECNat) => recauxdiv(REC_V_N:RECNat, REC_V_M:RECNat, REC_V_M:RECNat)
  requires REC_V_M:RECNat =/=K recz()
rule recauxdiv(recz(), recz(), REC_V_M:RECNat) => rectrue()
rule recauxdiv(recz(), recs(REC_V_X:RECNat), REC_V_M:RECNat) => recfalse()
rule recauxdiv(recs(REC_V_X:RECNat), recs(REC_V_Y:RECNat), REC_V_M:RECNat) => recauxdiv(REC_V_X:RECNat, REC_V_Y:RECNat, REC_V_M:RECNat)
rule recauxdiv(recs(REC_V_X:RECNat), recz(), REC_V_M:RECNat) => recauxdiv(recs(REC_V_X:RECNat), REC_V_M:RECNat, REC_V_M:RECNat)
rule recintsBetween(REC_V_N:RECNat, REC_V_M:RECNat) => recnil()
  requires REC_V_N:RECNat ==K REC_V_M:RECNat
rule recintsBetween(REC_V_N:RECNat, REC_V_M:RECNat) => recl(REC_V_N:RECNat, recintsBetween(recs(REC_V_N:RECNat), REC_V_M:RECNat))
  requires REC_V_N:RECNat =/=K REC_V_M:RECNat
rule recsieve(recl(REC_V_N:RECNat, REC_V_L1:RECList)) => recl(REC_V_N:RECNat, recsieve(recfilter(REC_V_L1:RECList, REC_V_N:RECNat)))
rule recsieve(recnil()) => recnil()
rule recfilter(recl(REC_V_N:RECNat, REC_V_L1:RECList), REC_V_M:RECNat) => recfilter(REC_V_L1:RECList, REC_V_M:RECNat)
  requires recdivides(REC_V_N:RECNat, REC_V_M:RECNat) ==K rectrue()
rule recfilter(recl(REC_V_N:RECNat, REC_V_L1:RECList), REC_V_M:RECNat) => recl(REC_V_N:RECNat, recfilter(REC_V_L1:RECList, REC_V_M:RECNat))
  requires recdivides(REC_V_N:RECNat, REC_V_M:RECNat) ==K recfalse()
rule recfilter(recnil(), REC_V_M:RECNat) => recnil()
rule rece(REC_V_N:RECNat, REC_V_L1:RECList) => recll(recconv(REC_V_N:RECNat), REC_V_L1:RECList)

// eval: recsieve(recintsBetween(recs(recs(recz())), recmult(rectwo(), recmult(recten(), recmult(recten(), recten())))))

endmodule
