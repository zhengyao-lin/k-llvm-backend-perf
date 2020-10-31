module LOGIC3-SYNTAX

syntax RECBool3

syntax KItem ::= then(KItem, KItem)
syntax RECBool3 ::= recd0()
syntax RECBool3 ::= recd1()
syntax RECBool3 ::= recd2()
syntax RECBool3 ::= reca() [function]
syntax RECBool3 ::= recb() [function]
syntax RECBool3 ::= recc() [function]
syntax RECBool3 ::= recd() [function]
syntax RECBool3 ::= rece() [function]
syntax RECBool3 ::= recf() [function]
syntax RECBool3 ::= recg() [function]
syntax RECBool3 ::= rech() [function]
syntax RECBool3 ::= recplus(RECBool3, RECBool3) [function]
syntax RECBool3 ::= rectimes(RECBool3, RECBool3) [function]
syntax RECBool3 ::= recand(RECBool3, RECBool3) [function]
syntax RECBool3 ::= recor(RECBool3, RECBool3) [function]
syntax RECBool3 ::= recnot(RECBool3) [function]
syntax RECBool3 ::= recsucc(RECBool3) [function]
syntax RECBool3 ::= receq(RECBool3, RECBool3) [function]

endmodule

module LOGIC3
imports K-EQUAL
imports LOGIC3-SYNTAX

rule reca() => recd0()
rule recb() => recd1()
rule recc() => recd2()
rule recd() => recd0()
rule rece() => recd1()
rule recf() => recd2()
rule recg() => recd0()
rule rech() => recd1()
rule recsucc(recd0()) => recd1()
rule recsucc(recd1()) => recd2()
rule recsucc(recd2()) => recd0()
rule recplus(recd0(), REC_V_X:RECBool3) => REC_V_X:RECBool3
rule recplus(recd1(), REC_V_X:RECBool3) => recsucc(REC_V_X:RECBool3)
rule recplus(recd2(), REC_V_X:RECBool3) => recsucc(recsucc(REC_V_X:RECBool3))
rule rectimes(recd0(), REC_V_X:RECBool3) => recd0()
rule rectimes(recd1(), REC_V_X:RECBool3) => REC_V_X:RECBool3
rule rectimes(recd2(), recd0()) => recd0()
rule rectimes(recd2(), recd1()) => recd2()
rule rectimes(recd2(), recd2()) => recd1()
rule recand(REC_V_X:RECBool3, REC_V_Y:RECBool3) => recplus(rectimes(rectimes(REC_V_X:RECBool3, REC_V_X:RECBool3), rectimes(REC_V_Y:RECBool3, REC_V_Y:RECBool3)), recplus(rectimes(recd2(), rectimes(rectimes(REC_V_X:RECBool3, REC_V_X:RECBool3), REC_V_Y:RECBool3)), recplus(rectimes(recd2(), rectimes(rectimes(REC_V_Y:RECBool3, REC_V_Y:RECBool3), REC_V_X:RECBool3)), rectimes(recd2(), rectimes(REC_V_X:RECBool3, REC_V_Y:RECBool3)))))
rule recor(REC_V_X:RECBool3, REC_V_Y:RECBool3) => recplus(rectimes(recd2(), rectimes(rectimes(REC_V_X:RECBool3, REC_V_X:RECBool3), rectimes(REC_V_Y:RECBool3, REC_V_Y:RECBool3))), recplus(rectimes(rectimes(REC_V_X:RECBool3, REC_V_X:RECBool3), REC_V_Y:RECBool3), recplus(rectimes(rectimes(REC_V_Y:RECBool3, REC_V_Y:RECBool3), REC_V_X:RECBool3), recplus(rectimes(REC_V_X:RECBool3, REC_V_Y:RECBool3), recplus(REC_V_X:RECBool3, REC_V_Y:RECBool3)))))
rule recnot(REC_V_X:RECBool3) => recplus(rectimes(recd2(), REC_V_X:RECBool3), recd1())
rule receq(REC_V_X:RECBool3, REC_V_Y:RECBool3) => recd1()
  requires REC_V_X:RECBool3 ==K REC_V_Y:RECBool3
rule receq(REC_V_X:RECBool3, REC_V_Y:RECBool3) => recd0()
  requires REC_V_X:RECBool3 =/=K REC_V_Y:RECBool3

// eval: receq(recand(recand(recand(reca(), recb()), recand(recc(), recd())), recand(recand(rece(), recf()), recand(recg(), rech()))), recnot(recor(recor(recor(recnot(reca()), recnot(recb())), recor(recnot(recc()), recnot(recd()))), recor(recor(recnot(rece()), recnot(recf())), recor(recnot(recg()), recnot(rech()))))))

endmodule
