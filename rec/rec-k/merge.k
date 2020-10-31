module MERGE-SYNTAX

syntax RECBool
syntax RECStrg
syntax RECList

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECStrg ::= reca()
syntax RECStrg ::= recb()
syntax RECStrg ::= recc(RECStrg, RECStrg)
syntax RECList ::= recnil()
syntax RECList ::= recl(RECStrg, RECList)
syntax RECBool ::= recgte(RECStrg, RECStrg) [function]
syntax RECList ::= recmerge(RECList, RECList) [function]
syntax RECList ::= recsort(RECList) [function]
syntax RECList ::= recodd(RECList) [function]
syntax RECList ::= receven(RECList) [function]

endmodule

module MERGE
imports K-EQUAL
imports MERGE-SYNTAX

rule recgte(recb(), reca()) => rectrue()
rule recgte(reca(), recb()) => recfalse()
rule recgte(reca(), reca()) => rectrue()
rule recgte(recb(), recb()) => rectrue()
rule recgte(recc(REC_V_E:RECStrg, REC_V_S:RECStrg), REC_V_E2:RECStrg) => recgte(REC_V_E:RECStrg, REC_V_E2:RECStrg)
rule recgte(REC_V_E:RECStrg, recc(REC_V_E2:RECStrg, REC_V_S2:RECStrg)) => recfalse()
  requires REC_V_E:RECStrg ==K REC_V_E2:RECStrg
rule recgte(REC_V_E:RECStrg, recc(REC_V_E2:RECStrg, REC_V_S2:RECStrg)) => recgte(REC_V_E:RECStrg, REC_V_E2:RECStrg)
  requires REC_V_E:RECStrg =/=K REC_V_E2:RECStrg
rule recmerge(recnil(), REC_V_L1:RECList) => REC_V_L1:RECList
rule recmerge(REC_V_L1:RECList, recnil()) => REC_V_L1:RECList
rule recmerge(recl(REC_V_S:RECStrg, REC_V_L1:RECList), recl(REC_V_S2:RECStrg, REC_V_L2:RECList)) => recl(REC_V_S2:RECStrg, recmerge(recl(REC_V_S:RECStrg, REC_V_L1:RECList), REC_V_L2:RECList))
  requires recgte(REC_V_S:RECStrg, REC_V_S2:RECStrg) ==K rectrue()
rule recmerge(recl(REC_V_S:RECStrg, REC_V_L1:RECList), recl(REC_V_S2:RECStrg, REC_V_L2:RECList)) => recl(REC_V_S:RECStrg, recmerge(REC_V_L1:RECList, recl(REC_V_S2:RECStrg, REC_V_L2:RECList)))
  requires recgte(REC_V_S:RECStrg, REC_V_S2:RECStrg) ==K recfalse()
rule recodd(recnil()) => recnil()
rule recodd(recl(REC_V_S:RECStrg, recnil())) => recl(REC_V_S:RECStrg, recnil())
rule recodd(recl(REC_V_S:RECStrg, recl(REC_V_S2:RECStrg, REC_V_L1:RECList))) => recl(REC_V_S:RECStrg, recodd(REC_V_L1:RECList))
rule receven(recnil()) => recnil()
rule receven(recl(REC_V_S:RECStrg, recnil())) => recnil()
rule receven(recl(REC_V_S:RECStrg, recl(REC_V_S2:RECStrg, REC_V_L1:RECList))) => recl(REC_V_S2:RECStrg, receven(REC_V_L1:RECList))
rule recsort(recnil()) => recnil()
rule recsort(recl(REC_V_S:RECStrg, recnil())) => recl(REC_V_S:RECStrg, recnil())
rule recsort(recl(REC_V_S:RECStrg, recl(REC_V_S2:RECStrg, REC_V_L1:RECList))) => recmerge(recsort(recodd(recl(REC_V_S:RECStrg, recl(REC_V_S2:RECStrg, REC_V_L1:RECList)))), recsort(receven(recl(REC_V_S:RECStrg, recl(REC_V_S2:RECStrg, REC_V_L1:RECList)))))

// eval: recsort(recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recnil())))))))))))))))))))))))))))))))))))))))))))))))))))

endmodule
