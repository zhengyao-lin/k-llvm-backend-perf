module SIEVE100-SYNTAX

syntax RECBoolResult
syntax RECListResult
syntax RECNatResult
syntax RECDigitResult

syntax RECBool ::= RECBoolResult
syntax RECList ::= RECListResult
syntax RECNat ::= RECNatResult
syntax RECDigit ::= RECDigitResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECListResult
syntax KResult ::= RECNatResult
syntax KResult ::= RECDigitResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECNat ::= recs(RECNat) [seqstrict]
syntax RECNatResult ::= recs(RECNatResult)
syntax RECNat ::= recz()
syntax RECNatResult ::= recz()
syntax RECDigit ::= recd0()
syntax RECDigitResult ::= recd0()
syntax RECDigit ::= recd1()
syntax RECDigitResult ::= recd1()
syntax RECDigit ::= recd2()
syntax RECDigitResult ::= recd2()
syntax RECDigit ::= recd3()
syntax RECDigitResult ::= recd3()
syntax RECDigit ::= recd4()
syntax RECDigitResult ::= recd4()
syntax RECDigit ::= recd5()
syntax RECDigitResult ::= recd5()
syntax RECDigit ::= recd6()
syntax RECDigitResult ::= recd6()
syntax RECDigit ::= recd7()
syntax RECDigitResult ::= recd7()
syntax RECDigit ::= recd8()
syntax RECDigitResult ::= recd8()
syntax RECDigit ::= recd9()
syntax RECDigitResult ::= recd9()
syntax RECList ::= recnil()
syntax RECListResult ::= recnil()
syntax RECList ::= recd(RECDigit) [seqstrict]
syntax RECListResult ::= recd(RECDigitResult)
syntax RECList ::= recdl(RECDigit, RECList) [seqstrict]
syntax RECListResult ::= recdl(RECDigitResult, RECListResult)
syntax RECList ::= recl(RECNat, RECList) [seqstrict]
syntax RECListResult ::= recl(RECNatResult, RECListResult)
syntax RECList ::= recll(RECList, RECList) [seqstrict]
syntax RECListResult ::= recll(RECListResult, RECListResult)
syntax RECBool ::= reclt(RECNat, RECNat) [function]
syntax RECNat ::= recsub(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recdiv(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recrem(RECNat, RECNat) [seqstrict]
syntax RECNat ::= recadd(RECNat, RECNat) [seqstrict]
syntax RECBool ::= recdivides(RECNat, RECNat) [function]
syntax RECNat ::= recmult(RECNat, RECNat) [seqstrict]
syntax RECNat ::= rectwo()
syntax RECNat ::= recten() [function]
syntax RECDigit ::= recfind(RECList, RECNat) [seqstrict]
syntax RECList ::= recdigitList()
syntax RECList ::= recap(RECList, RECList) [seqstrict]
syntax RECList ::= recconv(RECNat) [seqstrict]
syntax RECDigit ::= recdigit(RECNat) [seqstrict]
syntax RECNat ::= recfact(RECNat) [seqstrict]
syntax RECBool ::= recauxdiv(RECNat, RECNat, RECNat) [function]
syntax RECNat ::= recifNat(RECBool, RECNat, RECNat) [seqstrict]
syntax RECList ::= recintsBetween(RECNat, RECNat) [seqstrict]
syntax RECList ::= recsieve(RECList) [seqstrict]
syntax RECList ::= recfilter(RECList, RECNat) [seqstrict]
syntax RECList ::= rece(RECNat, RECList) [seqstrict]

endmodule

module SIEVE100
imports K-EQUAL
imports SIEVE100-SYNTAX

rule rectwo() => recs(recs(recz()))
rule recten() => recs(recs(recs(recs(recs(recs(recs(recs(recs(recs(recz()))))))))))
rule recdigitList() => recdl(recd0(), recdl(recd1(), recdl(recd2(), recdl(recd3(), recdl(recd4(), recdl(recd5(), recdl(recd6(), recdl(recd7(), recdl(recd8(), recdl(recd9(), recnil()))))))))))
rule recifNat(rectrue(), REC_V_N:RECNatResult, REC_V_M:RECNatResult) => REC_V_N:RECNatResult
rule recifNat(recfalse(), REC_V_N:RECNatResult, REC_V_M:RECNatResult) => REC_V_M:RECNatResult
rule recconv(REC_V_X:RECNatResult) => recdl(recdigit(REC_V_X:RECNatResult), recnil())
  requires reclt(REC_V_X:RECNatResult, recten()) ==K rectrue()
rule recconv(REC_V_X:RECNatResult) => recap(recconv(recdiv(REC_V_X:RECNatResult, recten())), recconv(recrem(REC_V_X:RECNatResult, recten())))
  requires reclt(REC_V_X:RECNatResult, recten()) ==K recfalse()
rule recrem(REC_V_X:RECNatResult, REC_V_Y:RECNatResult) => recifNat(reclt(REC_V_X:RECNatResult, REC_V_Y:RECNatResult), REC_V_X:RECNatResult, recrem(recsub(REC_V_X:RECNatResult, REC_V_Y:RECNatResult), REC_V_Y:RECNatResult))
  requires REC_V_Y:RECNatResult =/=K recz()
rule recdiv(REC_V_X:RECNatResult, REC_V_Y:RECNatResult) => recifNat(reclt(REC_V_X:RECNatResult, REC_V_Y:RECNatResult), recz(), recs(recdiv(recsub(REC_V_X:RECNatResult, REC_V_Y:RECNatResult), REC_V_Y:RECNatResult)))
  requires REC_V_Y:RECNatResult =/=K recz()
rule reclt(recz(), recs(REC_V_X:RECNatResult)) => rectrue()
rule reclt(REC_V_X:RECNatResult, recz()) => recfalse()
rule reclt(recs(REC_V_X:RECNatResult), recs(REC_V_Y:RECNatResult)) => reclt(REC_V_X:RECNatResult, REC_V_Y:RECNatResult)
rule recsub(recz(), recs(REC_V_Y:RECNatResult)) => recz()
rule recsub(REC_V_X:RECNatResult, recz()) => REC_V_X:RECNatResult
rule recsub(recs(REC_V_X:RECNatResult), recs(REC_V_Y:RECNatResult)) => recsub(REC_V_X:RECNatResult, REC_V_Y:RECNatResult)
rule recdigit(REC_V_X:RECNatResult) => recfind(recdigitList(), REC_V_X:RECNatResult)
rule recfind(recdl(REC_V_Dig:RECDigitResult, REC_V_L1:RECListResult), recz()) => REC_V_Dig:RECDigitResult
rule recfind(recdl(REC_V_Dig:RECDigitResult, REC_V_L1:RECListResult), recs(REC_V_X:RECNatResult)) => recfind(REC_V_L1:RECListResult, REC_V_X:RECNatResult)
rule recap(recnil(), REC_V_L1:RECListResult) => REC_V_L1:RECListResult
rule recap(recdl(REC_V_Dig:RECDigitResult, REC_V_L1:RECListResult), REC_V_L2:RECListResult) => recdl(REC_V_Dig:RECDigitResult, recap(REC_V_L1:RECListResult, REC_V_L2:RECListResult))
rule recadd(recz(), REC_V_Y:RECNatResult) => REC_V_Y:RECNatResult
rule recadd(recs(REC_V_X:RECNatResult), REC_V_Y:RECNatResult) => recs(recadd(REC_V_X:RECNatResult, REC_V_Y:RECNatResult))
rule recmult(recz(), REC_V_Y:RECNatResult) => recz()
rule recmult(recs(REC_V_X:RECNatResult), REC_V_Y:RECNatResult) => recadd(REC_V_Y:RECNatResult, recmult(REC_V_X:RECNatResult, REC_V_Y:RECNatResult))
rule recfact(recz()) => recs(recz())
rule recfact(recs(REC_V_X:RECNatResult)) => recmult(recs(REC_V_X:RECNatResult), recfact(REC_V_X:RECNatResult))
rule recdivides(REC_V_N:RECNatResult, REC_V_M:RECNatResult) => recauxdiv(REC_V_N:RECNatResult, REC_V_M:RECNatResult, REC_V_M:RECNatResult)
  requires REC_V_M:RECNatResult =/=K recz()
rule recauxdiv(recz(), recz(), REC_V_M:RECNatResult) => rectrue()
rule recauxdiv(recz(), recs(REC_V_X:RECNatResult), REC_V_M:RECNatResult) => recfalse()
rule recauxdiv(recs(REC_V_X:RECNatResult), recs(REC_V_Y:RECNatResult), REC_V_M:RECNatResult) => recauxdiv(REC_V_X:RECNatResult, REC_V_Y:RECNatResult, REC_V_M:RECNatResult)
rule recauxdiv(recs(REC_V_X:RECNatResult), recz(), REC_V_M:RECNatResult) => recauxdiv(recs(REC_V_X:RECNatResult), REC_V_M:RECNatResult, REC_V_M:RECNatResult)
rule recintsBetween(REC_V_N:RECNatResult, REC_V_M:RECNatResult) => recnil()
  requires REC_V_N:RECNatResult ==K REC_V_M:RECNatResult
rule recintsBetween(REC_V_N:RECNatResult, REC_V_M:RECNatResult) => recl(REC_V_N:RECNatResult, recintsBetween(recs(REC_V_N:RECNatResult), REC_V_M:RECNatResult))
  requires REC_V_N:RECNatResult =/=K REC_V_M:RECNatResult
rule recsieve(recl(REC_V_N:RECNatResult, REC_V_L1:RECListResult)) => recl(REC_V_N:RECNatResult, recsieve(recfilter(REC_V_L1:RECListResult, REC_V_N:RECNatResult)))
rule recsieve(recnil()) => recnil()
rule recfilter(recl(REC_V_N:RECNatResult, REC_V_L1:RECListResult), REC_V_M:RECNatResult) => recfilter(REC_V_L1:RECListResult, REC_V_M:RECNatResult)
  requires recdivides(REC_V_N:RECNatResult, REC_V_M:RECNatResult) ==K rectrue()
rule recfilter(recl(REC_V_N:RECNatResult, REC_V_L1:RECListResult), REC_V_M:RECNatResult) => recl(REC_V_N:RECNatResult, recfilter(REC_V_L1:RECListResult, REC_V_M:RECNatResult))
  requires recdivides(REC_V_N:RECNatResult, REC_V_M:RECNatResult) ==K recfalse()
rule recfilter(recnil(), REC_V_M:RECNatResult) => recnil()
rule rece(REC_V_N:RECNatResult, REC_V_L1:RECListResult) => recll(recconv(REC_V_N:RECNatResult), REC_V_L1:RECListResult)

// eval: recsieve(recintsBetween(recs(recs(recz())), recmult(recten(), recten())))

endmodule
