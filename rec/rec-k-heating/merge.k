module MERGE-SYNTAX

syntax RECBoolResult
syntax RECStrgResult
syntax RECListResult

syntax RECBool ::= RECBoolResult
syntax RECStrg ::= RECStrgResult
syntax RECList ::= RECListResult

syntax KResult ::= RECBoolResult
syntax KResult ::= RECStrgResult
syntax KResult ::= RECListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECBool ::= rectrue()
syntax RECBoolResult ::= rectrue()
syntax RECBool ::= recfalse()
syntax RECBoolResult ::= recfalse()
syntax RECStrg ::= reca()
syntax RECStrgResult ::= reca()
syntax RECStrg ::= recb()
syntax RECStrgResult ::= recb()
syntax RECStrg ::= recc(RECStrg, RECStrg) [seqstrict]
syntax RECStrgResult ::= recc(RECStrgResult, RECStrgResult)
syntax RECList ::= recnil()
syntax RECListResult ::= recnil()
syntax RECList ::= recl(RECStrg, RECList) [seqstrict]
syntax RECListResult ::= recl(RECStrgResult, RECListResult)
syntax RECBool ::= recgte(RECStrg, RECStrg) [function]
syntax RECList ::= recmerge(RECList, RECList) [seqstrict]
syntax RECList ::= recsort(RECList) [seqstrict]
syntax RECList ::= recodd(RECList) [seqstrict]
syntax RECList ::= receven(RECList) [seqstrict]

endmodule

module MERGE
imports K-EQUAL
imports MERGE-SYNTAX

rule recgte(recb(), reca()) => rectrue()
rule recgte(reca(), recb()) => recfalse()
rule recgte(reca(), reca()) => rectrue()
rule recgte(recb(), recb()) => rectrue()
rule recgte(recc(REC_V_E:RECStrgResult, REC_V_S:RECStrgResult), REC_V_E2:RECStrgResult) => recgte(REC_V_E:RECStrgResult, REC_V_E2:RECStrgResult)
rule recgte(REC_V_E:RECStrgResult, recc(REC_V_E2:RECStrgResult, REC_V_S2:RECStrgResult)) => recfalse()
  requires REC_V_E:RECStrgResult ==K REC_V_E2:RECStrgResult
rule recgte(REC_V_E:RECStrgResult, recc(REC_V_E2:RECStrgResult, REC_V_S2:RECStrgResult)) => recgte(REC_V_E:RECStrgResult, REC_V_E2:RECStrgResult)
  requires REC_V_E:RECStrgResult =/=K REC_V_E2:RECStrgResult
rule recmerge(recnil(), REC_V_L1:RECListResult) => REC_V_L1:RECListResult
rule recmerge(REC_V_L1:RECListResult, recnil()) => REC_V_L1:RECListResult
rule recmerge(recl(REC_V_S:RECStrgResult, REC_V_L1:RECListResult), recl(REC_V_S2:RECStrgResult, REC_V_L2:RECListResult)) => recl(REC_V_S2:RECStrgResult, recmerge(recl(REC_V_S:RECStrgResult, REC_V_L1:RECListResult), REC_V_L2:RECListResult))
  requires recgte(REC_V_S:RECStrgResult, REC_V_S2:RECStrgResult) ==K rectrue()
rule recmerge(recl(REC_V_S:RECStrgResult, REC_V_L1:RECListResult), recl(REC_V_S2:RECStrgResult, REC_V_L2:RECListResult)) => recl(REC_V_S:RECStrgResult, recmerge(REC_V_L1:RECListResult, recl(REC_V_S2:RECStrgResult, REC_V_L2:RECListResult)))
  requires recgte(REC_V_S:RECStrgResult, REC_V_S2:RECStrgResult) ==K recfalse()
rule recodd(recnil()) => recnil()
rule recodd(recl(REC_V_S:RECStrgResult, recnil())) => recl(REC_V_S:RECStrgResult, recnil())
rule recodd(recl(REC_V_S:RECStrgResult, recl(REC_V_S2:RECStrgResult, REC_V_L1:RECListResult))) => recl(REC_V_S:RECStrgResult, recodd(REC_V_L1:RECListResult))
rule receven(recnil()) => recnil()
rule receven(recl(REC_V_S:RECStrgResult, recnil())) => recnil()
rule receven(recl(REC_V_S:RECStrgResult, recl(REC_V_S2:RECStrgResult, REC_V_L1:RECListResult))) => recl(REC_V_S2:RECStrgResult, receven(REC_V_L1:RECListResult))
rule recsort(recnil()) => recnil()
rule recsort(recl(REC_V_S:RECStrgResult, recnil())) => recl(REC_V_S:RECStrgResult, recnil())
rule recsort(recl(REC_V_S:RECStrgResult, recl(REC_V_S2:RECStrgResult, REC_V_L1:RECListResult))) => recmerge(recsort(recodd(recl(REC_V_S:RECStrgResult, recl(REC_V_S2:RECStrgResult, REC_V_L1:RECListResult)))), recsort(receven(recl(REC_V_S:RECStrgResult, recl(REC_V_S2:RECStrgResult, REC_V_L1:RECListResult)))))

// eval: recsort(recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recl(recc(reca(), recc(recb(), recc(reca(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), recb()))), recl(recc(reca(), recc(recb(), recc(reca(), reca()))), recl(recc(recb(), recc(recb(), recc(recb(), recb()))), recl(recc(recb(), recc(recb(), recc(recb(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), recb()))), recl(recc(recb(), recc(recb(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(reca(), reca()))), recl(recc(reca(), recc(reca(), recc(recb(), recb()))), recl(recc(recb(), recc(reca(), recc(recb(), reca()))), recnil())))))))))))))))))))))))))))))))))))))))))))))))))))

endmodule
