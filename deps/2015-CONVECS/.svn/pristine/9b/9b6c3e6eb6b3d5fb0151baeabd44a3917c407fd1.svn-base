-- CAFEOBJ-A
mod! MAA {
  [ Xbool Xnat Bit Octet OctetSum Half HalfSum Block BlockSum Pair Key Message SegmentedMessage ]
  op Xfalse : -> Xbool { constr }
  op Xtrue : -> Xbool { constr }
  op x0 : -> Bit { constr }
  op x1 : -> Bit { constr }
  op buildOctet : Bit Bit Bit Bit Bit Bit Bit Bit -> Octet { constr }
  op buildOctetSum : Bit Octet -> OctetSum { constr }
  op buildHalf : Octet Octet -> Half { constr }
  op buildHalfSum : Bit Half -> HalfSum { constr }
  op buildBlock : Octet Octet Octet Octet -> Block { constr }
  op buildBlockSum : Bit Block -> BlockSum { constr }
  op buildPair : Block Block -> Pair { constr }
  op zero : -> Xnat { constr }
  op succ : Xnat -> Xnat { constr }
  op buildKey : Block Block -> Key { constr }
  op unitMessage : Block -> Message { constr }
  op consMessage : Block Message -> Message { constr }
  op unitSegment : Message -> SegmentedMessage { constr }
  op consSegment : Message SegmentedMessage -> SegmentedMessage { constr }
  op notBool : Xbool -> Xbool
  op andBool : Xbool Xbool -> Xbool
  op orBool : Xbool Xbool -> Xbool
  op xorBool : Xbool Xbool -> Xbool
  op notBit : Bit -> Bit
  op andBit : Bit Bit -> Bit
  op orBit : Bit Bit -> Bit
  op xorBit : Bit Bit -> Bit
  op x00 : -> Octet
  op x01 : -> Octet
  op x0000 : -> Half
  op HalfU : Block -> Half
  op HalfL : Block -> Half
  op eqBit : Bit Bit -> Xbool
  op eqOctet : Octet Octet -> Xbool
  op eqOctetSum : OctetSum OctetSum -> Xbool
  op eqHalf : Half Half -> Xbool
  op eqHalfSum : HalfSum HalfSum -> Xbool
  op eqBlock : Block Block -> Xbool
  op eqBlockSum : BlockSum BlockSum -> Xbool
  op eqPair : Pair Pair -> Xbool
  op addBit : Bit Bit Bit -> Bit
  op carBit : Bit Bit Bit -> Bit
  op addOctetSum : Octet Octet Bit -> OctetSum
  op addOctet8 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet7 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet6 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet5 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet4 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet3 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet2 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet1 : Bit Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op addOctet0 : Bit Bit Bit Bit Bit Bit Bit Bit Bit -> OctetSum
  op dropCarryOctetSum : OctetSum -> Octet
  op addOctet : Octet Octet -> Octet
  op addHalfSum : Half Half -> HalfSum
  op addHalf2 : Octet Octet Octet Octet -> HalfSum
  op addHalf1 : Octet Octet OctetSum -> HalfSum
  op addHalf0 : OctetSum Octet -> HalfSum
  op dropCarryHalfSum : HalfSum -> Half
  op addHalf : Half Half -> Half
  op addHalfOctet : Octet Half -> Half
  op addHalfOctets : Octet Octet -> Half
  op addBlockSum : Block Block -> BlockSum
  op addBlock4 : Octet Octet Octet Octet Octet Octet Octet Octet -> BlockSum
  op addBlock3 : Octet Octet Octet Octet Octet Octet OctetSum -> BlockSum
  op addBlock2 : Octet Octet Octet Octet OctetSum Octet -> BlockSum
  op addBlock1 : Octet Octet OctetSum Octet Octet -> BlockSum
  op addBlock0 : OctetSum Octet Octet Octet -> BlockSum
  op dropCarryBlockSum : BlockSum -> Block
  op addBlock : Block Block -> Block
  op addBlockHalf : Half Block -> Block
  op addBlockHalves : Half Half -> Block
  op leftOctet1 : Octet -> Octet
  op leftOctet2 : Octet -> Octet
  op leftOctet3 : Octet -> Octet
  op leftOctet4 : Octet -> Octet
  op leftOctet5 : Octet -> Octet
  op leftOctet6 : Octet -> Octet
  op leftOctet7 : Octet -> Octet
  op rightOctet1 : Octet -> Octet
  op rightOctet2 : Octet -> Octet
  op rightOctet3 : Octet -> Octet
  op rightOctet4 : Octet -> Octet
  op rightOctet5 : Octet -> Octet
  op rightOctet6 : Octet -> Octet
  op rightOctet7 : Octet -> Octet
  op mulOctet : Octet Octet -> Half
  op mulOctet1 : Bit Bit Bit Bit Bit Bit Bit Bit Octet Half -> Half
  op mulOctet2 : Bit Bit Bit Bit Bit Bit Bit Octet Half -> Half
  op mulOctet3 : Bit Bit Bit Bit Bit Bit Octet Half -> Half
  op mulOctet4 : Bit Bit Bit Bit Bit Octet Half -> Half
  op mulOctet5 : Bit Bit Bit Bit Octet Half -> Half
  op mulOctet6 : Bit Bit Bit Octet Half -> Half
  op mulOctet7 : Bit Bit Octet Half -> Half
  op mulOctet8 : Bit Octet Half -> Half
  op mulOctetA : Half Octet Octet -> Half
  op mulOctetB : Octet OctetSum -> Half
  op mulHalf : Half Half -> Block
  op mulHalfA : Half Half Half Half -> Block
  op mulHalf4 : Octet Octet Octet Octet Octet Octet Octet Octet -> Block
  op mulHalf3 : Octet Octet Octet Octet Half Octet -> Block
  op mulHalf2 : Octet Half Octet Octet -> Block
  op mulHalf1 : Half Octet Octet Octet -> Block
  op mulBlock : Block Block -> Pair
  op mulBlockA : Block Block Block Block -> Pair
  op mulBlock4 : Half Half Half Half Half Half Half Half -> Pair
  op mulBlock3 : Half Half Half Half Block Half -> Pair
  op mulBlock2 : Half Block Half Half -> Pair
  op mulBlock1 : Block Half Half Half -> Pair
  op mulBlockB : Half Half Half Half -> Pair
  op addNat : Xnat Xnat -> Xnat
  op multNat : Xnat Xnat -> Xnat
  op eqNat : Xnat Xnat -> Xbool
  op ltNat : Xnat Xnat -> Xbool
  op n1 : -> Xnat
  op n2 : -> Xnat
  op n3 : -> Xnat
  op n4 : -> Xnat
  op n5 : -> Xnat
  op n6 : -> Xnat
  op n7 : -> Xnat
  op n8 : -> Xnat
  op n9 : -> Xnat
  op n10 : -> Xnat
  op n11 : -> Xnat
  op n12 : -> Xnat
  op n13 : -> Xnat
  op n14 : -> Xnat
  op n15 : -> Xnat
  op n16 : -> Xnat
  op n17 : -> Xnat
  op n18 : -> Xnat
  op n19 : -> Xnat
  op n20 : -> Xnat
  op n21 : -> Xnat
  op n22 : -> Xnat
  op n254 : -> Xnat
  op n256 : -> Xnat
  op n4100 : -> Xnat
  op andOctet : Octet Octet -> Octet
  op orOctet : Octet Octet -> Octet
  op xorOctet : Octet Octet -> Octet
  op x02 : -> Octet
  op x03 : -> Octet
  op x04 : -> Octet
  op x05 : -> Octet
  op x06 : -> Octet
  op x07 : -> Octet
  op x08 : -> Octet
  op x09 : -> Octet
  op x0A : -> Octet
  op x0B : -> Octet
  op x0C : -> Octet
  op x0D : -> Octet
  op x0E : -> Octet
  op x0F : -> Octet
  op x10 : -> Octet
  op x11 : -> Octet
  op x12 : -> Octet
  op x13 : -> Octet
  op x14 : -> Octet
  op x15 : -> Octet
  op x16 : -> Octet
  op x17 : -> Octet
  op x18 : -> Octet
  op x1A : -> Octet
  op x1B : -> Octet
  op x1C : -> Octet
  op x1D : -> Octet
  op x1E : -> Octet
  op x1F : -> Octet
  op x20 : -> Octet
  op x21 : -> Octet
  op x23 : -> Octet
  op x24 : -> Octet
  op x25 : -> Octet
  op x26 : -> Octet
  op x27 : -> Octet
  op x28 : -> Octet
  op x29 : -> Octet
  op x2A : -> Octet
  op x2B : -> Octet
  op x2D : -> Octet
  op x2E : -> Octet
  op x2F : -> Octet
  op x30 : -> Octet
  op x31 : -> Octet
  op x32 : -> Octet
  op x33 : -> Octet
  op x34 : -> Octet
  op x35 : -> Octet
  op x36 : -> Octet
  op x37 : -> Octet
  op x38 : -> Octet
  op x39 : -> Octet
  op x3A : -> Octet
  op x3B : -> Octet
  op x3C : -> Octet
  op x3D : -> Octet
  op x3F : -> Octet
  op x40 : -> Octet
  op x46 : -> Octet
  op x48 : -> Octet
  op x49 : -> Octet
  op x4A : -> Octet
  op x4B : -> Octet
  op x4C : -> Octet
  op x4D : -> Octet
  op x4E : -> Octet
  op x4F : -> Octet
  op x50 : -> Octet
  op x51 : -> Octet
  op x53 : -> Octet
  op x54 : -> Octet
  op x55 : -> Octet
  op x58 : -> Octet
  op x5A : -> Octet
  op x5B : -> Octet
  op x5C : -> Octet
  op x5D : -> Octet
  op x5E : -> Octet
  op x5F : -> Octet
  op x60 : -> Octet
  op x61 : -> Octet
  op x62 : -> Octet
  op x63 : -> Octet
  op x64 : -> Octet
  op x65 : -> Octet
  op x66 : -> Octet
  op x67 : -> Octet
  op x69 : -> Octet
  op x6A : -> Octet
  op x6B : -> Octet
  op x6C : -> Octet
  op x6D : -> Octet
  op x6E : -> Octet
  op x6F : -> Octet
  op x70 : -> Octet
  op x71 : -> Octet
  op x72 : -> Octet
  op x73 : -> Octet
  op x74 : -> Octet
  op x75 : -> Octet
  op x76 : -> Octet
  op x77 : -> Octet
  op x78 : -> Octet
  op x79 : -> Octet
  op x7A : -> Octet
  op x7B : -> Octet
  op x7C : -> Octet
  op x7D : -> Octet
  op x7E : -> Octet
  op x7F : -> Octet
  op x80 : -> Octet
  op x81 : -> Octet
  op x83 : -> Octet
  op x84 : -> Octet
  op x85 : -> Octet
  op x86 : -> Octet
  op x88 : -> Octet
  op x89 : -> Octet
  op x8A : -> Octet
  op x8C : -> Octet
  op x8D : -> Octet
  op x8E : -> Octet
  op x8F : -> Octet
  op x90 : -> Octet
  op x91 : -> Octet
  op x92 : -> Octet
  op x93 : -> Octet
  op x95 : -> Octet
  op x96 : -> Octet
  op x97 : -> Octet
  op x98 : -> Octet
  op x99 : -> Octet
  op x9A : -> Octet
  op x9B : -> Octet
  op x9C : -> Octet
  op x9D : -> Octet
  op x9E : -> Octet
  op x9F : -> Octet
  op xA0 : -> Octet
  op xA1 : -> Octet
  op xA2 : -> Octet
  op xA3 : -> Octet
  op xA4 : -> Octet
  op xA5 : -> Octet
  op xA6 : -> Octet
  op xA7 : -> Octet
  op xA8 : -> Octet
  op xA9 : -> Octet
  op xAA : -> Octet
  op xAB : -> Octet
  op xAC : -> Octet
  op xAE : -> Octet
  op xAF : -> Octet
  op xB0 : -> Octet
  op xB1 : -> Octet
  op xB2 : -> Octet
  op xB3 : -> Octet
  op xB5 : -> Octet
  op xB6 : -> Octet
  op xB8 : -> Octet
  op xB9 : -> Octet
  op xBA : -> Octet
  op xBB : -> Octet
  op xBC : -> Octet
  op xBE : -> Octet
  op xBF : -> Octet
  op xC0 : -> Octet
  op xC1 : -> Octet
  op xC2 : -> Octet
  op xC4 : -> Octet
  op xC5 : -> Octet
  op xC6 : -> Octet
  op xC7 : -> Octet
  op xC8 : -> Octet
  op xC9 : -> Octet
  op xCA : -> Octet
  op xCB : -> Octet
  op xCC : -> Octet
  op xCD : -> Octet
  op xCE : -> Octet
  op xD0 : -> Octet
  op xD1 : -> Octet
  op xD2 : -> Octet
  op xD3 : -> Octet
  op xD4 : -> Octet
  op xD5 : -> Octet
  op xD6 : -> Octet
  op xD7 : -> Octet
  op xD8 : -> Octet
  op xD9 : -> Octet
  op xDB : -> Octet
  op xDC : -> Octet
  op xDD : -> Octet
  op xDE : -> Octet
  op xDF : -> Octet
  op xE0 : -> Octet
  op xE1 : -> Octet
  op xE3 : -> Octet
  op xE6 : -> Octet
  op xE8 : -> Octet
  op xE9 : -> Octet
  op xEA : -> Octet
  op xEB : -> Octet
  op xEC : -> Octet
  op xED : -> Octet
  op xEE : -> Octet
  op xEF : -> Octet
  op xF0 : -> Octet
  op xF1 : -> Octet
  op xF2 : -> Octet
  op xF3 : -> Octet
  op xF4 : -> Octet
  op xF5 : -> Octet
  op xF6 : -> Octet
  op xF7 : -> Octet
  op xF8 : -> Octet
  op xF9 : -> Octet
  op xFA : -> Octet
  op xFB : -> Octet
  op xFC : -> Octet
  op xFD : -> Octet
  op xFE : -> Octet
  op xFF : -> Octet
  op andBlock : Block Block -> Block
  op orBlock : Block Block -> Block
  op xorBlock : Block Block -> Block
  op x0001 : -> Half
  op x00000000 : -> Block
  op x00000001 : -> Block
  op x00000002 : -> Block
  op x00000003 : -> Block
  op x00000004 : -> Block
  op x00000005 : -> Block
  op x00000006 : -> Block
  op x00000007 : -> Block
  op x00000008 : -> Block
  op x00000009 : -> Block
  op x0000000A : -> Block
  op x0000000B : -> Block
  op x0000000C : -> Block
  op x0000000D : -> Block
  op x0000000E : -> Block
  op x0000000F : -> Block
  op x00000010 : -> Block
  op x00000012 : -> Block
  op x00000014 : -> Block
  op x00000016 : -> Block
  op x00000018 : -> Block
  op x0000001B : -> Block
  op x0000001D : -> Block
  op x0000001E : -> Block
  op x0000001F : -> Block
  op x00000031 : -> Block
  op x00000036 : -> Block
  op x00000060 : -> Block
  op x00000080 : -> Block
  op x000000A5 : -> Block
  op x000000B6 : -> Block
  op x000000C4 : -> Block
  op x000000D2 : -> Block
  op x00000100 : -> Block
  op x00000129 : -> Block
  op x0000018C : -> Block
  op x00004000 : -> Block
  op x00010000 : -> Block
  op x00020000 : -> Block
  op x00030000 : -> Block
  op x00040000 : -> Block
  op x00060000 : -> Block
  op x00804021 : -> Block
  op x00FF00FF : -> Block
  op x0103050B : -> Block
  op x01030703 : -> Block
  op x01030705 : -> Block
  op x0103070F : -> Block
  op x02040801 : -> Block
  op x0297AF6F : -> Block
  op x07050301 : -> Block
  op x077788A2 : -> Block
  op x07C72EAA : -> Block
  op x0A202020 : -> Block
  op x0AD67E20 : -> Block
  op x10000000 : -> Block
  op x11A9D254 : -> Block
  op x11AC46B8 : -> Block
  op x1277A6D4 : -> Block
  op x13647149 : -> Block
  op x160EE9B5 : -> Block
  op x17065DBB : -> Block
  op x17A808FD : -> Block
  op x1D10D8D3 : -> Block
  op x1D3B7760 : -> Block
  op x1D9C9655 : -> Block
  op x1F3F7FFF : -> Block
  op x204E80A7 : -> Block
  op x21D869BA : -> Block
  op x24B66FB5 : -> Block
  op x270EEDAF : -> Block
  op x277B4B25 : -> Block
  op x2829040B : -> Block
  op x288FC786 : -> Block
  op x28EAD8B3 : -> Block
  op x29907CD8 : -> Block
  op x29C1485F : -> Block
  op x29EEE96B : -> Block
  op x2A6091AE : -> Block
  op x2BF8499A : -> Block
  op x2E80AC30 : -> Block
  op x2FD76FFB : -> Block
  op x30261492 : -> Block
  op x303FF4AA : -> Block
  op x33D5A466 : -> Block
  op x344925FC : -> Block
  op x34ACF886 : -> Block
  op x3CD54DEB : -> Block
  op x3CF3A7D2 : -> Block
  op x3DD81AC6 : -> Block
  op x3F6F7248 : -> Block
  op x48B204D6 : -> Block
  op x4A645A01 : -> Block
  op x4C49AAE0 : -> Block
  op x4CE933E1 : -> Block
  op x4D53901A : -> Block
  op x4DA124A1 : -> Block
  op x4F998E01 : -> Block
  op x4FB1138A : -> Block
  op x50DEC930 : -> Block
  op x51AF3C1D : -> Block
  op x51EDE9C7 : -> Block
  op x550D91CE : -> Block
  op x55555555 : -> Block
  op x55DD063F : -> Block
  op x5834A585 : -> Block
  op x5A35D667 : -> Block
  op x5BC02502 : -> Block
  op x5CCA3239 : -> Block
  op x5EBA06C2 : -> Block
  op x5F38EEF1 : -> Block
  op x613F8E2A : -> Block
  op x63C70DBA : -> Block
  op x6AD6E8A4 : -> Block
  op x6AEBACF8 : -> Block
  op x6D67E884 : -> Block
  op x7050EC5E : -> Block
  op x717153D5 : -> Block
  op x7201F4DC : -> Block
  op x7397C9AE : -> Block
  op x74B39176 : -> Block
  op x76232E5F : -> Block
  op x7783C51D : -> Block
  op x7792F9D4 : -> Block
  op x7BC180AB : -> Block
  op x7DB2D9F4 : -> Block
  op x7DFEFBFF : -> Block
  op x7F76A3B0 : -> Block
  op x7F839576 : -> Block
  op x7FFFFFF0 : -> Block
  op x7FFFFFF1 : -> Block
  op x7FFFFFFC : -> Block
  op x7FFFFFFD : -> Block
  op x80000000 : -> Block
  op x80000002 : -> Block
  op x800000C2 : -> Block
  op x80018000 : -> Block
  op x80018001 : -> Block
  op x80397302 : -> Block
  op x81D10CA3 : -> Block
  op x89D635D7 : -> Block
  op x8CE37709 : -> Block
  op x8DC8BBDE : -> Block
  op x9115A558 : -> Block
  op x91896CFA : -> Block
  op x9372CDC6 : -> Block
  op x98D1CC75 : -> Block
  op x9D15C437 : -> Block
  op x9DB15CF6 : -> Block
  op x9E2E7B36 : -> Block
  op xA018C83B : -> Block
  op xA0B87B77 : -> Block
  op xA44AAAC0 : -> Block
  op xA511987A : -> Block
  op xA70FC148 : -> Block
  op xA93BD410 : -> Block
  op xAAAAAAAA : -> Block
  op xAB00FFCD : -> Block
  op xAB01FCCD : -> Block
  op xAB6EED4A : -> Block
  op xABEEED6B : -> Block
  op xACBC13DD : -> Block
  op xB1CC1CC5 : -> Block
  op xB8142629 : -> Block
  op xB99A62DE : -> Block
  op xBA92DB12 : -> Block
  op xBBA57835 : -> Block
  op xBE9F0917 : -> Block
  op xBF2D7D85 : -> Block
  op xBFEF7FDF : -> Block
  op xC1ED90DD : -> Block
  op xC21A1846 : -> Block
  op xC4EB1AEB : -> Block
  op xC6B1317E : -> Block
  op xCBC865BA : -> Block
  op xCD959B46 : -> Block
  op xD0482465 : -> Block
  op xD636250D : -> Block
  op xD7843FDC : -> Block
  op xD78634BC : -> Block
  op xD8804CA5 : -> Block
  op xDB79FBDC : -> Block
  op xDB9102B0 : -> Block
  op xE0C08000 : -> Block
  op xE6A12F07 : -> Block
  op xEB35B97F : -> Block
  op xF0239DD5 : -> Block
  op xF14D6E28 : -> Block
  op xF2EF3501 : -> Block
  op xF6A09667 : -> Block
  op xFD297DA4 : -> Block
  op xFDC1A8BA : -> Block
  op xFE4E5BDD : -> Block
  op xFEA1D334 : -> Block
  op xFECCAA6E : -> Block
  op xFEFC07F0 : -> Block
  op xFF2D7DA5 : -> Block
  op xFFEF0001 : -> Block
  op xFFFF00FF : -> Block
  op xFFFFFF2D : -> Block
  op xFFFFFF3A : -> Block
  op xFFFFFFF0 : -> Block
  op xFFFFFFF1 : -> Block
  op xFFFFFFF4 : -> Block
  op xFFFFFFF5 : -> Block
  op xFFFFFFF7 : -> Block
  op xFFFFFFF9 : -> Block
  op xFFFFFFFA : -> Block
  op xFFFFFFFB : -> Block
  op xFFFFFFFC : -> Block
  op xFFFFFFFD : -> Block
  op xFFFFFFFE : -> Block
  op xFFFFFFFF : -> Block
  op appendMessage : Message Block -> Message
  op reverseMessage : Message -> Message
  op makeMessage : Xnat Block Block -> Message
  op splitSegment : Message -> SegmentedMessage
  op cutSegment : Message Message Xnat -> SegmentedMessage
  op ADD : Block Block -> Block
  op AND : Block Block -> Block
  op MUL : Block Block -> Pair
  op OR : Block Block -> Block
  op XOR : Block Block -> Block
  op XOR-prime : Pair -> Block
  op CYC : Block -> Block
  op nCYC : Xnat Block -> Block
  op FIX1 : Block -> Block
  op FIX2 : Block -> Block
  op needAdjust : Octet -> Xbool
  op adjustCode : Octet -> Bit
  op adjust : Octet Octet -> Octet
  op PAT : Block Block -> Octet
  op BYT : Block Block -> Pair
  op BYT-prime : Octet Octet Octet Octet Octet Octet Octet Octet Octet -> Pair
  op ADDC : Block Block -> Pair
  op ADDC-prime : BlockSum -> Pair
  op MUL1 : Block Block -> Block
  op MUL1XY : Pair -> Block
  op MUL1UL : Block Block -> Block
  op MUL1SC : Pair -> Block
  op MUL2 : Block Block -> Block
  op MUL2XY : Pair -> Block
  op MUL2UL : Block Block -> Block
  op MUL2DEL : Pair Block -> Block
  op MUL2FL : Block Block -> Block
  op MUL2SC : Pair -> Block
  op MUL2A : Block Block -> Block
  op MUL2AXY : Pair -> Block
  op MUL2AUL : Block Block -> Block
  op MUL2ADL : Block Block -> Block
  op MUL2ASC : Pair -> Block
  op squareHalf : Half -> Block
  op Q : Octet -> Block
  op H4 : Block -> Block
  op H6 : Block -> Block
  op H8 : Block -> Block
  op H0 : Block -> Block
  op H5 : Block Octet -> Block
  op H7 : Block -> Block
  op H9 : Block -> Block
  op J1-2 : Block -> Block
  op J1-4 : Block -> Block
  op J1-6 : Block -> Block
  op J1-8 : Block -> Block
  op J2-2 : Block -> Block
  op J2-4 : Block -> Block
  op J2-6 : Block -> Block
  op J2-8 : Block -> Block
  op K1-2 : Block -> Block
  op K1-4 : Block -> Block
  op K1-5 : Block -> Block
  op K1-7 : Block -> Block
  op K1-9 : Block -> Block
  op K2-2 : Block -> Block
  op K2-4 : Block -> Block
  op K2-5 : Block -> Block
  op K2-7 : Block -> Block
  op K2-9 : Block -> Block
  op preludeXY : Block Block -> Pair
  op preludeVW : Block Block -> Pair
  op preludeST : Block Block -> Pair
  op preludeXY-prime : Pair Octet -> Pair
  op preludeVW-prime : Pair -> Pair
  op preludeST-prime : Pair -> Pair
  op computeXY : Pair Pair Block -> Pair
  op computeXY-prime : Pair Block Block -> Pair
  op computeVW : Pair -> Pair
  op loop1 : Pair Pair Message -> Pair
  op loop2 : Pair Pair Message -> Pair
  op coda : Pair Pair Pair -> Block
  op MAA : Key Message -> Block
  op MAA-prime : Pair Pair Pair Message -> Block
  op MAC : Key Message -> Block
  op MACfirst : Key SegmentedMessage -> Block
  op MACnext : Key Block SegmentedMessage -> Block
  eq notBool (Xfalse) = Xtrue .
  eq notBool (Xtrue) = Xfalse .
  eq andBool (Xfalse, L:Xbool) = Xfalse .
  eq andBool (Xtrue, L:Xbool) = L .
  eq orBool (Xfalse, L:Xbool) = L .
  eq orBool (Xtrue, L:Xbool) = Xtrue .
  eq xorBool (Xfalse, L:Xbool) = L .
  eq xorBool (Xtrue, L:Xbool) = notBool (L) .
  eq notBit (x0) = x1 .
  eq notBit (x1) = x0 .
  eq andBit (B:Bit, x0) = x0 .
  eq andBit (B:Bit, x1) = B .
  eq orBit (B:Bit, x0) = B .
  eq orBit (B:Bit, x1) = x1 .
  eq xorBit (B:Bit, x0) = B .
  eq xorBit (B:Bit, x1) = notBit (B) .
  eq x00 = buildOctet (x0, x0, x0, x0, x0, x0, x0, x0) .
  eq x01 = buildOctet (x0, x0, x0, x0, x0, x0, x0, x1) .
  eq x0000 = buildHalf (x00, x00) .
  eq HalfU (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet)) = buildHalf (O1, O2) .
  eq HalfL (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet)) = buildHalf (O3, O4) .
  eq eqBit (x0, x0) = Xtrue .
  eq eqBit (x0, x1) = Xfalse .
  eq eqBit (x1, x0) = Xfalse .
  eq eqBit (x1, x1) = Xtrue .
  eq eqOctet (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B-prime1:Bit, B-prime2:Bit, B-prime3:Bit, B-prime4:Bit, B-prime5:Bit, B-prime6:Bit, B-prime7:Bit, B-prime8:Bit)) = andBool (eqBit (B1, B-prime1), andBool (eqBit (B2, B-prime2), andBool (eqBit (B3, B-prime3), andBool (eqBit (B4, B-prime4), andBool (eqBit (B5, B-prime5), andBool (eqBit (B6, B-prime6), andBool (eqBit (B7, B-prime7), eqBit (B8, B-prime8)))))))) .
  eq eqOctetSum (buildOctetSum (B:Bit, O:Octet), buildOctetSum (B-prime:Bit, O-prime:Octet)) = andBool (eqBit (B, B-prime), eqOctet (O, O-prime)) .
  eq eqHalf (buildHalf (O1:Octet, O2:Octet), buildHalf (O-prime1:Octet, O-prime2:Octet)) = andBool (eqOctet (O1, O-prime1), eqOctet (O2, O-prime2)) .
  eq eqHalfSum (buildHalfSum (B:Bit, H:Half), buildHalfSum (B-prime:Bit, H-prime:Half)) = andBool (eqBit (B, B-prime), eqHalf (H, H-prime)) .
  eq eqBlock (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = andBool (andBool (eqOctet (O1, O-prime1), eqOctet (O2, O-prime2)), andBool (eqOctet (O3, O-prime3), eqOctet (O4, O-prime4))) .
  eq eqBlockSum (buildBlockSum (B:Bit, W:Block), buildBlockSum (B-prime:Bit, W-prime:Block)) = andBool (eqBit (B, B-prime), eqBlock (W, W-prime)) .
  eq eqPair (buildPair (W1:Block, W2:Block), buildPair (W-prime1:Block, W-prime2:Block)) = andBool (eqBlock (W1, W-prime1), eqBlock (W2, W-prime2)) .
  eq addBit (B:Bit, B-prime:Bit, Bcarry:Bit) = xorBit (xorBit (B, B-prime), Bcarry) .
  eq carBit (B:Bit, B-prime:Bit, Bcarry:Bit) = orBit (andBit (andBit (B, B-prime), notBit (Bcarry)), andBit (orBit (B, B-prime), Bcarry)) .
  eq addOctetSum (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B-prime1:Bit, B-prime2:Bit, B-prime3:Bit, B-prime4:Bit, B-prime5:Bit, B-prime6:Bit, B-prime7:Bit, B-prime8:Bit), Bcarry:Bit) = addOctet8 (B1, B-prime1, B2, B-prime2, B3, B-prime3, B4, B-prime4, B5, B-prime5, B6, B-prime6, B7, B-prime7, B8, B-prime8, Bcarry) .
  eq addOctet8 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, B4:Bit, B-prime4:Bit, B5:Bit, B-prime5:Bit, B6:Bit, B-prime6:Bit, B7:Bit, B-prime7:Bit, B8:Bit, B-prime8:Bit, Bcarry:Bit) = addOctet7 (B1, B-prime1, B2, B-prime2, B3, B-prime3, B4, B-prime4, B5, B-prime5, B6, B-prime6, B7, B-prime7, carBit (B8, B-prime8, Bcarry), addBit (B8, B-prime8, Bcarry)) .
  eq addOctet7 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, B4:Bit, B-prime4:Bit, B5:Bit, B-prime5:Bit, B6:Bit, B-prime6:Bit, B7:Bit, B-prime7:Bit, Bcarry:Bit, B-second8:Bit) = addOctet6 (B1, B-prime1, B2, B-prime2, B3, B-prime3, B4, B-prime4, B5, B-prime5, B6, B-prime6, carBit (B7, B-prime7, Bcarry), addBit (B7, B-prime7, Bcarry), B-second8) .
  eq addOctet6 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, B4:Bit, B-prime4:Bit, B5:Bit, B-prime5:Bit, B6:Bit, B-prime6:Bit, Bcarry:Bit, B-second7:Bit, B-second8:Bit) = addOctet5 (B1, B-prime1, B2, B-prime2, B3, B-prime3, B4, B-prime4, B5, B-prime5, carBit (B6, B-prime6, Bcarry), addBit (B6, B-prime6, Bcarry), B-second7, B-second8) .
  eq addOctet5 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, B4:Bit, B-prime4:Bit, B5:Bit, B-prime5:Bit, Bcarry:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = addOctet4 (B1, B-prime1, B2, B-prime2, B3, B-prime3, B4, B-prime4, carBit (B5, B-prime5, Bcarry), addBit (B5, B-prime5, Bcarry), B-second6, B-second7, B-second8) .
  eq addOctet4 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, B4:Bit, B-prime4:Bit, Bcarry:Bit, B-second5:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = addOctet3 (B1, B-prime1, B2, B-prime2, B3, B-prime3, carBit (B4, B-prime4, Bcarry), addBit (B4, B-prime4, Bcarry), B-second5, B-second6, B-second7, B-second8) .
  eq addOctet3 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, B3:Bit, B-prime3:Bit, Bcarry:Bit, B-second4:Bit, B-second5:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = addOctet2 (B1, B-prime1, B2, B-prime2, carBit (B3, B-prime3, Bcarry), addBit (B3, B-prime3, Bcarry), B-second4, B-second5, B-second6, B-second7, B-second8) .
  eq addOctet2 (B1:Bit, B-prime1:Bit, B2:Bit, B-prime2:Bit, Bcarry:Bit, B-second3:Bit, B-second4:Bit, B-second5:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = addOctet1 (B1, B-prime1, carBit (B2, B-prime2, Bcarry), addBit (B2, B-prime2, Bcarry), B-second3, B-second4, B-second5, B-second6, B-second7, B-second8) .
  eq addOctet1 (B1:Bit, B-prime1:Bit, Bcarry:Bit, B-second2:Bit, B-second3:Bit, B-second4:Bit, B-second5:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = addOctet0 (carBit (B1, B-prime1, Bcarry), addBit (B1, B-prime1, Bcarry), B-second2, B-second3, B-second4, B-second5, B-second6, B-second7, B-second8) .
  eq addOctet0 (Bcarry:Bit, B-second1:Bit, B-second2:Bit, B-second3:Bit, B-second4:Bit, B-second5:Bit, B-second6:Bit, B-second7:Bit, B-second8:Bit) = buildOctetSum (Bcarry, buildOctet (B-second1, B-second2, B-second3, B-second4, B-second5, B-second6, B-second7, B-second8)) .
  eq dropCarryOctetSum (buildOctetSum (Bcarry:Bit, O:Octet)) = O .
  eq addOctet (O:Octet, O-prime:Octet) = dropCarryOctetSum (addOctetSum (O, O-prime, x0)) .
  eq addHalfSum (buildHalf (O1:Octet, O2:Octet), buildHalf (O-prime1:Octet, O-prime2:Octet)) = addHalf2 (O1, O-prime1, O2, O-prime2) .
  eq addHalf2 (O1:Octet, O-prime1:Octet, O2:Octet, O-prime2:Octet) = addHalf1 (O1, O-prime1, addOctetSum (O2, O-prime2, x0)) .
  eq addHalf1 (O1:Octet, O-prime1:Octet, buildOctetSum (B:Bit, O-second2:Octet)) = addHalf0 (addOctetSum (O1, O-prime1, B), O-second2) .
  eq addHalf0 (buildOctetSum (B:Bit, O-second1:Octet), O-second2:Octet) = buildHalfSum (B, buildHalf (O-second1, O-second2)) .
  eq dropCarryHalfSum (buildHalfSum (B:Bit, H:Half)) = H .
  eq addHalf (H:Half, H-prime:Half) = dropCarryHalfSum (addHalfSum (H, H-prime)) .
  eq addHalfOctet (O:Octet, H:Half) = addHalf (buildHalf (x00, O), H) .
  eq addHalfOctets (O:Octet, O-prime:Octet) = addHalf (buildHalf (x00, O), buildHalf (x00, O-prime)) .
  eq addBlockSum (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = addBlock4 (O1, O-prime1, O2, O-prime2, O3, O-prime3, O4, O-prime4) .
  eq addBlock4 (O1:Octet, O-prime1:Octet, O2:Octet, O-prime2:Octet, O3:Octet, O-prime3:Octet, O4:Octet, O-prime4:Octet) = addBlock3 (O1, O-prime1, O2, O-prime2, O3, O-prime3, addOctetSum (O4, O-prime4, x0)) .
  eq addBlock3 (O1:Octet, O-prime1:Octet, O2:Octet, O-prime2:Octet, O3:Octet, O-prime3:Octet, buildOctetSum (Bcarry:Bit, O-second4:Octet)) = addBlock2 (O1, O-prime1, O2, O-prime2, addOctetSum (O3, O-prime3, Bcarry), O-second4) .
  eq addBlock2 (O1:Octet, O-prime1:Octet, O2:Octet, O-prime2:Octet, buildOctetSum (Bcarry:Bit, O-second3:Octet), O-second4:Octet) = addBlock1 (O1, O-prime1, addOctetSum (O2, O-prime2, Bcarry), O-second3, O-second4) .
  eq addBlock1 (O1:Octet, O-prime1:Octet, buildOctetSum (Bcarry:Bit, O-second2:Octet), O-second3:Octet, O-second4:Octet) = addBlock0 (addOctetSum (O1, O-prime1, Bcarry), O-second2, O-second3, O-second4) .
  eq addBlock0 (buildOctetSum (Bcarry:Bit, O-second1:Octet), O-second2:Octet, O-second3:Octet, O-second4:Octet) = buildBlockSum (Bcarry, buildBlock (O-second1, O-second2, O-second3, O-second4)) .
  eq dropCarryBlockSum (buildBlockSum (Bcarry:Bit, W:Block)) = W .
  eq addBlock (W:Block, W-prime:Block) = dropCarryBlockSum (addBlockSum (W, W-prime)) .
  eq addBlockHalf (buildHalf (O1:Octet, O2:Octet), W:Block) = addBlock (buildBlock (x00, x00, O1, O2), W) .
  eq addBlockHalves (buildHalf (O1:Octet, O2:Octet), buildHalf (O-prime1:Octet, O-prime2:Octet)) = addBlock (buildBlock (x00, x00, O1, O2), buildBlock (x00, x00, O-prime1, O-prime2)) .
  eq leftOctet1 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B2, B3, B4, B5, B6, B7, B8, x0) .
  eq leftOctet2 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B3, B4, B5, B6, B7, B8, x0, x0) .
  eq leftOctet3 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B4, B5, B6, B7, B8, x0, x0, x0) .
  eq leftOctet4 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B5, B6, B7, B8, x0, x0, x0, x0) .
  eq leftOctet5 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B6, B7, B8, x0, x0, x0, x0, x0) .
  eq leftOctet6 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B7, B8, x0, x0, x0, x0, x0, x0) .
  eq leftOctet7 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (B8, x0, x0, x0, x0, x0, x0, x0) .
  eq rightOctet1 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, B1, B2, B3, B4, B5, B6, B7) .
  eq rightOctet2 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, B1, B2, B3, B4, B5, B6) .
  eq rightOctet3 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, x0, B1, B2, B3, B4, B5) .
  eq rightOctet4 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, x0, x0, B1, B2, B3, B4) .
  eq rightOctet5 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, x0, x0, x0, B1, B2, B3) .
  eq rightOctet6 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, x0, x0, x0, x0, B1, B2) .
  eq rightOctet7 (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit)) = buildOctet (x0, x0, x0, x0, x0, x0, x0, B1) .
  eq mulOctet (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), O-prime:Octet) = mulOctet1 (B1, B2, B3, B4, B5, B6, B7, B8, O-prime, x0000) .
  eq mulOctet1 (x0, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet2 (B2, B3, B4, B5, B6, B7, B8, O-prime, H) .
  eq mulOctet1 (x1, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet2 (B2, B3, B4, B5, B6, B7, B8, O-prime, mulOctetA (H, rightOctet1 (O-prime), leftOctet7 (O-prime))) .
  eq mulOctet2 (x0, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet3 (B3, B4, B5, B6, B7, B8, O-prime, H) .
  eq mulOctet2 (x1, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet3 (B3, B4, B5, B6, B7, B8, O-prime, mulOctetA (H, rightOctet2 (O-prime), leftOctet6 (O-prime))) .
  eq mulOctet3 (x0, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet4 (B4, B5, B6, B7, B8, O-prime, H) .
  eq mulOctet3 (x1, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet4 (B4, B5, B6, B7, B8, O-prime, mulOctetA (H, rightOctet3 (O-prime), leftOctet5 (O-prime))) .
  eq mulOctet4 (x0, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet5 (B5, B6, B7, B8, O-prime, H) .
  eq mulOctet4 (x1, B5:Bit, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet5 (B5, B6, B7, B8, O-prime, mulOctetA (H, rightOctet4 (O-prime), leftOctet4 (O-prime))) .
  eq mulOctet5 (x0, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet6 (B6, B7, B8, O-prime, H) .
  eq mulOctet5 (x1, B6:Bit, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet6 (B6, B7, B8, O-prime, mulOctetA (H, rightOctet5 (O-prime), leftOctet3 (O-prime))) .
  eq mulOctet6 (x0, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet7 (B7, B8, O-prime, H) .
  eq mulOctet6 (x1, B7:Bit, B8:Bit, O-prime:Octet, H:Half) = mulOctet7 (B7, B8, O-prime, mulOctetA (H, rightOctet6 (O-prime), leftOctet2 (O-prime))) .
  eq mulOctet7 (x0, B8:Bit, O-prime:Octet, H:Half) = mulOctet8 (B8, O-prime, H) .
  eq mulOctet7 (x1, B8:Bit, O-prime:Octet, H:Half) = mulOctet8 (B8, O-prime, mulOctetA (H, rightOctet7 (O-prime), leftOctet1 (O-prime))) .
  eq mulOctet8 (x0, O-prime:Octet, H:Half) = H .
  eq mulOctet8 (x1, O-prime:Octet, H:Half) = mulOctetA (H, x00, O-prime) .
  eq mulOctetA (buildHalf (O1:Octet, O2:Octet), O-prime1:Octet, O-prime2:Octet) = mulOctetB (addOctet (O1, O-prime1), addOctetSum (O2, O-prime2, x0)) .
  eq mulOctetB (O1:Octet, buildOctetSum (x0, O2:Octet)) = buildHalf (O1, O2) .
  eq mulOctetB (O1:Octet, buildOctetSum (x1, O2:Octet)) = buildHalf (addOctet (O1, x01), O2) .
  eq mulHalf (buildHalf (O1:Octet, O2:Octet), buildHalf (O-prime1:Octet, O-prime2:Octet)) = mulHalfA (mulOctet (O1, O-prime1), mulOctet (O1, O-prime2), mulOctet (O2, O-prime1), mulOctet (O2, O-prime2)) .
  eq mulHalfA (buildHalf (O11U:Octet, O11L:Octet), buildHalf (O12U:Octet, O12L:Octet), buildHalf (O21U:Octet, O21L:Octet), buildHalf (O22U:Octet, O22L:Octet)) = mulHalf4 (O11U, O11L, O12U, O12L, O21U, O21L, O22U, O22L) .
  eq mulHalf4 (O11U:Octet, O11L:Octet, O12U:Octet, O12L:Octet, O21U:Octet, O21L:Octet, O22U:Octet, O-second4:Octet) = mulHalf3 (O11U, O11L, O12U, O21U, addHalfOctet (O12L, addHalfOctets (O21L, O22U)), O-second4) .
  eq mulHalf3 (O11U:Octet, O11L:Octet, O12U:Octet, O21U:Octet, buildHalf (Ocarry:Octet, O-second3:Octet), O-second4:Octet) = mulHalf2 (O11U, addHalfOctet (Ocarry, addHalfOctet (O11L, addHalfOctets (O12U, O21U))), O-second3, O-second4) .
  eq mulHalf2 (O11U:Octet, buildHalf (Ocarry:Octet, O-second2:Octet), O-second3:Octet, O-second4:Octet) = mulHalf1 (addHalfOctets (Ocarry, O11U), O-second2, O-second3, O-second4) .
  eq mulHalf1 (buildHalf (Ocarry:Octet, O-second1:Octet), O-second2:Octet, O-second3:Octet, O-second4:Octet) = buildBlock (O-second1, O-second2, O-second3, O-second4) .
  eq mulBlock (W1:Block, W2:Block) = mulBlockA (mulHalf (HalfU (W1), HalfU (W2)), mulHalf (HalfU (W1), HalfL (W2)), mulHalf (HalfL (W1), HalfU (W2)), mulHalf (HalfL (W1), HalfL (W2))) .
  eq mulBlockA (W11:Block, W12:Block, W21:Block, W22:Block) = mulBlock4 (HalfU (W11), HalfL (W11), HalfU (W12), HalfL (W12), HalfU (W21), HalfL (W21), HalfU (W22), HalfL (W22)) .
  eq mulBlock4 (H11U:Half, H11L:Half, H12U:Half, H12L:Half, H21U:Half, H21L:Half, H22U:Half, H-second4:Half) = mulBlock3 (H11U, H11L, H12U, H21U, addBlockHalf (H12L, addBlockHalves (H21L, H22U)), H-second4) .
  eq mulBlock3 (H11U:Half, H11L:Half, H12U:Half, H21U:Half, W:Block, H-second4:Half) = mulBlock2 (H11U, addBlockHalf (HalfU (W), addBlockHalf (H11L, addBlockHalves (H12U, H21U))), HalfL (W), H-second4) .
  eq mulBlock2 (H11U:Half, W:Block, H-second3:Half, H-second4:Half) = mulBlock1 (addBlockHalves (HalfU (W), H11U), HalfL (W), H-second3, H-second4) .
  eq mulBlock1 (W:Block, H-second2:Half, H-second3:Half, H-second4:Half) = mulBlockB (HalfL (W), H-second2, H-second3, H-second4) .
  eq mulBlockB (buildHalf (O1U:Octet, O1L:Octet), buildHalf (O2U:Octet, O2L:Octet), buildHalf (O3U:Octet, O3L:Octet), buildHalf (O4U:Octet, O4L:Octet)) = buildPair (buildBlock (O1U, O1L, O2U, O2L), buildBlock (O3U, O3L, O4U, O4L)) .
  eq addNat (N:Xnat, zero) = N .
  eq addNat (N:Xnat, succ (N-prime:Xnat)) = addNat (succ (N), N-prime) .
  eq multNat (N:Xnat, zero) = zero .
  eq multNat (N:Xnat, succ (N-prime:Xnat)) = addNat (N, multNat (N, N-prime)) .
  eq eqNat (zero, zero) = Xtrue .
  eq eqNat (zero, succ (N-prime:Xnat)) = Xfalse .
  eq eqNat (succ (N:Xnat), zero) = Xfalse .
  eq eqNat (succ (N:Xnat), succ (N-prime:Xnat)) = eqNat (N, N-prime) .
  eq ltNat (zero, zero) = Xfalse .
  eq ltNat (zero, succ (N-prime:Xnat)) = Xtrue .
  eq ltNat (succ (N-prime:Xnat), zero) = Xfalse .
  eq ltNat (succ (N:Xnat), succ (N-prime:Xnat)) = ltNat (N, N-prime) .
  eq n1 = succ (zero) .
  eq n2 = succ (n1) .
  eq n3 = succ (n2) .
  eq n4 = succ (n3) .
  eq n5 = succ (n4) .
  eq n6 = succ (n5) .
  eq n7 = succ (n6) .
  eq n8 = succ (n7) .
  eq n9 = succ (n8) .
  eq n10 = succ (n9) .
  eq n11 = succ (n10) .
  eq n12 = succ (n11) .
  eq n13 = succ (n12) .
  eq n14 = succ (n13) .
  eq n15 = succ (n14) .
  eq n16 = succ (n15) .
  eq n17 = succ (n16) .
  eq n18 = succ (n17) .
  eq n19 = succ (n18) .
  eq n20 = succ (n19) .
  eq n21 = succ (n20) .
  eq n22 = succ (n21) .
  eq n254 = addNat (n12, multNat (n11, n22)) .
  eq n256 = multNat (n16, n16) .
  eq n4100 = addNat (n4, multNat (n16, n256)) .
  eq andOctet (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B-prime1:Bit, B-prime2:Bit, B-prime3:Bit, B-prime4:Bit, B-prime5:Bit, B-prime6:Bit, B-prime7:Bit, B-prime8:Bit)) = buildOctet (andBit (B1, B-prime1), andBit (B2, B-prime2), andBit (B3, B-prime3), andBit (B4, B-prime4), andBit (B5, B-prime5), andBit (B6, B-prime6), andBit (B7, B-prime7), andBit (B8, B-prime8)) .
  eq orOctet (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B-prime1:Bit, B-prime2:Bit, B-prime3:Bit, B-prime4:Bit, B-prime5:Bit, B-prime6:Bit, B-prime7:Bit, B-prime8:Bit)) = buildOctet (orBit (B1, B-prime1), orBit (B2, B-prime2), orBit (B3, B-prime3), orBit (B4, B-prime4), orBit (B5, B-prime5), orBit (B6, B-prime6), orBit (B7, B-prime7), orBit (B8, B-prime8)) .
  eq xorOctet (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B-prime1:Bit, B-prime2:Bit, B-prime3:Bit, B-prime4:Bit, B-prime5:Bit, B-prime6:Bit, B-prime7:Bit, B-prime8:Bit)) = buildOctet (xorBit (B1, B-prime1), xorBit (B2, B-prime2), xorBit (B3, B-prime3), xorBit (B4, B-prime4), xorBit (B5, B-prime5), xorBit (B6, B-prime6), xorBit (B7, B-prime7), xorBit (B8, B-prime8)) .
  eq x02 = buildOctet (x0, x0, x0, x0, x0, x0, x1, x0) .
  eq x03 = buildOctet (x0, x0, x0, x0, x0, x0, x1, x1) .
  eq x04 = buildOctet (x0, x0, x0, x0, x0, x1, x0, x0) .
  eq x05 = buildOctet (x0, x0, x0, x0, x0, x1, x0, x1) .
  eq x06 = buildOctet (x0, x0, x0, x0, x0, x1, x1, x0) .
  eq x07 = buildOctet (x0, x0, x0, x0, x0, x1, x1, x1) .
  eq x08 = buildOctet (x0, x0, x0, x0, x1, x0, x0, x0) .
  eq x09 = buildOctet (x0, x0, x0, x0, x1, x0, x0, x1) .
  eq x0A = buildOctet (x0, x0, x0, x0, x1, x0, x1, x0) .
  eq x0B = buildOctet (x0, x0, x0, x0, x1, x0, x1, x1) .
  eq x0C = buildOctet (x0, x0, x0, x0, x1, x1, x0, x0) .
  eq x0D = buildOctet (x0, x0, x0, x0, x1, x1, x0, x1) .
  eq x0E = buildOctet (x0, x0, x0, x0, x1, x1, x1, x0) .
  eq x0F = buildOctet (x0, x0, x0, x0, x1, x1, x1, x1) .
  eq x10 = buildOctet (x0, x0, x0, x1, x0, x0, x0, x0) .
  eq x11 = buildOctet (x0, x0, x0, x1, x0, x0, x0, x1) .
  eq x12 = buildOctet (x0, x0, x0, x1, x0, x0, x1, x0) .
  eq x13 = buildOctet (x0, x0, x0, x1, x0, x0, x1, x1) .
  eq x14 = buildOctet (x0, x0, x0, x1, x0, x1, x0, x0) .
  eq x15 = buildOctet (x0, x0, x0, x1, x0, x1, x0, x1) .
  eq x16 = buildOctet (x0, x0, x0, x1, x0, x1, x1, x0) .
  eq x17 = buildOctet (x0, x0, x0, x1, x0, x1, x1, x1) .
  eq x18 = buildOctet (x0, x0, x0, x1, x1, x0, x0, x0) .
  eq x1A = buildOctet (x0, x0, x0, x1, x1, x0, x1, x0) .
  eq x1B = buildOctet (x0, x0, x0, x1, x1, x0, x1, x1) .
  eq x1C = buildOctet (x0, x0, x0, x1, x1, x1, x0, x0) .
  eq x1D = buildOctet (x0, x0, x0, x1, x1, x1, x0, x1) .
  eq x1E = buildOctet (x0, x0, x0, x1, x1, x1, x1, x0) .
  eq x1F = buildOctet (x0, x0, x0, x1, x1, x1, x1, x1) .
  eq x20 = buildOctet (x0, x0, x1, x0, x0, x0, x0, x0) .
  eq x21 = buildOctet (x0, x0, x1, x0, x0, x0, x0, x1) .
  eq x23 = buildOctet (x0, x0, x1, x0, x0, x0, x1, x1) .
  eq x24 = buildOctet (x0, x0, x1, x0, x0, x1, x0, x0) .
  eq x25 = buildOctet (x0, x0, x1, x0, x0, x1, x0, x1) .
  eq x26 = buildOctet (x0, x0, x1, x0, x0, x1, x1, x0) .
  eq x27 = buildOctet (x0, x0, x1, x0, x0, x1, x1, x1) .
  eq x28 = buildOctet (x0, x0, x1, x0, x1, x0, x0, x0) .
  eq x29 = buildOctet (x0, x0, x1, x0, x1, x0, x0, x1) .
  eq x2A = buildOctet (x0, x0, x1, x0, x1, x0, x1, x0) .
  eq x2B = buildOctet (x0, x0, x1, x0, x1, x0, x1, x1) .
  eq x2D = buildOctet (x0, x0, x1, x0, x1, x1, x0, x1) .
  eq x2E = buildOctet (x0, x0, x1, x0, x1, x1, x1, x0) .
  eq x2F = buildOctet (x0, x0, x1, x0, x1, x1, x1, x1) .
  eq x30 = buildOctet (x0, x0, x1, x1, x0, x0, x0, x0) .
  eq x31 = buildOctet (x0, x0, x1, x1, x0, x0, x0, x1) .
  eq x32 = buildOctet (x0, x0, x1, x1, x0, x0, x1, x0) .
  eq x33 = buildOctet (x0, x0, x1, x1, x0, x0, x1, x1) .
  eq x34 = buildOctet (x0, x0, x1, x1, x0, x1, x0, x0) .
  eq x35 = buildOctet (x0, x0, x1, x1, x0, x1, x0, x1) .
  eq x36 = buildOctet (x0, x0, x1, x1, x0, x1, x1, x0) .
  eq x37 = buildOctet (x0, x0, x1, x1, x0, x1, x1, x1) .
  eq x38 = buildOctet (x0, x0, x1, x1, x1, x0, x0, x0) .
  eq x39 = buildOctet (x0, x0, x1, x1, x1, x0, x0, x1) .
  eq x3A = buildOctet (x0, x0, x1, x1, x1, x0, x1, x0) .
  eq x3B = buildOctet (x0, x0, x1, x1, x1, x0, x1, x1) .
  eq x3D = buildOctet (x0, x0, x1, x1, x1, x1, x0, x1) .
  eq x3C = buildOctet (x0, x0, x1, x1, x1, x1, x0, x0) .
  eq x3F = buildOctet (x0, x0, x1, x1, x1, x1, x1, x1) .
  eq x40 = buildOctet (x0, x1, x0, x0, x0, x0, x0, x0) .
  eq x46 = buildOctet (x0, x1, x0, x0, x0, x1, x1, x0) .
  eq x48 = buildOctet (x0, x1, x0, x0, x1, x0, x0, x0) .
  eq x49 = buildOctet (x0, x1, x0, x0, x1, x0, x0, x1) .
  eq x4A = buildOctet (x0, x1, x0, x0, x1, x0, x1, x0) .
  eq x4B = buildOctet (x0, x1, x0, x0, x1, x0, x1, x1) .
  eq x4C = buildOctet (x0, x1, x0, x0, x1, x1, x0, x0) .
  eq x4D = buildOctet (x0, x1, x0, x0, x1, x1, x0, x1) .
  eq x4E = buildOctet (x0, x1, x0, x0, x1, x1, x1, x0) .
  eq x4F = buildOctet (x0, x1, x0, x0, x1, x1, x1, x1) .
  eq x50 = buildOctet (x0, x1, x0, x1, x0, x0, x0, x0) .
  eq x51 = buildOctet (x0, x1, x0, x1, x0, x0, x0, x1) .
  eq x53 = buildOctet (x0, x1, x0, x1, x0, x0, x1, x1) .
  eq x54 = buildOctet (x0, x1, x0, x1, x0, x1, x0, x0) .
  eq x55 = buildOctet (x0, x1, x0, x1, x0, x1, x0, x1) .
  eq x58 = buildOctet (x0, x1, x0, x1, x1, x0, x0, x0) .
  eq x5A = buildOctet (x0, x1, x0, x1, x1, x0, x1, x0) .
  eq x5B = buildOctet (x0, x1, x0, x1, x1, x0, x1, x1) .
  eq x5C = buildOctet (x0, x1, x0, x1, x1, x1, x0, x0) .
  eq x5D = buildOctet (x0, x1, x0, x1, x1, x1, x0, x1) .
  eq x5E = buildOctet (x0, x1, x0, x1, x1, x1, x1, x0) .
  eq x5F = buildOctet (x0, x1, x0, x1, x1, x1, x1, x1) .
  eq x60 = buildOctet (x0, x1, x1, x0, x0, x0, x0, x0) .
  eq x61 = buildOctet (x0, x1, x1, x0, x0, x0, x0, x1) .
  eq x62 = buildOctet (x0, x1, x1, x0, x0, x0, x1, x0) .
  eq x63 = buildOctet (x0, x1, x1, x0, x0, x0, x1, x1) .
  eq x64 = buildOctet (x0, x1, x1, x0, x0, x1, x0, x0) .
  eq x65 = buildOctet (x0, x1, x1, x0, x0, x1, x0, x1) .
  eq x66 = buildOctet (x0, x1, x1, x0, x0, x1, x1, x0) .
  eq x67 = buildOctet (x0, x1, x1, x0, x0, x1, x1, x1) .
  eq x69 = buildOctet (x0, x1, x1, x0, x1, x0, x0, x1) .
  eq x6A = buildOctet (x0, x1, x1, x0, x1, x0, x1, x0) .
  eq x6B = buildOctet (x0, x1, x1, x0, x1, x0, x1, x1) .
  eq x6C = buildOctet (x0, x1, x1, x0, x1, x1, x0, x0) .
  eq x6D = buildOctet (x0, x1, x1, x0, x1, x1, x0, x1) .
  eq x6E = buildOctet (x0, x1, x1, x0, x1, x1, x1, x0) .
  eq x6F = buildOctet (x0, x1, x1, x0, x1, x1, x1, x1) .
  eq x70 = buildOctet (x0, x1, x1, x1, x0, x0, x0, x0) .
  eq x71 = buildOctet (x0, x1, x1, x1, x0, x0, x0, x1) .
  eq x72 = buildOctet (x0, x1, x1, x1, x0, x0, x1, x0) .
  eq x73 = buildOctet (x0, x1, x1, x1, x0, x0, x1, x1) .
  eq x74 = buildOctet (x0, x1, x1, x1, x0, x1, x0, x0) .
  eq x75 = buildOctet (x0, x1, x1, x1, x0, x1, x0, x1) .
  eq x76 = buildOctet (x0, x1, x1, x1, x0, x1, x1, x0) .
  eq x77 = buildOctet (x0, x1, x1, x1, x0, x1, x1, x1) .
  eq x78 = buildOctet (x0, x1, x1, x1, x1, x0, x0, x0) .
  eq x79 = buildOctet (x0, x1, x1, x1, x1, x0, x0, x1) .
  eq x7A = buildOctet (x0, x1, x1, x1, x1, x0, x1, x0) .
  eq x7B = buildOctet (x0, x1, x1, x1, x1, x0, x1, x1) .
  eq x7C = buildOctet (x0, x1, x1, x1, x1, x1, x0, x0) .
  eq x7D = buildOctet (x0, x1, x1, x1, x1, x1, x0, x1) .
  eq x7E = buildOctet (x0, x1, x1, x1, x1, x1, x1, x0) .
  eq x7F = buildOctet (x0, x1, x1, x1, x1, x1, x1, x1) .
  eq x80 = buildOctet (x1, x0, x0, x0, x0, x0, x0, x0) .
  eq x81 = buildOctet (x1, x0, x0, x0, x0, x0, x0, x1) .
  eq x83 = buildOctet (x1, x0, x0, x0, x0, x0, x1, x1) .
  eq x84 = buildOctet (x1, x0, x0, x0, x0, x1, x0, x0) .
  eq x85 = buildOctet (x1, x0, x0, x0, x0, x1, x0, x1) .
  eq x86 = buildOctet (x1, x0, x0, x0, x0, x1, x1, x0) .
  eq x88 = buildOctet (x1, x0, x0, x0, x1, x0, x0, x0) .
  eq x89 = buildOctet (x1, x0, x0, x0, x1, x0, x0, x1) .
  eq x8A = buildOctet (x1, x0, x0, x0, x1, x0, x1, x0) .
  eq x8C = buildOctet (x1, x0, x0, x0, x1, x1, x0, x0) .
  eq x8D = buildOctet (x1, x0, x0, x0, x1, x1, x0, x1) .
  eq x8E = buildOctet (x1, x0, x0, x0, x1, x1, x1, x0) .
  eq x8F = buildOctet (x1, x0, x0, x0, x1, x1, x1, x1) .
  eq x90 = buildOctet (x1, x0, x0, x1, x0, x0, x0, x0) .
  eq x91 = buildOctet (x1, x0, x0, x1, x0, x0, x0, x1) .
  eq x92 = buildOctet (x1, x0, x0, x1, x0, x0, x1, x0) .
  eq x93 = buildOctet (x1, x0, x0, x1, x0, x0, x1, x1) .
  eq x95 = buildOctet (x1, x0, x0, x1, x0, x1, x0, x1) .
  eq x96 = buildOctet (x1, x0, x0, x1, x0, x1, x1, x0) .
  eq x97 = buildOctet (x1, x0, x0, x1, x0, x1, x1, x1) .
  eq x98 = buildOctet (x1, x0, x0, x1, x1, x0, x0, x0) .
  eq x99 = buildOctet (x1, x0, x0, x1, x1, x0, x0, x1) .
  eq x9A = buildOctet (x1, x0, x0, x1, x1, x0, x1, x0) .
  eq x9B = buildOctet (x1, x0, x0, x1, x1, x0, x1, x1) .
  eq x9C = buildOctet (x1, x0, x0, x1, x1, x1, x0, x0) .
  eq x9D = buildOctet (x1, x0, x0, x1, x1, x1, x0, x1) .
  eq x9E = buildOctet (x1, x0, x0, x1, x1, x1, x1, x0) .
  eq x9F = buildOctet (x1, x0, x0, x1, x1, x1, x1, x1) .
  eq xA1 = buildOctet (x1, x0, x1, x0, x0, x0, x0, x1) .
  eq xA0 = buildOctet (x1, x0, x1, x0, x0, x0, x0, x0) .
  eq xA2 = buildOctet (x1, x0, x1, x0, x0, x0, x1, x0) .
  eq xA3 = buildOctet (x1, x0, x1, x0, x0, x0, x1, x1) .
  eq xA4 = buildOctet (x1, x0, x1, x0, x0, x1, x0, x0) .
  eq xA5 = buildOctet (x1, x0, x1, x0, x0, x1, x0, x1) .
  eq xA6 = buildOctet (x1, x0, x1, x0, x0, x1, x1, x0) .
  eq xA7 = buildOctet (x1, x0, x1, x0, x0, x1, x1, x1) .
  eq xA8 = buildOctet (x1, x0, x1, x0, x1, x0, x0, x0) .
  eq xA9 = buildOctet (x1, x0, x1, x0, x1, x0, x0, x1) .
  eq xAA = buildOctet (x1, x0, x1, x0, x1, x0, x1, x0) .
  eq xAB = buildOctet (x1, x0, x1, x0, x1, x0, x1, x1) .
  eq xAC = buildOctet (x1, x0, x1, x0, x1, x1, x0, x0) .
  eq xAE = buildOctet (x1, x0, x1, x0, x1, x1, x1, x0) .
  eq xAF = buildOctet (x1, x0, x1, x0, x1, x1, x1, x1) .
  eq xB0 = buildOctet (x1, x0, x1, x1, x0, x0, x0, x0) .
  eq xB1 = buildOctet (x1, x0, x1, x1, x0, x0, x0, x1) .
  eq xB2 = buildOctet (x1, x0, x1, x1, x0, x0, x1, x0) .
  eq xB3 = buildOctet (x1, x0, x1, x1, x0, x0, x1, x1) .
  eq xB5 = buildOctet (x1, x0, x1, x1, x0, x1, x0, x1) .
  eq xB6 = buildOctet (x1, x0, x1, x1, x0, x1, x1, x0) .
  eq xB8 = buildOctet (x1, x0, x1, x1, x1, x0, x0, x0) .
  eq xB9 = buildOctet (x1, x0, x1, x1, x1, x0, x0, x1) .
  eq xBA = buildOctet (x1, x0, x1, x1, x1, x0, x1, x0) .
  eq xBB = buildOctet (x1, x0, x1, x1, x1, x0, x1, x1) .
  eq xBC = buildOctet (x1, x0, x1, x1, x1, x1, x0, x0) .
  eq xBE = buildOctet (x1, x0, x1, x1, x1, x1, x1, x0) .
  eq xBF = buildOctet (x1, x0, x1, x1, x1, x1, x1, x1) .
  eq xC0 = buildOctet (x1, x1, x0, x0, x0, x0, x0, x0) .
  eq xC1 = buildOctet (x1, x1, x0, x0, x0, x0, x0, x1) .
  eq xC2 = buildOctet (x1, x1, x0, x0, x0, x0, x1, x0) .
  eq xC4 = buildOctet (x1, x1, x0, x0, x0, x1, x0, x0) .
  eq xC5 = buildOctet (x1, x1, x0, x0, x0, x1, x0, x1) .
  eq xC6 = buildOctet (x1, x1, x0, x0, x0, x1, x1, x0) .
  eq xC7 = buildOctet (x1, x1, x0, x0, x0, x1, x1, x1) .
  eq xC8 = buildOctet (x1, x1, x0, x0, x1, x0, x0, x0) .
  eq xC9 = buildOctet (x1, x1, x0, x0, x1, x0, x0, x1) .
  eq xCA = buildOctet (x1, x1, x0, x0, x1, x0, x1, x0) .
  eq xCB = buildOctet (x1, x1, x0, x0, x1, x0, x1, x1) .
  eq xCC = buildOctet (x1, x1, x0, x0, x1, x1, x0, x0) .
  eq xCD = buildOctet (x1, x1, x0, x0, x1, x1, x0, x1) .
  eq xCE = buildOctet (x1, x1, x0, x0, x1, x1, x1, x0) .
  eq xD0 = buildOctet (x1, x1, x0, x1, x0, x0, x0, x0) .
  eq xD1 = buildOctet (x1, x1, x0, x1, x0, x0, x0, x1) .
  eq xD2 = buildOctet (x1, x1, x0, x1, x0, x0, x1, x0) .
  eq xD3 = buildOctet (x1, x1, x0, x1, x0, x0, x1, x1) .
  eq xD4 = buildOctet (x1, x1, x0, x1, x0, x1, x0, x0) .
  eq xD5 = buildOctet (x1, x1, x0, x1, x0, x1, x0, x1) .
  eq xD6 = buildOctet (x1, x1, x0, x1, x0, x1, x1, x0) .
  eq xD7 = buildOctet (x1, x1, x0, x1, x0, x1, x1, x1) .
  eq xD8 = buildOctet (x1, x1, x0, x1, x1, x0, x0, x0) .
  eq xD9 = buildOctet (x1, x1, x0, x1, x1, x0, x0, x1) .
  eq xDB = buildOctet (x1, x1, x0, x1, x1, x0, x1, x1) .
  eq xDC = buildOctet (x1, x1, x0, x1, x1, x1, x0, x0) .
  eq xDD = buildOctet (x1, x1, x0, x1, x1, x1, x0, x1) .
  eq xDE = buildOctet (x1, x1, x0, x1, x1, x1, x1, x0) .
  eq xDF = buildOctet (x1, x1, x0, x1, x1, x1, x1, x1) .
  eq xE0 = buildOctet (x1, x1, x1, x0, x0, x0, x0, x0) .
  eq xE1 = buildOctet (x1, x1, x1, x0, x0, x0, x0, x1) .
  eq xE3 = buildOctet (x1, x1, x1, x0, x0, x0, x1, x1) .
  eq xE6 = buildOctet (x1, x1, x1, x0, x0, x1, x1, x0) .
  eq xE8 = buildOctet (x1, x1, x1, x0, x1, x0, x0, x0) .
  eq xE9 = buildOctet (x1, x1, x1, x0, x1, x0, x0, x1) .
  eq xEA = buildOctet (x1, x1, x1, x0, x1, x0, x1, x0) .
  eq xEB = buildOctet (x1, x1, x1, x0, x1, x0, x1, x1) .
  eq xEC = buildOctet (x1, x1, x1, x0, x1, x1, x0, x0) .
  eq xED = buildOctet (x1, x1, x1, x0, x1, x1, x0, x1) .
  eq xEE = buildOctet (x1, x1, x1, x0, x1, x1, x1, x0) .
  eq xEF = buildOctet (x1, x1, x1, x0, x1, x1, x1, x1) .
  eq xF0 = buildOctet (x1, x1, x1, x1, x0, x0, x0, x0) .
  eq xF1 = buildOctet (x1, x1, x1, x1, x0, x0, x0, x1) .
  eq xF2 = buildOctet (x1, x1, x1, x1, x0, x0, x1, x0) .
  eq xF3 = buildOctet (x1, x1, x1, x1, x0, x0, x1, x1) .
  eq xF4 = buildOctet (x1, x1, x1, x1, x0, x1, x0, x0) .
  eq xF5 = buildOctet (x1, x1, x1, x1, x0, x1, x0, x1) .
  eq xF6 = buildOctet (x1, x1, x1, x1, x0, x1, x1, x0) .
  eq xF7 = buildOctet (x1, x1, x1, x1, x0, x1, x1, x1) .
  eq xF8 = buildOctet (x1, x1, x1, x1, x1, x0, x0, x0) .
  eq xF9 = buildOctet (x1, x1, x1, x1, x1, x0, x0, x1) .
  eq xFA = buildOctet (x1, x1, x1, x1, x1, x0, x1, x0) .
  eq xFB = buildOctet (x1, x1, x1, x1, x1, x0, x1, x1) .
  eq xFC = buildOctet (x1, x1, x1, x1, x1, x1, x0, x0) .
  eq xFD = buildOctet (x1, x1, x1, x1, x1, x1, x0, x1) .
  eq xFE = buildOctet (x1, x1, x1, x1, x1, x1, x1, x0) .
  eq xFF = buildOctet (x1, x1, x1, x1, x1, x1, x1, x1) .
  eq andBlock (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = buildBlock (andOctet (O1, O-prime1), andOctet (O2, O-prime2), andOctet (O3, O-prime3), andOctet (O4, O-prime4)) .
  eq orBlock (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = buildBlock (orOctet (O1, O-prime1), orOctet (O2, O-prime2), orOctet (O3, O-prime3), orOctet (O4, O-prime4)) .
  eq xorBlock (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = buildBlock (xorOctet (O1, O-prime1), xorOctet (O2, O-prime2), xorOctet (O3, O-prime3), xorOctet (O4, O-prime4)) .
  eq x0001 = buildHalf (x00, x01) .
  eq x00000000 = buildBlock (x00, x00, x00, x00) .
  eq x00000001 = buildBlock (x00, x00, x00, x01) .
  eq x00000002 = buildBlock (x00, x00, x00, x02) .
  eq x00000003 = buildBlock (x00, x00, x00, x03) .
  eq x00000004 = buildBlock (x00, x00, x00, x04) .
  eq x00000005 = buildBlock (x00, x00, x00, x05) .
  eq x00000006 = buildBlock (x00, x00, x00, x06) .
  eq x00000007 = buildBlock (x00, x00, x00, x07) .
  eq x00000008 = buildBlock (x00, x00, x00, x08) .
  eq x00000009 = buildBlock (x00, x00, x00, x09) .
  eq x0000000A = buildBlock (x00, x00, x00, x0A) .
  eq x0000000B = buildBlock (x00, x00, x00, x0B) .
  eq x0000000C = buildBlock (x00, x00, x00, x0C) .
  eq x0000000D = buildBlock (x00, x00, x00, x0D) .
  eq x0000000E = buildBlock (x00, x00, x00, x0E) .
  eq x0000000F = buildBlock (x00, x00, x00, x0F) .
  eq x00000010 = buildBlock (x00, x00, x00, x10) .
  eq x00000012 = buildBlock (x00, x00, x00, x12) .
  eq x00000014 = buildBlock (x00, x00, x00, x14) .
  eq x00000016 = buildBlock (x00, x00, x00, x16) .
  eq x00000018 = buildBlock (x00, x00, x00, x18) .
  eq x0000001B = buildBlock (x00, x00, x00, x1B) .
  eq x0000001D = buildBlock (x00, x00, x00, x1D) .
  eq x0000001E = buildBlock (x00, x00, x00, x1E) .
  eq x0000001F = buildBlock (x00, x00, x00, x1F) .
  eq x00000031 = buildBlock (x00, x00, x00, x31) .
  eq x00000036 = buildBlock (x00, x00, x00, x36) .
  eq x00000060 = buildBlock (x00, x00, x00, x60) .
  eq x00000080 = buildBlock (x00, x00, x00, x80) .
  eq x000000A5 = buildBlock (x00, x00, x00, xA5) .
  eq x000000B6 = buildBlock (x00, x00, x00, xB6) .
  eq x000000C4 = buildBlock (x00, x00, x00, xC4) .
  eq x000000D2 = buildBlock (x00, x00, x00, xD2) .
  eq x00000100 = buildBlock (x00, x00, x01, x00) .
  eq x00000129 = buildBlock (x00, x00, x01, x29) .
  eq x0000018C = buildBlock (x00, x00, x01, x8C) .
  eq x00004000 = buildBlock (x00, x00, x40, x00) .
  eq x00010000 = buildBlock (x00, x01, x00, x00) .
  eq x00020000 = buildBlock (x00, x02, x00, x00) .
  eq x00030000 = buildBlock (x00, x03, x00, x00) .
  eq x00040000 = buildBlock (x00, x04, x00, x00) .
  eq x00060000 = buildBlock (x00, x06, x00, x00) .
  eq x00804021 = buildBlock (x00, x80, x40, x21) .
  eq x00FF00FF = buildBlock (x00, xFF, x00, xFF) .
  eq x0103050B = buildBlock (x01, x03, x05, x0B) .
  eq x01030703 = buildBlock (x01, x03, x07, x03) .
  eq x01030705 = buildBlock (x01, x03, x07, x05) .
  eq x0103070F = buildBlock (x01, x03, x07, x0F) .
  eq x02040801 = buildBlock (x02, x04, x08, x01) .
  eq x0297AF6F = buildBlock (x02, x97, xAF, x6F) .
  eq x07050301 = buildBlock (x07, x05, x03, x01) .
  eq x077788A2 = buildBlock (x07, x77, x88, xA2) .
  eq x07C72EAA = buildBlock (x07, xC7, x2E, xAA) .
  eq x0A202020 = buildBlock (x0A, x20, x20, x20) .
  eq x0AD67E20 = buildBlock (x0A, xD6, x7E, x20) .
  eq x10000000 = buildBlock (x10, x00, x00, x00) .
  eq x11A9D254 = buildBlock (x11, xA9, xD2, x54) .
  eq x11AC46B8 = buildBlock (x11, xAC, x46, xB8) .
  eq x1277A6D4 = buildBlock (x12, x77, xA6, xD4) .
  eq x13647149 = buildBlock (x13, x64, x71, x49) .
  eq x160EE9B5 = buildBlock (x16, x0E, xE9, xB5) .
  eq x17065DBB = buildBlock (x17, x06, x5D, xBB) .
  eq x17A808FD = buildBlock (x17, xA8, x08, xFD) .
  eq x1D10D8D3 = buildBlock (x1D, x10, xD8, xD3) .
  eq x1D3B7760 = buildBlock (x1D, x3B, x77, x60) .
  eq x1D9C9655 = buildBlock (x1D, x9C, x96, x55) .
  eq x1F3F7FFF = buildBlock (x1F, x3F, x7F, xFF) .
  eq x204E80A7 = buildBlock (x20, x4E, x80, xA7) .
  eq x21D869BA = buildBlock (x21, xD8, x69, xBA) .
  eq x24B66FB5 = buildBlock (x24, xB6, x6F, xB5) .
  eq x270EEDAF = buildBlock (x27, x0E, xED, xAF) .
  eq x277B4B25 = buildBlock (x27, x7B, x4B, x25) .
  eq x2829040B = buildBlock (x28, x29, x04, x0B) .
  eq x288FC786 = buildBlock (x28, x8F, xC7, x86) .
  eq x28EAD8B3 = buildBlock (x28, xEA, xD8, xB3) .
  eq x29907CD8 = buildBlock (x29, x90, x7C, xD8) .
  eq x29C1485F = buildBlock (x29, xC1, x48, x5F) .
  eq x29EEE96B = buildBlock (x29, xEE, xE9, x6B) .
  eq x2A6091AE = buildBlock (x2A, x60, x91, xAE) .
  eq x2BF8499A = buildBlock (x2B, xF8, x49, x9A) .
  eq x2E80AC30 = buildBlock (x2E, x80, xAC, x30) .
  eq x2FD76FFB = buildBlock (x2F, xD7, x6F, xFB) .
  eq x30261492 = buildBlock (x30, x26, x14, x92) .
  eq x303FF4AA = buildBlock (x30, x3F, xF4, xAA) .
  eq x33D5A466 = buildBlock (x33, xD5, xA4, x66) .
  eq x344925FC = buildBlock (x34, x49, x25, xFC) .
  eq x34ACF886 = buildBlock (x34, xAC, xF8, x86) .
  eq x3CD54DEB = buildBlock (x3C, xD5, x4D, xEB) .
  eq x3CF3A7D2 = buildBlock (x3C, xF3, xA7, xD2) .
  eq x3DD81AC6 = buildBlock (x3D, xD8, x1A, xC6) .
  eq x3F6F7248 = buildBlock (x3F, x6F, x72, x48) .
  eq x48B204D6 = buildBlock (x48, xB2, x04, xD6) .
  eq x4A645A01 = buildBlock (x4A, x64, x5A, x01) .
  eq x4C49AAE0 = buildBlock (x4C, x49, xAA, xE0) .
  eq x4CE933E1 = buildBlock (x4C, xE9, x33, xE1) .
  eq x4D53901A = buildBlock (x4D, x53, x90, x1A) .
  eq x4DA124A1 = buildBlock (x4D, xA1, x24, xA1) .
  eq x4F998E01 = buildBlock (x4F, x99, x8E, x01) .
  eq x4FB1138A = buildBlock (x4F, xB1, x13, x8A) .
  eq x50DEC930 = buildBlock (x50, xDE, xC9, x30) .
  eq x51AF3C1D = buildBlock (x51, xAF, x3C, x1D) .
  eq x51EDE9C7 = buildBlock (x51, xED, xE9, xC7) .
  eq x550D91CE = buildBlock (x55, x0D, x91, xCE) .
  eq x55555555 = buildBlock (x55, x55, x55, x55) .
  eq x55DD063F = buildBlock (x55, xDD, x06, x3F) .
  eq x5834A585 = buildBlock (x58, x34, xA5, x85) .
  eq x5A35D667 = buildBlock (x5A, x35, xD6, x67) .
  eq x5BC02502 = buildBlock (x5B, xC0, x25, x02) .
  eq x5CCA3239 = buildBlock (x5C, xCA, x32, x39) .
  eq x5EBA06C2 = buildBlock (x5E, xBA, x06, xC2) .
  eq x5F38EEF1 = buildBlock (x5F, x38, xEE, xF1) .
  eq x613F8E2A = buildBlock (x61, x3F, x8E, x2A) .
  eq x63C70DBA = buildBlock (x63, xC7, x0D, xBA) .
  eq x6AD6E8A4 = buildBlock (x6A, xD6, xE8, xA4) .
  eq x6AEBACF8 = buildBlock (x6A, xEB, xAC, xF8) .
  eq x6D67E884 = buildBlock (x6D, x67, xE8, x84) .
  eq x7050EC5E = buildBlock (x70, x50, xEC, x5E) .
  eq x717153D5 = buildBlock (x71, x71, x53, xD5) .
  eq x7201F4DC = buildBlock (x72, x01, xF4, xDC) .
  eq x7397C9AE = buildBlock (x73, x97, xC9, xAE) .
  eq x74B39176 = buildBlock (x74, xB3, x91, x76) .
  eq x76232E5F = buildBlock (x76, x23, x2E, x5F) .
  eq x7783C51D = buildBlock (x77, x83, xC5, x1D) .
  eq x7792F9D4 = buildBlock (x77, x92, xF9, xD4) .
  eq x7BC180AB = buildBlock (x7B, xC1, x80, xAB) .
  eq x7DB2D9F4 = buildBlock (x7D, xB2, xD9, xF4) .
  eq x7DFEFBFF = buildBlock (x7D, xFE, xFB, xFF) .
  eq x7F76A3B0 = buildBlock (x7F, x76, xA3, xB0) .
  eq x7F839576 = buildBlock (x7F, x83, x95, x76) .
  eq x7FFFFFF0 = buildBlock (x7F, xFF, xFF, xF0) .
  eq x7FFFFFF1 = buildBlock (x7F, xFF, xFF, xF1) .
  eq x7FFFFFFC = buildBlock (x7F, xFF, xFF, xFC) .
  eq x7FFFFFFD = buildBlock (x7F, xFF, xFF, xFD) .
  eq x80000000 = buildBlock (x80, x00, x00, x00) .
  eq x80000002 = buildBlock (x80, x00, x00, x02) .
  eq x800000C2 = buildBlock (x80, x00, x00, xC2) .
  eq x80018000 = buildBlock (x80, x01, x80, x00) .
  eq x80018001 = buildBlock (x80, x01, x80, x01) .
  eq x80397302 = buildBlock (x80, x39, x73, x02) .
  eq x81D10CA3 = buildBlock (x81, xD1, x0C, xA3) .
  eq x89D635D7 = buildBlock (x89, xD6, x35, xD7) .
  eq x8CE37709 = buildBlock (x8C, xE3, x77, x09) .
  eq x8DC8BBDE = buildBlock (x8D, xC8, xBB, xDE) .
  eq x9115A558 = buildBlock (x91, x15, xA5, x58) .
  eq x91896CFA = buildBlock (x91, x89, x6C, xFA) .
  eq x9372CDC6 = buildBlock (x93, x72, xCD, xC6) .
  eq x98D1CC75 = buildBlock (x98, xD1, xCC, x75) .
  eq x9D15C437 = buildBlock (x9D, x15, xC4, x37) .
  eq x9DB15CF6 = buildBlock (x9D, xB1, x5C, xF6) .
  eq x9E2E7B36 = buildBlock (x9E, x2E, x7B, x36) .
  eq xA018C83B = buildBlock (xA0, x18, xC8, x3B) .
  eq xA0B87B77 = buildBlock (xA0, xB8, x7B, x77) .
  eq xA44AAAC0 = buildBlock (xA4, x4A, xAA, xC0) .
  eq xA511987A = buildBlock (xA5, x11, x98, x7A) .
  eq xA70FC148 = buildBlock (xA7, x0F, xC1, x48) .
  eq xA93BD410 = buildBlock (xA9, x3B, xD4, x10) .
  eq xAAAAAAAA = buildBlock (xAA, xAA, xAA, xAA) .
  eq xAB00FFCD = buildBlock (xAB, x00, xFF, xCD) .
  eq xAB01FCCD = buildBlock (xAB, x01, xFC, xCD) .
  eq xAB6EED4A = buildBlock (xAB, x6E, xED, x4A) .
  eq xABEEED6B = buildBlock (xAB, xEE, xED, x6B) .
  eq xACBC13DD = buildBlock (xAC, xBC, x13, xDD) .
  eq xB1CC1CC5 = buildBlock (xB1, xCC, x1C, xC5) .
  eq xB8142629 = buildBlock (xB8, x14, x26, x29) .
  eq xB99A62DE = buildBlock (xB9, x9A, x62, xDE) .
  eq xBA92DB12 = buildBlock (xBA, x92, xDB, x12) .
  eq xBBA57835 = buildBlock (xBB, xA5, x78, x35) .
  eq xBE9F0917 = buildBlock (xBE, x9F, x09, x17) .
  eq xBF2D7D85 = buildBlock (xBF, x2D, x7D, x85) .
  eq xBFEF7FDF = buildBlock (xBF, xEF, x7F, xDF) .
  eq xC1ED90DD = buildBlock (xC1, xED, x90, xDD) .
  eq xC21A1846 = buildBlock (xC2, x1A, x18, x46) .
  eq xC4EB1AEB = buildBlock (xC4, xEB, x1A, xEB) .
  eq xC6B1317E = buildBlock (xC6, xB1, x31, x7E) .
  eq xCBC865BA = buildBlock (xCB, xC8, x65, xBA) .
  eq xCD959B46 = buildBlock (xCD, x95, x9B, x46) .
  eq xD0482465 = buildBlock (xD0, x48, x24, x65) .
  eq xD636250D = buildBlock (xD6, x36, x25, x0D) .
  eq xD7843FDC = buildBlock (xD7, x84, x3F, xDC) .
  eq xD78634BC = buildBlock (xD7, x86, x34, xBC) .
  eq xD8804CA5 = buildBlock (xD8, x80, x4C, xA5) .
  eq xDB79FBDC = buildBlock (xDB, x79, xFB, xDC) .
  eq xDB9102B0 = buildBlock (xDB, x91, x02, xB0) .
  eq xE0C08000 = buildBlock (xE0, xC0, x80, x00) .
  eq xE6A12F07 = buildBlock (xE6, xA1, x2F, x07) .
  eq xEB35B97F = buildBlock (xEB, x35, xB9, x7F) .
  eq xF0239DD5 = buildBlock (xF0, x23, x9D, xD5) .
  eq xF14D6E28 = buildBlock (xF1, x4D, x6E, x28) .
  eq xF2EF3501 = buildBlock (xF2, xEF, x35, x01) .
  eq xF6A09667 = buildBlock (xF6, xA0, x96, x67) .
  eq xFD297DA4 = buildBlock (xFD, x29, x7D, xA4) .
  eq xFDC1A8BA = buildBlock (xFD, xC1, xA8, xBA) .
  eq xFE4E5BDD = buildBlock (xFE, x4E, x5B, xDD) .
  eq xFEA1D334 = buildBlock (xFE, xA1, xD3, x34) .
  eq xFECCAA6E = buildBlock (xFE, xCC, xAA, x6E) .
  eq xFEFC07F0 = buildBlock (xFE, xFC, x07, xF0) .
  eq xFF2D7DA5 = buildBlock (xFF, x2D, x7D, xA5) .
  eq xFFEF0001 = buildBlock (xFF, xEF, x00, x01) .
  eq xFFFF00FF = buildBlock (xFF, xFF, x00, xFF) .
  eq xFFFFFF2D = buildBlock (xFF, xFF, xFF, x2D) .
  eq xFFFFFF3A = buildBlock (xFF, xFF, xFF, x3A) .
  eq xFFFFFFF0 = buildBlock (xFF, xFF, xFF, xF0) .
  eq xFFFFFFF1 = buildBlock (xFF, xFF, xFF, xF1) .
  eq xFFFFFFF4 = buildBlock (xFF, xFF, xFF, xF4) .
  eq xFFFFFFF5 = buildBlock (xFF, xFF, xFF, xF5) .
  eq xFFFFFFF7 = buildBlock (xFF, xFF, xFF, xF7) .
  eq xFFFFFFF9 = buildBlock (xFF, xFF, xFF, xF9) .
  eq xFFFFFFFA = buildBlock (xFF, xFF, xFF, xFA) .
  eq xFFFFFFFB = buildBlock (xFF, xFF, xFF, xFB) .
  eq xFFFFFFFC = buildBlock (xFF, xFF, xFF, xFC) .
  eq xFFFFFFFD = buildBlock (xFF, xFF, xFF, xFD) .
  eq xFFFFFFFE = buildBlock (xFF, xFF, xFF, xFE) .
  eq xFFFFFFFF = buildBlock (xFF, xFF, xFF, xFF) .
  eq appendMessage (unitMessage (W:Block), W-prime:Block) = consMessage (W, unitMessage (W-prime)) .
  eq appendMessage (consMessage (W:Block, M:Message), W-prime:Block) = consMessage (W, appendMessage (M, W-prime)) .
  eq reverseMessage (unitMessage (W:Block)) = unitMessage (W) .
  eq reverseMessage (consMessage (W:Block, M:Message)) = appendMessage (reverseMessage (M), W) .
  ceq makeMessage (succ (N:Xnat), W:Block, W-prime:Block) = unitMessage (W) if eqNat (N, zero) == Xtrue .
  ceq makeMessage (succ (N:Xnat), W:Block, W-prime:Block) = consMessage (W, makeMessage (N, ADD (W, W-prime), W-prime)) if eqNat (N, zero) == Xfalse .
  eq ADD (W:Block, W-prime:Block) = addBlock (W, W-prime) .
  eq AND (W:Block, W-prime:Block) = andBlock (W, W-prime) .
  eq MUL (W:Block, W-prime:Block) = mulBlock (W, W-prime) .
  eq OR (W:Block, W-prime:Block) = orBlock (W, W-prime) .
  eq XOR (W:Block, W-prime:Block) = xorBlock (W, W-prime) .
  eq XOR-prime (buildPair (W:Block, W-prime:Block)) = XOR (W, W-prime) .
  eq CYC (buildBlock (buildOctet (B1:Bit, B2:Bit, B3:Bit, B4:Bit, B5:Bit, B6:Bit, B7:Bit, B8:Bit), buildOctet (B9:Bit, B10:Bit, B11:Bit, B12:Bit, B13:Bit, B14:Bit, B15:Bit, B16:Bit), buildOctet (B17:Bit, B18:Bit, B19:Bit, B20:Bit, B21:Bit, B22:Bit, B23:Bit, B24:Bit), buildOctet (B25:Bit, B26:Bit, B27:Bit, B28:Bit, B29:Bit, B30:Bit, B31:Bit, B32:Bit))) = buildBlock (buildOctet (B2, B3, B4, B5, B6, B7, B8, B9), buildOctet (B10, B11, B12, B13, B14, B15, B16, B17), buildOctet (B18, B19, B20, B21, B22, B23, B24, B25), buildOctet (B26, B27, B28, B29, B30, B31, B32, B1)) .
  eq nCYC (zero, W:Block) = W .
  eq nCYC (succ (N:Xnat), W:Block) = CYC (nCYC (N, W)) .
  eq FIX1 (W:Block) = AND (OR (W, x02040801), xBFEF7FDF) .
  eq FIX2 (W:Block) = AND (OR (W, x00804021), x7DFEFBFF) .
  eq needAdjust (O:Octet) = orBool (eqOctet (O, x00), eqOctet (O, xFF)) .
  ceq adjustCode (O:Octet) = x1 if needAdjust (O) == Xtrue .
  ceq adjustCode (O:Octet) = x0 if needAdjust (O) == Xfalse .
  ceq adjust (O:Octet, O-prime:Octet) = xorOctet (O, O-prime) if needAdjust (O) == Xtrue .
  ceq adjust (O:Octet, O-prime:Octet) = O if needAdjust (O) == Xfalse .
  eq PAT (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = buildOctet (adjustCode (O1), adjustCode (O2), adjustCode (O3), adjustCode (O4), adjustCode (O-prime1), adjustCode (O-prime2), adjustCode (O-prime3), adjustCode (O-prime4)) .
  eq BYT (buildBlock (O1:Octet, O2:Octet, O3:Octet, O4:Octet), buildBlock (O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet)) = BYT-prime (O1, O2, O3, O4, O-prime1, O-prime2, O-prime3, O-prime4, PAT (buildBlock (O1, O2, O3, O4), buildBlock (O-prime1, O-prime2, O-prime3, O-prime4))) .
  eq BYT-prime (O1:Octet, O2:Octet, O3:Octet, O4:Octet, O-prime1:Octet, O-prime2:Octet, O-prime3:Octet, O-prime4:Octet, Opat:Octet) = buildPair (buildBlock (adjust (O1, rightOctet7 (Opat)), adjust (O2, rightOctet6 (Opat)), adjust (O3, rightOctet5 (Opat)), adjust (O4, rightOctet4 (Opat))), buildBlock (adjust (O-prime1, rightOctet3 (Opat)), adjust (O-prime2, rightOctet2 (Opat)), adjust (O-prime3, rightOctet1 (Opat)), adjust (O-prime4, Opat))) .
  eq ADDC (W:Block, W-prime:Block) = ADDC-prime (addBlockSum (W, W-prime)) .
  eq ADDC-prime (buildBlockSum (x0, W:Block)) = buildPair (x00000000, W) .
  eq ADDC-prime (buildBlockSum (x1, W:Block)) = buildPair (x00000001, W) .
  eq MUL1 (W:Block, W-prime:Block) = MUL1XY (MUL (W, W-prime)) .
  eq MUL1XY (buildPair (W:Block, W-prime:Block)) = MUL1UL (W, W-prime) .
  eq MUL1UL (W:Block, W-prime:Block) = MUL1SC (ADDC (W, W-prime)) .
  eq MUL1SC (buildPair (Wcarry:Block, W:Block)) = ADD (W, Wcarry) .
  eq MUL2 (W:Block, W-prime:Block) = MUL2XY (MUL (W, W-prime)) .
  eq MUL2XY (buildPair (W:Block, W-prime:Block)) = MUL2UL (W, W-prime) .
  eq MUL2UL (W:Block, W-prime:Block) = MUL2DEL (ADDC (W, W), W-prime) .
  eq MUL2DEL (buildPair (Wcarry:Block, W:Block), W-prime:Block) = MUL2FL (ADD (W, ADD (Wcarry, Wcarry)), W-prime) .
  eq MUL2FL (W:Block, W-prime:Block) = MUL2SC (ADDC (W, W-prime)) .
  eq MUL2SC (buildPair (Wcarry:Block, W:Block)) = ADD (W, ADD (Wcarry, Wcarry)) .
  eq MUL2A (W:Block, W-prime:Block) = MUL2AXY (MUL (W, W-prime)) .
  eq MUL2AXY (buildPair (W:Block, W-prime:Block)) = MUL2AUL (W, W-prime) .
  eq MUL2AUL (W:Block, W-prime:Block) = MUL2ADL (ADD (W, W), W-prime) .
  eq MUL2ADL (W:Block, W-prime:Block) = MUL2ASC (ADDC (W, W-prime)) .
  eq MUL2ASC (buildPair (Wcarry:Block, W:Block)) = ADD (W, ADD (Wcarry, Wcarry)) .
  eq squareHalf (H:Half) = mulHalf (H, H) .
  eq Q (O:Octet) = squareHalf (addHalf (buildHalf (x00, O), x0001)) .
  eq J1-2 (W:Block) = MUL1 (W, W) .
  eq J1-4 (W:Block) = MUL1 (J1-2 (W), J1-2 (W)) .
  eq J1-6 (W:Block) = MUL1 (J1-2 (W), J1-4 (W)) .
  eq J1-8 (W:Block) = MUL1 (J1-2 (W), J1-6 (W)) .
  eq J2-2 (W:Block) = MUL2 (W, W) .
  eq J2-4 (W:Block) = MUL2 (J2-2 (W), J2-2 (W)) .
  eq J2-6 (W:Block) = MUL2 (J2-2 (W), J2-4 (W)) .
  eq J2-8 (W:Block) = MUL2 (J2-2 (W), J2-6 (W)) .
  eq K1-2 (W:Block) = MUL1 (W, W) .
  eq K1-4 (W:Block) = MUL1 (K1-2 (W), K1-2 (W)) .
  eq K1-5 (W:Block) = MUL1 (W, K1-4 (W)) .
  eq K1-7 (W:Block) = MUL1 (K1-2 (W), K1-5 (W)) .
  eq K1-9 (W:Block) = MUL1 (K1-2 (W), K1-7 (W)) .
  eq K2-2 (W:Block) = MUL2 (W, W) .
  eq K2-4 (W:Block) = MUL2 (K2-2 (W), K2-2 (W)) .
  eq K2-5 (W:Block) = MUL2 (W, K2-4 (W)) .
  eq K2-7 (W:Block) = MUL2 (K2-2 (W), K2-5 (W)) .
  eq K2-9 (W:Block) = MUL2 (K2-2 (W), K2-7 (W)) .
  eq H4 (W:Block) = XOR (J1-4 (W), J2-4 (W)) .
  eq H6 (W:Block) = XOR (J1-6 (W), J2-6 (W)) .
  eq H8 (W:Block) = XOR (J1-8 (W), J2-8 (W)) .
  eq H0 (W:Block) = XOR (K1-5 (W), K2-5 (W)) .
  eq H5 (W:Block, O:Octet) = MUL2 (H0 (W), Q (O)) .
  eq H7 (W:Block) = XOR (K1-7 (W), K2-7 (W)) .
  eq H9 (W:Block) = XOR (K1-9 (W), K2-9 (W)) .
  eq splitSegment (unitMessage (W:Block)) = unitSegment (unitMessage (W)) .
  eq splitSegment (consMessage (W:Block, M:Message)) = cutSegment (M, unitMessage (W), n254) .
  eq cutSegment (unitMessage (W:Block), M-prime:Message, N:Xnat) = unitSegment (reverseMessage (consMessage (W, M-prime))) .
  eq cutSegment (consMessage (W:Block, M:Message), M-prime:Message, zero) = consSegment (reverseMessage (consMessage (W, M-prime)), splitSegment (M)) .
  eq cutSegment (consMessage (W:Block, M:Message), M-prime:Message, succ (N:Xnat)) = cutSegment (M, consMessage (W, M-prime), N) .
  eq preludeXY (W1:Block, W2:Block) = preludeXY-prime (BYT (W1, W2), PAT (W1, W2)) .
  eq preludeVW (W1:Block, W2:Block) = preludeVW-prime (BYT (W1, W2)) .
  eq preludeST (W1:Block, W2:Block) = preludeST-prime (BYT (W1, W2)) .
  eq preludeXY-prime (buildPair (W:Block, W-prime:Block), O:Octet) = BYT (H4 (W), H5 (W-prime, O)) .
  eq preludeVW-prime (buildPair (W:Block, W-prime:Block)) = BYT (H6 (W), H7 (W-prime)) .
  eq preludeST-prime (buildPair (W:Block, W-prime:Block)) = BYT (H8 (W), H9 (W-prime)) .
  eq computeXY (P:Pair, P-prime:Pair, W:Block) = computeXY-prime (P, W, XOR-prime (computeVW (P-prime))) .
  eq computeXY-prime (buildPair (W1:Block, W2:Block), W:Block, W-prime:Block) = buildPair (MUL1 (XOR (W1, W), FIX1 (ADD (XOR (W2, W), W-prime))), MUL2A (XOR (W2, W), FIX2 (ADD (XOR (W1, W), W-prime)))) .
  eq computeVW (buildPair (W1:Block, W2:Block)) = buildPair (CYC (W1), W2) .
  eq loop1 (P:Pair, P-prime:Pair, unitMessage (W:Block)) = computeXY (P, P-prime, W) .
  eq loop1 (P:Pair, P-prime:Pair, consMessage (W:Block, M:Message)) = loop1 (computeXY (P, P-prime, W), computeVW (P-prime), M) .
  eq loop2 (P:Pair, P-prime:Pair, unitMessage (W:Block)) = computeVW (P-prime) .
  eq loop2 (P:Pair, P-prime:Pair, consMessage (W:Block, M:Message)) = loop2 (computeXY (P, P-prime, W), computeVW (P-prime), M) .
  eq coda (P:Pair, P-prime:Pair, buildPair (W:Block, W-prime:Block)) = XOR-prime (computeXY (computeXY (P, P-prime, W), computeVW (P-prime), W-prime)) .
  eq MAA (buildKey (W1:Block, W2:Block), M:Message) = MAA-prime (preludeXY (W1, W2), preludeVW (W1, W2), preludeST (W1, W2), M) .
  eq MAA-prime (P1:Pair, P2:Pair, P3:Pair, M:Message) = coda (loop1 (P1, P2, M), loop2 (P1, P2, M), P3) .
  eq MAC (K:Key, M:Message) = MACfirst (K, splitSegment (M)) .
  eq MACfirst (K:Key, unitSegment (M:Message)) = MAA (K, M) .
  eq MACfirst (K:Key, consSegment (M:Message, S:SegmentedMessage)) = MACnext (K, MAA (K, M), S) .
  eq MACnext (K:Key, W:Block, unitSegment (M:Message)) = MAA (K, consMessage (W, M)) .
  eq MACnext (K:Key, W:Block, consSegment (M:Message, S:SegmentedMessage)) = MACnext (K, MAA (K, consMessage (W, M)), S) .
}
select MAA .
red eqBlock (MUL1 (x0000000F, x0000000E), x000000D2) .
red eqBlock (MUL1 (xFFFFFFF0, x0000000E), xFFFFFF2D) .
red eqBlock (MUL1 (xFFFFFFF0, xFFFFFFF1), x000000D2) .
red eqBlock (MUL2 (x0000000F, x0000000E), x000000D2) .
red eqBlock (MUL2 (xFFFFFFF0, x0000000E), xFFFFFF3A) .
red eqBlock (MUL2 (xFFFFFFF0, xFFFFFFF1), x000000B6) .
red eqBlock (MUL2A (x0000000F, x0000000E), x000000D2) .
red eqBlock (MUL2A (xFFFFFFF0, x0000000E), xFFFFFF3A) .
red eqBlock (MUL2A (x7FFFFFF0, xFFFFFFF1), x800000C2) .
red eqBlock (MUL2A (xFFFFFFF0, x7FFFFFF1), x000000C4) .
red eqPair (BYT (x00000000, x00000000), buildPair (x0103070F, x1F3F7FFF)) .
red eqPair (BYT (xFFFF00FF, xFFFFFFFF), buildPair (xFEFC07F0, xE0C08000)) .
red eqPair (BYT (xAB00FFCD, xFFEF0001), buildPair (xAB01FCCD, xF2EF3501)) .
red eqOctet (PAT (x00000000, x00000000), xFF) .
red eqOctet (PAT (xFFFF00FF, xFFFFFFFF), xFF) .
red eqOctet (PAT (xAB00FFCD, xFFEF0001), x6A) .
red eqBlock (J1-2 (x00000100), x00010000) .
red eqBlock (J1-4 (x00000100), x00000001) .
red eqBlock (J1-6 (x00000100), x00010000) .
red eqBlock (J1-8 (x00000100), x00000001) .
red eqBlock (J2-2 (x00000100), x00010000) .
red eqBlock (J2-4 (x00000100), x00000002) .
red eqBlock (J2-6 (x00000100), x00020000) .
red eqBlock (J2-8 (x00000100), x00000004) .
red eqBlock (H4 (x00000100), x00000003) .
red eqBlock (H6 (x00000100), x00030000) .
red eqBlock (H8 (x00000100), x00000005) .
red eqBlock (K1-2 (x00000080), x00004000) .
red eqBlock (K1-4 (x00000080), x10000000) .
red eqBlock (K1-5 (x00000080), x00000008) .
red eqBlock (K1-7 (x00000080), x00020000) .
red eqBlock (K1-9 (x00000080), x80000000) .
red eqBlock (K2-2 (x00000080), x00004000) .
red eqBlock (K2-4 (x00000080), x10000000) .
red eqBlock (K2-5 (x00000080), x00000010) .
red eqBlock (K2-7 (x00000080), x00040000) .
red eqBlock (K2-9 (x00000080), x00000002) .
red eqBlock (H0 (x00000080), x00000018) .
red eqBlock (Q (x01), x00000004) .
red eqBlock (H5 (x00000080, x01), x00000060) .
red eqBlock (H7 (x00000080), x00060000) .
red eqBlock (H9 (x00000080), x80000002) .
red eqOctet (PAT (x00000003, x00000060), xEE) .
red eqOctet (PAT (x00030000, x00060000), xBB) .
red eqOctet (PAT (x00000005, x80000002), xE6) .
red eqPair (BYT (x00000003, x00000060), buildPair (x01030703, x1D3B7760)) .
red eqPair (BYT (x00030000, x00060000), buildPair (x0103050B, x17065DBB)) .
red eqPair (BYT (x00000005, x80000002), buildPair (x01030705, x80397302)) .
red eqBlock (CYC (x00000003), x00000006) .
red eqBlock (XOR (x00000006, x00000003), x00000005) .
red eqBlock (XOR (x00000002, x00000005), x00000007) .
red eqBlock (XOR (x00000003, x00000005), x00000006) .
red eqBlock (ADD (x00000005, x00000006), x0000000B) .
red eqBlock (ADD (x00000005, x00000007), x0000000C) .
red eqBlock (OR (x0000000B, x00000004), x0000000F) .
red eqBlock (OR (x0000000C, x00000001), x0000000D) .
red eqBlock (AND (x0000000F, xFFFFFFF7), x00000007) .
red eqBlock (AND (x0000000D, xFFFFFFFB), x00000009) .
red eqBlock (MUL1 (x00000007, x00000007), x00000031) .
red eqBlock (MUL2A (x00000006, x00000009), x00000036) .
red eqBlock (XOR (x00000031, x00000036), x00000007) .
red eqBlock (CYC (x00000003), x00000006) .
red eqBlock (XOR (x00000006, x00000003), x00000005) .
red eqBlock (XOR (xFFFFFFFD, x00000001), xFFFFFFFC) .
red eqBlock (XOR (xFFFFFFFC, x00000001), xFFFFFFFD) .
red eqBlock (ADD (x00000005, xFFFFFFFD), x00000002) .
red eqBlock (ADD (x00000005, xFFFFFFFC), x00000001) .
red eqBlock (OR (x00000002, x00000001), x00000003) .
red eqBlock (OR (x00000001, x00000004), x00000005) .
red eqBlock (AND (x00000003, xFFFFFFF9), x00000001) .
red eqBlock (AND (x00000005, xFFFFFFFC), x00000004) .
red eqBlock (MUL1 (xFFFFFFFC, x00000001), xFFFFFFFC) .
red eqBlock (MUL2A (xFFFFFFFD, x00000004), xFFFFFFFA) .
red eqBlock (XOR (xFFFFFFFC, xFFFFFFFA), x00000006) .
red eqBlock (CYC (x00000007), x0000000E) .
red eqBlock (XOR (x0000000E, x00000007), x00000009) .
red eqBlock (XOR (xFFFFFFFD, x00000008), xFFFFFFF5) .
red eqBlock (XOR (xFFFFFFFC, x00000008), xFFFFFFF4) .
red eqBlock (ADD (x00000009, xFFFFFFF4), xFFFFFFFD) .
red eqBlock (ADD (x00000009, xFFFFFFF5), xFFFFFFFE) .
red eqBlock (OR (xFFFFFFFD, x00000001), xFFFFFFFD) .
red eqBlock (OR (xFFFFFFFE, x00000002), xFFFFFFFE) .
red eqBlock (AND (xFFFFFFFD, xFFFFFFFE), xFFFFFFFC) .
red eqBlock (AND (xFFFFFFFE, x7FFFFFFD), x7FFFFFFC) .
red eqBlock (MUL1 (xFFFFFFF5, xFFFFFFFC), x0000001E) .
red eqBlock (MUL2A (xFFFFFFF4, x7FFFFFFC), x0000001E) .
red eqBlock (XOR (x0000001E, x0000001E), x00000000) .
red eqBlock (CYC (x00000001), x00000002) .
red eqBlock (XOR (x00000002, x00000001), x00000003) .
red eqBlock (XOR (x00000001, x00000000), x00000001) .
red eqBlock (XOR (x00000002, x00000000), x00000002) .
red eqBlock (ADD (x00000003, x00000002), x00000005) .
red eqBlock (ADD (x00000003, x00000001), x00000004) .
red eqBlock (OR (x00000005, x00000002), x00000007) .
red eqBlock (OR (x00000004, x00000001), x00000005) .
red eqBlock (AND (x00000007, xFFFFFFFB), x00000003) .
red eqBlock (AND (x00000005, xFFFFFFFB), x00000001) .
red eqBlock (MUL1 (x00000001, x00000003), x00000003) .
red eqBlock (MUL2A (x00000002, x00000001), x00000002) .
red eqBlock (XOR (x00000003, x00000002), x00000001) .
red eqBlock (CYC (x00000002), x00000004) .
red eqBlock (XOR (x00000004, x00000001), x00000005) .
red eqBlock (XOR (x00000003, x00000001), x00000002) .
red eqBlock (XOR (x00000002, x00000001), x00000003) .
red eqBlock (ADD (x00000005, x00000003), x00000008) .
red eqBlock (ADD (x00000005, x00000002), x00000007) .
red eqBlock (OR (x00000008, x00000002), x0000000A) .
red eqBlock (OR (x00000007, x00000001), x00000007) .
red eqBlock (AND (x0000000A, xFFFFFFFB), x0000000A) .
red eqBlock (AND (x00000007, xFFFFFFFB), x00000003) .
red eqBlock (MUL1 (x00000002, x0000000A), x00000014) .
red eqBlock (MUL2A (x00000003, x00000003), x00000009) .
red eqBlock (XOR (x00000014, x00000009), x0000001D) .
red eqBlock (CYC (x00000004), x00000008) .
red eqBlock (XOR (x00000008, x00000001), x00000009) .
red eqBlock (XOR (x00000014, x00000002), x00000016) .
red eqBlock (XOR (x00000009, x00000002), x0000000B) .
red eqBlock (ADD (x00000009, x0000000B), x00000014) .
red eqBlock (ADD (x00000009, x00000016), x0000001F) .
red eqBlock (OR (x00000014, x00000002), x00000016) .
red eqBlock (OR (x0000001F, x00000001), x0000001F) .
red eqBlock (AND (x00000016, xFFFFFFFB), x00000012) .
red eqBlock (AND (x0000001F, xFFFFFFFB), x0000001B) .
red eqBlock (MUL1 (x00000016, x00000012), x0000018C) .
red eqBlock (MUL2A (x0000000B, x0000001B), x00000129) .
red eqBlock (XOR (x0000018C, x00000129), x000000A5) .
red eqBlock (CYC (xC4EB1AEB), x89D635D7) .
red eqBlock (XOR (x89D635D7, xF6A09667), x7F76A3B0) .
red eqBlock (XOR (x21D869BA, x0A202020), x2BF8499A) .
red eqBlock (XOR (x7792F9D4, x0A202020), x7DB2D9F4) .
red eqBlock (ADD (x7F76A3B0, x7DB2D9F4), xFD297DA4) .
red eqBlock (ADD (x7F76A3B0, x2BF8499A), xAB6EED4A) .
red eqBlock (OR (xFD297DA4, x02040801), xFF2D7DA5) .
red eqBlock (OR (xAB6EED4A, x00804021), xABEEED6B) .
red eqBlock (AND (xFF2D7DA5, xBFEF7FDF), xBF2D7D85) .
red eqBlock (AND (xABEEED6B, x7DFEFBFF), x29EEE96B) .
red eqBlock (MUL1 (x2BF8499A, xBF2D7D85), x0AD67E20) .
red eqBlock (MUL2A (x7DB2D9F4, x29EEE96B), x30261492) .
red eqOctet (PAT (x00FF00FF, x00000000), xFF) .
red eqPair (preludeXY (x00FF00FF, x00000000), buildPair (x4A645A01, x50DEC930)) .
red eqPair (preludeVW (x00FF00FF, x00000000), buildPair (x5CCA3239, xFECCAA6E)) .
red eqPair (preludeST (x00FF00FF, x00000000), buildPair (x51EDE9C7, x24B66FB5)) .
red eqPair (computeXY-prime (buildPair (x4A645A01, x50DEC930), x55555555, XOR (nCYC (n1, x5CCA3239), xFECCAA6E)), buildPair (x48B204D6, x5834A585)) .
red eqPair (computeXY-prime (buildPair (x48B204D6, x5834A585), xAAAAAAAA, XOR (nCYC (n2, x5CCA3239), xFECCAA6E)), buildPair (x4F998E01, xBE9F0917)) .
red eqPair (computeXY-prime (buildPair (x4F998E01, xBE9F0917), x51EDE9C7, XOR (nCYC (n3, x5CCA3239), xFECCAA6E)), buildPair (x344925FC, xDB9102B0)) .
red eqPair (computeXY-prime (buildPair (x344925FC, xDB9102B0), x24B66FB5, XOR (nCYC (n4, x5CCA3239), xFECCAA6E)), buildPair (x277B4B25, xD636250D)) .
red eqBlock (XOR (x277B4B25, xD636250D), xF14D6E28) .
red eqOctet (PAT (x00FF00FF, x00000000), xFF) .
red eqPair (preludeXY (x00FF00FF, x00000000), buildPair (x4A645A01, x50DEC930)) .
red eqPair (preludeVW (x00FF00FF, x00000000), buildPair (x5CCA3239, xFECCAA6E)) .
red eqPair (preludeST (x00FF00FF, x00000000), buildPair (x51EDE9C7, x24B66FB5)) .
red eqPair (computeXY-prime (buildPair (x4A645A01, x50DEC930), xAAAAAAAA, XOR (nCYC (n1, x5CCA3239), xFECCAA6E)), buildPair (x6AEBACF8, x9DB15CF6)) .
red eqPair (computeXY-prime (buildPair (x6AEBACF8, x9DB15CF6), x55555555, XOR (nCYC (n2, x5CCA3239), xFECCAA6E)), buildPair (x270EEDAF, xB8142629)) .
red eqPair (computeXY-prime (buildPair (x270EEDAF, xB8142629), x51EDE9C7, XOR (nCYC (n3, x5CCA3239), xFECCAA6E)), buildPair (x29907CD8, xBA92DB12)) .
red eqPair (computeXY-prime (buildPair (x29907CD8, xBA92DB12), x24B66FB5, XOR (nCYC (n4, x5CCA3239), xFECCAA6E)), buildPair (x28EAD8B3, x81D10CA3)) .
red eqBlock (XOR (x28EAD8B3, x81D10CA3), xA93BD410) .
red eqOctet (PAT (x55555555, x5A35D667), x00) .
red eqPair (preludeXY (x55555555, x5A35D667), buildPair (x34ACF886, x7397C9AE)) .
red eqPair (preludeVW (x55555555, x5A35D667), buildPair (x7201F4DC, x2829040B)) .
red eqPair (preludeST (x55555555, x5A35D667), buildPair (x9E2E7B36, x13647149)) .
red eqPair (computeXY-prime (buildPair (x34ACF886, x7397C9AE), x00000000, XOR (nCYC (n1, x7201F4DC), x2829040B)), buildPair (x2FD76FFB, x550D91CE)) .
red eqPair (computeXY-prime (buildPair (x2FD76FFB, x550D91CE), xFFFFFFFF, XOR (nCYC (n2, x7201F4DC), x2829040B)), buildPair (xA70FC148, x1D10D8D3)) .
red eqPair (computeXY-prime (buildPair (xA70FC148, x1D10D8D3), x9E2E7B36, XOR (nCYC (n3, x7201F4DC), x2829040B)), buildPair (xB1CC1CC5, x29C1485F)) .
red eqPair (computeXY-prime (buildPair (xB1CC1CC5, x29C1485F), x13647149, XOR (nCYC (n4, x7201F4DC), x2829040B)), buildPair (x288FC786, x9115A558)) .
red eqBlock (XOR (x288FC786, x9115A558), xB99A62DE) .
red eqOctet (PAT (x55555555, x5A35D667), x00) .
red eqPair (preludeXY (x55555555, x5A35D667), buildPair (x34ACF886, x7397C9AE)) .
red eqPair (preludeVW (x55555555, x5A35D667), buildPair (x7201F4DC, x2829040B)) .
red eqPair (preludeST (x55555555, x5A35D667), buildPair (x9E2E7B36, x13647149)) .
red eqPair (computeXY-prime (buildPair (x34ACF886, x7397C9AE), xFFFFFFFF, XOR (nCYC (n1, x7201F4DC), x2829040B)), buildPair (x8DC8BBDE, xFE4E5BDD)) .
red eqPair (computeXY-prime (buildPair (x8DC8BBDE, xFE4E5BDD), x00000000, XOR (nCYC (n2, x7201F4DC), x2829040B)), buildPair (xCBC865BA, x0297AF6F)) .
red eqPair (computeXY-prime (buildPair (xCBC865BA, x0297AF6F), x9E2E7B36, XOR (nCYC (n3, x7201F4DC), x2829040B)), buildPair (x3CF3A7D2, x160EE9B5)) .
red eqPair (computeXY-prime (buildPair (x3CF3A7D2, x160EE9B5), x13647149, XOR (nCYC (n4, x7201F4DC), x2829040B)), buildPair (xD0482465, x7050EC5E)) .
red eqBlock (XOR (xD0482465, x7050EC5E), xA018C83B) .
red eqPair (preludeXY (xE6A12F07, x9D15C437), buildPair (x21D869BA, x7792F9D4)) .
red eqPair (preludeVW (xE6A12F07, x9D15C437), buildPair (xC4EB1AEB, xF6A09667)) .
red eqPair (preludeST (xE6A12F07, x9D15C437), buildPair (x6D67E884, xA511987A)) .
red eqPair (computeXY-prime (buildPair (x204E80A7, x077788A2), x00000000, XOR (nCYC (n1, x17A808FD), xFEA1D334)), buildPair (x303FF4AA, x1277A6D4)) .
red eqPair (computeXY-prime (buildPair (x303FF4AA, x1277A6D4), x00000000, XOR (nCYC (n2, x17A808FD), xFEA1D334)), buildPair (x55DD063F, x4C49AAE0)) .
red eqPair (computeXY-prime (buildPair (x55DD063F, x4C49AAE0), x00000000, XOR (nCYC (n3, x17A808FD), xFEA1D334)), buildPair (x51AF3C1D, x5BC02502)) .
red eqPair (computeXY-prime (buildPair (x51AF3C1D, x5BC02502), x00000000, XOR (nCYC (n4, x17A808FD), xFEA1D334)), buildPair (xA44AAAC0, x63C70DBA)) .
red eqPair (computeXY-prime (buildPair (xA44AAAC0, x63C70DBA), x00000000, XOR (nCYC (n5, x17A808FD), xFEA1D334)), buildPair (x4D53901A, x2E80AC30)) .
red eqPair (computeXY-prime (buildPair (x4D53901A, x2E80AC30), x00000000, XOR (nCYC (n6, x17A808FD), xFEA1D334)), buildPair (x5F38EEF1, x2A6091AE)) .
red eqPair (computeXY-prime (buildPair (x5F38EEF1, x2A6091AE), x00000000, XOR (nCYC (n7, x17A808FD), xFEA1D334)), buildPair (xF0239DD5, x3DD81AC6)) .
red eqPair (computeXY-prime (buildPair (xF0239DD5, x3DD81AC6), x00000000, XOR (nCYC (n8, x17A808FD), xFEA1D334)), buildPair (xEB35B97F, x9372CDC6)) .
red eqPair (computeXY-prime (buildPair (xEB35B97F, x9372CDC6), x00000000, XOR (nCYC (n9, x17A808FD), xFEA1D334)), buildPair (x4DA124A1, xC6B1317E)) .
red eqPair (computeXY-prime (buildPair (x4DA124A1, xC6B1317E), x00000000, XOR (nCYC (n10, x17A808FD), xFEA1D334)), buildPair (x7F839576, x74B39176)) .
red eqPair (computeXY-prime (buildPair (x7F839576, x74B39176), x00000000, XOR (nCYC (n11, x17A808FD), xFEA1D334)), buildPair (x11A9D254, xD78634BC)) .
red eqPair (computeXY-prime (buildPair (x11A9D254, xD78634BC), x00000000, XOR (nCYC (n12, x17A808FD), xFEA1D334)), buildPair (xD8804CA5, xFDC1A8BA)) .
red eqPair (computeXY-prime (buildPair (xD8804CA5, xFDC1A8BA), x00000000, XOR (nCYC (n13, x17A808FD), xFEA1D334)), buildPair (x3F6F7248, x11AC46B8)) .
red eqPair (computeXY-prime (buildPair (x3F6F7248, x11AC46B8), x00000000, XOR (nCYC (n14, x17A808FD), xFEA1D334)), buildPair (xACBC13DD, x33D5A466)) .
red eqPair (computeXY-prime (buildPair (xACBC13DD, x33D5A466), x00000000, XOR (nCYC (n15, x17A808FD), xFEA1D334)), buildPair (x4CE933E1, xC21A1846)) .
red eqPair (computeXY-prime (buildPair (x4CE933E1, xC21A1846), x00000000, XOR (nCYC (n16, x17A808FD), xFEA1D334)), buildPair (xC1ED90DD, xCD959B46)) .
red eqPair (computeXY-prime (buildPair (xC1ED90DD, xCD959B46), x00000000, XOR (nCYC (n17, x17A808FD), xFEA1D334)), buildPair (x3CD54DEB, x613F8E2A)) .
red eqPair (computeXY-prime (buildPair (x3CD54DEB, x613F8E2A), x00000000, XOR (nCYC (n18, x17A808FD), xFEA1D334)), buildPair (xBBA57835, x07C72EAA)) .
red eqPair (computeXY-prime (buildPair (xBBA57835, x07C72EAA), x00000000, XOR (nCYC (n19, x17A808FD), xFEA1D334)), buildPair (xD7843FDC, x6AD6E8A4)) .
red eqPair (computeXY-prime (buildPair (xD7843FDC, x6AD6E8A4), x00000000, XOR (nCYC (n20, x17A808FD), xFEA1D334)), buildPair (x5EBA06C2, x91896CFA)) .
red eqPair (computeXY-prime (buildPair (x5EBA06C2, x91896CFA), x76232E5F, XOR (nCYC (n21, x17A808FD), xFEA1D334)), buildPair (x1D9C9655, x98D1CC75)) .
red eqPair (computeXY-prime (buildPair (x1D9C9655, x98D1CC75), x4FB1138A, XOR (nCYC (n22, x17A808FD), xFEA1D334)), buildPair (x7BC180AB, xA0B87B77)) .
red eqBlock (MAC (buildKey (x80018001, x80018000), makeMessage (n20, x00000000, x00000000)), xDB79FBDC) .
red eqBlock (MAC (buildKey (x80018001, x80018000), makeMessage (n16, x00000000, x07050301)), x8CE37709) .
red eqBlock (MAC (buildKey (x80018001, x80018000), makeMessage (n256, x00000000, x07050301)), x717153D5) .
red eqBlock (MAC (buildKey (x80018001, x80018000), makeMessage (n4100, x00000000, x07050301)), x7783C51D) .
