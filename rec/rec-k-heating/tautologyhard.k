module TAUTOLOGYHARD-SYNTAX

syntax RECPropResult

syntax RECProp ::= RECPropResult

syntax KResult ::= RECPropResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECProp ::= rectt()
syntax RECPropResult ::= rectt()
syntax RECProp ::= recff()
syntax RECPropResult ::= recff()
syntax RECProp ::= recand(RECProp, RECProp) [seqstrict]
syntax RECProp ::= recxor(RECProp, RECProp) [seqstrict]
syntax RECProp ::= recnot(RECProp) [seqstrict]
syntax RECProp ::= recor(RECProp, RECProp) [seqstrict]
syntax RECProp ::= recimplies(RECProp, RECProp) [seqstrict]
syntax RECProp ::= reciff(RECProp, RECProp) [seqstrict]
syntax RECProp ::= reca()
syntax RECProp ::= recb()
syntax RECProp ::= recc()
syntax RECProp ::= recd()
syntax RECProp ::= rece()
syntax RECProp ::= reca1()
syntax RECProp ::= reca2()
syntax RECProp ::= reca3()
syntax RECProp ::= reca4()
syntax RECProp ::= reca5()
syntax RECProp ::= reca6()
syntax RECProp ::= reca7()
syntax RECProp ::= reca8()
syntax RECProp ::= reca9()
syntax RECProp ::= reca10()
syntax RECProp ::= reca11()
syntax RECProp ::= reca12()
syntax RECProp ::= reca13()
syntax RECProp ::= reca14()
syntax RECProp ::= reca15()
syntax RECProp ::= reca16()
syntax RECProp ::= reca17()
syntax RECProp ::= reca18()

endmodule

module TAUTOLOGYHARD
imports K-EQUAL
imports TAUTOLOGYHARD-SYNTAX

rule recand(REC_V_P:RECPropResult, rectt()) => REC_V_P:RECPropResult
rule recand(REC_V_P:RECPropResult, recff()) => recff()
rule recxor(REC_V_P:RECPropResult, recff()) => REC_V_P:RECPropResult
rule recxor(recff(), rectt()) => rectt()
rule recxor(rectt(), rectt()) => recff()
rule recnot(REC_V_P:RECPropResult) => recxor(REC_V_P:RECPropResult, rectt())
rule recor(REC_V_P:RECPropResult, REC_V_Q:RECPropResult) => recxor(recand(REC_V_P:RECPropResult, REC_V_Q:RECPropResult), recxor(REC_V_P:RECPropResult, REC_V_Q:RECPropResult))
rule recimplies(REC_V_P:RECPropResult, REC_V_Q:RECPropResult) => recnot(recxor(REC_V_P:RECPropResult, recand(REC_V_P:RECPropResult, REC_V_Q:RECPropResult)))
rule reciff(REC_V_P:RECPropResult, REC_V_Q:RECPropResult) => recnot(recxor(REC_V_P:RECPropResult, REC_V_Q:RECPropResult))
rule reca() => recff()
rule recb() => rectt()
rule recc() => recff()
rule recd() => rectt()
rule rece() => recff()
rule reca1() => rectt()
rule reca2() => recff()
rule reca3() => rectt()
rule reca4() => recff()
rule reca5() => rectt()
rule reca6() => recff()
rule reca7() => rectt()
rule reca8() => recff()
rule reca9() => rectt()
rule reca10() => recff()
rule reca11() => rectt()
rule reca12() => recff()
rule reca13() => rectt()
rule reca14() => recff()
rule reca15() => rectt()
rule reca16() => recff()
rule reca17() => rectt()
rule reca18() => recff()

