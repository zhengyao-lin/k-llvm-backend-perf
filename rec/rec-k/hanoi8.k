module HANOI8-SYNTAX

syntax RECDisk
syntax RECTower
syntax RECMove
syntax RECList

syntax KItem ::= then(KItem, KItem)
syntax RECDisk ::= recd0()
syntax RECDisk ::= recd1()
syntax RECDisk ::= recd2()
syntax RECDisk ::= recd3()
syntax RECDisk ::= recd4()
syntax RECDisk ::= recd5()
syntax RECDisk ::= recd6()
syntax RECDisk ::= recd7()
syntax RECDisk ::= recd8()
syntax RECDisk ::= recd9()
syntax RECDisk ::= recd10()
syntax RECDisk ::= recd11()
syntax RECDisk ::= recd12()
syntax RECDisk ::= recd13()
syntax RECDisk ::= recd14()
syntax RECDisk ::= recd15()
syntax RECDisk ::= recd16()
syntax RECDisk ::= recd17()
syntax RECDisk ::= recd18()
syntax RECDisk ::= recd19()
syntax RECDisk ::= recd20()
syntax RECTower ::= reca()
syntax RECTower ::= recb()
syntax RECTower ::= recc()
syntax RECMove ::= recmovedisk(RECDisk, RECTower, RECTower)
syntax RECList ::= recnil()
syntax RECList ::= reccons(RECMove, RECList)
syntax RECDisk ::= recdec(RECDisk) [function]
syntax RECTower ::= recother(RECTower, RECTower) [function]
syntax RECList ::= recconc(RECList, RECList) [function]
syntax RECList ::= recsolve(RECTower, RECTower, RECDisk) [function]

endmodule

module HANOI8
imports K-EQUAL
imports HANOI8-SYNTAX

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
rule recconc(recnil(), REC_V_L:RECList) => REC_V_L:RECList
rule recconc(REC_V_L:RECList, recnil()) => REC_V_L:RECList
rule recconc(reccons(REC_V_H:RECMove, REC_V_T:RECList), REC_V_L:RECList) => reccons(REC_V_H:RECMove, recconc(REC_V_T:RECList, REC_V_L:RECList))
rule recsolve(REC_V_ORG:RECTower, REC_V_DEST:RECTower, recd0()) => recnil()
rule recsolve(REC_V_ORG:RECTower, REC_V_DEST:RECTower, REC_V_D:RECDisk) => recconc(recsolve(REC_V_ORG:RECTower, recother(REC_V_ORG:RECTower, REC_V_DEST:RECTower), recdec(REC_V_D:RECDisk)), reccons(recmovedisk(REC_V_D:RECDisk, REC_V_ORG:RECTower, REC_V_DEST:RECTower), recsolve(recother(REC_V_ORG:RECTower, REC_V_DEST:RECTower), REC_V_DEST:RECTower, recdec(REC_V_D:RECDisk))))
  requires REC_V_D:RECDisk =/=K recd0()

// eval: recsolve(reca(), recb(), recd8())

endmodule
