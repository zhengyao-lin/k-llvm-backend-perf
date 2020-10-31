module HANOI16-SYNTAX

syntax RECDiskResult
syntax RECTowerResult
syntax RECMoveResult
syntax RECListResult

syntax RECDisk ::= RECDiskResult
syntax RECTower ::= RECTowerResult
syntax RECMove ::= RECMoveResult
syntax RECList ::= RECListResult

syntax KResult ::= RECDiskResult
syntax KResult ::= RECTowerResult
syntax KResult ::= RECMoveResult
syntax KResult ::= RECListResult
syntax KItem ::= then(KItem, KItem) [seqstrict]
syntax RECDisk ::= recd0()
syntax RECDiskResult ::= recd0()
syntax RECDisk ::= recd1()
syntax RECDiskResult ::= recd1()
syntax RECDisk ::= recd2()
syntax RECDiskResult ::= recd2()
syntax RECDisk ::= recd3()
syntax RECDiskResult ::= recd3()
syntax RECDisk ::= recd4()
syntax RECDiskResult ::= recd4()
syntax RECDisk ::= recd5()
syntax RECDiskResult ::= recd5()
syntax RECDisk ::= recd6()
syntax RECDiskResult ::= recd6()
syntax RECDisk ::= recd7()
syntax RECDiskResult ::= recd7()
syntax RECDisk ::= recd8()
syntax RECDiskResult ::= recd8()
syntax RECDisk ::= recd9()
syntax RECDiskResult ::= recd9()
syntax RECDisk ::= recd10()
syntax RECDiskResult ::= recd10()
syntax RECDisk ::= recd11()
syntax RECDiskResult ::= recd11()
syntax RECDisk ::= recd12()
syntax RECDiskResult ::= recd12()
syntax RECDisk ::= recd13()
syntax RECDiskResult ::= recd13()
syntax RECDisk ::= recd14()
syntax RECDiskResult ::= recd14()
syntax RECDisk ::= recd15()
syntax RECDiskResult ::= recd15()
syntax RECDisk ::= recd16()
syntax RECDiskResult ::= recd16()
syntax RECDisk ::= recd17()
syntax RECDiskResult ::= recd17()
syntax RECDisk ::= recd18()
syntax RECDiskResult ::= recd18()
syntax RECDisk ::= recd19()
syntax RECDiskResult ::= recd19()
syntax RECDisk ::= recd20()
syntax RECDiskResult ::= recd20()
syntax RECTower ::= reca()
syntax RECTowerResult ::= reca()
syntax RECTower ::= recb()
syntax RECTowerResult ::= recb()
syntax RECTower ::= recc()
syntax RECTowerResult ::= recc()
syntax RECMove ::= recmovedisk(RECDisk, RECTower, RECTower) [seqstrict]
syntax RECMoveResult ::= recmovedisk(RECDiskResult, RECTowerResult, RECTowerResult)
syntax RECList ::= recnil()
syntax RECListResult ::= recnil()
syntax RECList ::= reccons(RECMove, RECList) [seqstrict]
syntax RECListResult ::= reccons(RECMoveResult, RECListResult)
syntax RECDisk ::= recdec(RECDisk) [seqstrict]
syntax RECTower ::= recother(RECTower, RECTower) [seqstrict]
syntax RECList ::= recconc(RECList, RECList) [seqstrict]
syntax RECList ::= recsolve(RECTower, RECTower, RECDisk) [seqstrict]

endmodule

module HANOI16
imports K-EQUAL
imports HANOI16-SYNTAX

rule recdec(recd20()) => recd19()
rule recdec(recd19()) => recd18()
rule recdec(recd18()) => recd17()
rule recdec(recd17()) => recd16()
rule recdec(recd16()) => recd15()
rule recdec(recd15()) => recd14()
rule recdec(recd14()) => recd13()
rule recdec(recd13()) => recd12()
rule recdec(recd12()) => recd11()
rule recdec(recd11()) => recd10()
rule recdec(recd10()) => recd9()
rule recdec(recd9()) => recd8()
rule recdec(recd8()) => recd7()
rule recdec(recd7()) => recd6()
rule recdec(recd6()) => recd5()
rule recdec(recd5()) => recd4()
rule recdec(recd4()) => recd3()
rule recdec(recd3()) => recd2()
rule recdec(recd2()) => recd1()
rule recdec(recd1()) => recd0()
rule recother(reca(), recb()) => recc()
rule recother(recb(), reca()) => recc()
rule recother(reca(), recc()) => recb()
rule recother(recc(), reca()) => recb()
rule recother(recb(), recc()) => reca()
rule recother(recc(), recb()) => reca()
rule recconc(recnil(), REC_V_L:RECListResult) => REC_V_L:RECListResult
rule recconc(REC_V_L:RECListResult, recnil()) => REC_V_L:RECListResult
rule recconc(reccons(REC_V_H:RECMoveResult, REC_V_T:RECListResult), REC_V_L:RECListResult) => reccons(REC_V_H:RECMoveResult, recconc(REC_V_T:RECListResult, REC_V_L:RECListResult))
rule recsolve(REC_V_ORG:RECTowerResult, REC_V_DEST:RECTowerResult, recd0()) => recnil()
rule recsolve(REC_V_ORG:RECTowerResult, REC_V_DEST:RECTowerResult, REC_V_D:RECDiskResult) => recconc(recsolve(REC_V_ORG:RECTowerResult, recother(REC_V_ORG:RECTowerResult, REC_V_DEST:RECTowerResult), recdec(REC_V_D:RECDiskResult)), reccons(recmovedisk(REC_V_D:RECDiskResult, REC_V_ORG:RECTowerResult, REC_V_DEST:RECTowerResult), recsolve(recother(REC_V_ORG:RECTowerResult, REC_V_DEST:RECTowerResult), REC_V_DEST:RECTowerResult, recdec(REC_V_D:RECDiskResult))))
  requires REC_V_D:RECDiskResult =/=K recd0()

// eval: recsolve(reca(), recb(), recd16())

endmodule
