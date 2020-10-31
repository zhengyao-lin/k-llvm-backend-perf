module LOGIC3-SYNTAX

syntax RECBool3Result

syntax RECBool3 ::= RECBool3Result

syntax KResult ::= RECBool3Result
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool3 ::= recd0()
syntax RECBool3Result ::= recd0()
syntax RECBool3 ::= recd1()
syntax RECBool3Result ::= recd1()
syntax RECBool3 ::= recd2()
syntax RECBool3Result ::= recd2()
syntax RECBool3 ::= reca()
syntax RECBool3 ::= recb()
syntax RECBool3 ::= recc()
syntax RECBool3 ::= recd()
syntax RECBool3 ::= rece()
syntax RECBool3 ::= recf()
syntax RECBool3 ::= recg()
syntax RECBool3 ::= rech()
syntax RECBool3 ::= recplus(RECBool3, RECBool3) [seqstrict]
syntax RECBool3 ::= rectimes(RECBool3, RECBool3) [seqstrict]
syntax RECBool3 ::= recand(RECBool3, RECBool3) [seqstrict]
syntax RECBool3 ::= recor(RECBool3, RECBool3) [seqstrict]
syntax RECBool3 ::= recnot(RECBool3) [seqstrict]
syntax RECBool3 ::= recsucc(RECBool3) [seqstrict]
syntax RECBool3 ::= receq(RECBool3, RECBool3) [seqstrict]

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
rule recplus(recd0(), REC_V_X:RECBool3Result) => REC_V_X:RECBool3Result
rule recplus(recd1(), REC_V_X:RECBool3Result) => recsucc(REC_V_X:RECBool3Result)
rule recplus(recd2(), REC_V_X:RECBool3Result) => recsucc(recsucc(REC_V_X:RECBool3Result))
rule rectimes(recd0(), REC_V_X:RECBool3Result) => recd0()
rule rectimes(recd1(), REC_V_X:RECBool3Result) => REC_V_X:RECBool3Result
rule rectimes(recd2(), recd0()) => recd0()
rule rectimes(recd2(), recd1()) => recd2()
rule rectimes(recd2(), recd2()) => recd1()
rule recand(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result) => recplus(rectimes(rectimes(REC_V_X:RECBool3Result, REC_V_X:RECBool3Result), rectimes(REC_V_Y:RECBool3Result, REC_V_Y:RECBool3Result)), recplus(rectimes(recd2(), rectimes(rectimes(REC_V_X:RECBool3Result, REC_V_X:RECBool3Result), REC_V_Y:RECBool3Result)), recplus(rectimes(recd2(), rectimes(rectimes(REC_V_Y:RECBool3Result, REC_V_Y:RECBool3Result), REC_V_X:RECBool3Result)), rectimes(recd2(), rectimes(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result)))))
rule recor(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result) => recplus(rectimes(recd2(), rectimes(rectimes(REC_V_X:RECBool3Result, REC_V_X:RECBool3Result), rectimes(REC_V_Y:RECBool3Result, REC_V_Y:RECBool3Result))), recplus(rectimes(rectimes(REC_V_X:RECBool3Result, REC_V_X:RECBool3Result), REC_V_Y:RECBool3Result), recplus(rectimes(rectimes(REC_V_Y:RECBool3Result, REC_V_Y:RECBool3Result), REC_V_X:RECBool3Result), recplus(rectimes(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result), recplus(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result)))))
rule recnot(REC_V_X:RECBool3Result) => recplus(rectimes(recd2(), REC_V_X:RECBool3Result), recd1())
rule receq(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result) => recd1()
  requires REC_V_X:RECBool3Result ==K REC_V_Y:RECBool3Result
rule receq(REC_V_X:RECBool3Result, REC_V_Y:RECBool3Result) => recd0()
  requires REC_V_X:RECBool3Result =/=K REC_V_Y:RECBool3Result

// eval: receq(recand(recand(recand(reca(), recb()), recand(recc(), recd())), recand(recand(rece(), recf()), recand(recg(), rech()))), recnot(recor(recor(recor(recnot(reca()), recnot(recb())), recor(recnot(recc()), recnot(recd()))), recor(recor(recnot(rece()), recnot(recf())), recor(recnot(recg()), recnot(rech()))))))

endmodule