// eval: recimplies(recand(reciff(reciff(recor(reca1(), reca2()), recor(recnot(reca3()), reciff(recxor(reca4(), reca5()), recnot(recnot(recnot(reca6())))))), recnot(recand(recand(reca7(), reca8()), recnot(recxor(recxor(recor(reca9(), recand(reca10(), reca11())), reca2()), recand(recand(reca11(), recxor(reca2(), reciff(reca5(), reca5()))), recxor(recxor(reca7(), reca7()), reciff(reca9(), reca4())))))))), recimplies(reciff(reciff(recor(reca1(), reca2()), recor(recnot(reca3()), reciff(recxor(reca4(), reca5()), recnot(recnot(recnot(reca6())))))), recnot(recand(recand(reca7(), reca8()), recnot(recxor(recxor(recor(reca9(), recand(reca10(), reca11())), reca2()), recand(recand(reca11(), recxor(reca2(), reciff(reca5(), reca5()))), recxor(recxor(reca7(), reca7()), reciff(reca9(), reca4())))))))), recnot(recand(recimplies(recand(reca1(), reca2()), recnot(recxor(recor(recor(recxor(recimplies(recand(reca3(), reca4()), recimplies(reca5(), reca6())), recor(reca7(), reca8())), recxor(reciff(reca9(), reca10()), reca11())), recxor(recxor(reca2(), reca2()), reca7())), reciff(recor(reca4(), reca9()), recxor(recnot(reca6()), reca6()))))), recnot(reciff(recnot(reca11()), recnot(reca9()))))))), recnot(recand(recimplies(recand(reca1(), reca2()), recnot(recxor(recor(recor(recxor(recimplies(recand(reca3(), reca4()), recimplies(reca5(), reca6())), recor(reca7(), reca8())), recxor(reciff(reca9(), reca10()), reca11())), recxor(recxor(reca2(), reca2()), reca7())), reciff(recor(reca4(), reca9()), recxor(recnot(reca6()), reca6()))))), recnot(reciff(recnot(reca11()), recnot(reca9()))))))
// eval: recimplies(recand(recnot(recand(recxor(reca1(), recxor(recor(reca2(), reca3()), reca4())), recxor(reciff(recxor(recnot(reca5()), recor(recxor(reciff(reca6(), reca7()), reciff(reca8(), reca9())), recand(reca10(), reca9()))), reciff(recnot(recnot(reca2())), recimplies(recor(reca9(), reca6()), recor(reca10(), reca5())))), recnot(recor(reca9(), recimplies(recnot(reca8()), recor(reca4(), reca9()))))))), recimplies(recnot(recand(recxor(reca1(), recxor(recor(reca2(), reca3()), reca4())), recxor(reciff(recxor(recnot(reca5()), recor(recxor(reciff(reca6(), reca7()), reciff(reca8(), reca9())), recand(reca10(), reca9()))), reciff(recnot(recnot(reca2())), recimplies(recor(reca9(), reca6()), recor(reca10(), reca5())))), recnot(recor(reca9(), recimplies(recnot(reca8()), recor(reca4(), reca9()))))))), recnot(recimplies(recimplies(recand(recor(reca1(), recxor(recxor(reca2(), reca3()), recnot(reca4()))), recnot(recxor(reca5(), recand(reca6(), reca7())))), recimplies(recxor(recimplies(reca8(), reca9()), reca10()), recxor(recand(reca4(), recor(reca4(), reca1())), reca2()))), recor(recor(recxor(recor(reca4(), reca7()), reca2()), recand(reca8(), reca1())), recnot(recnot(recnot(reca6())))))))), recnot(recimplies(recimplies(recand(recor(reca1(), recxor(recxor(reca2(), reca3()), recnot(reca4()))), recnot(recxor(reca5(), recand(reca6(), reca7())))), recimplies(recxor(recimplies(reca8(), reca9()), reca10()), recxor(recand(reca4(), recor(reca4(), reca1())), reca2()))), recor(recor(recxor(recor(reca4(), reca7()), reca2()), recand(reca8(), reca1())), recnot(recnot(recnot(reca6())))))))
// eval: recimplies(recand(recnot(recand(recxor(reca1(), recxor(recor(reca2(), reca3()), reca4())), recxor(reciff(recxor(recnot(reca5()), recor(recxor(reciff(reca6(), reca7()), reciff(reca8(), reca9())), recand(reca10(), reca11()))), recimplies(recor(reca4(), recand(reca3(), reciff(reca1(), reca2()))), recnot(recnot(reca4())))), recxor(recimplies(recimplies(reca6(), reca1()), recnot(reca1())), recnot(reca9()))))), recimplies(recnot(recand(recxor(reca1(), recxor(recor(reca2(), reca3()), reca4())), recxor(reciff(recxor(recnot(reca5()), recor(recxor(reciff(reca6(), reca7()), reciff(reca8(), reca9())), recand(reca10(), reca11()))), recimplies(recor(reca4(), recand(reca3(), reciff(reca1(), reca2()))), recnot(recnot(reca4())))), recxor(recimplies(recimplies(reca6(), reca1()), recnot(reca1())), recnot(reca9()))))), recnot(recimplies(recimplies(recand(recor(reca1(), recxor(recxor(reca2(), reca3()), recnot(reca4()))), recnot(recxor(reca5(), recand(reca6(), reca7())))), recimplies(recxor(recimplies(reca8(), reca9()), reca10()), recxor(recand(reca11(), recimplies(reca2(), reca8())), reca8()))), recnot(recor(recimplies(recor(reca5(), recor(reca8(), recand(reca8(), reca9()))), recnot(reca2())), recnot(reca7()))))))), recnot(recimplies(recimplies(recand(recor(reca1(), recxor(recxor(reca2(), reca3()), recnot(reca4()))), recnot(recxor(reca5(), recand(reca6(), reca7())))), recimplies(recxor(recimplies(reca8(), reca9()), reca10()), recxor(recand(reca11(), recimplies(reca2(), reca8())), reca8()))), recnot(recor(recimplies(recor(reca5(), recor(reca8(), recand(reca8(), reca9()))), recnot(reca2())), recnot(reca7()))))))

endmodule
