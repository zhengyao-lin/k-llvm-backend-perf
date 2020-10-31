module MAA-SYNTAX

syntax RECBool
syntax RECNat
syntax RECBit
syntax RECOctet
syntax RECOctetSum
syntax RECHalf
syntax RECHalfSum
syntax RECBlock
syntax RECBlockSum
syntax RECPair
syntax RECKey
syntax RECMessage
syntax RECSegmentedMessage

syntax KItem ::= then(KItem, KItem)
syntax RECBool ::= recfalse()
syntax RECBool ::= rectrue()
syntax RECBit ::= recx0()
syntax RECBit ::= recx1()
syntax RECOctet ::= recbuildOctet(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit)
syntax RECOctetSum ::= recbuildOctetSum(RECBit, RECOctet)
syntax RECHalf ::= recbuildHalf(RECOctet, RECOctet)
syntax RECHalfSum ::= recbuildHalfSum(RECBit, RECHalf)
syntax RECBlock ::= recbuildBlock(RECOctet, RECOctet, RECOctet, RECOctet)
syntax RECBlockSum ::= recbuildBlockSum(RECBit, RECBlock)
syntax RECPair ::= recbuildPair(RECBlock, RECBlock)
syntax RECNat ::= reczero()
syntax RECNat ::= recsucc(RECNat)
syntax RECKey ::= recbuildKey(RECBlock, RECBlock)
syntax RECMessage ::= recunitMessage(RECBlock)
syntax RECMessage ::= recconsMessage(RECBlock, RECMessage)
syntax RECSegmentedMessage ::= recunitSegment(RECMessage)
syntax RECSegmentedMessage ::= recconsSegment(RECMessage, RECSegmentedMessage)
syntax RECBool ::= recnotBool(RECBool) [function]
syntax RECBool ::= recandBool(RECBool, RECBool) [function]
syntax RECBool ::= recorBool(RECBool, RECBool) [function]
syntax RECBool ::= recxorBool(RECBool, RECBool) [function]
syntax RECBit ::= recnotBit(RECBit) [function]
syntax RECBit ::= recandBit(RECBit, RECBit) [function]
syntax RECBit ::= recorBit(RECBit, RECBit) [function]
syntax RECBit ::= recxorBit(RECBit, RECBit) [function]
syntax RECOctet ::= recx00() [function]
syntax RECOctet ::= recx01() [function]
syntax RECHalf ::= recx0000() [function]
syntax RECHalf ::= recHalfU(RECBlock) [function]
syntax RECHalf ::= recHalfL(RECBlock) [function]
syntax RECBool ::= receqBit(RECBit, RECBit) [function]
syntax RECBool ::= receqOctet(RECOctet, RECOctet) [function]
syntax RECBool ::= receqOctetSum(RECOctetSum, RECOctetSum) [function]
syntax RECBool ::= receqHalf(RECHalf, RECHalf) [function]
syntax RECBool ::= receqHalfSum(RECHalfSum, RECHalfSum) [function]
syntax RECBool ::= receqBlock(RECBlock, RECBlock) [function]
syntax RECBool ::= receqBlockSum(RECBlockSum, RECBlockSum) [function]
syntax RECBool ::= receqPair(RECPair, RECPair) [function]
syntax RECBit ::= recaddBit(RECBit, RECBit, RECBit) [function]
syntax RECBit ::= reccarBit(RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctetSum(RECOctet, RECOctet, RECBit) [function]
syntax RECOctetSum ::= recaddOctet8(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet7(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet6(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet5(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet4(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet3(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet2(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet1(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctetSum ::= recaddOctet0(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit) [function]
syntax RECOctet ::= recdropCarryOctetSum(RECOctetSum) [function]
syntax RECOctet ::= recaddOctet(RECOctet, RECOctet) [function]
syntax RECHalfSum ::= recaddHalfSum(RECHalf, RECHalf) [function]
syntax RECHalfSum ::= recaddHalf2(RECOctet, RECOctet, RECOctet, RECOctet) [function]
syntax RECHalfSum ::= recaddHalf1(RECOctet, RECOctet, RECOctetSum) [function]
syntax RECHalfSum ::= recaddHalf0(RECOctetSum, RECOctet) [function]
syntax RECHalf ::= recdropCarryHalfSum(RECHalfSum) [function]
syntax RECHalf ::= recaddHalf(RECHalf, RECHalf) [function]
syntax RECHalf ::= recaddHalfOctet(RECOctet, RECHalf) [function]
syntax RECHalf ::= recaddHalfOctets(RECOctet, RECOctet) [function]
syntax RECBlockSum ::= recaddBlockSum(RECBlock, RECBlock) [function]
syntax RECBlockSum ::= recaddBlock4(RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet) [function]
syntax RECBlockSum ::= recaddBlock3(RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctetSum) [function]
syntax RECBlockSum ::= recaddBlock2(RECOctet, RECOctet, RECOctet, RECOctet, RECOctetSum, RECOctet) [function]
syntax RECBlockSum ::= recaddBlock1(RECOctet, RECOctet, RECOctetSum, RECOctet, RECOctet) [function]
syntax RECBlockSum ::= recaddBlock0(RECOctetSum, RECOctet, RECOctet, RECOctet) [function]
syntax RECBlock ::= recdropCarryBlockSum(RECBlockSum) [function]
syntax RECBlock ::= recaddBlock(RECBlock, RECBlock) [function]
syntax RECBlock ::= recaddBlockHalf(RECHalf, RECBlock) [function]
syntax RECBlock ::= recaddBlockHalves(RECHalf, RECHalf) [function]
syntax RECOctet ::= recleftOctet1(RECOctet) [function]
syntax RECOctet ::= recleftOctet2(RECOctet) [function]
syntax RECOctet ::= recleftOctet3(RECOctet) [function]
syntax RECOctet ::= recleftOctet4(RECOctet) [function]
syntax RECOctet ::= recleftOctet5(RECOctet) [function]
syntax RECOctet ::= recleftOctet6(RECOctet) [function]
syntax RECOctet ::= recleftOctet7(RECOctet) [function]
syntax RECOctet ::= recrightOctet1(RECOctet) [function]
syntax RECOctet ::= recrightOctet2(RECOctet) [function]
syntax RECOctet ::= recrightOctet3(RECOctet) [function]
syntax RECOctet ::= recrightOctet4(RECOctet) [function]
syntax RECOctet ::= recrightOctet5(RECOctet) [function]
syntax RECOctet ::= recrightOctet6(RECOctet) [function]
syntax RECOctet ::= recrightOctet7(RECOctet) [function]
syntax RECHalf ::= recmulOctet(RECOctet, RECOctet) [function]
syntax RECHalf ::= recmulOctet1(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet2(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet3(RECBit, RECBit, RECBit, RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet4(RECBit, RECBit, RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet5(RECBit, RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet6(RECBit, RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet7(RECBit, RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctet8(RECBit, RECOctet, RECHalf) [function]
syntax RECHalf ::= recmulOctetA(RECHalf, RECOctet, RECOctet) [function]
syntax RECHalf ::= recmulOctetB(RECOctet, RECOctetSum) [function]
syntax RECBlock ::= recmulHalf(RECHalf, RECHalf) [function]
syntax RECBlock ::= recmulHalfA(RECHalf, RECHalf, RECHalf, RECHalf) [function]
syntax RECBlock ::= recmulHalf4(RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet) [function]
syntax RECBlock ::= recmulHalf3(RECOctet, RECOctet, RECOctet, RECOctet, RECHalf, RECOctet) [function]
syntax RECBlock ::= recmulHalf2(RECOctet, RECHalf, RECOctet, RECOctet) [function]
syntax RECBlock ::= recmulHalf1(RECHalf, RECOctet, RECOctet, RECOctet) [function]
syntax RECPair ::= recmulBlock(RECBlock, RECBlock) [function]
syntax RECPair ::= recmulBlockA(RECBlock, RECBlock, RECBlock, RECBlock) [function]
syntax RECPair ::= recmulBlock4(RECHalf, RECHalf, RECHalf, RECHalf, RECHalf, RECHalf, RECHalf, RECHalf) [function]
syntax RECPair ::= recmulBlock3(RECHalf, RECHalf, RECHalf, RECHalf, RECBlock, RECHalf) [function]
syntax RECPair ::= recmulBlock2(RECHalf, RECBlock, RECHalf, RECHalf) [function]
syntax RECPair ::= recmulBlock1(RECBlock, RECHalf, RECHalf, RECHalf) [function]
syntax RECPair ::= recmulBlockB(RECHalf, RECHalf, RECHalf, RECHalf) [function]
syntax RECNat ::= recaddNat(RECNat, RECNat) [function]
syntax RECNat ::= recmultNat(RECNat, RECNat) [function]
syntax RECBool ::= receqNat(RECNat, RECNat) [function]
syntax RECBool ::= recltNat(RECNat, RECNat) [function]
syntax RECNat ::= recn1() [function]
syntax RECNat ::= recn2() [function]
syntax RECNat ::= recn3() [function]
syntax RECNat ::= recn4() [function]
syntax RECNat ::= recn5() [function]
syntax RECNat ::= recn6() [function]
syntax RECNat ::= recn7() [function]
syntax RECNat ::= recn8() [function]
syntax RECNat ::= recn9() [function]
syntax RECNat ::= recn10() [function]
syntax RECNat ::= recn11() [function]
syntax RECNat ::= recn12() [function]
syntax RECNat ::= recn13() [function]
syntax RECNat ::= recn14() [function]
syntax RECNat ::= recn15() [function]
syntax RECNat ::= recn16() [function]
syntax RECNat ::= recn17() [function]
syntax RECNat ::= recn18() [function]
syntax RECNat ::= recn19() [function]
syntax RECNat ::= recn20() [function]
syntax RECNat ::= recn21() [function]
syntax RECNat ::= recn22() [function]
syntax RECNat ::= recn254() [function]
syntax RECNat ::= recn256() [function]
syntax RECNat ::= recn4100() [function]
syntax RECOctet ::= recandOctet(RECOctet, RECOctet) [function]
syntax RECOctet ::= recorOctet(RECOctet, RECOctet) [function]
syntax RECOctet ::= recxorOctet(RECOctet, RECOctet) [function]
syntax RECOctet ::= recx02() [function]
syntax RECOctet ::= recx03() [function]
syntax RECOctet ::= recx04() [function]
syntax RECOctet ::= recx05() [function]
syntax RECOctet ::= recx06() [function]
syntax RECOctet ::= recx07() [function]
syntax RECOctet ::= recx08() [function]
syntax RECOctet ::= recx09() [function]
syntax RECOctet ::= recx0A() [function]
syntax RECOctet ::= recx0B() [function]
syntax RECOctet ::= recx0C() [function]
syntax RECOctet ::= recx0D() [function]
syntax RECOctet ::= recx0E() [function]
syntax RECOctet ::= recx0F() [function]
syntax RECOctet ::= recx10() [function]
syntax RECOctet ::= recx11() [function]
syntax RECOctet ::= recx12() [function]
syntax RECOctet ::= recx13() [function]
syntax RECOctet ::= recx14() [function]
syntax RECOctet ::= recx15() [function]
syntax RECOctet ::= recx16() [function]
syntax RECOctet ::= recx17() [function]
syntax RECOctet ::= recx18() [function]
syntax RECOctet ::= recx1A() [function]
syntax RECOctet ::= recx1B() [function]
syntax RECOctet ::= recx1C() [function]
syntax RECOctet ::= recx1D() [function]
syntax RECOctet ::= recx1E() [function]
syntax RECOctet ::= recx1F() [function]
syntax RECOctet ::= recx20() [function]
syntax RECOctet ::= recx21() [function]
syntax RECOctet ::= recx23() [function]
syntax RECOctet ::= recx24() [function]
syntax RECOctet ::= recx25() [function]
syntax RECOctet ::= recx26() [function]
syntax RECOctet ::= recx27() [function]
syntax RECOctet ::= recx28() [function]
syntax RECOctet ::= recx29() [function]
syntax RECOctet ::= recx2A() [function]
syntax RECOctet ::= recx2B() [function]
syntax RECOctet ::= recx2D() [function]
syntax RECOctet ::= recx2E() [function]
syntax RECOctet ::= recx2F() [function]
syntax RECOctet ::= recx30() [function]
syntax RECOctet ::= recx31() [function]
syntax RECOctet ::= recx32() [function]
syntax RECOctet ::= recx33() [function]
syntax RECOctet ::= recx34() [function]
syntax RECOctet ::= recx35() [function]
syntax RECOctet ::= recx36() [function]
syntax RECOctet ::= recx37() [function]
syntax RECOctet ::= recx38() [function]
syntax RECOctet ::= recx39() [function]
syntax RECOctet ::= recx3A() [function]
syntax RECOctet ::= recx3B() [function]
syntax RECOctet ::= recx3C() [function]
syntax RECOctet ::= recx3D() [function]
syntax RECOctet ::= recx3F() [function]
syntax RECOctet ::= recx40() [function]
syntax RECOctet ::= recx46() [function]
syntax RECOctet ::= recx48() [function]
syntax RECOctet ::= recx49() [function]
syntax RECOctet ::= recx4A() [function]
syntax RECOctet ::= recx4B() [function]
syntax RECOctet ::= recx4C() [function]
syntax RECOctet ::= recx4D() [function]
syntax RECOctet ::= recx4E() [function]
syntax RECOctet ::= recx4F() [function]
syntax RECOctet ::= recx50() [function]
syntax RECOctet ::= recx51() [function]
syntax RECOctet ::= recx53() [function]
syntax RECOctet ::= recx54() [function]
syntax RECOctet ::= recx55() [function]
syntax RECOctet ::= recx58() [function]
syntax RECOctet ::= recx5A() [function]
syntax RECOctet ::= recx5B() [function]
syntax RECOctet ::= recx5C() [function]
syntax RECOctet ::= recx5D() [function]
syntax RECOctet ::= recx5E() [function]
syntax RECOctet ::= recx5F() [function]
syntax RECOctet ::= recx60() [function]
syntax RECOctet ::= recx61() [function]
syntax RECOctet ::= recx62() [function]
syntax RECOctet ::= recx63() [function]
syntax RECOctet ::= recx64() [function]
syntax RECOctet ::= recx65() [function]
syntax RECOctet ::= recx66() [function]
syntax RECOctet ::= recx67() [function]
syntax RECOctet ::= recx69() [function]
syntax RECOctet ::= recx6A() [function]
syntax RECOctet ::= recx6B() [function]
syntax RECOctet ::= recx6C() [function]
syntax RECOctet ::= recx6D() [function]
syntax RECOctet ::= recx6E() [function]
syntax RECOctet ::= recx6F() [function]
syntax RECOctet ::= recx70() [function]
syntax RECOctet ::= recx71() [function]
syntax RECOctet ::= recx72() [function]
syntax RECOctet ::= recx73() [function]
syntax RECOctet ::= recx74() [function]
syntax RECOctet ::= recx75() [function]
syntax RECOctet ::= recx76() [function]
syntax RECOctet ::= recx77() [function]
syntax RECOctet ::= recx78() [function]
syntax RECOctet ::= recx79() [function]
syntax RECOctet ::= recx7A() [function]
syntax RECOctet ::= recx7B() [function]
syntax RECOctet ::= recx7C() [function]
syntax RECOctet ::= recx7D() [function]
syntax RECOctet ::= recx7E() [function]
syntax RECOctet ::= recx7F() [function]
syntax RECOctet ::= recx80() [function]
syntax RECOctet ::= recx81() [function]
syntax RECOctet ::= recx83() [function]
syntax RECOctet ::= recx84() [function]
syntax RECOctet ::= recx85() [function]
syntax RECOctet ::= recx86() [function]
syntax RECOctet ::= recx88() [function]
syntax RECOctet ::= recx89() [function]
syntax RECOctet ::= recx8A() [function]
syntax RECOctet ::= recx8C() [function]
syntax RECOctet ::= recx8D() [function]
syntax RECOctet ::= recx8E() [function]
syntax RECOctet ::= recx8F() [function]
syntax RECOctet ::= recx90() [function]
syntax RECOctet ::= recx91() [function]
syntax RECOctet ::= recx92() [function]
syntax RECOctet ::= recx93() [function]
syntax RECOctet ::= recx95() [function]
syntax RECOctet ::= recx96() [function]
syntax RECOctet ::= recx97() [function]
syntax RECOctet ::= recx98() [function]
syntax RECOctet ::= recx99() [function]
syntax RECOctet ::= recx9A() [function]
syntax RECOctet ::= recx9B() [function]
syntax RECOctet ::= recx9C() [function]
syntax RECOctet ::= recx9D() [function]
syntax RECOctet ::= recx9E() [function]
syntax RECOctet ::= recx9F() [function]
syntax RECOctet ::= recxA0() [function]
syntax RECOctet ::= recxA1() [function]
syntax RECOctet ::= recxA2() [function]
syntax RECOctet ::= recxA3() [function]
syntax RECOctet ::= recxA4() [function]
syntax RECOctet ::= recxA5() [function]
syntax RECOctet ::= recxA6() [function]
syntax RECOctet ::= recxA7() [function]
syntax RECOctet ::= recxA8() [function]
syntax RECOctet ::= recxA9() [function]
syntax RECOctet ::= recxAA() [function]
syntax RECOctet ::= recxAB() [function]
syntax RECOctet ::= recxAC() [function]
syntax RECOctet ::= recxAE() [function]
syntax RECOctet ::= recxAF() [function]
syntax RECOctet ::= recxB0() [function]
syntax RECOctet ::= recxB1() [function]
syntax RECOctet ::= recxB2() [function]
syntax RECOctet ::= recxB3() [function]
syntax RECOctet ::= recxB5() [function]
syntax RECOctet ::= recxB6() [function]
syntax RECOctet ::= recxB8() [function]
syntax RECOctet ::= recxB9() [function]
syntax RECOctet ::= recxBA() [function]
syntax RECOctet ::= recxBB() [function]
syntax RECOctet ::= recxBC() [function]
syntax RECOctet ::= recxBE() [function]
syntax RECOctet ::= recxBF() [function]
syntax RECOctet ::= recxC0() [function]
syntax RECOctet ::= recxC1() [function]
syntax RECOctet ::= recxC2() [function]
syntax RECOctet ::= recxC4() [function]
syntax RECOctet ::= recxC5() [function]
syntax RECOctet ::= recxC6() [function]
syntax RECOctet ::= recxC7() [function]
syntax RECOctet ::= recxC8() [function]
syntax RECOctet ::= recxC9() [function]
syntax RECOctet ::= recxCA() [function]
syntax RECOctet ::= recxCB() [function]
syntax RECOctet ::= recxCC() [function]
syntax RECOctet ::= recxCD() [function]
syntax RECOctet ::= recxCE() [function]
syntax RECOctet ::= recxD0() [function]
syntax RECOctet ::= recxD1() [function]
syntax RECOctet ::= recxD2() [function]
syntax RECOctet ::= recxD3() [function]
syntax RECOctet ::= recxD4() [function]
syntax RECOctet ::= recxD5() [function]
syntax RECOctet ::= recxD6() [function]
syntax RECOctet ::= recxD7() [function]
syntax RECOctet ::= recxD8() [function]
syntax RECOctet ::= recxD9() [function]
syntax RECOctet ::= recxDB() [function]
syntax RECOctet ::= recxDC() [function]
syntax RECOctet ::= recxDD() [function]
syntax RECOctet ::= recxDE() [function]
syntax RECOctet ::= recxDF() [function]
syntax RECOctet ::= recxE0() [function]
syntax RECOctet ::= recxE1() [function]
syntax RECOctet ::= recxE3() [function]
syntax RECOctet ::= recxE6() [function]
syntax RECOctet ::= recxE8() [function]
syntax RECOctet ::= recxE9() [function]
syntax RECOctet ::= recxEA() [function]
syntax RECOctet ::= recxEB() [function]
syntax RECOctet ::= recxEC() [function]
syntax RECOctet ::= recxED() [function]
syntax RECOctet ::= recxEE() [function]
syntax RECOctet ::= recxEF() [function]
syntax RECOctet ::= recxF0() [function]
syntax RECOctet ::= recxF1() [function]
syntax RECOctet ::= recxF2() [function]
syntax RECOctet ::= recxF3() [function]
syntax RECOctet ::= recxF4() [function]
syntax RECOctet ::= recxF5() [function]
syntax RECOctet ::= recxF6() [function]
syntax RECOctet ::= recxF7() [function]
syntax RECOctet ::= recxF8() [function]
syntax RECOctet ::= recxF9() [function]
syntax RECOctet ::= recxFA() [function]
syntax RECOctet ::= recxFB() [function]
syntax RECOctet ::= recxFC() [function]
syntax RECOctet ::= recxFD() [function]
syntax RECOctet ::= recxFE() [function]
syntax RECOctet ::= recxFF() [function]
syntax RECBlock ::= recandBlock(RECBlock, RECBlock) [function]
syntax RECBlock ::= recorBlock(RECBlock, RECBlock) [function]
syntax RECBlock ::= recxorBlock(RECBlock, RECBlock) [function]
syntax RECHalf ::= recx0001() [function]
syntax RECBlock ::= recx00000000() [function]
syntax RECBlock ::= recx00000001() [function]
syntax RECBlock ::= recx00000002() [function]
syntax RECBlock ::= recx00000003() [function]
syntax RECBlock ::= recx00000004() [function]
syntax RECBlock ::= recx00000005() [function]
syntax RECBlock ::= recx00000006() [function]
syntax RECBlock ::= recx00000007() [function]
syntax RECBlock ::= recx00000008() [function]
syntax RECBlock ::= recx00000009() [function]
syntax RECBlock ::= recx0000000A() [function]
syntax RECBlock ::= recx0000000B() [function]
syntax RECBlock ::= recx0000000C() [function]
syntax RECBlock ::= recx0000000D() [function]
syntax RECBlock ::= recx0000000E() [function]
syntax RECBlock ::= recx0000000F() [function]
syntax RECBlock ::= recx00000010() [function]
syntax RECBlock ::= recx00000012() [function]
syntax RECBlock ::= recx00000014() [function]
syntax RECBlock ::= recx00000016() [function]
syntax RECBlock ::= recx00000018() [function]
syntax RECBlock ::= recx0000001B() [function]
syntax RECBlock ::= recx0000001D() [function]
syntax RECBlock ::= recx0000001E() [function]
syntax RECBlock ::= recx0000001F() [function]
syntax RECBlock ::= recx00000031() [function]
syntax RECBlock ::= recx00000036() [function]
syntax RECBlock ::= recx00000060() [function]
syntax RECBlock ::= recx00000080() [function]
syntax RECBlock ::= recx000000A5() [function]
syntax RECBlock ::= recx000000B6() [function]
syntax RECBlock ::= recx000000C4() [function]
syntax RECBlock ::= recx000000D2() [function]
syntax RECBlock ::= recx00000100() [function]
syntax RECBlock ::= recx00000129() [function]
syntax RECBlock ::= recx0000018C() [function]
syntax RECBlock ::= recx00004000() [function]
syntax RECBlock ::= recx00010000() [function]
syntax RECBlock ::= recx00020000() [function]
syntax RECBlock ::= recx00030000() [function]
syntax RECBlock ::= recx00040000() [function]
syntax RECBlock ::= recx00060000() [function]
syntax RECBlock ::= recx00804021() [function]
syntax RECBlock ::= recx00FF00FF() [function]
syntax RECBlock ::= recx0103050B() [function]
syntax RECBlock ::= recx01030703() [function]
syntax RECBlock ::= recx01030705() [function]
syntax RECBlock ::= recx0103070F() [function]
syntax RECBlock ::= recx02040801() [function]
syntax RECBlock ::= recx0297AF6F() [function]
syntax RECBlock ::= recx07050301() [function]
syntax RECBlock ::= recx077788A2() [function]
syntax RECBlock ::= recx07C72EAA() [function]
syntax RECBlock ::= recx0A202020() [function]
syntax RECBlock ::= recx0AD67E20() [function]
syntax RECBlock ::= recx10000000() [function]
syntax RECBlock ::= recx11A9D254() [function]
syntax RECBlock ::= recx11AC46B8() [function]
syntax RECBlock ::= recx1277A6D4() [function]
syntax RECBlock ::= recx13647149() [function]
syntax RECBlock ::= recx160EE9B5() [function]
syntax RECBlock ::= recx17065DBB() [function]
syntax RECBlock ::= recx17A808FD() [function]
syntax RECBlock ::= recx1D10D8D3() [function]
syntax RECBlock ::= recx1D3B7760() [function]
syntax RECBlock ::= recx1D9C9655() [function]
syntax RECBlock ::= recx1F3F7FFF() [function]
syntax RECBlock ::= recx204E80A7() [function]
syntax RECBlock ::= recx21D869BA() [function]
syntax RECBlock ::= recx24B66FB5() [function]
syntax RECBlock ::= recx270EEDAF() [function]
syntax RECBlock ::= recx277B4B25() [function]
syntax RECBlock ::= recx2829040B() [function]
syntax RECBlock ::= recx288FC786() [function]
syntax RECBlock ::= recx28EAD8B3() [function]
syntax RECBlock ::= recx29907CD8() [function]
syntax RECBlock ::= recx29C1485F() [function]
syntax RECBlock ::= recx29EEE96B() [function]
syntax RECBlock ::= recx2A6091AE() [function]
syntax RECBlock ::= recx2BF8499A() [function]
syntax RECBlock ::= recx2E80AC30() [function]
syntax RECBlock ::= recx2FD76FFB() [function]
syntax RECBlock ::= recx30261492() [function]
syntax RECBlock ::= recx303FF4AA() [function]
syntax RECBlock ::= recx33D5A466() [function]
syntax RECBlock ::= recx344925FC() [function]
syntax RECBlock ::= recx34ACF886() [function]
syntax RECBlock ::= recx3CD54DEB() [function]
syntax RECBlock ::= recx3CF3A7D2() [function]
syntax RECBlock ::= recx3DD81AC6() [function]
syntax RECBlock ::= recx3F6F7248() [function]
syntax RECBlock ::= recx48B204D6() [function]
syntax RECBlock ::= recx4A645A01() [function]
syntax RECBlock ::= recx4C49AAE0() [function]
syntax RECBlock ::= recx4CE933E1() [function]
syntax RECBlock ::= recx4D53901A() [function]
syntax RECBlock ::= recx4DA124A1() [function]
syntax RECBlock ::= recx4F998E01() [function]
syntax RECBlock ::= recx4FB1138A() [function]
syntax RECBlock ::= recx50DEC930() [function]
syntax RECBlock ::= recx51AF3C1D() [function]
syntax RECBlock ::= recx51EDE9C7() [function]
syntax RECBlock ::= recx550D91CE() [function]
syntax RECBlock ::= recx55555555() [function]
syntax RECBlock ::= recx55DD063F() [function]
syntax RECBlock ::= recx5834A585() [function]
syntax RECBlock ::= recx5A35D667() [function]
syntax RECBlock ::= recx5BC02502() [function]
syntax RECBlock ::= recx5CCA3239() [function]
syntax RECBlock ::= recx5EBA06C2() [function]
syntax RECBlock ::= recx5F38EEF1() [function]
syntax RECBlock ::= recx613F8E2A() [function]
syntax RECBlock ::= recx63C70DBA() [function]
syntax RECBlock ::= recx6AD6E8A4() [function]
syntax RECBlock ::= recx6AEBACF8() [function]
syntax RECBlock ::= recx6D67E884() [function]
syntax RECBlock ::= recx7050EC5E() [function]
syntax RECBlock ::= recx717153D5() [function]
syntax RECBlock ::= recx7201F4DC() [function]
syntax RECBlock ::= recx7397C9AE() [function]
syntax RECBlock ::= recx74B39176() [function]
syntax RECBlock ::= recx76232E5F() [function]
syntax RECBlock ::= recx7783C51D() [function]
syntax RECBlock ::= recx7792F9D4() [function]
syntax RECBlock ::= recx7BC180AB() [function]
syntax RECBlock ::= recx7DB2D9F4() [function]
syntax RECBlock ::= recx7DFEFBFF() [function]
syntax RECBlock ::= recx7F76A3B0() [function]
syntax RECBlock ::= recx7F839576() [function]
syntax RECBlock ::= recx7FFFFFF0() [function]
syntax RECBlock ::= recx7FFFFFF1() [function]
syntax RECBlock ::= recx7FFFFFFC() [function]
syntax RECBlock ::= recx7FFFFFFD() [function]
syntax RECBlock ::= recx80000000() [function]
syntax RECBlock ::= recx80000002() [function]
syntax RECBlock ::= recx800000C2() [function]
syntax RECBlock ::= recx80018000() [function]
syntax RECBlock ::= recx80018001() [function]
syntax RECBlock ::= recx80397302() [function]
syntax RECBlock ::= recx81D10CA3() [function]
syntax RECBlock ::= recx89D635D7() [function]
syntax RECBlock ::= recx8CE37709() [function]
syntax RECBlock ::= recx8DC8BBDE() [function]
syntax RECBlock ::= recx9115A558() [function]
syntax RECBlock ::= recx91896CFA() [function]
syntax RECBlock ::= recx9372CDC6() [function]
syntax RECBlock ::= recx98D1CC75() [function]
syntax RECBlock ::= recx9D15C437() [function]
syntax RECBlock ::= recx9DB15CF6() [function]
syntax RECBlock ::= recx9E2E7B36() [function]
syntax RECBlock ::= recxA018C83B() [function]
syntax RECBlock ::= recxA0B87B77() [function]
syntax RECBlock ::= recxA44AAAC0() [function]
syntax RECBlock ::= recxA511987A() [function]
syntax RECBlock ::= recxA70FC148() [function]
syntax RECBlock ::= recxA93BD410() [function]
syntax RECBlock ::= recxAAAAAAAA() [function]
syntax RECBlock ::= recxAB00FFCD() [function]
syntax RECBlock ::= recxAB01FCCD() [function]
syntax RECBlock ::= recxAB6EED4A() [function]
syntax RECBlock ::= recxABEEED6B() [function]
syntax RECBlock ::= recxACBC13DD() [function]
syntax RECBlock ::= recxB1CC1CC5() [function]
syntax RECBlock ::= recxB8142629() [function]
syntax RECBlock ::= recxB99A62DE() [function]
syntax RECBlock ::= recxBA92DB12() [function]
syntax RECBlock ::= recxBBA57835() [function]
syntax RECBlock ::= recxBE9F0917() [function]
syntax RECBlock ::= recxBF2D7D85() [function]
syntax RECBlock ::= recxBFEF7FDF() [function]
syntax RECBlock ::= recxC1ED90DD() [function]
syntax RECBlock ::= recxC21A1846() [function]
syntax RECBlock ::= recxC4EB1AEB() [function]
syntax RECBlock ::= recxC6B1317E() [function]
syntax RECBlock ::= recxCBC865BA() [function]
syntax RECBlock ::= recxCD959B46() [function]
syntax RECBlock ::= recxD0482465() [function]
syntax RECBlock ::= recxD636250D() [function]
syntax RECBlock ::= recxD7843FDC() [function]
syntax RECBlock ::= recxD78634BC() [function]
syntax RECBlock ::= recxD8804CA5() [function]
syntax RECBlock ::= recxDB79FBDC() [function]
syntax RECBlock ::= recxDB9102B0() [function]
syntax RECBlock ::= recxE0C08000() [function]
syntax RECBlock ::= recxE6A12F07() [function]
syntax RECBlock ::= recxEB35B97F() [function]
syntax RECBlock ::= recxF0239DD5() [function]
syntax RECBlock ::= recxF14D6E28() [function]
syntax RECBlock ::= recxF2EF3501() [function]
syntax RECBlock ::= recxF6A09667() [function]
syntax RECBlock ::= recxFD297DA4() [function]
syntax RECBlock ::= recxFDC1A8BA() [function]
syntax RECBlock ::= recxFE4E5BDD() [function]
syntax RECBlock ::= recxFEA1D334() [function]
syntax RECBlock ::= recxFECCAA6E() [function]
syntax RECBlock ::= recxFEFC07F0() [function]
syntax RECBlock ::= recxFF2D7DA5() [function]
syntax RECBlock ::= recxFFEF0001() [function]
syntax RECBlock ::= recxFFFF00FF() [function]
syntax RECBlock ::= recxFFFFFF2D() [function]
syntax RECBlock ::= recxFFFFFF3A() [function]
syntax RECBlock ::= recxFFFFFFF0() [function]
syntax RECBlock ::= recxFFFFFFF1() [function]
syntax RECBlock ::= recxFFFFFFF4() [function]
syntax RECBlock ::= recxFFFFFFF5() [function]
syntax RECBlock ::= recxFFFFFFF7() [function]
syntax RECBlock ::= recxFFFFFFF9() [function]
syntax RECBlock ::= recxFFFFFFFA() [function]
syntax RECBlock ::= recxFFFFFFFB() [function]
syntax RECBlock ::= recxFFFFFFFC() [function]
syntax RECBlock ::= recxFFFFFFFD() [function]
syntax RECBlock ::= recxFFFFFFFE() [function]
syntax RECBlock ::= recxFFFFFFFF() [function]
syntax RECMessage ::= recappendMessage(RECMessage, RECBlock) [function]
syntax RECMessage ::= recreverseMessage(RECMessage) [function]
syntax RECMessage ::= recmakeMessage(RECNat, RECBlock, RECBlock) [function]
syntax RECSegmentedMessage ::= recsplitSegment(RECMessage) [function]
syntax RECSegmentedMessage ::= reccutSegment(RECMessage, RECMessage, RECNat) [function]
syntax RECBlock ::= recADD(RECBlock, RECBlock) [function]
syntax RECBlock ::= recAND(RECBlock, RECBlock) [function]
syntax RECPair ::= recMUL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recOR(RECBlock, RECBlock) [function]
syntax RECBlock ::= recXOR(RECBlock, RECBlock) [function]
syntax RECBlock ::= recXORprime(RECPair) [function]
syntax RECBlock ::= recCYC(RECBlock) [function]
syntax RECBlock ::= recnCYC(RECNat, RECBlock) [function]
syntax RECBlock ::= recFIX1(RECBlock) [function]
syntax RECBlock ::= recFIX2(RECBlock) [function]
syntax RECBool ::= recneedAdjust(RECOctet) [function]
syntax RECBit ::= recadjustCode(RECOctet) [function]
syntax RECOctet ::= recadjust(RECOctet, RECOctet) [function]
syntax RECOctet ::= recPAT(RECBlock, RECBlock) [function]
syntax RECPair ::= recBYT(RECBlock, RECBlock) [function]
syntax RECPair ::= recBYTprime(RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet, RECOctet) [function]
syntax RECPair ::= recADDC(RECBlock, RECBlock) [function]
syntax RECPair ::= recADDCprime(RECBlockSum) [function]
syntax RECBlock ::= recMUL1(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL1XY(RECPair) [function]
syntax RECBlock ::= recMUL1UL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL1SC(RECPair) [function]
syntax RECBlock ::= recMUL2(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2XY(RECPair) [function]
syntax RECBlock ::= recMUL2UL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2DEL(RECPair, RECBlock) [function]
syntax RECBlock ::= recMUL2FL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2SC(RECPair) [function]
syntax RECBlock ::= recMUL2A(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2AXY(RECPair) [function]
syntax RECBlock ::= recMUL2AUL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2ADL(RECBlock, RECBlock) [function]
syntax RECBlock ::= recMUL2ASC(RECPair) [function]
syntax RECBlock ::= recsquareHalf(RECHalf) [function]
syntax RECBlock ::= recQ(RECOctet) [function]
syntax RECBlock ::= recH4(RECBlock) [function]
syntax RECBlock ::= recH6(RECBlock) [function]
syntax RECBlock ::= recH8(RECBlock) [function]
syntax RECBlock ::= recH0(RECBlock) [function]
syntax RECBlock ::= recH5(RECBlock, RECOctet) [function]
syntax RECBlock ::= recH7(RECBlock) [function]
syntax RECBlock ::= recH9(RECBlock) [function]
syntax RECBlock ::= recJ12(RECBlock) [function]
syntax RECBlock ::= recJ14(RECBlock) [function]
syntax RECBlock ::= recJ16(RECBlock) [function]
syntax RECBlock ::= recJ18(RECBlock) [function]
syntax RECBlock ::= recJ22(RECBlock) [function]
syntax RECBlock ::= recJ24(RECBlock) [function]
syntax RECBlock ::= recJ26(RECBlock) [function]
syntax RECBlock ::= recJ28(RECBlock) [function]
syntax RECBlock ::= recK12(RECBlock) [function]
syntax RECBlock ::= recK14(RECBlock) [function]
syntax RECBlock ::= recK15(RECBlock) [function]
syntax RECBlock ::= recK17(RECBlock) [function]
syntax RECBlock ::= recK19(RECBlock) [function]
syntax RECBlock ::= recK22(RECBlock) [function]
syntax RECBlock ::= recK24(RECBlock) [function]
syntax RECBlock ::= recK25(RECBlock) [function]
syntax RECBlock ::= recK27(RECBlock) [function]
syntax RECBlock ::= recK29(RECBlock) [function]
syntax RECPair ::= recpreludeXY(RECBlock, RECBlock) [function]
syntax RECPair ::= recpreludeVW(RECBlock, RECBlock) [function]
syntax RECPair ::= recpreludeST(RECBlock, RECBlock) [function]
syntax RECPair ::= recpreludeXYprime(RECPair, RECOctet) [function]
syntax RECPair ::= recpreludeVWprime(RECPair) [function]
syntax RECPair ::= recpreludeSTprime(RECPair) [function]
syntax RECPair ::= reccomputeXY(RECPair, RECPair, RECBlock) [function]
syntax RECPair ::= reccomputeXYprime(RECPair, RECBlock, RECBlock) [function]
syntax RECPair ::= reccomputeVW(RECPair) [function]
syntax RECPair ::= recloop1(RECPair, RECPair, RECMessage) [function]
syntax RECPair ::= recloop2(RECPair, RECPair, RECMessage) [function]
syntax RECBlock ::= reccoda(RECPair, RECPair, RECPair) [function]
syntax RECBlock ::= recMAA(RECKey, RECMessage) [function]
syntax RECBlock ::= recMAAprime(RECPair, RECPair, RECPair, RECMessage) [function]
syntax RECBlock ::= recMAC(RECKey, RECMessage) [function]
syntax RECBlock ::= recMACfirst(RECKey, RECSegmentedMessage) [function]
syntax RECBlock ::= recMACnext(RECKey, RECBlock, RECSegmentedMessage) [function]

endmodule

module MAA
imports K-EQUAL
imports MAA-SYNTAX

rule recnotBool(recfalse()) => rectrue()
rule recnotBool(rectrue()) => recfalse()
rule recandBool(recfalse(), REC_V_L:RECBool) => recfalse()
rule recandBool(rectrue(), REC_V_L:RECBool) => REC_V_L:RECBool
rule recorBool(recfalse(), REC_V_L:RECBool) => REC_V_L:RECBool
rule recorBool(rectrue(), REC_V_L:RECBool) => rectrue()
rule recxorBool(recfalse(), REC_V_L:RECBool) => REC_V_L:RECBool
rule recxorBool(rectrue(), REC_V_L:RECBool) => recnotBool(REC_V_L:RECBool)
rule recnotBit(recx0()) => recx1()
rule recnotBit(recx1()) => recx0()
rule recandBit(REC_V_B:RECBit, recx0()) => recx0()
rule recandBit(REC_V_B:RECBit, recx1()) => REC_V_B:RECBit
rule recorBit(REC_V_B:RECBit, recx0()) => REC_V_B:RECBit
rule recorBit(REC_V_B:RECBit, recx1()) => recx1()
rule recxorBit(REC_V_B:RECBit, recx0()) => REC_V_B:RECBit
rule recxorBit(REC_V_B:RECBit, recx1()) => recnotBit(REC_V_B:RECBit)
rule recx00() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recx01() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recx0000() => recbuildHalf(recx00(), recx00())
rule recHalfU(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet)) => recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet)
rule recHalfL(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet)) => recbuildHalf(REC_V_O3:RECOctet, REC_V_O4:RECOctet)
rule receqBit(recx0(), recx0()) => rectrue()
rule receqBit(recx0(), recx1()) => recfalse()
rule receqBit(recx1(), recx0()) => recfalse()
rule receqBit(recx1(), recx1()) => rectrue()
rule receqOctet(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B_prime_1:RECBit, REC_V_B_prime_2:RECBit, REC_V_B_prime_3:RECBit, REC_V_B_prime_4:RECBit, REC_V_B_prime_5:RECBit, REC_V_B_prime_6:RECBit, REC_V_B_prime_7:RECBit, REC_V_B_prime_8:RECBit)) => recandBool(receqBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit), recandBool(receqBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit), recandBool(receqBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit), recandBool(receqBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit), recandBool(receqBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit), recandBool(receqBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit), recandBool(receqBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit), receqBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit))))))))
rule receqOctetSum(recbuildOctetSum(REC_V_B:RECBit, REC_V_O:RECOctet), recbuildOctetSum(REC_V_B_prime_:RECBit, REC_V_O_prime_:RECOctet)) => recandBool(receqBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), receqOctet(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet))
rule receqHalf(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), recbuildHalf(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet)) => recandBool(receqOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), receqOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet))
rule receqHalfSum(recbuildHalfSum(REC_V_B:RECBit, REC_V_H:RECHalf), recbuildHalfSum(REC_V_B_prime_:RECBit, REC_V_H_prime_:RECHalf)) => recandBool(receqBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), receqHalf(REC_V_H:RECHalf, REC_V_H_prime_:RECHalf))
rule receqBlock(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recandBool(recandBool(receqOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), receqOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet)), recandBool(receqOctet(REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet), receqOctet(REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet)))
rule receqBlockSum(recbuildBlockSum(REC_V_B:RECBit, REC_V_W:RECBlock), recbuildBlockSum(REC_V_B_prime_:RECBit, REC_V_W_prime_:RECBlock)) => recandBool(receqBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), receqBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule receqPair(recbuildPair(REC_V_W1:RECBlock, REC_V_W2:RECBlock), recbuildPair(REC_V_W_prime_1:RECBlock, REC_V_W_prime_2:RECBlock)) => recandBool(receqBlock(REC_V_W1:RECBlock, REC_V_W_prime_1:RECBlock), receqBlock(REC_V_W2:RECBlock, REC_V_W_prime_2:RECBlock))
rule recaddBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit, REC_V_Bcarry:RECBit) => recxorBit(recxorBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), REC_V_Bcarry:RECBit)
rule reccarBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit, REC_V_Bcarry:RECBit) => recorBit(recandBit(recandBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), recnotBit(REC_V_Bcarry:RECBit)), recandBit(recorBit(REC_V_B:RECBit, REC_V_B_prime_:RECBit), REC_V_Bcarry:RECBit))
rule recaddOctetSum(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B_prime_1:RECBit, REC_V_B_prime_2:RECBit, REC_V_B_prime_3:RECBit, REC_V_B_prime_4:RECBit, REC_V_B_prime_5:RECBit, REC_V_B_prime_6:RECBit, REC_V_B_prime_7:RECBit, REC_V_B_prime_8:RECBit), REC_V_Bcarry:RECBit) => recaddOctet8(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, REC_V_B8:RECBit, REC_V_B_prime_8:RECBit, REC_V_Bcarry:RECBit)
rule recaddOctet8(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, REC_V_B8:RECBit, REC_V_B_prime_8:RECBit, REC_V_Bcarry:RECBit) => recaddOctet7(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, reccarBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit, REC_V_Bcarry:RECBit))
rule recaddOctet7(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_8:RECBit) => recaddOctet6(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, reccarBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_8:RECBit)
rule recaddOctet6(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet5(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, reccarBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet5(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet4(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, reccarBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet4(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet3(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, reccarBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet3(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet2(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, reccarBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet2(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet1(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, reccarBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet1(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_Bcarry:RECBit, REC_V_B_second_2:RECBit, REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recaddOctet0(reccarBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_Bcarry:RECBit), recaddBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit, REC_V_Bcarry:RECBit), REC_V_B_second_2:RECBit, REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit)
rule recaddOctet0(REC_V_Bcarry:RECBit, REC_V_B_second_1:RECBit, REC_V_B_second_2:RECBit, REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit) => recbuildOctetSum(REC_V_Bcarry:RECBit, recbuildOctet(REC_V_B_second_1:RECBit, REC_V_B_second_2:RECBit, REC_V_B_second_3:RECBit, REC_V_B_second_4:RECBit, REC_V_B_second_5:RECBit, REC_V_B_second_6:RECBit, REC_V_B_second_7:RECBit, REC_V_B_second_8:RECBit))
rule recdropCarryOctetSum(recbuildOctetSum(REC_V_Bcarry:RECBit, REC_V_O:RECOctet)) => REC_V_O:RECOctet
rule recaddOctet(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet) => recdropCarryOctetSum(recaddOctetSum(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet, recx0()))
rule recaddHalfSum(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), recbuildHalf(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet)) => recaddHalf2(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet)
rule recaddHalf2(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet) => recaddHalf1(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, recaddOctetSum(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, recx0()))
rule recaddHalf1(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, recbuildOctetSum(REC_V_B:RECBit, REC_V_O_second_2:RECOctet)) => recaddHalf0(recaddOctetSum(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_B:RECBit), REC_V_O_second_2:RECOctet)
rule recaddHalf0(recbuildOctetSum(REC_V_B:RECBit, REC_V_O_second_1:RECOctet), REC_V_O_second_2:RECOctet) => recbuildHalfSum(REC_V_B:RECBit, recbuildHalf(REC_V_O_second_1:RECOctet, REC_V_O_second_2:RECOctet))
rule recdropCarryHalfSum(recbuildHalfSum(REC_V_B:RECBit, REC_V_H:RECHalf)) => REC_V_H:RECHalf
rule recaddHalf(REC_V_H:RECHalf, REC_V_H_prime_:RECHalf) => recdropCarryHalfSum(recaddHalfSum(REC_V_H:RECHalf, REC_V_H_prime_:RECHalf))
rule recaddHalfOctet(REC_V_O:RECOctet, REC_V_H:RECHalf) => recaddHalf(recbuildHalf(recx00(), REC_V_O:RECOctet), REC_V_H:RECHalf)
rule recaddHalfOctets(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet) => recaddHalf(recbuildHalf(recx00(), REC_V_O:RECOctet), recbuildHalf(recx00(), REC_V_O_prime_:RECOctet))
rule recaddBlockSum(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recaddBlock4(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet)
rule recaddBlock4(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet) => recaddBlock3(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet, recaddOctetSum(REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet, recx0()))
rule recaddBlock3(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet, recbuildOctetSum(REC_V_Bcarry:RECBit, REC_V_O_second_4:RECOctet)) => recaddBlock2(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, recaddOctetSum(REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_Bcarry:RECBit), REC_V_O_second_4:RECOctet)
rule recaddBlock2(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, recbuildOctetSum(REC_V_Bcarry:RECBit, REC_V_O_second_3:RECOctet), REC_V_O_second_4:RECOctet) => recaddBlock1(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, recaddOctetSum(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_Bcarry:RECBit), REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet)
rule recaddBlock1(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, recbuildOctetSum(REC_V_Bcarry:RECBit, REC_V_O_second_2:RECOctet), REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet) => recaddBlock0(recaddOctetSum(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_Bcarry:RECBit), REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet)
rule recaddBlock0(recbuildOctetSum(REC_V_Bcarry:RECBit, REC_V_O_second_1:RECOctet), REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet) => recbuildBlockSum(REC_V_Bcarry:RECBit, recbuildBlock(REC_V_O_second_1:RECOctet, REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet))
rule recdropCarryBlockSum(recbuildBlockSum(REC_V_Bcarry:RECBit, REC_V_W:RECBlock)) => REC_V_W:RECBlock
rule recaddBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recdropCarryBlockSum(recaddBlockSum(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recaddBlockHalf(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), REC_V_W:RECBlock) => recaddBlock(recbuildBlock(recx00(), recx00(), REC_V_O1:RECOctet, REC_V_O2:RECOctet), REC_V_W:RECBlock)
rule recaddBlockHalves(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), recbuildHalf(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet)) => recaddBlock(recbuildBlock(recx00(), recx00(), REC_V_O1:RECOctet, REC_V_O2:RECOctet), recbuildBlock(recx00(), recx00(), REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet))
rule recleftOctet1(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, recx0())
rule recleftOctet2(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, recx0(), recx0())
rule recleftOctet3(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, recx0(), recx0(), recx0())
rule recleftOctet4(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, recx0(), recx0(), recx0(), recx0())
rule recleftOctet5(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, recx0(), recx0(), recx0(), recx0(), recx0())
rule recleftOctet6(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B7:RECBit, REC_V_B8:RECBit, recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recleftOctet7(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(REC_V_B8:RECBit, recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recrightOctet1(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit)
rule recrightOctet2(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit)
rule recrightOctet3(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit)
rule recrightOctet4(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), recx0(), recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit)
rule recrightOctet5(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit)
rule recrightOctet6(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), REC_V_B1:RECBit, REC_V_B2:RECBit)
rule recrightOctet7(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit)) => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), REC_V_B1:RECBit)
rule recmulOctet(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), REC_V_O_prime_:RECOctet) => recmulOctet1(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recx0000())
rule recmulOctet1(recx0(), REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet2(REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet1(recx1(), REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet2(REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet1(REC_V_O_prime_:RECOctet), recleftOctet7(REC_V_O_prime_:RECOctet)))
rule recmulOctet2(recx0(), REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet3(REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet2(recx1(), REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet3(REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet2(REC_V_O_prime_:RECOctet), recleftOctet6(REC_V_O_prime_:RECOctet)))
rule recmulOctet3(recx0(), REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet4(REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet3(recx1(), REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet4(REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet3(REC_V_O_prime_:RECOctet), recleftOctet5(REC_V_O_prime_:RECOctet)))
rule recmulOctet4(recx0(), REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet5(REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet4(recx1(), REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet5(REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet4(REC_V_O_prime_:RECOctet), recleftOctet4(REC_V_O_prime_:RECOctet)))
rule recmulOctet5(recx0(), REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet6(REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet5(recx1(), REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet6(REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet5(REC_V_O_prime_:RECOctet), recleftOctet3(REC_V_O_prime_:RECOctet)))
rule recmulOctet6(recx0(), REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet7(REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet6(recx1(), REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet7(REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet6(REC_V_O_prime_:RECOctet), recleftOctet2(REC_V_O_prime_:RECOctet)))
rule recmulOctet7(recx0(), REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet8(REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf)
rule recmulOctet7(recx1(), REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctet8(REC_V_B8:RECBit, REC_V_O_prime_:RECOctet, recmulOctetA(REC_V_H:RECHalf, recrightOctet7(REC_V_O_prime_:RECOctet), recleftOctet1(REC_V_O_prime_:RECOctet)))
rule recmulOctet8(recx0(), REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => REC_V_H:RECHalf
rule recmulOctet8(recx1(), REC_V_O_prime_:RECOctet, REC_V_H:RECHalf) => recmulOctetA(REC_V_H:RECHalf, recx00(), REC_V_O_prime_:RECOctet)
rule recmulOctetA(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet) => recmulOctetB(recaddOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), recaddOctetSum(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet, recx0()))
rule recmulOctetB(REC_V_O1:RECOctet, recbuildOctetSum(recx0(), REC_V_O2:RECOctet)) => recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet)
rule recmulOctetB(REC_V_O1:RECOctet, recbuildOctetSum(recx1(), REC_V_O2:RECOctet)) => recbuildHalf(recaddOctet(REC_V_O1:RECOctet, recx01()), REC_V_O2:RECOctet)
rule recmulHalf(recbuildHalf(REC_V_O1:RECOctet, REC_V_O2:RECOctet), recbuildHalf(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet)) => recmulHalfA(recmulOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), recmulOctet(REC_V_O1:RECOctet, REC_V_O_prime_2:RECOctet), recmulOctet(REC_V_O2:RECOctet, REC_V_O_prime_1:RECOctet), recmulOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet))
rule recmulHalfA(recbuildHalf(REC_V_O11U:RECOctet, REC_V_O11L:RECOctet), recbuildHalf(REC_V_O12U:RECOctet, REC_V_O12L:RECOctet), recbuildHalf(REC_V_O21U:RECOctet, REC_V_O21L:RECOctet), recbuildHalf(REC_V_O22U:RECOctet, REC_V_O22L:RECOctet)) => recmulHalf4(REC_V_O11U:RECOctet, REC_V_O11L:RECOctet, REC_V_O12U:RECOctet, REC_V_O12L:RECOctet, REC_V_O21U:RECOctet, REC_V_O21L:RECOctet, REC_V_O22U:RECOctet, REC_V_O22L:RECOctet)
rule recmulHalf4(REC_V_O11U:RECOctet, REC_V_O11L:RECOctet, REC_V_O12U:RECOctet, REC_V_O12L:RECOctet, REC_V_O21U:RECOctet, REC_V_O21L:RECOctet, REC_V_O22U:RECOctet, REC_V_O_second_4:RECOctet) => recmulHalf3(REC_V_O11U:RECOctet, REC_V_O11L:RECOctet, REC_V_O12U:RECOctet, REC_V_O21U:RECOctet, recaddHalfOctet(REC_V_O12L:RECOctet, recaddHalfOctets(REC_V_O21L:RECOctet, REC_V_O22U:RECOctet)), REC_V_O_second_4:RECOctet)
rule recmulHalf3(REC_V_O11U:RECOctet, REC_V_O11L:RECOctet, REC_V_O12U:RECOctet, REC_V_O21U:RECOctet, recbuildHalf(REC_V_Ocarry:RECOctet, REC_V_O_second_3:RECOctet), REC_V_O_second_4:RECOctet) => recmulHalf2(REC_V_O11U:RECOctet, recaddHalfOctet(REC_V_Ocarry:RECOctet, recaddHalfOctet(REC_V_O11L:RECOctet, recaddHalfOctets(REC_V_O12U:RECOctet, REC_V_O21U:RECOctet))), REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet)
rule recmulHalf2(REC_V_O11U:RECOctet, recbuildHalf(REC_V_Ocarry:RECOctet, REC_V_O_second_2:RECOctet), REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet) => recmulHalf1(recaddHalfOctets(REC_V_Ocarry:RECOctet, REC_V_O11U:RECOctet), REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet)
rule recmulHalf1(recbuildHalf(REC_V_Ocarry:RECOctet, REC_V_O_second_1:RECOctet), REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet) => recbuildBlock(REC_V_O_second_1:RECOctet, REC_V_O_second_2:RECOctet, REC_V_O_second_3:RECOctet, REC_V_O_second_4:RECOctet)
rule recmulBlock(REC_V_W1:RECBlock, REC_V_W2:RECBlock) => recmulBlockA(recmulHalf(recHalfU(REC_V_W1:RECBlock), recHalfU(REC_V_W2:RECBlock)), recmulHalf(recHalfU(REC_V_W1:RECBlock), recHalfL(REC_V_W2:RECBlock)), recmulHalf(recHalfL(REC_V_W1:RECBlock), recHalfU(REC_V_W2:RECBlock)), recmulHalf(recHalfL(REC_V_W1:RECBlock), recHalfL(REC_V_W2:RECBlock)))
rule recmulBlockA(REC_V_W11:RECBlock, REC_V_W12:RECBlock, REC_V_W21:RECBlock, REC_V_W22:RECBlock) => recmulBlock4(recHalfU(REC_V_W11:RECBlock), recHalfL(REC_V_W11:RECBlock), recHalfU(REC_V_W12:RECBlock), recHalfL(REC_V_W12:RECBlock), recHalfU(REC_V_W21:RECBlock), recHalfL(REC_V_W21:RECBlock), recHalfU(REC_V_W22:RECBlock), recHalfL(REC_V_W22:RECBlock))
rule recmulBlock4(REC_V_H11U:RECHalf, REC_V_H11L:RECHalf, REC_V_H12U:RECHalf, REC_V_H12L:RECHalf, REC_V_H21U:RECHalf, REC_V_H21L:RECHalf, REC_V_H22U:RECHalf, REC_V_H_second_4:RECHalf) => recmulBlock3(REC_V_H11U:RECHalf, REC_V_H11L:RECHalf, REC_V_H12U:RECHalf, REC_V_H21U:RECHalf, recaddBlockHalf(REC_V_H12L:RECHalf, recaddBlockHalves(REC_V_H21L:RECHalf, REC_V_H22U:RECHalf)), REC_V_H_second_4:RECHalf)
rule recmulBlock3(REC_V_H11U:RECHalf, REC_V_H11L:RECHalf, REC_V_H12U:RECHalf, REC_V_H21U:RECHalf, REC_V_W:RECBlock, REC_V_H_second_4:RECHalf) => recmulBlock2(REC_V_H11U:RECHalf, recaddBlockHalf(recHalfU(REC_V_W:RECBlock), recaddBlockHalf(REC_V_H11L:RECHalf, recaddBlockHalves(REC_V_H12U:RECHalf, REC_V_H21U:RECHalf))), recHalfL(REC_V_W:RECBlock), REC_V_H_second_4:RECHalf)
rule recmulBlock2(REC_V_H11U:RECHalf, REC_V_W:RECBlock, REC_V_H_second_3:RECHalf, REC_V_H_second_4:RECHalf) => recmulBlock1(recaddBlockHalves(recHalfU(REC_V_W:RECBlock), REC_V_H11U:RECHalf), recHalfL(REC_V_W:RECBlock), REC_V_H_second_3:RECHalf, REC_V_H_second_4:RECHalf)
rule recmulBlock1(REC_V_W:RECBlock, REC_V_H_second_2:RECHalf, REC_V_H_second_3:RECHalf, REC_V_H_second_4:RECHalf) => recmulBlockB(recHalfL(REC_V_W:RECBlock), REC_V_H_second_2:RECHalf, REC_V_H_second_3:RECHalf, REC_V_H_second_4:RECHalf)
rule recmulBlockB(recbuildHalf(REC_V_O1U:RECOctet, REC_V_O1L:RECOctet), recbuildHalf(REC_V_O2U:RECOctet, REC_V_O2L:RECOctet), recbuildHalf(REC_V_O3U:RECOctet, REC_V_O3L:RECOctet), recbuildHalf(REC_V_O4U:RECOctet, REC_V_O4L:RECOctet)) => recbuildPair(recbuildBlock(REC_V_O1U:RECOctet, REC_V_O1L:RECOctet, REC_V_O2U:RECOctet, REC_V_O2L:RECOctet), recbuildBlock(REC_V_O3U:RECOctet, REC_V_O3L:RECOctet, REC_V_O4U:RECOctet, REC_V_O4L:RECOctet))
rule recaddNat(REC_V_N:RECNat, reczero()) => REC_V_N:RECNat
rule recaddNat(REC_V_N:RECNat, recsucc(REC_V_N_prime_:RECNat)) => recaddNat(recsucc(REC_V_N:RECNat), REC_V_N_prime_:RECNat)
rule recmultNat(REC_V_N:RECNat, reczero()) => reczero()
rule recmultNat(REC_V_N:RECNat, recsucc(REC_V_N_prime_:RECNat)) => recaddNat(REC_V_N:RECNat, recmultNat(REC_V_N:RECNat, REC_V_N_prime_:RECNat))
rule receqNat(reczero(), reczero()) => rectrue()
rule receqNat(reczero(), recsucc(REC_V_N_prime_:RECNat)) => recfalse()
rule receqNat(recsucc(REC_V_N:RECNat), reczero()) => recfalse()
rule receqNat(recsucc(REC_V_N:RECNat), recsucc(REC_V_N_prime_:RECNat)) => receqNat(REC_V_N:RECNat, REC_V_N_prime_:RECNat)
rule recltNat(reczero(), reczero()) => recfalse()
rule recltNat(reczero(), recsucc(REC_V_N_prime_:RECNat)) => rectrue()
rule recltNat(recsucc(REC_V_N_prime_:RECNat), reczero()) => recfalse()
rule recltNat(recsucc(REC_V_N:RECNat), recsucc(REC_V_N_prime_:RECNat)) => recltNat(REC_V_N:RECNat, REC_V_N_prime_:RECNat)
rule recn1() => recsucc(reczero())
rule recn2() => recsucc(recn1())
rule recn3() => recsucc(recn2())
rule recn4() => recsucc(recn3())
rule recn5() => recsucc(recn4())
rule recn6() => recsucc(recn5())
rule recn7() => recsucc(recn6())
rule recn8() => recsucc(recn7())
rule recn9() => recsucc(recn8())
rule recn10() => recsucc(recn9())
rule recn11() => recsucc(recn10())
rule recn12() => recsucc(recn11())
rule recn13() => recsucc(recn12())
rule recn14() => recsucc(recn13())
rule recn15() => recsucc(recn14())
rule recn16() => recsucc(recn15())
rule recn17() => recsucc(recn16())
rule recn18() => recsucc(recn17())
rule recn19() => recsucc(recn18())
rule recn20() => recsucc(recn19())
rule recn21() => recsucc(recn20())
rule recn22() => recsucc(recn21())
rule recn254() => recaddNat(recn12(), recmultNat(recn11(), recn22()))
rule recn256() => recmultNat(recn16(), recn16())
rule recn4100() => recaddNat(recn4(), recmultNat(recn16(), recn256()))
rule recandOctet(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B_prime_1:RECBit, REC_V_B_prime_2:RECBit, REC_V_B_prime_3:RECBit, REC_V_B_prime_4:RECBit, REC_V_B_prime_5:RECBit, REC_V_B_prime_6:RECBit, REC_V_B_prime_7:RECBit, REC_V_B_prime_8:RECBit)) => recbuildOctet(recandBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit), recandBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit), recandBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit), recandBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit), recandBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit), recandBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit), recandBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit), recandBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit))
rule recorOctet(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B_prime_1:RECBit, REC_V_B_prime_2:RECBit, REC_V_B_prime_3:RECBit, REC_V_B_prime_4:RECBit, REC_V_B_prime_5:RECBit, REC_V_B_prime_6:RECBit, REC_V_B_prime_7:RECBit, REC_V_B_prime_8:RECBit)) => recbuildOctet(recorBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit), recorBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit), recorBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit), recorBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit), recorBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit), recorBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit), recorBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit), recorBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit))
rule recxorOctet(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B_prime_1:RECBit, REC_V_B_prime_2:RECBit, REC_V_B_prime_3:RECBit, REC_V_B_prime_4:RECBit, REC_V_B_prime_5:RECBit, REC_V_B_prime_6:RECBit, REC_V_B_prime_7:RECBit, REC_V_B_prime_8:RECBit)) => recbuildOctet(recxorBit(REC_V_B1:RECBit, REC_V_B_prime_1:RECBit), recxorBit(REC_V_B2:RECBit, REC_V_B_prime_2:RECBit), recxorBit(REC_V_B3:RECBit, REC_V_B_prime_3:RECBit), recxorBit(REC_V_B4:RECBit, REC_V_B_prime_4:RECBit), recxorBit(REC_V_B5:RECBit, REC_V_B_prime_5:RECBit), recxorBit(REC_V_B6:RECBit, REC_V_B_prime_6:RECBit), recxorBit(REC_V_B7:RECBit, REC_V_B_prime_7:RECBit), recxorBit(REC_V_B8:RECBit, REC_V_B_prime_8:RECBit))
rule recx02() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0())
rule recx03() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recx04() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recx05() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recx06() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recx07() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1())
rule recx08() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recx09() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recx0A() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recx0B() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recx0C() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recx0D() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recx0E() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recx0F() => recbuildOctet(recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recx10() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recx11() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recx12() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recx13() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recx14() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recx15() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recx16() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recx17() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recx18() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recx1A() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recx1B() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recx1C() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recx1D() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recx1E() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recx1F() => recbuildOctet(recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recx20() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recx21() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recx23() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recx24() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recx25() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recx26() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recx27() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1())
rule recx28() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recx29() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recx2A() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recx2B() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recx2D() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recx2E() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recx2F() => recbuildOctet(recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recx30() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recx31() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recx32() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recx33() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recx34() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recx35() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recx36() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recx37() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recx38() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recx39() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recx3A() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recx3B() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recx3D() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recx3C() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recx3F() => recbuildOctet(recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recx40() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recx46() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recx48() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recx49() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recx4A() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recx4B() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recx4C() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recx4D() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recx4E() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recx4F() => recbuildOctet(recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recx50() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recx51() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recx53() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recx54() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recx55() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recx58() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recx5A() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recx5B() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recx5C() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recx5D() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recx5E() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recx5F() => recbuildOctet(recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recx60() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recx61() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recx62() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx0())
rule recx63() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recx64() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recx65() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recx66() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recx67() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1())
rule recx69() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recx6A() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recx6B() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recx6C() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recx6D() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recx6E() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recx6F() => recbuildOctet(recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recx70() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recx71() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recx72() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recx73() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recx74() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recx75() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recx76() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recx77() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recx78() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recx79() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recx7A() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recx7B() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recx7C() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recx7D() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recx7E() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recx7F() => recbuildOctet(recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recx80() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recx81() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recx83() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recx84() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recx85() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recx86() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recx88() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recx89() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recx8A() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recx8C() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recx8D() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recx8E() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recx8F() => recbuildOctet(recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recx90() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recx91() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recx92() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recx93() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recx95() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recx96() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recx97() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recx98() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recx99() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recx9A() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recx9B() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recx9C() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recx9D() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recx9E() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recx9F() => recbuildOctet(recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recxA1() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recxA0() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recxA2() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1(), recx0())
rule recxA3() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recxA4() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recxA5() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recxA6() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recxA7() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1())
rule recxA8() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recxA9() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recxAA() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recxAB() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recxAC() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recxAE() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recxAF() => recbuildOctet(recx1(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recxB0() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recxB1() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recxB2() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recxB3() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recxB5() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recxB6() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recxB8() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recxB9() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recxBA() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recxBB() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recxBC() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recxBE() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recxBF() => recbuildOctet(recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recxC0() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recxC1() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recxC2() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx1(), recx0())
rule recxC4() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx0(), recx0())
rule recxC5() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx0(), recx1())
rule recxC6() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recxC7() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1(), recx1())
rule recxC8() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recxC9() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recxCA() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recxCB() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recxCC() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recxCD() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recxCE() => recbuildOctet(recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recxD0() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recxD1() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recxD2() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recxD3() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recxD4() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recxD5() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recxD6() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recxD7() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recxD8() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recxD9() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recxDB() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recxDC() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recxDD() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recxDE() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recxDF() => recbuildOctet(recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recxE0() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx0())
rule recxE1() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0(), recx1())
rule recxE3() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1(), recx1())
rule recxE6() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1(), recx0())
rule recxE8() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx0())
rule recxE9() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0(), recx1())
rule recxEA() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx0())
rule recxEB() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1(), recx1())
rule recxEC() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx0())
rule recxED() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0(), recx1())
rule recxEE() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx0())
rule recxEF() => recbuildOctet(recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1(), recx1())
rule recxF0() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx0())
rule recxF1() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0(), recx1())
rule recxF2() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1(), recx0())
rule recxF3() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1(), recx1())
rule recxF4() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx0())
rule recxF5() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0(), recx1())
rule recxF6() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx0())
rule recxF7() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1(), recx1())
rule recxF8() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx0())
rule recxF9() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0(), recx1())
rule recxFA() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx0())
rule recxFB() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1(), recx1())
rule recxFC() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx0())
rule recxFD() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0(), recx1())
rule recxFE() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx0())
rule recxFF() => recbuildOctet(recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1(), recx1())
rule recandBlock(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recbuildBlock(recandOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), recandOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet), recandOctet(REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet), recandOctet(REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet))
rule recorBlock(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recbuildBlock(recorOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), recorOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet), recorOctet(REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet), recorOctet(REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet))
rule recxorBlock(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recbuildBlock(recxorOctet(REC_V_O1:RECOctet, REC_V_O_prime_1:RECOctet), recxorOctet(REC_V_O2:RECOctet, REC_V_O_prime_2:RECOctet), recxorOctet(REC_V_O3:RECOctet, REC_V_O_prime_3:RECOctet), recxorOctet(REC_V_O4:RECOctet, REC_V_O_prime_4:RECOctet))
rule recx0001() => recbuildHalf(recx00(), recx01())
rule recx00000000() => recbuildBlock(recx00(), recx00(), recx00(), recx00())
rule recx00000001() => recbuildBlock(recx00(), recx00(), recx00(), recx01())
rule recx00000002() => recbuildBlock(recx00(), recx00(), recx00(), recx02())
rule recx00000003() => recbuildBlock(recx00(), recx00(), recx00(), recx03())
rule recx00000004() => recbuildBlock(recx00(), recx00(), recx00(), recx04())
rule recx00000005() => recbuildBlock(recx00(), recx00(), recx00(), recx05())
rule recx00000006() => recbuildBlock(recx00(), recx00(), recx00(), recx06())
rule recx00000007() => recbuildBlock(recx00(), recx00(), recx00(), recx07())
rule recx00000008() => recbuildBlock(recx00(), recx00(), recx00(), recx08())
rule recx00000009() => recbuildBlock(recx00(), recx00(), recx00(), recx09())
rule recx0000000A() => recbuildBlock(recx00(), recx00(), recx00(), recx0A())
rule recx0000000B() => recbuildBlock(recx00(), recx00(), recx00(), recx0B())
rule recx0000000C() => recbuildBlock(recx00(), recx00(), recx00(), recx0C())
rule recx0000000D() => recbuildBlock(recx00(), recx00(), recx00(), recx0D())
rule recx0000000E() => recbuildBlock(recx00(), recx00(), recx00(), recx0E())
rule recx0000000F() => recbuildBlock(recx00(), recx00(), recx00(), recx0F())
rule recx00000010() => recbuildBlock(recx00(), recx00(), recx00(), recx10())
rule recx00000012() => recbuildBlock(recx00(), recx00(), recx00(), recx12())
rule recx00000014() => recbuildBlock(recx00(), recx00(), recx00(), recx14())
rule recx00000016() => recbuildBlock(recx00(), recx00(), recx00(), recx16())
rule recx00000018() => recbuildBlock(recx00(), recx00(), recx00(), recx18())
rule recx0000001B() => recbuildBlock(recx00(), recx00(), recx00(), recx1B())
rule recx0000001D() => recbuildBlock(recx00(), recx00(), recx00(), recx1D())
rule recx0000001E() => recbuildBlock(recx00(), recx00(), recx00(), recx1E())
rule recx0000001F() => recbuildBlock(recx00(), recx00(), recx00(), recx1F())
rule recx00000031() => recbuildBlock(recx00(), recx00(), recx00(), recx31())
rule recx00000036() => recbuildBlock(recx00(), recx00(), recx00(), recx36())
rule recx00000060() => recbuildBlock(recx00(), recx00(), recx00(), recx60())
rule recx00000080() => recbuildBlock(recx00(), recx00(), recx00(), recx80())
rule recx000000A5() => recbuildBlock(recx00(), recx00(), recx00(), recxA5())
rule recx000000B6() => recbuildBlock(recx00(), recx00(), recx00(), recxB6())
rule recx000000C4() => recbuildBlock(recx00(), recx00(), recx00(), recxC4())
rule recx000000D2() => recbuildBlock(recx00(), recx00(), recx00(), recxD2())
rule recx00000100() => recbuildBlock(recx00(), recx00(), recx01(), recx00())
rule recx00000129() => recbuildBlock(recx00(), recx00(), recx01(), recx29())
rule recx0000018C() => recbuildBlock(recx00(), recx00(), recx01(), recx8C())
rule recx00004000() => recbuildBlock(recx00(), recx00(), recx40(), recx00())
rule recx00010000() => recbuildBlock(recx00(), recx01(), recx00(), recx00())
rule recx00020000() => recbuildBlock(recx00(), recx02(), recx00(), recx00())
rule recx00030000() => recbuildBlock(recx00(), recx03(), recx00(), recx00())
rule recx00040000() => recbuildBlock(recx00(), recx04(), recx00(), recx00())
rule recx00060000() => recbuildBlock(recx00(), recx06(), recx00(), recx00())
rule recx00804021() => recbuildBlock(recx00(), recx80(), recx40(), recx21())
rule recx00FF00FF() => recbuildBlock(recx00(), recxFF(), recx00(), recxFF())
rule recx0103050B() => recbuildBlock(recx01(), recx03(), recx05(), recx0B())
rule recx01030703() => recbuildBlock(recx01(), recx03(), recx07(), recx03())
rule recx01030705() => recbuildBlock(recx01(), recx03(), recx07(), recx05())
rule recx0103070F() => recbuildBlock(recx01(), recx03(), recx07(), recx0F())
rule recx02040801() => recbuildBlock(recx02(), recx04(), recx08(), recx01())
rule recx0297AF6F() => recbuildBlock(recx02(), recx97(), recxAF(), recx6F())
rule recx07050301() => recbuildBlock(recx07(), recx05(), recx03(), recx01())
rule recx077788A2() => recbuildBlock(recx07(), recx77(), recx88(), recxA2())
rule recx07C72EAA() => recbuildBlock(recx07(), recxC7(), recx2E(), recxAA())
rule recx0A202020() => recbuildBlock(recx0A(), recx20(), recx20(), recx20())
rule recx0AD67E20() => recbuildBlock(recx0A(), recxD6(), recx7E(), recx20())
rule recx10000000() => recbuildBlock(recx10(), recx00(), recx00(), recx00())
rule recx11A9D254() => recbuildBlock(recx11(), recxA9(), recxD2(), recx54())
rule recx11AC46B8() => recbuildBlock(recx11(), recxAC(), recx46(), recxB8())
rule recx1277A6D4() => recbuildBlock(recx12(), recx77(), recxA6(), recxD4())
rule recx13647149() => recbuildBlock(recx13(), recx64(), recx71(), recx49())
rule recx160EE9B5() => recbuildBlock(recx16(), recx0E(), recxE9(), recxB5())
rule recx17065DBB() => recbuildBlock(recx17(), recx06(), recx5D(), recxBB())
rule recx17A808FD() => recbuildBlock(recx17(), recxA8(), recx08(), recxFD())
rule recx1D10D8D3() => recbuildBlock(recx1D(), recx10(), recxD8(), recxD3())
rule recx1D3B7760() => recbuildBlock(recx1D(), recx3B(), recx77(), recx60())
rule recx1D9C9655() => recbuildBlock(recx1D(), recx9C(), recx96(), recx55())
rule recx1F3F7FFF() => recbuildBlock(recx1F(), recx3F(), recx7F(), recxFF())
rule recx204E80A7() => recbuildBlock(recx20(), recx4E(), recx80(), recxA7())
rule recx21D869BA() => recbuildBlock(recx21(), recxD8(), recx69(), recxBA())
rule recx24B66FB5() => recbuildBlock(recx24(), recxB6(), recx6F(), recxB5())
rule recx270EEDAF() => recbuildBlock(recx27(), recx0E(), recxED(), recxAF())
rule recx277B4B25() => recbuildBlock(recx27(), recx7B(), recx4B(), recx25())
rule recx2829040B() => recbuildBlock(recx28(), recx29(), recx04(), recx0B())
rule recx288FC786() => recbuildBlock(recx28(), recx8F(), recxC7(), recx86())
rule recx28EAD8B3() => recbuildBlock(recx28(), recxEA(), recxD8(), recxB3())
rule recx29907CD8() => recbuildBlock(recx29(), recx90(), recx7C(), recxD8())
rule recx29C1485F() => recbuildBlock(recx29(), recxC1(), recx48(), recx5F())
rule recx29EEE96B() => recbuildBlock(recx29(), recxEE(), recxE9(), recx6B())
rule recx2A6091AE() => recbuildBlock(recx2A(), recx60(), recx91(), recxAE())
rule recx2BF8499A() => recbuildBlock(recx2B(), recxF8(), recx49(), recx9A())
rule recx2E80AC30() => recbuildBlock(recx2E(), recx80(), recxAC(), recx30())
rule recx2FD76FFB() => recbuildBlock(recx2F(), recxD7(), recx6F(), recxFB())
rule recx30261492() => recbuildBlock(recx30(), recx26(), recx14(), recx92())
rule recx303FF4AA() => recbuildBlock(recx30(), recx3F(), recxF4(), recxAA())
rule recx33D5A466() => recbuildBlock(recx33(), recxD5(), recxA4(), recx66())
rule recx344925FC() => recbuildBlock(recx34(), recx49(), recx25(), recxFC())
rule recx34ACF886() => recbuildBlock(recx34(), recxAC(), recxF8(), recx86())
rule recx3CD54DEB() => recbuildBlock(recx3C(), recxD5(), recx4D(), recxEB())
rule recx3CF3A7D2() => recbuildBlock(recx3C(), recxF3(), recxA7(), recxD2())
rule recx3DD81AC6() => recbuildBlock(recx3D(), recxD8(), recx1A(), recxC6())
rule recx3F6F7248() => recbuildBlock(recx3F(), recx6F(), recx72(), recx48())
rule recx48B204D6() => recbuildBlock(recx48(), recxB2(), recx04(), recxD6())
rule recx4A645A01() => recbuildBlock(recx4A(), recx64(), recx5A(), recx01())
rule recx4C49AAE0() => recbuildBlock(recx4C(), recx49(), recxAA(), recxE0())
rule recx4CE933E1() => recbuildBlock(recx4C(), recxE9(), recx33(), recxE1())
rule recx4D53901A() => recbuildBlock(recx4D(), recx53(), recx90(), recx1A())
rule recx4DA124A1() => recbuildBlock(recx4D(), recxA1(), recx24(), recxA1())
rule recx4F998E01() => recbuildBlock(recx4F(), recx99(), recx8E(), recx01())
rule recx4FB1138A() => recbuildBlock(recx4F(), recxB1(), recx13(), recx8A())
rule recx50DEC930() => recbuildBlock(recx50(), recxDE(), recxC9(), recx30())
rule recx51AF3C1D() => recbuildBlock(recx51(), recxAF(), recx3C(), recx1D())
rule recx51EDE9C7() => recbuildBlock(recx51(), recxED(), recxE9(), recxC7())
rule recx550D91CE() => recbuildBlock(recx55(), recx0D(), recx91(), recxCE())
rule recx55555555() => recbuildBlock(recx55(), recx55(), recx55(), recx55())
rule recx55DD063F() => recbuildBlock(recx55(), recxDD(), recx06(), recx3F())
rule recx5834A585() => recbuildBlock(recx58(), recx34(), recxA5(), recx85())
rule recx5A35D667() => recbuildBlock(recx5A(), recx35(), recxD6(), recx67())
rule recx5BC02502() => recbuildBlock(recx5B(), recxC0(), recx25(), recx02())
rule recx5CCA3239() => recbuildBlock(recx5C(), recxCA(), recx32(), recx39())
rule recx5EBA06C2() => recbuildBlock(recx5E(), recxBA(), recx06(), recxC2())
rule recx5F38EEF1() => recbuildBlock(recx5F(), recx38(), recxEE(), recxF1())
rule recx613F8E2A() => recbuildBlock(recx61(), recx3F(), recx8E(), recx2A())
rule recx63C70DBA() => recbuildBlock(recx63(), recxC7(), recx0D(), recxBA())
rule recx6AD6E8A4() => recbuildBlock(recx6A(), recxD6(), recxE8(), recxA4())
rule recx6AEBACF8() => recbuildBlock(recx6A(), recxEB(), recxAC(), recxF8())
rule recx6D67E884() => recbuildBlock(recx6D(), recx67(), recxE8(), recx84())
rule recx7050EC5E() => recbuildBlock(recx70(), recx50(), recxEC(), recx5E())
rule recx717153D5() => recbuildBlock(recx71(), recx71(), recx53(), recxD5())
rule recx7201F4DC() => recbuildBlock(recx72(), recx01(), recxF4(), recxDC())
rule recx7397C9AE() => recbuildBlock(recx73(), recx97(), recxC9(), recxAE())
rule recx74B39176() => recbuildBlock(recx74(), recxB3(), recx91(), recx76())
rule recx76232E5F() => recbuildBlock(recx76(), recx23(), recx2E(), recx5F())
rule recx7783C51D() => recbuildBlock(recx77(), recx83(), recxC5(), recx1D())
rule recx7792F9D4() => recbuildBlock(recx77(), recx92(), recxF9(), recxD4())
rule recx7BC180AB() => recbuildBlock(recx7B(), recxC1(), recx80(), recxAB())
rule recx7DB2D9F4() => recbuildBlock(recx7D(), recxB2(), recxD9(), recxF4())
rule recx7DFEFBFF() => recbuildBlock(recx7D(), recxFE(), recxFB(), recxFF())
rule recx7F76A3B0() => recbuildBlock(recx7F(), recx76(), recxA3(), recxB0())
rule recx7F839576() => recbuildBlock(recx7F(), recx83(), recx95(), recx76())
rule recx7FFFFFF0() => recbuildBlock(recx7F(), recxFF(), recxFF(), recxF0())
rule recx7FFFFFF1() => recbuildBlock(recx7F(), recxFF(), recxFF(), recxF1())
rule recx7FFFFFFC() => recbuildBlock(recx7F(), recxFF(), recxFF(), recxFC())
rule recx7FFFFFFD() => recbuildBlock(recx7F(), recxFF(), recxFF(), recxFD())
rule recx80000000() => recbuildBlock(recx80(), recx00(), recx00(), recx00())
rule recx80000002() => recbuildBlock(recx80(), recx00(), recx00(), recx02())
rule recx800000C2() => recbuildBlock(recx80(), recx00(), recx00(), recxC2())
rule recx80018000() => recbuildBlock(recx80(), recx01(), recx80(), recx00())
rule recx80018001() => recbuildBlock(recx80(), recx01(), recx80(), recx01())
rule recx80397302() => recbuildBlock(recx80(), recx39(), recx73(), recx02())
rule recx81D10CA3() => recbuildBlock(recx81(), recxD1(), recx0C(), recxA3())
rule recx89D635D7() => recbuildBlock(recx89(), recxD6(), recx35(), recxD7())
rule recx8CE37709() => recbuildBlock(recx8C(), recxE3(), recx77(), recx09())
rule recx8DC8BBDE() => recbuildBlock(recx8D(), recxC8(), recxBB(), recxDE())
rule recx9115A558() => recbuildBlock(recx91(), recx15(), recxA5(), recx58())
rule recx91896CFA() => recbuildBlock(recx91(), recx89(), recx6C(), recxFA())
rule recx9372CDC6() => recbuildBlock(recx93(), recx72(), recxCD(), recxC6())
rule recx98D1CC75() => recbuildBlock(recx98(), recxD1(), recxCC(), recx75())
rule recx9D15C437() => recbuildBlock(recx9D(), recx15(), recxC4(), recx37())
rule recx9DB15CF6() => recbuildBlock(recx9D(), recxB1(), recx5C(), recxF6())
rule recx9E2E7B36() => recbuildBlock(recx9E(), recx2E(), recx7B(), recx36())
rule recxA018C83B() => recbuildBlock(recxA0(), recx18(), recxC8(), recx3B())
rule recxA0B87B77() => recbuildBlock(recxA0(), recxB8(), recx7B(), recx77())
rule recxA44AAAC0() => recbuildBlock(recxA4(), recx4A(), recxAA(), recxC0())
rule recxA511987A() => recbuildBlock(recxA5(), recx11(), recx98(), recx7A())
rule recxA70FC148() => recbuildBlock(recxA7(), recx0F(), recxC1(), recx48())
rule recxA93BD410() => recbuildBlock(recxA9(), recx3B(), recxD4(), recx10())
rule recxAAAAAAAA() => recbuildBlock(recxAA(), recxAA(), recxAA(), recxAA())
rule recxAB00FFCD() => recbuildBlock(recxAB(), recx00(), recxFF(), recxCD())
rule recxAB01FCCD() => recbuildBlock(recxAB(), recx01(), recxFC(), recxCD())
rule recxAB6EED4A() => recbuildBlock(recxAB(), recx6E(), recxED(), recx4A())
rule recxABEEED6B() => recbuildBlock(recxAB(), recxEE(), recxED(), recx6B())
rule recxACBC13DD() => recbuildBlock(recxAC(), recxBC(), recx13(), recxDD())
rule recxB1CC1CC5() => recbuildBlock(recxB1(), recxCC(), recx1C(), recxC5())
rule recxB8142629() => recbuildBlock(recxB8(), recx14(), recx26(), recx29())
rule recxB99A62DE() => recbuildBlock(recxB9(), recx9A(), recx62(), recxDE())
rule recxBA92DB12() => recbuildBlock(recxBA(), recx92(), recxDB(), recx12())
rule recxBBA57835() => recbuildBlock(recxBB(), recxA5(), recx78(), recx35())
rule recxBE9F0917() => recbuildBlock(recxBE(), recx9F(), recx09(), recx17())
rule recxBF2D7D85() => recbuildBlock(recxBF(), recx2D(), recx7D(), recx85())
rule recxBFEF7FDF() => recbuildBlock(recxBF(), recxEF(), recx7F(), recxDF())
rule recxC1ED90DD() => recbuildBlock(recxC1(), recxED(), recx90(), recxDD())
rule recxC21A1846() => recbuildBlock(recxC2(), recx1A(), recx18(), recx46())
rule recxC4EB1AEB() => recbuildBlock(recxC4(), recxEB(), recx1A(), recxEB())
rule recxC6B1317E() => recbuildBlock(recxC6(), recxB1(), recx31(), recx7E())
rule recxCBC865BA() => recbuildBlock(recxCB(), recxC8(), recx65(), recxBA())
rule recxCD959B46() => recbuildBlock(recxCD(), recx95(), recx9B(), recx46())
rule recxD0482465() => recbuildBlock(recxD0(), recx48(), recx24(), recx65())
rule recxD636250D() => recbuildBlock(recxD6(), recx36(), recx25(), recx0D())
rule recxD7843FDC() => recbuildBlock(recxD7(), recx84(), recx3F(), recxDC())
rule recxD78634BC() => recbuildBlock(recxD7(), recx86(), recx34(), recxBC())
rule recxD8804CA5() => recbuildBlock(recxD8(), recx80(), recx4C(), recxA5())
rule recxDB79FBDC() => recbuildBlock(recxDB(), recx79(), recxFB(), recxDC())
rule recxDB9102B0() => recbuildBlock(recxDB(), recx91(), recx02(), recxB0())
rule recxE0C08000() => recbuildBlock(recxE0(), recxC0(), recx80(), recx00())
rule recxE6A12F07() => recbuildBlock(recxE6(), recxA1(), recx2F(), recx07())
rule recxEB35B97F() => recbuildBlock(recxEB(), recx35(), recxB9(), recx7F())
rule recxF0239DD5() => recbuildBlock(recxF0(), recx23(), recx9D(), recxD5())
rule recxF14D6E28() => recbuildBlock(recxF1(), recx4D(), recx6E(), recx28())
rule recxF2EF3501() => recbuildBlock(recxF2(), recxEF(), recx35(), recx01())
rule recxF6A09667() => recbuildBlock(recxF6(), recxA0(), recx96(), recx67())
rule recxFD297DA4() => recbuildBlock(recxFD(), recx29(), recx7D(), recxA4())
rule recxFDC1A8BA() => recbuildBlock(recxFD(), recxC1(), recxA8(), recxBA())
rule recxFE4E5BDD() => recbuildBlock(recxFE(), recx4E(), recx5B(), recxDD())
rule recxFEA1D334() => recbuildBlock(recxFE(), recxA1(), recxD3(), recx34())
rule recxFECCAA6E() => recbuildBlock(recxFE(), recxCC(), recxAA(), recx6E())
rule recxFEFC07F0() => recbuildBlock(recxFE(), recxFC(), recx07(), recxF0())
rule recxFF2D7DA5() => recbuildBlock(recxFF(), recx2D(), recx7D(), recxA5())
rule recxFFEF0001() => recbuildBlock(recxFF(), recxEF(), recx00(), recx01())
rule recxFFFF00FF() => recbuildBlock(recxFF(), recxFF(), recx00(), recxFF())
rule recxFFFFFF2D() => recbuildBlock(recxFF(), recxFF(), recxFF(), recx2D())
rule recxFFFFFF3A() => recbuildBlock(recxFF(), recxFF(), recxFF(), recx3A())
rule recxFFFFFFF0() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF0())
rule recxFFFFFFF1() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF1())
rule recxFFFFFFF4() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF4())
rule recxFFFFFFF5() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF5())
rule recxFFFFFFF7() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF7())
rule recxFFFFFFF9() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxF9())
rule recxFFFFFFFA() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFA())
rule recxFFFFFFFB() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFB())
rule recxFFFFFFFC() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFC())
rule recxFFFFFFFD() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFD())
rule recxFFFFFFFE() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFE())
rule recxFFFFFFFF() => recbuildBlock(recxFF(), recxFF(), recxFF(), recxFF())
rule recappendMessage(recunitMessage(REC_V_W:RECBlock), REC_V_W_prime_:RECBlock) => recconsMessage(REC_V_W:RECBlock, recunitMessage(REC_V_W_prime_:RECBlock))
rule recappendMessage(recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage), REC_V_W_prime_:RECBlock) => recconsMessage(REC_V_W:RECBlock, recappendMessage(REC_V_M:RECMessage, REC_V_W_prime_:RECBlock))
rule recreverseMessage(recunitMessage(REC_V_W:RECBlock)) => recunitMessage(REC_V_W:RECBlock)
rule recreverseMessage(recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage)) => recappendMessage(recreverseMessage(REC_V_M:RECMessage), REC_V_W:RECBlock)
rule recmakeMessage(recsucc(REC_V_N:RECNat), REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recunitMessage(REC_V_W:RECBlock)
  requires receqNat(REC_V_N:RECNat, reczero()) ==K rectrue()
rule recmakeMessage(recsucc(REC_V_N:RECNat), REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recconsMessage(REC_V_W:RECBlock, recmakeMessage(REC_V_N:RECNat, recADD(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock), REC_V_W_prime_:RECBlock))
  requires receqNat(REC_V_N:RECNat, reczero()) ==K recfalse()
rule recADD(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recaddBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recAND(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recandBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recMUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recmulBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recOR(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recorBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recXOR(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recxorBlock(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recXORprime(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recXOR(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recCYC(recbuildBlock(recbuildOctet(REC_V_B1:RECBit, REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit), recbuildOctet(REC_V_B9:RECBit, REC_V_B10:RECBit, REC_V_B11:RECBit, REC_V_B12:RECBit, REC_V_B13:RECBit, REC_V_B14:RECBit, REC_V_B15:RECBit, REC_V_B16:RECBit), recbuildOctet(REC_V_B17:RECBit, REC_V_B18:RECBit, REC_V_B19:RECBit, REC_V_B20:RECBit, REC_V_B21:RECBit, REC_V_B22:RECBit, REC_V_B23:RECBit, REC_V_B24:RECBit), recbuildOctet(REC_V_B25:RECBit, REC_V_B26:RECBit, REC_V_B27:RECBit, REC_V_B28:RECBit, REC_V_B29:RECBit, REC_V_B30:RECBit, REC_V_B31:RECBit, REC_V_B32:RECBit))) => recbuildBlock(recbuildOctet(REC_V_B2:RECBit, REC_V_B3:RECBit, REC_V_B4:RECBit, REC_V_B5:RECBit, REC_V_B6:RECBit, REC_V_B7:RECBit, REC_V_B8:RECBit, REC_V_B9:RECBit), recbuildOctet(REC_V_B10:RECBit, REC_V_B11:RECBit, REC_V_B12:RECBit, REC_V_B13:RECBit, REC_V_B14:RECBit, REC_V_B15:RECBit, REC_V_B16:RECBit, REC_V_B17:RECBit), recbuildOctet(REC_V_B18:RECBit, REC_V_B19:RECBit, REC_V_B20:RECBit, REC_V_B21:RECBit, REC_V_B22:RECBit, REC_V_B23:RECBit, REC_V_B24:RECBit, REC_V_B25:RECBit), recbuildOctet(REC_V_B26:RECBit, REC_V_B27:RECBit, REC_V_B28:RECBit, REC_V_B29:RECBit, REC_V_B30:RECBit, REC_V_B31:RECBit, REC_V_B32:RECBit, REC_V_B1:RECBit))
rule recnCYC(reczero(), REC_V_W:RECBlock) => REC_V_W:RECBlock
rule recnCYC(recsucc(REC_V_N:RECNat), REC_V_W:RECBlock) => recCYC(recnCYC(REC_V_N:RECNat, REC_V_W:RECBlock))
rule recFIX1(REC_V_W:RECBlock) => recAND(recOR(REC_V_W:RECBlock, recx02040801()), recxBFEF7FDF())
rule recFIX2(REC_V_W:RECBlock) => recAND(recOR(REC_V_W:RECBlock, recx00804021()), recx7DFEFBFF())
rule recneedAdjust(REC_V_O:RECOctet) => recorBool(receqOctet(REC_V_O:RECOctet, recx00()), receqOctet(REC_V_O:RECOctet, recxFF()))
rule recadjustCode(REC_V_O:RECOctet) => recx1()
  requires recneedAdjust(REC_V_O:RECOctet) ==K rectrue()
rule recadjustCode(REC_V_O:RECOctet) => recx0()
  requires recneedAdjust(REC_V_O:RECOctet) ==K recfalse()
rule recadjust(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet) => recxorOctet(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet)
  requires recneedAdjust(REC_V_O:RECOctet) ==K rectrue()
rule recadjust(REC_V_O:RECOctet, REC_V_O_prime_:RECOctet) => REC_V_O:RECOctet
  requires recneedAdjust(REC_V_O:RECOctet) ==K recfalse()
rule recPAT(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recbuildOctet(recadjustCode(REC_V_O1:RECOctet), recadjustCode(REC_V_O2:RECOctet), recadjustCode(REC_V_O3:RECOctet), recadjustCode(REC_V_O4:RECOctet), recadjustCode(REC_V_O_prime_1:RECOctet), recadjustCode(REC_V_O_prime_2:RECOctet), recadjustCode(REC_V_O_prime_3:RECOctet), recadjustCode(REC_V_O_prime_4:RECOctet))
rule recBYT(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)) => recBYTprime(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet, recPAT(recbuildBlock(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet), recbuildBlock(REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet)))
rule recBYTprime(REC_V_O1:RECOctet, REC_V_O2:RECOctet, REC_V_O3:RECOctet, REC_V_O4:RECOctet, REC_V_O_prime_1:RECOctet, REC_V_O_prime_2:RECOctet, REC_V_O_prime_3:RECOctet, REC_V_O_prime_4:RECOctet, REC_V_Opat:RECOctet) => recbuildPair(recbuildBlock(recadjust(REC_V_O1:RECOctet, recrightOctet7(REC_V_Opat:RECOctet)), recadjust(REC_V_O2:RECOctet, recrightOctet6(REC_V_Opat:RECOctet)), recadjust(REC_V_O3:RECOctet, recrightOctet5(REC_V_Opat:RECOctet)), recadjust(REC_V_O4:RECOctet, recrightOctet4(REC_V_Opat:RECOctet))), recbuildBlock(recadjust(REC_V_O_prime_1:RECOctet, recrightOctet3(REC_V_Opat:RECOctet)), recadjust(REC_V_O_prime_2:RECOctet, recrightOctet2(REC_V_Opat:RECOctet)), recadjust(REC_V_O_prime_3:RECOctet, recrightOctet1(REC_V_Opat:RECOctet)), recadjust(REC_V_O_prime_4:RECOctet, REC_V_Opat:RECOctet)))
rule recADDC(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recADDCprime(recaddBlockSum(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recADDCprime(recbuildBlockSum(recx0(), REC_V_W:RECBlock)) => recbuildPair(recx00000000(), REC_V_W:RECBlock)
rule recADDCprime(recbuildBlockSum(recx1(), REC_V_W:RECBlock)) => recbuildPair(recx00000001(), REC_V_W:RECBlock)
rule recMUL1(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL1XY(recMUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL1XY(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recMUL1UL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recMUL1UL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL1SC(recADDC(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL1SC(recbuildPair(REC_V_Wcarry:RECBlock, REC_V_W:RECBlock)) => recADD(REC_V_W:RECBlock, REC_V_Wcarry:RECBlock)
rule recMUL2(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2XY(recMUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL2XY(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recMUL2UL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recMUL2UL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2DEL(recADDC(REC_V_W:RECBlock, REC_V_W:RECBlock), REC_V_W_prime_:RECBlock)
rule recMUL2DEL(recbuildPair(REC_V_Wcarry:RECBlock, REC_V_W:RECBlock), REC_V_W_prime_:RECBlock) => recMUL2FL(recADD(REC_V_W:RECBlock, recADD(REC_V_Wcarry:RECBlock, REC_V_Wcarry:RECBlock)), REC_V_W_prime_:RECBlock)
rule recMUL2FL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2SC(recADDC(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL2SC(recbuildPair(REC_V_Wcarry:RECBlock, REC_V_W:RECBlock)) => recADD(REC_V_W:RECBlock, recADD(REC_V_Wcarry:RECBlock, REC_V_Wcarry:RECBlock))
rule recMUL2A(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2AXY(recMUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL2AXY(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recMUL2AUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)
rule recMUL2AUL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2ADL(recADD(REC_V_W:RECBlock, REC_V_W:RECBlock), REC_V_W_prime_:RECBlock)
rule recMUL2ADL(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recMUL2ASC(recADDC(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock))
rule recMUL2ASC(recbuildPair(REC_V_Wcarry:RECBlock, REC_V_W:RECBlock)) => recADD(REC_V_W:RECBlock, recADD(REC_V_Wcarry:RECBlock, REC_V_Wcarry:RECBlock))
rule recsquareHalf(REC_V_H:RECHalf) => recmulHalf(REC_V_H:RECHalf, REC_V_H:RECHalf)
rule recQ(REC_V_O:RECOctet) => recsquareHalf(recaddHalf(recbuildHalf(recx00(), REC_V_O:RECOctet), recx0001()))
rule recJ12(REC_V_W:RECBlock) => recMUL1(REC_V_W:RECBlock, REC_V_W:RECBlock)
rule recJ14(REC_V_W:RECBlock) => recMUL1(recJ12(REC_V_W:RECBlock), recJ12(REC_V_W:RECBlock))
rule recJ16(REC_V_W:RECBlock) => recMUL1(recJ12(REC_V_W:RECBlock), recJ14(REC_V_W:RECBlock))
rule recJ18(REC_V_W:RECBlock) => recMUL1(recJ12(REC_V_W:RECBlock), recJ16(REC_V_W:RECBlock))
rule recJ22(REC_V_W:RECBlock) => recMUL2(REC_V_W:RECBlock, REC_V_W:RECBlock)
rule recJ24(REC_V_W:RECBlock) => recMUL2(recJ22(REC_V_W:RECBlock), recJ22(REC_V_W:RECBlock))
rule recJ26(REC_V_W:RECBlock) => recMUL2(recJ22(REC_V_W:RECBlock), recJ24(REC_V_W:RECBlock))
rule recJ28(REC_V_W:RECBlock) => recMUL2(recJ22(REC_V_W:RECBlock), recJ26(REC_V_W:RECBlock))
rule recK12(REC_V_W:RECBlock) => recMUL1(REC_V_W:RECBlock, REC_V_W:RECBlock)
rule recK14(REC_V_W:RECBlock) => recMUL1(recK12(REC_V_W:RECBlock), recK12(REC_V_W:RECBlock))
rule recK15(REC_V_W:RECBlock) => recMUL1(REC_V_W:RECBlock, recK14(REC_V_W:RECBlock))
rule recK17(REC_V_W:RECBlock) => recMUL1(recK12(REC_V_W:RECBlock), recK15(REC_V_W:RECBlock))
rule recK19(REC_V_W:RECBlock) => recMUL1(recK12(REC_V_W:RECBlock), recK17(REC_V_W:RECBlock))
rule recK22(REC_V_W:RECBlock) => recMUL2(REC_V_W:RECBlock, REC_V_W:RECBlock)
rule recK24(REC_V_W:RECBlock) => recMUL2(recK22(REC_V_W:RECBlock), recK22(REC_V_W:RECBlock))
rule recK25(REC_V_W:RECBlock) => recMUL2(REC_V_W:RECBlock, recK24(REC_V_W:RECBlock))
rule recK27(REC_V_W:RECBlock) => recMUL2(recK22(REC_V_W:RECBlock), recK25(REC_V_W:RECBlock))
rule recK29(REC_V_W:RECBlock) => recMUL2(recK22(REC_V_W:RECBlock), recK27(REC_V_W:RECBlock))
rule recH4(REC_V_W:RECBlock) => recXOR(recJ14(REC_V_W:RECBlock), recJ24(REC_V_W:RECBlock))
rule recH6(REC_V_W:RECBlock) => recXOR(recJ16(REC_V_W:RECBlock), recJ26(REC_V_W:RECBlock))
rule recH8(REC_V_W:RECBlock) => recXOR(recJ18(REC_V_W:RECBlock), recJ28(REC_V_W:RECBlock))
rule recH0(REC_V_W:RECBlock) => recXOR(recK15(REC_V_W:RECBlock), recK25(REC_V_W:RECBlock))
rule recH5(REC_V_W:RECBlock, REC_V_O:RECOctet) => recMUL2(recH0(REC_V_W:RECBlock), recQ(REC_V_O:RECOctet))
rule recH7(REC_V_W:RECBlock) => recXOR(recK17(REC_V_W:RECBlock), recK27(REC_V_W:RECBlock))
rule recH9(REC_V_W:RECBlock) => recXOR(recK19(REC_V_W:RECBlock), recK29(REC_V_W:RECBlock))
rule recsplitSegment(recunitMessage(REC_V_W:RECBlock)) => recunitSegment(recunitMessage(REC_V_W:RECBlock))
rule recsplitSegment(recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage)) => reccutSegment(REC_V_M:RECMessage, recunitMessage(REC_V_W:RECBlock), recn254())
rule reccutSegment(recunitMessage(REC_V_W:RECBlock), REC_V_M_prime_:RECMessage, REC_V_N:RECNat) => recunitSegment(recreverseMessage(recconsMessage(REC_V_W:RECBlock, REC_V_M_prime_:RECMessage)))
rule reccutSegment(recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage), REC_V_M_prime_:RECMessage, reczero()) => recconsSegment(recreverseMessage(recconsMessage(REC_V_W:RECBlock, REC_V_M_prime_:RECMessage)), recsplitSegment(REC_V_M:RECMessage))
rule reccutSegment(recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage), REC_V_M_prime_:RECMessage, recsucc(REC_V_N:RECNat)) => reccutSegment(REC_V_M:RECMessage, recconsMessage(REC_V_W:RECBlock, REC_V_M_prime_:RECMessage), REC_V_N:RECNat)
rule recpreludeXY(REC_V_W1:RECBlock, REC_V_W2:RECBlock) => recpreludeXYprime(recBYT(REC_V_W1:RECBlock, REC_V_W2:RECBlock), recPAT(REC_V_W1:RECBlock, REC_V_W2:RECBlock))
rule recpreludeVW(REC_V_W1:RECBlock, REC_V_W2:RECBlock) => recpreludeVWprime(recBYT(REC_V_W1:RECBlock, REC_V_W2:RECBlock))
rule recpreludeST(REC_V_W1:RECBlock, REC_V_W2:RECBlock) => recpreludeSTprime(recBYT(REC_V_W1:RECBlock, REC_V_W2:RECBlock))
rule recpreludeXYprime(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock), REC_V_O:RECOctet) => recBYT(recH4(REC_V_W:RECBlock), recH5(REC_V_W_prime_:RECBlock, REC_V_O:RECOctet))
rule recpreludeVWprime(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recBYT(recH6(REC_V_W:RECBlock), recH7(REC_V_W_prime_:RECBlock))
rule recpreludeSTprime(recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recBYT(recH8(REC_V_W:RECBlock), recH9(REC_V_W_prime_:RECBlock))
rule reccomputeXY(REC_V_P:RECPair, REC_V_P_prime_:RECPair, REC_V_W:RECBlock) => reccomputeXYprime(REC_V_P:RECPair, REC_V_W:RECBlock, recXORprime(reccomputeVW(REC_V_P_prime_:RECPair)))
rule reccomputeXYprime(recbuildPair(REC_V_W1:RECBlock, REC_V_W2:RECBlock), REC_V_W:RECBlock, REC_V_W_prime_:RECBlock) => recbuildPair(recMUL1(recXOR(REC_V_W1:RECBlock, REC_V_W:RECBlock), recFIX1(recADD(recXOR(REC_V_W2:RECBlock, REC_V_W:RECBlock), REC_V_W_prime_:RECBlock))), recMUL2A(recXOR(REC_V_W2:RECBlock, REC_V_W:RECBlock), recFIX2(recADD(recXOR(REC_V_W1:RECBlock, REC_V_W:RECBlock), REC_V_W_prime_:RECBlock))))
rule reccomputeVW(recbuildPair(REC_V_W1:RECBlock, REC_V_W2:RECBlock)) => recbuildPair(recCYC(REC_V_W1:RECBlock), REC_V_W2:RECBlock)
rule recloop1(REC_V_P:RECPair, REC_V_P_prime_:RECPair, recunitMessage(REC_V_W:RECBlock)) => reccomputeXY(REC_V_P:RECPair, REC_V_P_prime_:RECPair, REC_V_W:RECBlock)
rule recloop1(REC_V_P:RECPair, REC_V_P_prime_:RECPair, recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage)) => recloop1(reccomputeXY(REC_V_P:RECPair, REC_V_P_prime_:RECPair, REC_V_W:RECBlock), reccomputeVW(REC_V_P_prime_:RECPair), REC_V_M:RECMessage)
rule recloop2(REC_V_P:RECPair, REC_V_P_prime_:RECPair, recunitMessage(REC_V_W:RECBlock)) => reccomputeVW(REC_V_P_prime_:RECPair)
rule recloop2(REC_V_P:RECPair, REC_V_P_prime_:RECPair, recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage)) => recloop2(reccomputeXY(REC_V_P:RECPair, REC_V_P_prime_:RECPair, REC_V_W:RECBlock), reccomputeVW(REC_V_P_prime_:RECPair), REC_V_M:RECMessage)
rule reccoda(REC_V_P:RECPair, REC_V_P_prime_:RECPair, recbuildPair(REC_V_W:RECBlock, REC_V_W_prime_:RECBlock)) => recXORprime(reccomputeXY(reccomputeXY(REC_V_P:RECPair, REC_V_P_prime_:RECPair, REC_V_W:RECBlock), reccomputeVW(REC_V_P_prime_:RECPair), REC_V_W_prime_:RECBlock))
rule recMAA(recbuildKey(REC_V_W1:RECBlock, REC_V_W2:RECBlock), REC_V_M:RECMessage) => recMAAprime(recpreludeXY(REC_V_W1:RECBlock, REC_V_W2:RECBlock), recpreludeVW(REC_V_W1:RECBlock, REC_V_W2:RECBlock), recpreludeST(REC_V_W1:RECBlock, REC_V_W2:RECBlock), REC_V_M:RECMessage)
rule recMAAprime(REC_V_P1:RECPair, REC_V_P2:RECPair, REC_V_P3:RECPair, REC_V_M:RECMessage) => reccoda(recloop1(REC_V_P1:RECPair, REC_V_P2:RECPair, REC_V_M:RECMessage), recloop2(REC_V_P1:RECPair, REC_V_P2:RECPair, REC_V_M:RECMessage), REC_V_P3:RECPair)
rule recMAC(REC_V_K:RECKey, REC_V_M:RECMessage) => recMACfirst(REC_V_K:RECKey, recsplitSegment(REC_V_M:RECMessage))
rule recMACfirst(REC_V_K:RECKey, recunitSegment(REC_V_M:RECMessage)) => recMAA(REC_V_K:RECKey, REC_V_M:RECMessage)
rule recMACfirst(REC_V_K:RECKey, recconsSegment(REC_V_M:RECMessage, REC_V_S:RECSegmentedMessage)) => recMACnext(REC_V_K:RECKey, recMAA(REC_V_K:RECKey, REC_V_M:RECMessage), REC_V_S:RECSegmentedMessage)
rule recMACnext(REC_V_K:RECKey, REC_V_W:RECBlock, recunitSegment(REC_V_M:RECMessage)) => recMAA(REC_V_K:RECKey, recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage))
rule recMACnext(REC_V_K:RECKey, REC_V_W:RECBlock, recconsSegment(REC_V_M:RECMessage, REC_V_S:RECSegmentedMessage)) => recMACnext(REC_V_K:RECKey, recMAA(REC_V_K:RECKey, recconsMessage(REC_V_W:RECBlock, REC_V_M:RECMessage)), REC_V_S:RECSegmentedMessage)

// eval: receqBlock(recMUL1(recx0000000F(), recx0000000E()), recx000000D2())
// eval: receqBlock(recMUL1(recxFFFFFFF0(), recx0000000E()), recxFFFFFF2D())
// eval: receqBlock(recMUL1(recxFFFFFFF0(), recxFFFFFFF1()), recx000000D2())
// eval: receqBlock(recMUL2(recx0000000F(), recx0000000E()), recx000000D2())
// eval: receqBlock(recMUL2(recxFFFFFFF0(), recx0000000E()), recxFFFFFF3A())
// eval: receqBlock(recMUL2(recxFFFFFFF0(), recxFFFFFFF1()), recx000000B6())
// eval: receqBlock(recMUL2A(recx0000000F(), recx0000000E()), recx000000D2())
// eval: receqBlock(recMUL2A(recxFFFFFFF0(), recx0000000E()), recxFFFFFF3A())
// eval: receqBlock(recMUL2A(recx7FFFFFF0(), recxFFFFFFF1()), recx800000C2())
// eval: receqBlock(recMUL2A(recxFFFFFFF0(), recx7FFFFFF1()), recx000000C4())
// eval: receqPair(recBYT(recx00000000(), recx00000000()), recbuildPair(recx0103070F(), recx1F3F7FFF()))
// eval: receqPair(recBYT(recxFFFF00FF(), recxFFFFFFFF()), recbuildPair(recxFEFC07F0(), recxE0C08000()))
// eval: receqPair(recBYT(recxAB00FFCD(), recxFFEF0001()), recbuildPair(recxAB01FCCD(), recxF2EF3501()))
// eval: receqOctet(recPAT(recx00000000(), recx00000000()), recxFF())
// eval: receqOctet(recPAT(recxFFFF00FF(), recxFFFFFFFF()), recxFF())
// eval: receqOctet(recPAT(recxAB00FFCD(), recxFFEF0001()), recx6A())
// eval: receqBlock(recJ12(recx00000100()), recx00010000())
// eval: receqBlock(recJ14(recx00000100()), recx00000001())
// eval: receqBlock(recJ16(recx00000100()), recx00010000())
// eval: receqBlock(recJ18(recx00000100()), recx00000001())
// eval: receqBlock(recJ22(recx00000100()), recx00010000())
// eval: receqBlock(recJ24(recx00000100()), recx00000002())
// eval: receqBlock(recJ26(recx00000100()), recx00020000())
// eval: receqBlock(recJ28(recx00000100()), recx00000004())
// eval: receqBlock(recH4(recx00000100()), recx00000003())
// eval: receqBlock(recH6(recx00000100()), recx00030000())
// eval: receqBlock(recH8(recx00000100()), recx00000005())
// eval: receqBlock(recK12(recx00000080()), recx00004000())
// eval: receqBlock(recK14(recx00000080()), recx10000000())
// eval: receqBlock(recK15(recx00000080()), recx00000008())
// eval: receqBlock(recK17(recx00000080()), recx00020000())
// eval: receqBlock(recK19(recx00000080()), recx80000000())
// eval: receqBlock(recK22(recx00000080()), recx00004000())
// eval: receqBlock(recK24(recx00000080()), recx10000000())
// eval: receqBlock(recK25(recx00000080()), recx00000010())
// eval: receqBlock(recK27(recx00000080()), recx00040000())
// eval: receqBlock(recK29(recx00000080()), recx00000002())
// eval: receqBlock(recH0(recx00000080()), recx00000018())
// eval: receqBlock(recQ(recx01()), recx00000004())
// eval: receqBlock(recH5(recx00000080(), recx01()), recx00000060())
// eval: receqBlock(recH7(recx00000080()), recx00060000())
// eval: receqBlock(recH9(recx00000080()), recx80000002())
// eval: receqOctet(recPAT(recx00000003(), recx00000060()), recxEE())
// eval: receqOctet(recPAT(recx00030000(), recx00060000()), recxBB())
// eval: receqOctet(recPAT(recx00000005(), recx80000002()), recxE6())
// eval: receqPair(recBYT(recx00000003(), recx00000060()), recbuildPair(recx01030703(), recx1D3B7760()))
// eval: receqPair(recBYT(recx00030000(), recx00060000()), recbuildPair(recx0103050B(), recx17065DBB()))
// eval: receqPair(recBYT(recx00000005(), recx80000002()), recbuildPair(recx01030705(), recx80397302()))
// eval: receqBlock(recCYC(recx00000003()), recx00000006())
// eval: receqBlock(recXOR(recx00000006(), recx00000003()), recx00000005())
// eval: receqBlock(recXOR(recx00000002(), recx00000005()), recx00000007())
// eval: receqBlock(recXOR(recx00000003(), recx00000005()), recx00000006())
// eval: receqBlock(recADD(recx00000005(), recx00000006()), recx0000000B())
// eval: receqBlock(recADD(recx00000005(), recx00000007()), recx0000000C())
// eval: receqBlock(recOR(recx0000000B(), recx00000004()), recx0000000F())
// eval: receqBlock(recOR(recx0000000C(), recx00000001()), recx0000000D())
// eval: receqBlock(recAND(recx0000000F(), recxFFFFFFF7()), recx00000007())
// eval: receqBlock(recAND(recx0000000D(), recxFFFFFFFB()), recx00000009())
// eval: receqBlock(recMUL1(recx00000007(), recx00000007()), recx00000031())
// eval: receqBlock(recMUL2A(recx00000006(), recx00000009()), recx00000036())
// eval: receqBlock(recXOR(recx00000031(), recx00000036()), recx00000007())
// eval: receqBlock(recCYC(recx00000003()), recx00000006())
// eval: receqBlock(recXOR(recx00000006(), recx00000003()), recx00000005())
// eval: receqBlock(recXOR(recxFFFFFFFD(), recx00000001()), recxFFFFFFFC())
// eval: receqBlock(recXOR(recxFFFFFFFC(), recx00000001()), recxFFFFFFFD())
// eval: receqBlock(recADD(recx00000005(), recxFFFFFFFD()), recx00000002())
// eval: receqBlock(recADD(recx00000005(), recxFFFFFFFC()), recx00000001())
// eval: receqBlock(recOR(recx00000002(), recx00000001()), recx00000003())
// eval: receqBlock(recOR(recx00000001(), recx00000004()), recx00000005())
// eval: receqBlock(recAND(recx00000003(), recxFFFFFFF9()), recx00000001())
// eval: receqBlock(recAND(recx00000005(), recxFFFFFFFC()), recx00000004())
// eval: receqBlock(recMUL1(recxFFFFFFFC(), recx00000001()), recxFFFFFFFC())
// eval: receqBlock(recMUL2A(recxFFFFFFFD(), recx00000004()), recxFFFFFFFA())
// eval: receqBlock(recXOR(recxFFFFFFFC(), recxFFFFFFFA()), recx00000006())
// eval: receqBlock(recCYC(recx00000007()), recx0000000E())
// eval: receqBlock(recXOR(recx0000000E(), recx00000007()), recx00000009())
// eval: receqBlock(recXOR(recxFFFFFFFD(), recx00000008()), recxFFFFFFF5())
// eval: receqBlock(recXOR(recxFFFFFFFC(), recx00000008()), recxFFFFFFF4())
// eval: receqBlock(recADD(recx00000009(), recxFFFFFFF4()), recxFFFFFFFD())
// eval: receqBlock(recADD(recx00000009(), recxFFFFFFF5()), recxFFFFFFFE())
// eval: receqBlock(recOR(recxFFFFFFFD(), recx00000001()), recxFFFFFFFD())
// eval: receqBlock(recOR(recxFFFFFFFE(), recx00000002()), recxFFFFFFFE())
// eval: receqBlock(recAND(recxFFFFFFFD(), recxFFFFFFFE()), recxFFFFFFFC())
// eval: receqBlock(recAND(recxFFFFFFFE(), recx7FFFFFFD()), recx7FFFFFFC())
// eval: receqBlock(recMUL1(recxFFFFFFF5(), recxFFFFFFFC()), recx0000001E())
// eval: receqBlock(recMUL2A(recxFFFFFFF4(), recx7FFFFFFC()), recx0000001E())
// eval: receqBlock(recXOR(recx0000001E(), recx0000001E()), recx00000000())
// eval: receqBlock(recCYC(recx00000001()), recx00000002())
// eval: receqBlock(recXOR(recx00000002(), recx00000001()), recx00000003())
// eval: receqBlock(recXOR(recx00000001(), recx00000000()), recx00000001())
// eval: receqBlock(recXOR(recx00000002(), recx00000000()), recx00000002())
// eval: receqBlock(recADD(recx00000003(), recx00000002()), recx00000005())
// eval: receqBlock(recADD(recx00000003(), recx00000001()), recx00000004())
// eval: receqBlock(recOR(recx00000005(), recx00000002()), recx00000007())
// eval: receqBlock(recOR(recx00000004(), recx00000001()), recx00000005())
// eval: receqBlock(recAND(recx00000007(), recxFFFFFFFB()), recx00000003())
// eval: receqBlock(recAND(recx00000005(), recxFFFFFFFB()), recx00000001())
// eval: receqBlock(recMUL1(recx00000001(), recx00000003()), recx00000003())
// eval: receqBlock(recMUL2A(recx00000002(), recx00000001()), recx00000002())
// eval: receqBlock(recXOR(recx00000003(), recx00000002()), recx00000001())
// eval: receqBlock(recCYC(recx00000002()), recx00000004())
// eval: receqBlock(recXOR(recx00000004(), recx00000001()), recx00000005())
// eval: receqBlock(recXOR(recx00000003(), recx00000001()), recx00000002())
// eval: receqBlock(recXOR(recx00000002(), recx00000001()), recx00000003())
// eval: receqBlock(recADD(recx00000005(), recx00000003()), recx00000008())
// eval: receqBlock(recADD(recx00000005(), recx00000002()), recx00000007())
// eval: receqBlock(recOR(recx00000008(), recx00000002()), recx0000000A())
// eval: receqBlock(recOR(recx00000007(), recx00000001()), recx00000007())
// eval: receqBlock(recAND(recx0000000A(), recxFFFFFFFB()), recx0000000A())
// eval: receqBlock(recAND(recx00000007(), recxFFFFFFFB()), recx00000003())
// eval: receqBlock(recMUL1(recx00000002(), recx0000000A()), recx00000014())
// eval: receqBlock(recMUL2A(recx00000003(), recx00000003()), recx00000009())
// eval: receqBlock(recXOR(recx00000014(), recx00000009()), recx0000001D())
// eval: receqBlock(recCYC(recx00000004()), recx00000008())
// eval: receqBlock(recXOR(recx00000008(), recx00000001()), recx00000009())
// eval: receqBlock(recXOR(recx00000014(), recx00000002()), recx00000016())
// eval: receqBlock(recXOR(recx00000009(), recx00000002()), recx0000000B())
// eval: receqBlock(recADD(recx00000009(), recx0000000B()), recx00000014())
// eval: receqBlock(recADD(recx00000009(), recx00000016()), recx0000001F())
// eval: receqBlock(recOR(recx00000014(), recx00000002()), recx00000016())
// eval: receqBlock(recOR(recx0000001F(), recx00000001()), recx0000001F())
// eval: receqBlock(recAND(recx00000016(), recxFFFFFFFB()), recx00000012())
// eval: receqBlock(recAND(recx0000001F(), recxFFFFFFFB()), recx0000001B())
// eval: receqBlock(recMUL1(recx00000016(), recx00000012()), recx0000018C())
// eval: receqBlock(recMUL2A(recx0000000B(), recx0000001B()), recx00000129())
// eval: receqBlock(recXOR(recx0000018C(), recx00000129()), recx000000A5())
// eval: receqBlock(recCYC(recxC4EB1AEB()), recx89D635D7())
// eval: receqBlock(recXOR(recx89D635D7(), recxF6A09667()), recx7F76A3B0())
// eval: receqBlock(recXOR(recx21D869BA(), recx0A202020()), recx2BF8499A())
// eval: receqBlock(recXOR(recx7792F9D4(), recx0A202020()), recx7DB2D9F4())
// eval: receqBlock(recADD(recx7F76A3B0(), recx7DB2D9F4()), recxFD297DA4())
// eval: receqBlock(recADD(recx7F76A3B0(), recx2BF8499A()), recxAB6EED4A())
// eval: receqBlock(recOR(recxFD297DA4(), recx02040801()), recxFF2D7DA5())
// eval: receqBlock(recOR(recxAB6EED4A(), recx00804021()), recxABEEED6B())
// eval: receqBlock(recAND(recxFF2D7DA5(), recxBFEF7FDF()), recxBF2D7D85())
// eval: receqBlock(recAND(recxABEEED6B(), recx7DFEFBFF()), recx29EEE96B())
// eval: receqBlock(recMUL1(recx2BF8499A(), recxBF2D7D85()), recx0AD67E20())
// eval: receqBlock(recMUL2A(recx7DB2D9F4(), recx29EEE96B()), recx30261492())
// eval: receqOctet(recPAT(recx00FF00FF(), recx00000000()), recxFF())
// eval: receqPair(recpreludeXY(recx00FF00FF(), recx00000000()), recbuildPair(recx4A645A01(), recx50DEC930()))
// eval: receqPair(recpreludeVW(recx00FF00FF(), recx00000000()), recbuildPair(recx5CCA3239(), recxFECCAA6E()))
// eval: receqPair(recpreludeST(recx00FF00FF(), recx00000000()), recbuildPair(recx51EDE9C7(), recx24B66FB5()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4A645A01(), recx50DEC930()), recx55555555(), recXOR(recnCYC(recn1(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx48B204D6(), recx5834A585()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx48B204D6(), recx5834A585()), recxAAAAAAAA(), recXOR(recnCYC(recn2(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx4F998E01(), recxBE9F0917()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4F998E01(), recxBE9F0917()), recx51EDE9C7(), recXOR(recnCYC(recn3(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx344925FC(), recxDB9102B0()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx344925FC(), recxDB9102B0()), recx24B66FB5(), recXOR(recnCYC(recn4(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx277B4B25(), recxD636250D()))
// eval: receqBlock(recXOR(recx277B4B25(), recxD636250D()), recxF14D6E28())
// eval: receqOctet(recPAT(recx00FF00FF(), recx00000000()), recxFF())
// eval: receqPair(recpreludeXY(recx00FF00FF(), recx00000000()), recbuildPair(recx4A645A01(), recx50DEC930()))
// eval: receqPair(recpreludeVW(recx00FF00FF(), recx00000000()), recbuildPair(recx5CCA3239(), recxFECCAA6E()))
// eval: receqPair(recpreludeST(recx00FF00FF(), recx00000000()), recbuildPair(recx51EDE9C7(), recx24B66FB5()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4A645A01(), recx50DEC930()), recxAAAAAAAA(), recXOR(recnCYC(recn1(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx6AEBACF8(), recx9DB15CF6()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx6AEBACF8(), recx9DB15CF6()), recx55555555(), recXOR(recnCYC(recn2(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx270EEDAF(), recxB8142629()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx270EEDAF(), recxB8142629()), recx51EDE9C7(), recXOR(recnCYC(recn3(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx29907CD8(), recxBA92DB12()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx29907CD8(), recxBA92DB12()), recx24B66FB5(), recXOR(recnCYC(recn4(), recx5CCA3239()), recxFECCAA6E())), recbuildPair(recx28EAD8B3(), recx81D10CA3()))
// eval: receqBlock(recXOR(recx28EAD8B3(), recx81D10CA3()), recxA93BD410())
// eval: receqOctet(recPAT(recx55555555(), recx5A35D667()), recx00())
// eval: receqPair(recpreludeXY(recx55555555(), recx5A35D667()), recbuildPair(recx34ACF886(), recx7397C9AE()))
// eval: receqPair(recpreludeVW(recx55555555(), recx5A35D667()), recbuildPair(recx7201F4DC(), recx2829040B()))
// eval: receqPair(recpreludeST(recx55555555(), recx5A35D667()), recbuildPair(recx9E2E7B36(), recx13647149()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx34ACF886(), recx7397C9AE()), recx00000000(), recXOR(recnCYC(recn1(), recx7201F4DC()), recx2829040B())), recbuildPair(recx2FD76FFB(), recx550D91CE()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx2FD76FFB(), recx550D91CE()), recxFFFFFFFF(), recXOR(recnCYC(recn2(), recx7201F4DC()), recx2829040B())), recbuildPair(recxA70FC148(), recx1D10D8D3()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxA70FC148(), recx1D10D8D3()), recx9E2E7B36(), recXOR(recnCYC(recn3(), recx7201F4DC()), recx2829040B())), recbuildPair(recxB1CC1CC5(), recx29C1485F()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxB1CC1CC5(), recx29C1485F()), recx13647149(), recXOR(recnCYC(recn4(), recx7201F4DC()), recx2829040B())), recbuildPair(recx288FC786(), recx9115A558()))
// eval: receqBlock(recXOR(recx288FC786(), recx9115A558()), recxB99A62DE())
// eval: receqOctet(recPAT(recx55555555(), recx5A35D667()), recx00())
// eval: receqPair(recpreludeXY(recx55555555(), recx5A35D667()), recbuildPair(recx34ACF886(), recx7397C9AE()))
// eval: receqPair(recpreludeVW(recx55555555(), recx5A35D667()), recbuildPair(recx7201F4DC(), recx2829040B()))
// eval: receqPair(recpreludeST(recx55555555(), recx5A35D667()), recbuildPair(recx9E2E7B36(), recx13647149()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx34ACF886(), recx7397C9AE()), recxFFFFFFFF(), recXOR(recnCYC(recn1(), recx7201F4DC()), recx2829040B())), recbuildPair(recx8DC8BBDE(), recxFE4E5BDD()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx8DC8BBDE(), recxFE4E5BDD()), recx00000000(), recXOR(recnCYC(recn2(), recx7201F4DC()), recx2829040B())), recbuildPair(recxCBC865BA(), recx0297AF6F()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxCBC865BA(), recx0297AF6F()), recx9E2E7B36(), recXOR(recnCYC(recn3(), recx7201F4DC()), recx2829040B())), recbuildPair(recx3CF3A7D2(), recx160EE9B5()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx3CF3A7D2(), recx160EE9B5()), recx13647149(), recXOR(recnCYC(recn4(), recx7201F4DC()), recx2829040B())), recbuildPair(recxD0482465(), recx7050EC5E()))
// eval: receqBlock(recXOR(recxD0482465(), recx7050EC5E()), recxA018C83B())
// eval: receqPair(recpreludeXY(recxE6A12F07(), recx9D15C437()), recbuildPair(recx21D869BA(), recx7792F9D4()))
// eval: receqPair(recpreludeVW(recxE6A12F07(), recx9D15C437()), recbuildPair(recxC4EB1AEB(), recxF6A09667()))
// eval: receqPair(recpreludeST(recxE6A12F07(), recx9D15C437()), recbuildPair(recx6D67E884(), recxA511987A()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx204E80A7(), recx077788A2()), recx00000000(), recXOR(recnCYC(recn1(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx303FF4AA(), recx1277A6D4()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx303FF4AA(), recx1277A6D4()), recx00000000(), recXOR(recnCYC(recn2(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx55DD063F(), recx4C49AAE0()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx55DD063F(), recx4C49AAE0()), recx00000000(), recXOR(recnCYC(recn3(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx51AF3C1D(), recx5BC02502()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx51AF3C1D(), recx5BC02502()), recx00000000(), recXOR(recnCYC(recn4(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxA44AAAC0(), recx63C70DBA()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxA44AAAC0(), recx63C70DBA()), recx00000000(), recXOR(recnCYC(recn5(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx4D53901A(), recx2E80AC30()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4D53901A(), recx2E80AC30()), recx00000000(), recXOR(recnCYC(recn6(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx5F38EEF1(), recx2A6091AE()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx5F38EEF1(), recx2A6091AE()), recx00000000(), recXOR(recnCYC(recn7(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxF0239DD5(), recx3DD81AC6()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxF0239DD5(), recx3DD81AC6()), recx00000000(), recXOR(recnCYC(recn8(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxEB35B97F(), recx9372CDC6()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxEB35B97F(), recx9372CDC6()), recx00000000(), recXOR(recnCYC(recn9(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx4DA124A1(), recxC6B1317E()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4DA124A1(), recxC6B1317E()), recx00000000(), recXOR(recnCYC(recn10(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx7F839576(), recx74B39176()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx7F839576(), recx74B39176()), recx00000000(), recXOR(recnCYC(recn11(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx11A9D254(), recxD78634BC()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx11A9D254(), recxD78634BC()), recx00000000(), recXOR(recnCYC(recn12(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxD8804CA5(), recxFDC1A8BA()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxD8804CA5(), recxFDC1A8BA()), recx00000000(), recXOR(recnCYC(recn13(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx3F6F7248(), recx11AC46B8()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx3F6F7248(), recx11AC46B8()), recx00000000(), recXOR(recnCYC(recn14(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxACBC13DD(), recx33D5A466()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxACBC13DD(), recx33D5A466()), recx00000000(), recXOR(recnCYC(recn15(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx4CE933E1(), recxC21A1846()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx4CE933E1(), recxC21A1846()), recx00000000(), recXOR(recnCYC(recn16(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxC1ED90DD(), recxCD959B46()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxC1ED90DD(), recxCD959B46()), recx00000000(), recXOR(recnCYC(recn17(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx3CD54DEB(), recx613F8E2A()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx3CD54DEB(), recx613F8E2A()), recx00000000(), recXOR(recnCYC(recn18(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxBBA57835(), recx07C72EAA()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxBBA57835(), recx07C72EAA()), recx00000000(), recXOR(recnCYC(recn19(), recx17A808FD()), recxFEA1D334())), recbuildPair(recxD7843FDC(), recx6AD6E8A4()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recxD7843FDC(), recx6AD6E8A4()), recx00000000(), recXOR(recnCYC(recn20(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx5EBA06C2(), recx91896CFA()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx5EBA06C2(), recx91896CFA()), recx76232E5F(), recXOR(recnCYC(recn21(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx1D9C9655(), recx98D1CC75()))
// eval: receqPair(reccomputeXYprime(recbuildPair(recx1D9C9655(), recx98D1CC75()), recx4FB1138A(), recXOR(recnCYC(recn22(), recx17A808FD()), recxFEA1D334())), recbuildPair(recx7BC180AB(), recxA0B87B77()))
// eval: receqBlock(recMAC(recbuildKey(recx80018001(), recx80018000()), recmakeMessage(recn20(), recx00000000(), recx00000000())), recxDB79FBDC())
// eval: receqBlock(recMAC(recbuildKey(recx80018001(), recx80018000()), recmakeMessage(recn16(), recx00000000(), recx07050301())), recx8CE37709())
// eval: receqBlock(recMAC(recbuildKey(recx80018001(), recx80018000()), recmakeMessage(recn256(), recx00000000(), recx07050301())), recx717153D5())
// eval: receqBlock(recMAC(recbuildKey(recx80018001(), recx80018000()), recmakeMessage(recn4100(), recx00000000(), recx07050301())), recx7783C51D())

endmodule
