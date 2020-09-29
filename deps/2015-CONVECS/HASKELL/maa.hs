data Xbool = Xfalse | Xtrue
  deriving (Show, Eq, Ord)

data Bit = X0 | X1
  deriving (Show, Eq, Ord)

data Octet = BuildOctet Bit Bit Bit Bit Bit Bit Bit Bit 
  deriving (Show, Eq, Ord)

data OctetSum = BuildOctetSum Bit Octet 
  deriving (Show, Eq, Ord)

data Half = BuildHalf Octet Octet 
  deriving (Show, Eq, Ord)

data HalfSum = BuildHalfSum Bit Half 
  deriving (Show, Eq, Ord)

data Block = BuildBlock Octet Octet Octet Octet 
  deriving (Show, Eq, Ord)

data BlockSum = BuildBlockSum Bit Block 
  deriving (Show, Eq, Ord)

data Pair = BuildPair Block Block 
  deriving (Show, Eq, Ord)

data Nat = Zero | Xsucc Nat 
  deriving (Show, Eq, Ord)

data Key = BuildKey Block Block 
  deriving (Show, Eq, Ord)

data Message = UnitMessage Block  | ConsMessage Block Message 
  deriving (Show, Eq, Ord)

data SegmentedMessage = UnitSegment Message  | ConsSegment Message SegmentedMessage 
  deriving (Show, Eq, Ord)

notBool :: Xbool -> Xbool
andBool :: Xbool -> Xbool -> Xbool
orBool :: Xbool -> Xbool -> Xbool
xorBool :: Xbool -> Xbool -> Xbool
notBit :: Bit -> Bit
andBit :: Bit -> Bit -> Bit
orBit :: Bit -> Bit -> Bit
xorBit :: Bit -> Bit -> Bit
x00 :: Octet
x01 :: Octet
x0000 :: Half
halfU :: Block -> Half
halfL :: Block -> Half
eqBit :: Bit -> Bit -> Xbool
eqOctet :: Octet -> Octet -> Xbool
eqOctetSum :: OctetSum -> OctetSum -> Xbool
eqHalf :: Half -> Half -> Xbool
eqHalfSum :: HalfSum -> HalfSum -> Xbool
eqBlock :: Block -> Block -> Xbool
eqBlockSum :: BlockSum -> BlockSum -> Xbool
eqPair :: Pair -> Pair -> Xbool
addBit :: Bit -> Bit -> Bit -> Bit
carBit :: Bit -> Bit -> Bit -> Bit
addOctetSum :: Octet -> Octet -> Bit -> OctetSum
addOctet8 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet7 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet6 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet5 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet4 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet3 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet2 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet1 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
addOctet0 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> OctetSum
dropCarryOctetSum :: OctetSum -> Octet
addOctet :: Octet -> Octet -> Octet
addHalfSum :: Half -> Half -> HalfSum
addHalf2 :: Octet -> Octet -> Octet -> Octet -> HalfSum
addHalf1 :: Octet -> Octet -> OctetSum -> HalfSum
addHalf0 :: OctetSum -> Octet -> HalfSum
dropCarryHalfSum :: HalfSum -> Half
addHalf :: Half -> Half -> Half
addHalfOctet :: Octet -> Half -> Half
addHalfOctets :: Octet -> Octet -> Half
addBlockSum :: Block -> Block -> BlockSum
addBlock4 :: Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> BlockSum
addBlock3 :: Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> OctetSum -> BlockSum
addBlock2 :: Octet -> Octet -> Octet -> Octet -> OctetSum -> Octet -> BlockSum
addBlock1 :: Octet -> Octet -> OctetSum -> Octet -> Octet -> BlockSum
addBlock0 :: OctetSum -> Octet -> Octet -> Octet -> BlockSum
dropCarryBlockSum :: BlockSum -> Block
addBlock :: Block -> Block -> Block
addBlockHalf :: Half -> Block -> Block
addBlockHalves :: Half -> Half -> Block
leftOctet1 :: Octet -> Octet
leftOctet2 :: Octet -> Octet
leftOctet3 :: Octet -> Octet
leftOctet4 :: Octet -> Octet
leftOctet5 :: Octet -> Octet
leftOctet6 :: Octet -> Octet
leftOctet7 :: Octet -> Octet
rightOctet1 :: Octet -> Octet
rightOctet2 :: Octet -> Octet
rightOctet3 :: Octet -> Octet
rightOctet4 :: Octet -> Octet
rightOctet5 :: Octet -> Octet
rightOctet6 :: Octet -> Octet
rightOctet7 :: Octet -> Octet
mulOctet :: Octet -> Octet -> Half
mulOctet1 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet2 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet3 :: Bit -> Bit -> Bit -> Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet4 :: Bit -> Bit -> Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet5 :: Bit -> Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet6 :: Bit -> Bit -> Bit -> Octet -> Half -> Half
mulOctet7 :: Bit -> Bit -> Octet -> Half -> Half
mulOctet8 :: Bit -> Octet -> Half -> Half
mulOctetA :: Half -> Octet -> Octet -> Half
mulOctetB :: Octet -> OctetSum -> Half
mulHalf :: Half -> Half -> Block
mulHalfA :: Half -> Half -> Half -> Half -> Block
mulHalf4 :: Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Block
mulHalf3 :: Octet -> Octet -> Octet -> Octet -> Half -> Octet -> Block
mulHalf2 :: Octet -> Half -> Octet -> Octet -> Block
mulHalf1 :: Half -> Octet -> Octet -> Octet -> Block
mulBlock :: Block -> Block -> Pair
mulBlockA :: Block -> Block -> Block -> Block -> Pair
mulBlock4 :: Half -> Half -> Half -> Half -> Half -> Half -> Half -> Half -> Pair
mulBlock3 :: Half -> Half -> Half -> Half -> Block -> Half -> Pair
mulBlock2 :: Half -> Block -> Half -> Half -> Pair
mulBlock1 :: Block -> Half -> Half -> Half -> Pair
mulBlockB :: Half -> Half -> Half -> Half -> Pair
addNat :: Nat -> Nat -> Nat
multNat :: Nat -> Nat -> Nat
eqNat :: Nat -> Nat -> Xbool
ltNat :: Nat -> Nat -> Xbool
n1 :: Nat
n2 :: Nat
n3 :: Nat
n4 :: Nat
n5 :: Nat
n6 :: Nat
n7 :: Nat
n8 :: Nat
n9 :: Nat
n10 :: Nat
n11 :: Nat
n12 :: Nat
n13 :: Nat
n14 :: Nat
n15 :: Nat
n16 :: Nat
n17 :: Nat
n18 :: Nat
n19 :: Nat
n20 :: Nat
n21 :: Nat
n22 :: Nat
n254 :: Nat
n256 :: Nat
n4100 :: Nat
andOctet :: Octet -> Octet -> Octet
orOctet :: Octet -> Octet -> Octet
xorOctet :: Octet -> Octet -> Octet
x02 :: Octet
x03 :: Octet
x04 :: Octet
x05 :: Octet
x06 :: Octet
x07 :: Octet
x08 :: Octet
x09 :: Octet
x0A :: Octet
x0B :: Octet
x0C :: Octet
x0D :: Octet
x0E :: Octet
x0F :: Octet
x10 :: Octet
x11 :: Octet
x12 :: Octet
x13 :: Octet
x14 :: Octet
x15 :: Octet
x16 :: Octet
x17 :: Octet
x18 :: Octet
x1A :: Octet
x1B :: Octet
x1C :: Octet
x1D :: Octet
x1E :: Octet
x1F :: Octet
x20 :: Octet
x21 :: Octet
x23 :: Octet
x24 :: Octet
x25 :: Octet
x26 :: Octet
x27 :: Octet
x28 :: Octet
x29 :: Octet
x2A :: Octet
x2B :: Octet
x2D :: Octet
x2E :: Octet
x2F :: Octet
x30 :: Octet
x31 :: Octet
x32 :: Octet
x33 :: Octet
x34 :: Octet
x35 :: Octet
x36 :: Octet
x37 :: Octet
x38 :: Octet
x39 :: Octet
x3A :: Octet
x3B :: Octet
x3C :: Octet
x3D :: Octet
x3F :: Octet
x40 :: Octet
x46 :: Octet
x48 :: Octet
x49 :: Octet
x4A :: Octet
x4B :: Octet
x4C :: Octet
x4D :: Octet
x4E :: Octet
x4F :: Octet
x50 :: Octet
x51 :: Octet
x53 :: Octet
x54 :: Octet
x55 :: Octet
x58 :: Octet
x5A :: Octet
x5B :: Octet
x5C :: Octet
x5D :: Octet
x5E :: Octet
x5F :: Octet
x60 :: Octet
x61 :: Octet
x62 :: Octet
x63 :: Octet
x64 :: Octet
x65 :: Octet
x66 :: Octet
x67 :: Octet
x69 :: Octet
x6A :: Octet
x6B :: Octet
x6C :: Octet
x6D :: Octet
x6E :: Octet
x6F :: Octet
x70 :: Octet
x71 :: Octet
x72 :: Octet
x73 :: Octet
x74 :: Octet
x75 :: Octet
x76 :: Octet
x77 :: Octet
x78 :: Octet
x79 :: Octet
x7A :: Octet
x7B :: Octet
x7C :: Octet
x7D :: Octet
x7E :: Octet
x7F :: Octet
x80 :: Octet
x81 :: Octet
x83 :: Octet
x84 :: Octet
x85 :: Octet
x86 :: Octet
x88 :: Octet
x89 :: Octet
x8A :: Octet
x8C :: Octet
x8D :: Octet
x8E :: Octet
x8F :: Octet
x90 :: Octet
x91 :: Octet
x92 :: Octet
x93 :: Octet
x95 :: Octet
x96 :: Octet
x97 :: Octet
x98 :: Octet
x99 :: Octet
x9A :: Octet
x9B :: Octet
x9C :: Octet
x9D :: Octet
x9E :: Octet
x9F :: Octet
xA0 :: Octet
xA1 :: Octet
xA2 :: Octet
xA3 :: Octet
xA4 :: Octet
xA5 :: Octet
xA6 :: Octet
xA7 :: Octet
xA8 :: Octet
xA9 :: Octet
xAA :: Octet
xAB :: Octet
xAC :: Octet
xAE :: Octet
xAF :: Octet
xB0 :: Octet
xB1 :: Octet
xB2 :: Octet
xB3 :: Octet
xB5 :: Octet
xB6 :: Octet
xB8 :: Octet
xB9 :: Octet
xBA :: Octet
xBB :: Octet
xBC :: Octet
xBE :: Octet
xBF :: Octet
xC0 :: Octet
xC1 :: Octet
xC2 :: Octet
xC4 :: Octet
xC5 :: Octet
xC6 :: Octet
xC7 :: Octet
xC8 :: Octet
xC9 :: Octet
xCA :: Octet
xCB :: Octet
xCC :: Octet
xCD :: Octet
xCE :: Octet
xD0 :: Octet
xD1 :: Octet
xD2 :: Octet
xD3 :: Octet
xD4 :: Octet
xD5 :: Octet
xD6 :: Octet
xD7 :: Octet
xD8 :: Octet
xD9 :: Octet
xDB :: Octet
xDC :: Octet
xDD :: Octet
xDE :: Octet
xDF :: Octet
xE0 :: Octet
xE1 :: Octet
xE3 :: Octet
xE6 :: Octet
xE8 :: Octet
xE9 :: Octet
xEA :: Octet
xEB :: Octet
xEC :: Octet
xED :: Octet
xEE :: Octet
xEF :: Octet
xF0 :: Octet
xF1 :: Octet
xF2 :: Octet
xF3 :: Octet
xF4 :: Octet
xF5 :: Octet
xF6 :: Octet
xF7 :: Octet
xF8 :: Octet
xF9 :: Octet
xFA :: Octet
xFB :: Octet
xFC :: Octet
xFD :: Octet
xFE :: Octet
xFF :: Octet
andBlock :: Block -> Block -> Block
orBlock :: Block -> Block -> Block
xorBlock :: Block -> Block -> Block
x0001 :: Half
x00000000 :: Block
x00000001 :: Block
x00000002 :: Block
x00000003 :: Block
x00000004 :: Block
x00000005 :: Block
x00000006 :: Block
x00000007 :: Block
x00000008 :: Block
x00000009 :: Block
x0000000A :: Block
x0000000B :: Block
x0000000C :: Block
x0000000D :: Block
x0000000E :: Block
x0000000F :: Block
x00000010 :: Block
x00000012 :: Block
x00000014 :: Block
x00000016 :: Block
x00000018 :: Block
x0000001B :: Block
x0000001D :: Block
x0000001E :: Block
x0000001F :: Block
x00000031 :: Block
x00000036 :: Block
x00000060 :: Block
x00000080 :: Block
x000000A5 :: Block
x000000B6 :: Block
x000000C4 :: Block
x000000D2 :: Block
x00000100 :: Block
x00000129 :: Block
x0000018C :: Block
x00004000 :: Block
x00010000 :: Block
x00020000 :: Block
x00030000 :: Block
x00040000 :: Block
x00060000 :: Block
x00804021 :: Block
x00FF00FF :: Block
x0103050B :: Block
x01030703 :: Block
x01030705 :: Block
x0103070F :: Block
x02040801 :: Block
x0297AF6F :: Block
x07050301 :: Block
x077788A2 :: Block
x07C72EAA :: Block
x0A202020 :: Block
x0AD67E20 :: Block
x10000000 :: Block
x11A9D254 :: Block
x11AC46B8 :: Block
x1277A6D4 :: Block
x13647149 :: Block
x160EE9B5 :: Block
x17065DBB :: Block
x17A808FD :: Block
x1D10D8D3 :: Block
x1D3B7760 :: Block
x1D9C9655 :: Block
x1F3F7FFF :: Block
x204E80A7 :: Block
x21D869BA :: Block
x24B66FB5 :: Block
x270EEDAF :: Block
x277B4B25 :: Block
x2829040B :: Block
x288FC786 :: Block
x28EAD8B3 :: Block
x29907CD8 :: Block
x29C1485F :: Block
x29EEE96B :: Block
x2A6091AE :: Block
x2BF8499A :: Block
x2E80AC30 :: Block
x2FD76FFB :: Block
x30261492 :: Block
x303FF4AA :: Block
x33D5A466 :: Block
x344925FC :: Block
x34ACF886 :: Block
x3CD54DEB :: Block
x3CF3A7D2 :: Block
x3DD81AC6 :: Block
x3F6F7248 :: Block
x48B204D6 :: Block
x4A645A01 :: Block
x4C49AAE0 :: Block
x4CE933E1 :: Block
x4D53901A :: Block
x4DA124A1 :: Block
x4F998E01 :: Block
x4FB1138A :: Block
x50DEC930 :: Block
x51AF3C1D :: Block
x51EDE9C7 :: Block
x550D91CE :: Block
x55555555 :: Block
x55DD063F :: Block
x5834A585 :: Block
x5A35D667 :: Block
x5BC02502 :: Block
x5CCA3239 :: Block
x5EBA06C2 :: Block
x5F38EEF1 :: Block
x613F8E2A :: Block
x63C70DBA :: Block
x6AD6E8A4 :: Block
x6AEBACF8 :: Block
x6D67E884 :: Block
x7050EC5E :: Block
x717153D5 :: Block
x7201F4DC :: Block
x7397C9AE :: Block
x74B39176 :: Block
x76232E5F :: Block
x7783C51D :: Block
x7792F9D4 :: Block
x7BC180AB :: Block
x7DB2D9F4 :: Block
x7DFEFBFF :: Block
x7F76A3B0 :: Block
x7F839576 :: Block
x7FFFFFF0 :: Block
x7FFFFFF1 :: Block
x7FFFFFFC :: Block
x7FFFFFFD :: Block
x80000000 :: Block
x80000002 :: Block
x800000C2 :: Block
x80018000 :: Block
x80018001 :: Block
x80397302 :: Block
x81D10CA3 :: Block
x89D635D7 :: Block
x8CE37709 :: Block
x8DC8BBDE :: Block
x9115A558 :: Block
x91896CFA :: Block
x9372CDC6 :: Block
x98D1CC75 :: Block
x9D15C437 :: Block
x9DB15CF6 :: Block
x9E2E7B36 :: Block
xA018C83B :: Block
xA0B87B77 :: Block
xA44AAAC0 :: Block
xA511987A :: Block
xA70FC148 :: Block
xA93BD410 :: Block
xAAAAAAAA :: Block
xAB00FFCD :: Block
xAB01FCCD :: Block
xAB6EED4A :: Block
xABEEED6B :: Block
xACBC13DD :: Block
xB1CC1CC5 :: Block
xB8142629 :: Block
xB99A62DE :: Block
xBA92DB12 :: Block
xBBA57835 :: Block
xBE9F0917 :: Block
xBF2D7D85 :: Block
xBFEF7FDF :: Block
xC1ED90DD :: Block
xC21A1846 :: Block
xC4EB1AEB :: Block
xC6B1317E :: Block
xCBC865BA :: Block
xCD959B46 :: Block
xD0482465 :: Block
xD636250D :: Block
xD7843FDC :: Block
xD78634BC :: Block
xD8804CA5 :: Block
xDB79FBDC :: Block
xDB9102B0 :: Block
xE0C08000 :: Block
xE6A12F07 :: Block
xEB35B97F :: Block
xF0239DD5 :: Block
xF14D6E28 :: Block
xF2EF3501 :: Block
xF6A09667 :: Block
xFD297DA4 :: Block
xFDC1A8BA :: Block
xFE4E5BDD :: Block
xFEA1D334 :: Block
xFECCAA6E :: Block
xFEFC07F0 :: Block
xFF2D7DA5 :: Block
xFFEF0001 :: Block
xFFFF00FF :: Block
xFFFFFF2D :: Block
xFFFFFF3A :: Block
xFFFFFFF0 :: Block
xFFFFFFF1 :: Block
xFFFFFFF4 :: Block
xFFFFFFF5 :: Block
xFFFFFFF7 :: Block
xFFFFFFF9 :: Block
xFFFFFFFA :: Block
xFFFFFFFB :: Block
xFFFFFFFC :: Block
xFFFFFFFD :: Block
xFFFFFFFE :: Block
xFFFFFFFF :: Block
appendMessage :: Message -> Block -> Message
reverseMessage :: Message -> Message
makeMessage :: Nat -> Block -> Block -> Message
splitSegment :: Message -> SegmentedMessage
cutSegment :: Message -> Message -> Nat -> SegmentedMessage
aDD :: Block -> Block -> Block
xand :: Block -> Block -> Block
mUL :: Block -> Block -> Pair
yor :: Block -> Block -> Block
xOR :: Block -> Block -> Block
xOR_prime :: Pair -> Block
cYC :: Block -> Block
nCYC :: Nat -> Block -> Block
fIX1 :: Block -> Block
fIX2 :: Block -> Block
needAdjust :: Octet -> Xbool
adjustCode :: Octet -> Bit
adjust :: Octet -> Octet -> Octet
pAT :: Block -> Block -> Octet
bYT :: Block -> Block -> Pair
bYT_prime :: Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Octet -> Pair
aDDC :: Block -> Block -> Pair
aDDC_prime :: BlockSum -> Pair
mUL1 :: Block -> Block -> Block
mUL1XY :: Pair -> Block
mUL1UL :: Block -> Block -> Block
mUL1SC :: Pair -> Block
mUL2 :: Block -> Block -> Block
mUL2XY :: Pair -> Block
mUL2UL :: Block -> Block -> Block
mUL2DEL :: Pair -> Block -> Block
mUL2FL :: Block -> Block -> Block
mUL2SC :: Pair -> Block
mUL2A :: Block -> Block -> Block
mUL2AXY :: Pair -> Block
mUL2AUL :: Block -> Block -> Block
mUL2ADL :: Block -> Block -> Block
mUL2ASC :: Pair -> Block
squareHalf :: Half -> Block
q :: Octet -> Block
h4 :: Block -> Block
h6 :: Block -> Block
h8 :: Block -> Block
h0 :: Block -> Block
h5 :: Block -> Octet -> Block
h7 :: Block -> Block
h9 :: Block -> Block
j1_2 :: Block -> Block
j1_4 :: Block -> Block
j1_6 :: Block -> Block
j1_8 :: Block -> Block
j2_2 :: Block -> Block
j2_4 :: Block -> Block
j2_6 :: Block -> Block
j2_8 :: Block -> Block
k1_2 :: Block -> Block
k1_4 :: Block -> Block
k1_5 :: Block -> Block
k1_7 :: Block -> Block
k1_9 :: Block -> Block
k2_2 :: Block -> Block
k2_4 :: Block -> Block
k2_5 :: Block -> Block
k2_7 :: Block -> Block
k2_9 :: Block -> Block
preludeXY :: Block -> Block -> Pair
preludeVW :: Block -> Block -> Pair
preludeST :: Block -> Block -> Pair
preludeXY_prime :: Pair -> Octet -> Pair
preludeVW_prime :: Pair -> Pair
preludeST_prime :: Pair -> Pair
computeXY :: Pair -> Pair -> Block -> Pair
computeXY_prime :: Pair -> Block -> Block -> Pair
computeVW :: Pair -> Pair
loop1 :: Pair -> Pair -> Message -> Pair
loop2 :: Pair -> Pair -> Message -> Pair
coda :: Pair -> Pair -> Pair -> Block
mAA :: Key -> Message -> Block
mAA_prime :: Pair -> Pair -> Pair -> Message -> Block
mAC :: Key -> Message -> Block
mACfirst :: Key -> SegmentedMessage -> Block
mACnext :: Key -> Block -> SegmentedMessage -> Block

notBool Xfalse = Xtrue
notBool Xtrue = Xfalse
andBool Xfalse l = Xfalse
andBool Xtrue l = l
orBool Xfalse l = l
orBool Xtrue l = Xtrue
xorBool Xfalse l = l
xorBool Xtrue l = (notBool l)
notBit X0 = X1
notBit X1 = X0
andBit b X0 = X0
andBit b X1 = b
orBit b X0 = b
orBit b X1 = X1
xorBit b X0 = b
xorBit b X1 = (notBit b)
x00 = (BuildOctet X0 X0 X0 X0 X0 X0 X0 X0)
x01 = (BuildOctet X0 X0 X0 X0 X0 X0 X0 X1)
x0000 = (BuildHalf x00 x00)
halfU (BuildBlock o1 o2 o3 o4) = (BuildHalf o1 o2)
halfL (BuildBlock o1 o2 o3 o4) = (BuildHalf o3 o4)
eqBit X0 X0 = Xtrue
eqBit X0 X1 = Xfalse
eqBit X1 X0 = Xfalse
eqBit X1 X1 = Xtrue
eqOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (andBool (eqBit b1 b_prime1) (andBool (eqBit b2 b_prime2) (andBool (eqBit b3 b_prime3) (andBool (eqBit b4 b_prime4) (andBool (eqBit b5 b_prime5) (andBool (eqBit b6 b_prime6) (andBool (eqBit b7 b_prime7) (eqBit b8 b_prime8))))))))
eqOctetSum (BuildOctetSum b o) (BuildOctetSum b_prime o_prime) = (andBool (eqBit b b_prime) (eqOctet o o_prime))
eqHalf (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (andBool (eqOctet o1 o_prime1) (eqOctet o2 o_prime2))
eqHalfSum (BuildHalfSum b h) (BuildHalfSum b_prime h_prime) = (andBool (eqBit b b_prime) (eqHalf h h_prime))
eqBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (andBool (andBool (eqOctet o1 o_prime1) (eqOctet o2 o_prime2)) (andBool (eqOctet o3 o_prime3) (eqOctet o4 o_prime4)))
eqBlockSum (BuildBlockSum b w) (BuildBlockSum b_prime w_prime) = (andBool (eqBit b b_prime) (eqBlock w w_prime))
eqPair (BuildPair w1 w2) (BuildPair w_prime1 w_prime2) = (andBool (eqBlock w1 w_prime1) (eqBlock w2 w_prime2))
addBit b b_prime bcarry = (xorBit (xorBit b b_prime) bcarry)
carBit b b_prime bcarry = (orBit (andBit (andBit b b_prime) (notBit bcarry)) (andBit (orBit b b_prime) bcarry))
addOctetSum (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) bcarry = (addOctet8 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 b8 b_prime8 bcarry)
addOctet8 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 b8 b_prime8 bcarry = (addOctet7 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 (carBit b8 b_prime8 bcarry) (addBit b8 b_prime8 bcarry))
addOctet7 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 bcarry b_second8 = (addOctet6 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 (carBit b7 b_prime7 bcarry) (addBit b7 b_prime7 bcarry) b_second8)
addOctet6 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 bcarry b_second7 b_second8 = (addOctet5 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 (carBit b6 b_prime6 bcarry) (addBit b6 b_prime6 bcarry) b_second7 b_second8)
addOctet5 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 bcarry b_second6 b_second7 b_second8 = (addOctet4 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 (carBit b5 b_prime5 bcarry) (addBit b5 b_prime5 bcarry) b_second6 b_second7 b_second8)
addOctet4 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 bcarry b_second5 b_second6 b_second7 b_second8 = (addOctet3 b1 b_prime1 b2 b_prime2 b3 b_prime3 (carBit b4 b_prime4 bcarry) (addBit b4 b_prime4 bcarry) b_second5 b_second6 b_second7 b_second8)
addOctet3 b1 b_prime1 b2 b_prime2 b3 b_prime3 bcarry b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet2 b1 b_prime1 b2 b_prime2 (carBit b3 b_prime3 bcarry) (addBit b3 b_prime3 bcarry) b_second4 b_second5 b_second6 b_second7 b_second8)
addOctet2 b1 b_prime1 b2 b_prime2 bcarry b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet1 b1 b_prime1 (carBit b2 b_prime2 bcarry) (addBit b2 b_prime2 bcarry) b_second3 b_second4 b_second5 b_second6 b_second7 b_second8)
addOctet1 b1 b_prime1 bcarry b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet0 (carBit b1 b_prime1 bcarry) (addBit b1 b_prime1 bcarry) b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8)
addOctet0 bcarry b_second1 b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (BuildOctetSum bcarry (BuildOctet b_second1 b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8))
dropCarryOctetSum (BuildOctetSum bcarry o) = o
addOctet o o_prime = (dropCarryOctetSum (addOctetSum o o_prime X0))
addHalfSum (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (addHalf2 o1 o_prime1 o2 o_prime2)
addHalf2 o1 o_prime1 o2 o_prime2 = (addHalf1 o1 o_prime1 (addOctetSum o2 o_prime2 X0))
addHalf1 o1 o_prime1 (BuildOctetSum b o_second2) = (addHalf0 (addOctetSum o1 o_prime1 b) o_second2)
addHalf0 (BuildOctetSum b o_second1) o_second2 = (BuildHalfSum b (BuildHalf o_second1 o_second2))
dropCarryHalfSum (BuildHalfSum b h) = h
addHalf h h_prime = (dropCarryHalfSum (addHalfSum h h_prime))
addHalfOctet o h = (addHalf (BuildHalf x00 o) h)
addHalfOctets o o_prime = (addHalf (BuildHalf x00 o) (BuildHalf x00 o_prime))
addBlockSum (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (addBlock4 o1 o_prime1 o2 o_prime2 o3 o_prime3 o4 o_prime4)
addBlock4 o1 o_prime1 o2 o_prime2 o3 o_prime3 o4 o_prime4 = (addBlock3 o1 o_prime1 o2 o_prime2 o3 o_prime3 (addOctetSum o4 o_prime4 X0))
addBlock3 o1 o_prime1 o2 o_prime2 o3 o_prime3 (BuildOctetSum bcarry o_second4) = (addBlock2 o1 o_prime1 o2 o_prime2 (addOctetSum o3 o_prime3 bcarry) o_second4)
addBlock2 o1 o_prime1 o2 o_prime2 (BuildOctetSum bcarry o_second3) o_second4 = (addBlock1 o1 o_prime1 (addOctetSum o2 o_prime2 bcarry) o_second3 o_second4)
addBlock1 o1 o_prime1 (BuildOctetSum bcarry o_second2) o_second3 o_second4 = (addBlock0 (addOctetSum o1 o_prime1 bcarry) o_second2 o_second3 o_second4)
addBlock0 (BuildOctetSum bcarry o_second1) o_second2 o_second3 o_second4 = (BuildBlockSum bcarry (BuildBlock o_second1 o_second2 o_second3 o_second4))
dropCarryBlockSum (BuildBlockSum bcarry w) = w
addBlock w w_prime = (dropCarryBlockSum (addBlockSum w w_prime))
addBlockHalf (BuildHalf o1 o2) w = (addBlock (BuildBlock x00 x00 o1 o2) w)
addBlockHalves (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (addBlock (BuildBlock x00 x00 o1 o2) (BuildBlock x00 x00 o_prime1 o_prime2))
leftOctet1 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b2 b3 b4 b5 b6 b7 b8 X0)
leftOctet2 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b3 b4 b5 b6 b7 b8 X0 X0)
leftOctet3 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b4 b5 b6 b7 b8 X0 X0 X0)
leftOctet4 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b5 b6 b7 b8 X0 X0 X0 X0)
leftOctet5 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b6 b7 b8 X0 X0 X0 X0 X0)
leftOctet6 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b7 b8 X0 X0 X0 X0 X0 X0)
leftOctet7 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b8 X0 X0 X0 X0 X0 X0 X0)
rightOctet1 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 b1 b2 b3 b4 b5 b6 b7)
rightOctet2 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 b1 b2 b3 b4 b5 b6)
rightOctet3 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 b1 b2 b3 b4 b5)
rightOctet4 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 b1 b2 b3 b4)
rightOctet5 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 b1 b2 b3)
rightOctet6 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 X0 b1 b2)
rightOctet7 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 X0 X0 b1)
mulOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) o_prime = (mulOctet1 b1 b2 b3 b4 b5 b6 b7 b8 o_prime x0000)
mulOctet1 X0 b2 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet2 b2 b3 b4 b5 b6 b7 b8 o_prime h)
mulOctet1 X1 b2 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet2 b2 b3 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet1 o_prime) (leftOctet7 o_prime)))
mulOctet2 X0 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet3 b3 b4 b5 b6 b7 b8 o_prime h)
mulOctet2 X1 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet3 b3 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet2 o_prime) (leftOctet6 o_prime)))
mulOctet3 X0 b4 b5 b6 b7 b8 o_prime h = (mulOctet4 b4 b5 b6 b7 b8 o_prime h)
mulOctet3 X1 b4 b5 b6 b7 b8 o_prime h = (mulOctet4 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet3 o_prime) (leftOctet5 o_prime)))
mulOctet4 X0 b5 b6 b7 b8 o_prime h = (mulOctet5 b5 b6 b7 b8 o_prime h)
mulOctet4 X1 b5 b6 b7 b8 o_prime h = (mulOctet5 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet4 o_prime) (leftOctet4 o_prime)))
mulOctet5 X0 b6 b7 b8 o_prime h = (mulOctet6 b6 b7 b8 o_prime h)
mulOctet5 X1 b6 b7 b8 o_prime h = (mulOctet6 b6 b7 b8 o_prime (mulOctetA h (rightOctet5 o_prime) (leftOctet3 o_prime)))
mulOctet6 X0 b7 b8 o_prime h = (mulOctet7 b7 b8 o_prime h)
mulOctet6 X1 b7 b8 o_prime h = (mulOctet7 b7 b8 o_prime (mulOctetA h (rightOctet6 o_prime) (leftOctet2 o_prime)))
mulOctet7 X0 b8 o_prime h = (mulOctet8 b8 o_prime h)
mulOctet7 X1 b8 o_prime h = (mulOctet8 b8 o_prime (mulOctetA h (rightOctet7 o_prime) (leftOctet1 o_prime)))
mulOctet8 X0 o_prime h = h
mulOctet8 X1 o_prime h = (mulOctetA h x00 o_prime)
mulOctetA (BuildHalf o1 o2) o_prime1 o_prime2 = (mulOctetB (addOctet o1 o_prime1) (addOctetSum o2 o_prime2 X0))
mulOctetB o1 (BuildOctetSum X0 o2) = (BuildHalf o1 o2)
mulOctetB o1 (BuildOctetSum X1 o2) = (BuildHalf (addOctet o1 x01) o2)
mulHalf (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (mulHalfA (mulOctet o1 o_prime1) (mulOctet o1 o_prime2) (mulOctet o2 o_prime1) (mulOctet o2 o_prime2))
mulHalfA (BuildHalf o11U o11L) (BuildHalf o12U o12L) (BuildHalf o21U o21L) (BuildHalf o22U o22L) = (mulHalf4 o11U o11L o12U o12L o21U o21L o22U o22L)
mulHalf4 o11U o11L o12U o12L o21U o21L o22U o_second4 = (mulHalf3 o11U o11L o12U o21U (addHalfOctet o12L (addHalfOctets o21L o22U)) o_second4)
mulHalf3 o11U o11L o12U o21U (BuildHalf ocarry o_second3) o_second4 = (mulHalf2 o11U (addHalfOctet ocarry (addHalfOctet o11L (addHalfOctets o12U o21U))) o_second3 o_second4)
mulHalf2 o11U (BuildHalf ocarry o_second2) o_second3 o_second4 = (mulHalf1 (addHalfOctets ocarry o11U) o_second2 o_second3 o_second4)
mulHalf1 (BuildHalf ocarry o_second1) o_second2 o_second3 o_second4 = (BuildBlock o_second1 o_second2 o_second3 o_second4)
mulBlock w1 w2 = (mulBlockA (mulHalf (halfU w1) (halfU w2)) (mulHalf (halfU w1) (halfL w2)) (mulHalf (halfL w1) (halfU w2)) (mulHalf (halfL w1) (halfL w2)))
mulBlockA w11 w12 w21 w22 = (mulBlock4 (halfU w11) (halfL w11) (halfU w12) (halfL w12) (halfU w21) (halfL w21) (halfU w22) (halfL w22))
mulBlock4 h11U h11L h12U h12L h21U h21L h22U h_second4 = (mulBlock3 h11U h11L h12U h21U (addBlockHalf h12L (addBlockHalves h21L h22U)) h_second4)
mulBlock3 h11U h11L h12U h21U w h_second4 = (mulBlock2 h11U (addBlockHalf (halfU w) (addBlockHalf h11L (addBlockHalves h12U h21U))) (halfL w) h_second4)
mulBlock2 h11U w h_second3 h_second4 = (mulBlock1 (addBlockHalves (halfU w) h11U) (halfL w) h_second3 h_second4)
mulBlock1 w h_second2 h_second3 h_second4 = (mulBlockB (halfL w) h_second2 h_second3 h_second4)
mulBlockB (BuildHalf o1U o1L) (BuildHalf o2U o2L) (BuildHalf o3U o3L) (BuildHalf o4U o4L) = (BuildPair (BuildBlock o1U o1L o2U o2L) (BuildBlock o3U o3L o4U o4L))
addNat n Zero = n
addNat n (Xsucc n_prime) = (addNat (Xsucc n) n_prime)
multNat n Zero = Zero
multNat n (Xsucc n_prime) = (addNat n (multNat n n_prime))
eqNat Zero Zero = Xtrue
eqNat Zero (Xsucc n_prime) = Xfalse
eqNat (Xsucc n) Zero = Xfalse
eqNat (Xsucc n) (Xsucc n_prime) = (eqNat n n_prime)
ltNat Zero Zero = Xfalse
ltNat Zero (Xsucc n_prime) = Xtrue
ltNat (Xsucc n_prime) Zero = Xfalse
ltNat (Xsucc n) (Xsucc n_prime) = (ltNat n n_prime)
n1 = (Xsucc Zero)
n2 = (Xsucc n1)
n3 = (Xsucc n2)
n4 = (Xsucc n3)
n5 = (Xsucc n4)
n6 = (Xsucc n5)
n7 = (Xsucc n6)
n8 = (Xsucc n7)
n9 = (Xsucc n8)
n10 = (Xsucc n9)
n11 = (Xsucc n10)
n12 = (Xsucc n11)
n13 = (Xsucc n12)
n14 = (Xsucc n13)
n15 = (Xsucc n14)
n16 = (Xsucc n15)
n17 = (Xsucc n16)
n18 = (Xsucc n17)
n19 = (Xsucc n18)
n20 = (Xsucc n19)
n21 = (Xsucc n20)
n22 = (Xsucc n21)
n254 = (addNat n12 (multNat n11 n22))
n256 = (multNat n16 n16)
n4100 = (addNat n4 (multNat n16 n256))
andOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (andBit b1 b_prime1) (andBit b2 b_prime2) (andBit b3 b_prime3) (andBit b4 b_prime4) (andBit b5 b_prime5) (andBit b6 b_prime6) (andBit b7 b_prime7) (andBit b8 b_prime8))
orOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (orBit b1 b_prime1) (orBit b2 b_prime2) (orBit b3 b_prime3) (orBit b4 b_prime4) (orBit b5 b_prime5) (orBit b6 b_prime6) (orBit b7 b_prime7) (orBit b8 b_prime8))
xorOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (xorBit b1 b_prime1) (xorBit b2 b_prime2) (xorBit b3 b_prime3) (xorBit b4 b_prime4) (xorBit b5 b_prime5) (xorBit b6 b_prime6) (xorBit b7 b_prime7) (xorBit b8 b_prime8))
x02 = (BuildOctet X0 X0 X0 X0 X0 X0 X1 X0)
x03 = (BuildOctet X0 X0 X0 X0 X0 X0 X1 X1)
x04 = (BuildOctet X0 X0 X0 X0 X0 X1 X0 X0)
x05 = (BuildOctet X0 X0 X0 X0 X0 X1 X0 X1)
x06 = (BuildOctet X0 X0 X0 X0 X0 X1 X1 X0)
x07 = (BuildOctet X0 X0 X0 X0 X0 X1 X1 X1)
x08 = (BuildOctet X0 X0 X0 X0 X1 X0 X0 X0)
x09 = (BuildOctet X0 X0 X0 X0 X1 X0 X0 X1)
x0A = (BuildOctet X0 X0 X0 X0 X1 X0 X1 X0)
x0B = (BuildOctet X0 X0 X0 X0 X1 X0 X1 X1)
x0C = (BuildOctet X0 X0 X0 X0 X1 X1 X0 X0)
x0D = (BuildOctet X0 X0 X0 X0 X1 X1 X0 X1)
x0E = (BuildOctet X0 X0 X0 X0 X1 X1 X1 X0)
x0F = (BuildOctet X0 X0 X0 X0 X1 X1 X1 X1)
x10 = (BuildOctet X0 X0 X0 X1 X0 X0 X0 X0)
x11 = (BuildOctet X0 X0 X0 X1 X0 X0 X0 X1)
x12 = (BuildOctet X0 X0 X0 X1 X0 X0 X1 X0)
x13 = (BuildOctet X0 X0 X0 X1 X0 X0 X1 X1)
x14 = (BuildOctet X0 X0 X0 X1 X0 X1 X0 X0)
x15 = (BuildOctet X0 X0 X0 X1 X0 X1 X0 X1)
x16 = (BuildOctet X0 X0 X0 X1 X0 X1 X1 X0)
x17 = (BuildOctet X0 X0 X0 X1 X0 X1 X1 X1)
x18 = (BuildOctet X0 X0 X0 X1 X1 X0 X0 X0)
x1A = (BuildOctet X0 X0 X0 X1 X1 X0 X1 X0)
x1B = (BuildOctet X0 X0 X0 X1 X1 X0 X1 X1)
x1C = (BuildOctet X0 X0 X0 X1 X1 X1 X0 X0)
x1D = (BuildOctet X0 X0 X0 X1 X1 X1 X0 X1)
x1E = (BuildOctet X0 X0 X0 X1 X1 X1 X1 X0)
x1F = (BuildOctet X0 X0 X0 X1 X1 X1 X1 X1)
x20 = (BuildOctet X0 X0 X1 X0 X0 X0 X0 X0)
x21 = (BuildOctet X0 X0 X1 X0 X0 X0 X0 X1)
x23 = (BuildOctet X0 X0 X1 X0 X0 X0 X1 X1)
x24 = (BuildOctet X0 X0 X1 X0 X0 X1 X0 X0)
x25 = (BuildOctet X0 X0 X1 X0 X0 X1 X0 X1)
x26 = (BuildOctet X0 X0 X1 X0 X0 X1 X1 X0)
x27 = (BuildOctet X0 X0 X1 X0 X0 X1 X1 X1)
x28 = (BuildOctet X0 X0 X1 X0 X1 X0 X0 X0)
x29 = (BuildOctet X0 X0 X1 X0 X1 X0 X0 X1)
x2A = (BuildOctet X0 X0 X1 X0 X1 X0 X1 X0)
x2B = (BuildOctet X0 X0 X1 X0 X1 X0 X1 X1)
x2D = (BuildOctet X0 X0 X1 X0 X1 X1 X0 X1)
x2E = (BuildOctet X0 X0 X1 X0 X1 X1 X1 X0)
x2F = (BuildOctet X0 X0 X1 X0 X1 X1 X1 X1)
x30 = (BuildOctet X0 X0 X1 X1 X0 X0 X0 X0)
x31 = (BuildOctet X0 X0 X1 X1 X0 X0 X0 X1)
x32 = (BuildOctet X0 X0 X1 X1 X0 X0 X1 X0)
x33 = (BuildOctet X0 X0 X1 X1 X0 X0 X1 X1)
x34 = (BuildOctet X0 X0 X1 X1 X0 X1 X0 X0)
x35 = (BuildOctet X0 X0 X1 X1 X0 X1 X0 X1)
x36 = (BuildOctet X0 X0 X1 X1 X0 X1 X1 X0)
x37 = (BuildOctet X0 X0 X1 X1 X0 X1 X1 X1)
x38 = (BuildOctet X0 X0 X1 X1 X1 X0 X0 X0)
x39 = (BuildOctet X0 X0 X1 X1 X1 X0 X0 X1)
x3A = (BuildOctet X0 X0 X1 X1 X1 X0 X1 X0)
x3B = (BuildOctet X0 X0 X1 X1 X1 X0 X1 X1)
x3D = (BuildOctet X0 X0 X1 X1 X1 X1 X0 X1)
x3C = (BuildOctet X0 X0 X1 X1 X1 X1 X0 X0)
x3F = (BuildOctet X0 X0 X1 X1 X1 X1 X1 X1)
x40 = (BuildOctet X0 X1 X0 X0 X0 X0 X0 X0)
x46 = (BuildOctet X0 X1 X0 X0 X0 X1 X1 X0)
x48 = (BuildOctet X0 X1 X0 X0 X1 X0 X0 X0)
x49 = (BuildOctet X0 X1 X0 X0 X1 X0 X0 X1)
x4A = (BuildOctet X0 X1 X0 X0 X1 X0 X1 X0)
x4B = (BuildOctet X0 X1 X0 X0 X1 X0 X1 X1)
x4C = (BuildOctet X0 X1 X0 X0 X1 X1 X0 X0)
x4D = (BuildOctet X0 X1 X0 X0 X1 X1 X0 X1)
x4E = (BuildOctet X0 X1 X0 X0 X1 X1 X1 X0)
x4F = (BuildOctet X0 X1 X0 X0 X1 X1 X1 X1)
x50 = (BuildOctet X0 X1 X0 X1 X0 X0 X0 X0)
x51 = (BuildOctet X0 X1 X0 X1 X0 X0 X0 X1)
x53 = (BuildOctet X0 X1 X0 X1 X0 X0 X1 X1)
x54 = (BuildOctet X0 X1 X0 X1 X0 X1 X0 X0)
x55 = (BuildOctet X0 X1 X0 X1 X0 X1 X0 X1)
x58 = (BuildOctet X0 X1 X0 X1 X1 X0 X0 X0)
x5A = (BuildOctet X0 X1 X0 X1 X1 X0 X1 X0)
x5B = (BuildOctet X0 X1 X0 X1 X1 X0 X1 X1)
x5C = (BuildOctet X0 X1 X0 X1 X1 X1 X0 X0)
x5D = (BuildOctet X0 X1 X0 X1 X1 X1 X0 X1)
x5E = (BuildOctet X0 X1 X0 X1 X1 X1 X1 X0)
x5F = (BuildOctet X0 X1 X0 X1 X1 X1 X1 X1)
x60 = (BuildOctet X0 X1 X1 X0 X0 X0 X0 X0)
x61 = (BuildOctet X0 X1 X1 X0 X0 X0 X0 X1)
x62 = (BuildOctet X0 X1 X1 X0 X0 X0 X1 X0)
x63 = (BuildOctet X0 X1 X1 X0 X0 X0 X1 X1)
x64 = (BuildOctet X0 X1 X1 X0 X0 X1 X0 X0)
x65 = (BuildOctet X0 X1 X1 X0 X0 X1 X0 X1)
x66 = (BuildOctet X0 X1 X1 X0 X0 X1 X1 X0)
x67 = (BuildOctet X0 X1 X1 X0 X0 X1 X1 X1)
x69 = (BuildOctet X0 X1 X1 X0 X1 X0 X0 X1)
x6A = (BuildOctet X0 X1 X1 X0 X1 X0 X1 X0)
x6B = (BuildOctet X0 X1 X1 X0 X1 X0 X1 X1)
x6C = (BuildOctet X0 X1 X1 X0 X1 X1 X0 X0)
x6D = (BuildOctet X0 X1 X1 X0 X1 X1 X0 X1)
x6E = (BuildOctet X0 X1 X1 X0 X1 X1 X1 X0)
x6F = (BuildOctet X0 X1 X1 X0 X1 X1 X1 X1)
x70 = (BuildOctet X0 X1 X1 X1 X0 X0 X0 X0)
x71 = (BuildOctet X0 X1 X1 X1 X0 X0 X0 X1)
x72 = (BuildOctet X0 X1 X1 X1 X0 X0 X1 X0)
x73 = (BuildOctet X0 X1 X1 X1 X0 X0 X1 X1)
x74 = (BuildOctet X0 X1 X1 X1 X0 X1 X0 X0)
x75 = (BuildOctet X0 X1 X1 X1 X0 X1 X0 X1)
x76 = (BuildOctet X0 X1 X1 X1 X0 X1 X1 X0)
x77 = (BuildOctet X0 X1 X1 X1 X0 X1 X1 X1)
x78 = (BuildOctet X0 X1 X1 X1 X1 X0 X0 X0)
x79 = (BuildOctet X0 X1 X1 X1 X1 X0 X0 X1)
x7A = (BuildOctet X0 X1 X1 X1 X1 X0 X1 X0)
x7B = (BuildOctet X0 X1 X1 X1 X1 X0 X1 X1)
x7C = (BuildOctet X0 X1 X1 X1 X1 X1 X0 X0)
x7D = (BuildOctet X0 X1 X1 X1 X1 X1 X0 X1)
x7E = (BuildOctet X0 X1 X1 X1 X1 X1 X1 X0)
x7F = (BuildOctet X0 X1 X1 X1 X1 X1 X1 X1)
x80 = (BuildOctet X1 X0 X0 X0 X0 X0 X0 X0)
x81 = (BuildOctet X1 X0 X0 X0 X0 X0 X0 X1)
x83 = (BuildOctet X1 X0 X0 X0 X0 X0 X1 X1)
x84 = (BuildOctet X1 X0 X0 X0 X0 X1 X0 X0)
x85 = (BuildOctet X1 X0 X0 X0 X0 X1 X0 X1)
x86 = (BuildOctet X1 X0 X0 X0 X0 X1 X1 X0)
x88 = (BuildOctet X1 X0 X0 X0 X1 X0 X0 X0)
x89 = (BuildOctet X1 X0 X0 X0 X1 X0 X0 X1)
x8A = (BuildOctet X1 X0 X0 X0 X1 X0 X1 X0)
x8C = (BuildOctet X1 X0 X0 X0 X1 X1 X0 X0)
x8D = (BuildOctet X1 X0 X0 X0 X1 X1 X0 X1)
x8E = (BuildOctet X1 X0 X0 X0 X1 X1 X1 X0)
x8F = (BuildOctet X1 X0 X0 X0 X1 X1 X1 X1)
x90 = (BuildOctet X1 X0 X0 X1 X0 X0 X0 X0)
x91 = (BuildOctet X1 X0 X0 X1 X0 X0 X0 X1)
x92 = (BuildOctet X1 X0 X0 X1 X0 X0 X1 X0)
x93 = (BuildOctet X1 X0 X0 X1 X0 X0 X1 X1)
x95 = (BuildOctet X1 X0 X0 X1 X0 X1 X0 X1)
x96 = (BuildOctet X1 X0 X0 X1 X0 X1 X1 X0)
x97 = (BuildOctet X1 X0 X0 X1 X0 X1 X1 X1)
x98 = (BuildOctet X1 X0 X0 X1 X1 X0 X0 X0)
x99 = (BuildOctet X1 X0 X0 X1 X1 X0 X0 X1)
x9A = (BuildOctet X1 X0 X0 X1 X1 X0 X1 X0)
x9B = (BuildOctet X1 X0 X0 X1 X1 X0 X1 X1)
x9C = (BuildOctet X1 X0 X0 X1 X1 X1 X0 X0)
x9D = (BuildOctet X1 X0 X0 X1 X1 X1 X0 X1)
x9E = (BuildOctet X1 X0 X0 X1 X1 X1 X1 X0)
x9F = (BuildOctet X1 X0 X0 X1 X1 X1 X1 X1)
xA1 = (BuildOctet X1 X0 X1 X0 X0 X0 X0 X1)
xA0 = (BuildOctet X1 X0 X1 X0 X0 X0 X0 X0)
xA2 = (BuildOctet X1 X0 X1 X0 X0 X0 X1 X0)
xA3 = (BuildOctet X1 X0 X1 X0 X0 X0 X1 X1)
xA4 = (BuildOctet X1 X0 X1 X0 X0 X1 X0 X0)
xA5 = (BuildOctet X1 X0 X1 X0 X0 X1 X0 X1)
xA6 = (BuildOctet X1 X0 X1 X0 X0 X1 X1 X0)
xA7 = (BuildOctet X1 X0 X1 X0 X0 X1 X1 X1)
xA8 = (BuildOctet X1 X0 X1 X0 X1 X0 X0 X0)
xA9 = (BuildOctet X1 X0 X1 X0 X1 X0 X0 X1)
xAA = (BuildOctet X1 X0 X1 X0 X1 X0 X1 X0)
xAB = (BuildOctet X1 X0 X1 X0 X1 X0 X1 X1)
xAC = (BuildOctet X1 X0 X1 X0 X1 X1 X0 X0)
xAE = (BuildOctet X1 X0 X1 X0 X1 X1 X1 X0)
xAF = (BuildOctet X1 X0 X1 X0 X1 X1 X1 X1)
xB0 = (BuildOctet X1 X0 X1 X1 X0 X0 X0 X0)
xB1 = (BuildOctet X1 X0 X1 X1 X0 X0 X0 X1)
xB2 = (BuildOctet X1 X0 X1 X1 X0 X0 X1 X0)
xB3 = (BuildOctet X1 X0 X1 X1 X0 X0 X1 X1)
xB5 = (BuildOctet X1 X0 X1 X1 X0 X1 X0 X1)
xB6 = (BuildOctet X1 X0 X1 X1 X0 X1 X1 X0)
xB8 = (BuildOctet X1 X0 X1 X1 X1 X0 X0 X0)
xB9 = (BuildOctet X1 X0 X1 X1 X1 X0 X0 X1)
xBA = (BuildOctet X1 X0 X1 X1 X1 X0 X1 X0)
xBB = (BuildOctet X1 X0 X1 X1 X1 X0 X1 X1)
xBC = (BuildOctet X1 X0 X1 X1 X1 X1 X0 X0)
xBE = (BuildOctet X1 X0 X1 X1 X1 X1 X1 X0)
xBF = (BuildOctet X1 X0 X1 X1 X1 X1 X1 X1)
xC0 = (BuildOctet X1 X1 X0 X0 X0 X0 X0 X0)
xC1 = (BuildOctet X1 X1 X0 X0 X0 X0 X0 X1)
xC2 = (BuildOctet X1 X1 X0 X0 X0 X0 X1 X0)
xC4 = (BuildOctet X1 X1 X0 X0 X0 X1 X0 X0)
xC5 = (BuildOctet X1 X1 X0 X0 X0 X1 X0 X1)
xC6 = (BuildOctet X1 X1 X0 X0 X0 X1 X1 X0)
xC7 = (BuildOctet X1 X1 X0 X0 X0 X1 X1 X1)
xC8 = (BuildOctet X1 X1 X0 X0 X1 X0 X0 X0)
xC9 = (BuildOctet X1 X1 X0 X0 X1 X0 X0 X1)
xCA = (BuildOctet X1 X1 X0 X0 X1 X0 X1 X0)
xCB = (BuildOctet X1 X1 X0 X0 X1 X0 X1 X1)
xCC = (BuildOctet X1 X1 X0 X0 X1 X1 X0 X0)
xCD = (BuildOctet X1 X1 X0 X0 X1 X1 X0 X1)
xCE = (BuildOctet X1 X1 X0 X0 X1 X1 X1 X0)
xD0 = (BuildOctet X1 X1 X0 X1 X0 X0 X0 X0)
xD1 = (BuildOctet X1 X1 X0 X1 X0 X0 X0 X1)
xD2 = (BuildOctet X1 X1 X0 X1 X0 X0 X1 X0)
xD3 = (BuildOctet X1 X1 X0 X1 X0 X0 X1 X1)
xD4 = (BuildOctet X1 X1 X0 X1 X0 X1 X0 X0)
xD5 = (BuildOctet X1 X1 X0 X1 X0 X1 X0 X1)
xD6 = (BuildOctet X1 X1 X0 X1 X0 X1 X1 X0)
xD7 = (BuildOctet X1 X1 X0 X1 X0 X1 X1 X1)
xD8 = (BuildOctet X1 X1 X0 X1 X1 X0 X0 X0)
xD9 = (BuildOctet X1 X1 X0 X1 X1 X0 X0 X1)
xDB = (BuildOctet X1 X1 X0 X1 X1 X0 X1 X1)
xDC = (BuildOctet X1 X1 X0 X1 X1 X1 X0 X0)
xDD = (BuildOctet X1 X1 X0 X1 X1 X1 X0 X1)
xDE = (BuildOctet X1 X1 X0 X1 X1 X1 X1 X0)
xDF = (BuildOctet X1 X1 X0 X1 X1 X1 X1 X1)
xE0 = (BuildOctet X1 X1 X1 X0 X0 X0 X0 X0)
xE1 = (BuildOctet X1 X1 X1 X0 X0 X0 X0 X1)
xE3 = (BuildOctet X1 X1 X1 X0 X0 X0 X1 X1)
xE6 = (BuildOctet X1 X1 X1 X0 X0 X1 X1 X0)
xE8 = (BuildOctet X1 X1 X1 X0 X1 X0 X0 X0)
xE9 = (BuildOctet X1 X1 X1 X0 X1 X0 X0 X1)
xEA = (BuildOctet X1 X1 X1 X0 X1 X0 X1 X0)
xEB = (BuildOctet X1 X1 X1 X0 X1 X0 X1 X1)
xEC = (BuildOctet X1 X1 X1 X0 X1 X1 X0 X0)
xED = (BuildOctet X1 X1 X1 X0 X1 X1 X0 X1)
xEE = (BuildOctet X1 X1 X1 X0 X1 X1 X1 X0)
xEF = (BuildOctet X1 X1 X1 X0 X1 X1 X1 X1)
xF0 = (BuildOctet X1 X1 X1 X1 X0 X0 X0 X0)
xF1 = (BuildOctet X1 X1 X1 X1 X0 X0 X0 X1)
xF2 = (BuildOctet X1 X1 X1 X1 X0 X0 X1 X0)
xF3 = (BuildOctet X1 X1 X1 X1 X0 X0 X1 X1)
xF4 = (BuildOctet X1 X1 X1 X1 X0 X1 X0 X0)
xF5 = (BuildOctet X1 X1 X1 X1 X0 X1 X0 X1)
xF6 = (BuildOctet X1 X1 X1 X1 X0 X1 X1 X0)
xF7 = (BuildOctet X1 X1 X1 X1 X0 X1 X1 X1)
xF8 = (BuildOctet X1 X1 X1 X1 X1 X0 X0 X0)
xF9 = (BuildOctet X1 X1 X1 X1 X1 X0 X0 X1)
xFA = (BuildOctet X1 X1 X1 X1 X1 X0 X1 X0)
xFB = (BuildOctet X1 X1 X1 X1 X1 X0 X1 X1)
xFC = (BuildOctet X1 X1 X1 X1 X1 X1 X0 X0)
xFD = (BuildOctet X1 X1 X1 X1 X1 X1 X0 X1)
xFE = (BuildOctet X1 X1 X1 X1 X1 X1 X1 X0)
xFF = (BuildOctet X1 X1 X1 X1 X1 X1 X1 X1)
andBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (andOctet o1 o_prime1) (andOctet o2 o_prime2) (andOctet o3 o_prime3) (andOctet o4 o_prime4))
orBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (orOctet o1 o_prime1) (orOctet o2 o_prime2) (orOctet o3 o_prime3) (orOctet o4 o_prime4))
xorBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (xorOctet o1 o_prime1) (xorOctet o2 o_prime2) (xorOctet o3 o_prime3) (xorOctet o4 o_prime4))
x0001 = (BuildHalf x00 x01)
x00000000 = (BuildBlock x00 x00 x00 x00)
x00000001 = (BuildBlock x00 x00 x00 x01)
x00000002 = (BuildBlock x00 x00 x00 x02)
x00000003 = (BuildBlock x00 x00 x00 x03)
x00000004 = (BuildBlock x00 x00 x00 x04)
x00000005 = (BuildBlock x00 x00 x00 x05)
x00000006 = (BuildBlock x00 x00 x00 x06)
x00000007 = (BuildBlock x00 x00 x00 x07)
x00000008 = (BuildBlock x00 x00 x00 x08)
x00000009 = (BuildBlock x00 x00 x00 x09)
x0000000A = (BuildBlock x00 x00 x00 x0A)
x0000000B = (BuildBlock x00 x00 x00 x0B)
x0000000C = (BuildBlock x00 x00 x00 x0C)
x0000000D = (BuildBlock x00 x00 x00 x0D)
x0000000E = (BuildBlock x00 x00 x00 x0E)
x0000000F = (BuildBlock x00 x00 x00 x0F)
x00000010 = (BuildBlock x00 x00 x00 x10)
x00000012 = (BuildBlock x00 x00 x00 x12)
x00000014 = (BuildBlock x00 x00 x00 x14)
x00000016 = (BuildBlock x00 x00 x00 x16)
x00000018 = (BuildBlock x00 x00 x00 x18)
x0000001B = (BuildBlock x00 x00 x00 x1B)
x0000001D = (BuildBlock x00 x00 x00 x1D)
x0000001E = (BuildBlock x00 x00 x00 x1E)
x0000001F = (BuildBlock x00 x00 x00 x1F)
x00000031 = (BuildBlock x00 x00 x00 x31)
x00000036 = (BuildBlock x00 x00 x00 x36)
x00000060 = (BuildBlock x00 x00 x00 x60)
x00000080 = (BuildBlock x00 x00 x00 x80)
x000000A5 = (BuildBlock x00 x00 x00 xA5)
x000000B6 = (BuildBlock x00 x00 x00 xB6)
x000000C4 = (BuildBlock x00 x00 x00 xC4)
x000000D2 = (BuildBlock x00 x00 x00 xD2)
x00000100 = (BuildBlock x00 x00 x01 x00)
x00000129 = (BuildBlock x00 x00 x01 x29)
x0000018C = (BuildBlock x00 x00 x01 x8C)
x00004000 = (BuildBlock x00 x00 x40 x00)
x00010000 = (BuildBlock x00 x01 x00 x00)
x00020000 = (BuildBlock x00 x02 x00 x00)
x00030000 = (BuildBlock x00 x03 x00 x00)
x00040000 = (BuildBlock x00 x04 x00 x00)
x00060000 = (BuildBlock x00 x06 x00 x00)
x00804021 = (BuildBlock x00 x80 x40 x21)
x00FF00FF = (BuildBlock x00 xFF x00 xFF)
x0103050B = (BuildBlock x01 x03 x05 x0B)
x01030703 = (BuildBlock x01 x03 x07 x03)
x01030705 = (BuildBlock x01 x03 x07 x05)
x0103070F = (BuildBlock x01 x03 x07 x0F)
x02040801 = (BuildBlock x02 x04 x08 x01)
x0297AF6F = (BuildBlock x02 x97 xAF x6F)
x07050301 = (BuildBlock x07 x05 x03 x01)
x077788A2 = (BuildBlock x07 x77 x88 xA2)
x07C72EAA = (BuildBlock x07 xC7 x2E xAA)
x0A202020 = (BuildBlock x0A x20 x20 x20)
x0AD67E20 = (BuildBlock x0A xD6 x7E x20)
x10000000 = (BuildBlock x10 x00 x00 x00)
x11A9D254 = (BuildBlock x11 xA9 xD2 x54)
x11AC46B8 = (BuildBlock x11 xAC x46 xB8)
x1277A6D4 = (BuildBlock x12 x77 xA6 xD4)
x13647149 = (BuildBlock x13 x64 x71 x49)
x160EE9B5 = (BuildBlock x16 x0E xE9 xB5)
x17065DBB = (BuildBlock x17 x06 x5D xBB)
x17A808FD = (BuildBlock x17 xA8 x08 xFD)
x1D10D8D3 = (BuildBlock x1D x10 xD8 xD3)
x1D3B7760 = (BuildBlock x1D x3B x77 x60)
x1D9C9655 = (BuildBlock x1D x9C x96 x55)
x1F3F7FFF = (BuildBlock x1F x3F x7F xFF)
x204E80A7 = (BuildBlock x20 x4E x80 xA7)
x21D869BA = (BuildBlock x21 xD8 x69 xBA)
x24B66FB5 = (BuildBlock x24 xB6 x6F xB5)
x270EEDAF = (BuildBlock x27 x0E xED xAF)
x277B4B25 = (BuildBlock x27 x7B x4B x25)
x2829040B = (BuildBlock x28 x29 x04 x0B)
x288FC786 = (BuildBlock x28 x8F xC7 x86)
x28EAD8B3 = (BuildBlock x28 xEA xD8 xB3)
x29907CD8 = (BuildBlock x29 x90 x7C xD8)
x29C1485F = (BuildBlock x29 xC1 x48 x5F)
x29EEE96B = (BuildBlock x29 xEE xE9 x6B)
x2A6091AE = (BuildBlock x2A x60 x91 xAE)
x2BF8499A = (BuildBlock x2B xF8 x49 x9A)
x2E80AC30 = (BuildBlock x2E x80 xAC x30)
x2FD76FFB = (BuildBlock x2F xD7 x6F xFB)
x30261492 = (BuildBlock x30 x26 x14 x92)
x303FF4AA = (BuildBlock x30 x3F xF4 xAA)
x33D5A466 = (BuildBlock x33 xD5 xA4 x66)
x344925FC = (BuildBlock x34 x49 x25 xFC)
x34ACF886 = (BuildBlock x34 xAC xF8 x86)
x3CD54DEB = (BuildBlock x3C xD5 x4D xEB)
x3CF3A7D2 = (BuildBlock x3C xF3 xA7 xD2)
x3DD81AC6 = (BuildBlock x3D xD8 x1A xC6)
x3F6F7248 = (BuildBlock x3F x6F x72 x48)
x48B204D6 = (BuildBlock x48 xB2 x04 xD6)
x4A645A01 = (BuildBlock x4A x64 x5A x01)
x4C49AAE0 = (BuildBlock x4C x49 xAA xE0)
x4CE933E1 = (BuildBlock x4C xE9 x33 xE1)
x4D53901A = (BuildBlock x4D x53 x90 x1A)
x4DA124A1 = (BuildBlock x4D xA1 x24 xA1)
x4F998E01 = (BuildBlock x4F x99 x8E x01)
x4FB1138A = (BuildBlock x4F xB1 x13 x8A)
x50DEC930 = (BuildBlock x50 xDE xC9 x30)
x51AF3C1D = (BuildBlock x51 xAF x3C x1D)
x51EDE9C7 = (BuildBlock x51 xED xE9 xC7)
x550D91CE = (BuildBlock x55 x0D x91 xCE)
x55555555 = (BuildBlock x55 x55 x55 x55)
x55DD063F = (BuildBlock x55 xDD x06 x3F)
x5834A585 = (BuildBlock x58 x34 xA5 x85)
x5A35D667 = (BuildBlock x5A x35 xD6 x67)
x5BC02502 = (BuildBlock x5B xC0 x25 x02)
x5CCA3239 = (BuildBlock x5C xCA x32 x39)
x5EBA06C2 = (BuildBlock x5E xBA x06 xC2)
x5F38EEF1 = (BuildBlock x5F x38 xEE xF1)
x613F8E2A = (BuildBlock x61 x3F x8E x2A)
x63C70DBA = (BuildBlock x63 xC7 x0D xBA)
x6AD6E8A4 = (BuildBlock x6A xD6 xE8 xA4)
x6AEBACF8 = (BuildBlock x6A xEB xAC xF8)
x6D67E884 = (BuildBlock x6D x67 xE8 x84)
x7050EC5E = (BuildBlock x70 x50 xEC x5E)
x717153D5 = (BuildBlock x71 x71 x53 xD5)
x7201F4DC = (BuildBlock x72 x01 xF4 xDC)
x7397C9AE = (BuildBlock x73 x97 xC9 xAE)
x74B39176 = (BuildBlock x74 xB3 x91 x76)
x76232E5F = (BuildBlock x76 x23 x2E x5F)
x7783C51D = (BuildBlock x77 x83 xC5 x1D)
x7792F9D4 = (BuildBlock x77 x92 xF9 xD4)
x7BC180AB = (BuildBlock x7B xC1 x80 xAB)
x7DB2D9F4 = (BuildBlock x7D xB2 xD9 xF4)
x7DFEFBFF = (BuildBlock x7D xFE xFB xFF)
x7F76A3B0 = (BuildBlock x7F x76 xA3 xB0)
x7F839576 = (BuildBlock x7F x83 x95 x76)
x7FFFFFF0 = (BuildBlock x7F xFF xFF xF0)
x7FFFFFF1 = (BuildBlock x7F xFF xFF xF1)
x7FFFFFFC = (BuildBlock x7F xFF xFF xFC)
x7FFFFFFD = (BuildBlock x7F xFF xFF xFD)
x80000000 = (BuildBlock x80 x00 x00 x00)
x80000002 = (BuildBlock x80 x00 x00 x02)
x800000C2 = (BuildBlock x80 x00 x00 xC2)
x80018000 = (BuildBlock x80 x01 x80 x00)
x80018001 = (BuildBlock x80 x01 x80 x01)
x80397302 = (BuildBlock x80 x39 x73 x02)
x81D10CA3 = (BuildBlock x81 xD1 x0C xA3)
x89D635D7 = (BuildBlock x89 xD6 x35 xD7)
x8CE37709 = (BuildBlock x8C xE3 x77 x09)
x8DC8BBDE = (BuildBlock x8D xC8 xBB xDE)
x9115A558 = (BuildBlock x91 x15 xA5 x58)
x91896CFA = (BuildBlock x91 x89 x6C xFA)
x9372CDC6 = (BuildBlock x93 x72 xCD xC6)
x98D1CC75 = (BuildBlock x98 xD1 xCC x75)
x9D15C437 = (BuildBlock x9D x15 xC4 x37)
x9DB15CF6 = (BuildBlock x9D xB1 x5C xF6)
x9E2E7B36 = (BuildBlock x9E x2E x7B x36)
xA018C83B = (BuildBlock xA0 x18 xC8 x3B)
xA0B87B77 = (BuildBlock xA0 xB8 x7B x77)
xA44AAAC0 = (BuildBlock xA4 x4A xAA xC0)
xA511987A = (BuildBlock xA5 x11 x98 x7A)
xA70FC148 = (BuildBlock xA7 x0F xC1 x48)
xA93BD410 = (BuildBlock xA9 x3B xD4 x10)
xAAAAAAAA = (BuildBlock xAA xAA xAA xAA)
xAB00FFCD = (BuildBlock xAB x00 xFF xCD)
xAB01FCCD = (BuildBlock xAB x01 xFC xCD)
xAB6EED4A = (BuildBlock xAB x6E xED x4A)
xABEEED6B = (BuildBlock xAB xEE xED x6B)
xACBC13DD = (BuildBlock xAC xBC x13 xDD)
xB1CC1CC5 = (BuildBlock xB1 xCC x1C xC5)
xB8142629 = (BuildBlock xB8 x14 x26 x29)
xB99A62DE = (BuildBlock xB9 x9A x62 xDE)
xBA92DB12 = (BuildBlock xBA x92 xDB x12)
xBBA57835 = (BuildBlock xBB xA5 x78 x35)
xBE9F0917 = (BuildBlock xBE x9F x09 x17)
xBF2D7D85 = (BuildBlock xBF x2D x7D x85)
xBFEF7FDF = (BuildBlock xBF xEF x7F xDF)
xC1ED90DD = (BuildBlock xC1 xED x90 xDD)
xC21A1846 = (BuildBlock xC2 x1A x18 x46)
xC4EB1AEB = (BuildBlock xC4 xEB x1A xEB)
xC6B1317E = (BuildBlock xC6 xB1 x31 x7E)
xCBC865BA = (BuildBlock xCB xC8 x65 xBA)
xCD959B46 = (BuildBlock xCD x95 x9B x46)
xD0482465 = (BuildBlock xD0 x48 x24 x65)
xD636250D = (BuildBlock xD6 x36 x25 x0D)
xD7843FDC = (BuildBlock xD7 x84 x3F xDC)
xD78634BC = (BuildBlock xD7 x86 x34 xBC)
xD8804CA5 = (BuildBlock xD8 x80 x4C xA5)
xDB79FBDC = (BuildBlock xDB x79 xFB xDC)
xDB9102B0 = (BuildBlock xDB x91 x02 xB0)
xE0C08000 = (BuildBlock xE0 xC0 x80 x00)
xE6A12F07 = (BuildBlock xE6 xA1 x2F x07)
xEB35B97F = (BuildBlock xEB x35 xB9 x7F)
xF0239DD5 = (BuildBlock xF0 x23 x9D xD5)
xF14D6E28 = (BuildBlock xF1 x4D x6E x28)
xF2EF3501 = (BuildBlock xF2 xEF x35 x01)
xF6A09667 = (BuildBlock xF6 xA0 x96 x67)
xFD297DA4 = (BuildBlock xFD x29 x7D xA4)
xFDC1A8BA = (BuildBlock xFD xC1 xA8 xBA)
xFE4E5BDD = (BuildBlock xFE x4E x5B xDD)
xFEA1D334 = (BuildBlock xFE xA1 xD3 x34)
xFECCAA6E = (BuildBlock xFE xCC xAA x6E)
xFEFC07F0 = (BuildBlock xFE xFC x07 xF0)
xFF2D7DA5 = (BuildBlock xFF x2D x7D xA5)
xFFEF0001 = (BuildBlock xFF xEF x00 x01)
xFFFF00FF = (BuildBlock xFF xFF x00 xFF)
xFFFFFF2D = (BuildBlock xFF xFF xFF x2D)
xFFFFFF3A = (BuildBlock xFF xFF xFF x3A)
xFFFFFFF0 = (BuildBlock xFF xFF xFF xF0)
xFFFFFFF1 = (BuildBlock xFF xFF xFF xF1)
xFFFFFFF4 = (BuildBlock xFF xFF xFF xF4)
xFFFFFFF5 = (BuildBlock xFF xFF xFF xF5)
xFFFFFFF7 = (BuildBlock xFF xFF xFF xF7)
xFFFFFFF9 = (BuildBlock xFF xFF xFF xF9)
xFFFFFFFA = (BuildBlock xFF xFF xFF xFA)
xFFFFFFFB = (BuildBlock xFF xFF xFF xFB)
xFFFFFFFC = (BuildBlock xFF xFF xFF xFC)
xFFFFFFFD = (BuildBlock xFF xFF xFF xFD)
xFFFFFFFE = (BuildBlock xFF xFF xFF xFE)
xFFFFFFFF = (BuildBlock xFF xFF xFF xFF)
appendMessage (UnitMessage w) w_prime = (ConsMessage w (UnitMessage w_prime))
appendMessage (ConsMessage w m) w_prime = (ConsMessage w (appendMessage m w_prime))
reverseMessage (UnitMessage w) = (UnitMessage w)
reverseMessage (ConsMessage w m) = (appendMessage (reverseMessage m) w)
makeMessage (Xsucc n) w w_prime | (eqNat n Zero) == Xtrue = (UnitMessage w)
makeMessage (Xsucc n) w w_prime | (eqNat n Zero) == Xfalse = (ConsMessage w (makeMessage n (aDD w w_prime) w_prime))
aDD w w_prime = (addBlock w w_prime)
xand w w_prime = (andBlock w w_prime)
mUL w w_prime = (mulBlock w w_prime)
yor w w_prime = (orBlock w w_prime)
xOR w w_prime = (xorBlock w w_prime)
xOR_prime (BuildPair w w_prime) = (xOR w w_prime)
cYC (BuildBlock (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b9 b10 b11 b12 b13 b14 b15 b16) (BuildOctet b17 b18 b19 b20 b21 b22 b23 b24) (BuildOctet b25 b26 b27 b28 b29 b30 b31 b32)) = (BuildBlock (BuildOctet b2 b3 b4 b5 b6 b7 b8 b9) (BuildOctet b10 b11 b12 b13 b14 b15 b16 b17) (BuildOctet b18 b19 b20 b21 b22 b23 b24 b25) (BuildOctet b26 b27 b28 b29 b30 b31 b32 b1))
nCYC Zero w = w
nCYC (Xsucc n) w = (cYC (nCYC n w))
fIX1 w = (xand (yor w x02040801) xBFEF7FDF)
fIX2 w = (xand (yor w x00804021) x7DFEFBFF)
needAdjust o = (orBool (eqOctet o x00) (eqOctet o xFF))
adjustCode o | (needAdjust o) == Xtrue = X1
adjustCode o | (needAdjust o) == Xfalse = X0
adjust o o_prime | (needAdjust o) == Xtrue = (xorOctet o o_prime)
adjust o o_prime | (needAdjust o) == Xfalse = o
pAT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildOctet (adjustCode o1) (adjustCode o2) (adjustCode o3) (adjustCode o4) (adjustCode o_prime1) (adjustCode o_prime2) (adjustCode o_prime3) (adjustCode o_prime4))
bYT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (bYT_prime o1 o2 o3 o4 o_prime1 o_prime2 o_prime3 o_prime4 (pAT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4)))
bYT_prime o1 o2 o3 o4 o_prime1 o_prime2 o_prime3 o_prime4 opat = (BuildPair (BuildBlock (adjust o1 (rightOctet7 opat)) (adjust o2 (rightOctet6 opat)) (adjust o3 (rightOctet5 opat)) (adjust o4 (rightOctet4 opat))) (BuildBlock (adjust o_prime1 (rightOctet3 opat)) (adjust o_prime2 (rightOctet2 opat)) (adjust o_prime3 (rightOctet1 opat)) (adjust o_prime4 opat)))
aDDC w w_prime = (aDDC_prime (addBlockSum w w_prime))
aDDC_prime (BuildBlockSum X0 w) = (BuildPair x00000000 w)
aDDC_prime (BuildBlockSum X1 w) = (BuildPair x00000001 w)
mUL1 w w_prime = (mUL1XY (mUL w w_prime))
mUL1XY (BuildPair w w_prime) = (mUL1UL w w_prime)
mUL1UL w w_prime = (mUL1SC (aDDC w w_prime))
mUL1SC (BuildPair wcarry w) = (aDD w wcarry)
mUL2 w w_prime = (mUL2XY (mUL w w_prime))
mUL2XY (BuildPair w w_prime) = (mUL2UL w w_prime)
mUL2UL w w_prime = (mUL2DEL (aDDC w w) w_prime)
mUL2DEL (BuildPair wcarry w) w_prime = (mUL2FL (aDD w (aDD wcarry wcarry)) w_prime)
mUL2FL w w_prime = (mUL2SC (aDDC w w_prime))
mUL2SC (BuildPair wcarry w) = (aDD w (aDD wcarry wcarry))
mUL2A w w_prime = (mUL2AXY (mUL w w_prime))
mUL2AXY (BuildPair w w_prime) = (mUL2AUL w w_prime)
mUL2AUL w w_prime = (mUL2ADL (aDD w w) w_prime)
mUL2ADL w w_prime = (mUL2ASC (aDDC w w_prime))
mUL2ASC (BuildPair wcarry w) = (aDD w (aDD wcarry wcarry))
squareHalf h = (mulHalf h h)
q o = (squareHalf (addHalf (BuildHalf x00 o) x0001))
j1_2 w = (mUL1 w w)
j1_4 w = (mUL1 (j1_2 w) (j1_2 w))
j1_6 w = (mUL1 (j1_2 w) (j1_4 w))
j1_8 w = (mUL1 (j1_2 w) (j1_6 w))
j2_2 w = (mUL2 w w)
j2_4 w = (mUL2 (j2_2 w) (j2_2 w))
j2_6 w = (mUL2 (j2_2 w) (j2_4 w))
j2_8 w = (mUL2 (j2_2 w) (j2_6 w))
k1_2 w = (mUL1 w w)
k1_4 w = (mUL1 (k1_2 w) (k1_2 w))
k1_5 w = (mUL1 w (k1_4 w))
k1_7 w = (mUL1 (k1_2 w) (k1_5 w))
k1_9 w = (mUL1 (k1_2 w) (k1_7 w))
k2_2 w = (mUL2 w w)
k2_4 w = (mUL2 (k2_2 w) (k2_2 w))
k2_5 w = (mUL2 w (k2_4 w))
k2_7 w = (mUL2 (k2_2 w) (k2_5 w))
k2_9 w = (mUL2 (k2_2 w) (k2_7 w))
h4 w = (xOR (j1_4 w) (j2_4 w))
h6 w = (xOR (j1_6 w) (j2_6 w))
h8 w = (xOR (j1_8 w) (j2_8 w))
h0 w = (xOR (k1_5 w) (k2_5 w))
h5 w o = (mUL2 (h0 w) (q o))
h7 w = (xOR (k1_7 w) (k2_7 w))
h9 w = (xOR (k1_9 w) (k2_9 w))
splitSegment (UnitMessage w) = (UnitSegment (UnitMessage w))
splitSegment (ConsMessage w m) = (cutSegment m (UnitMessage w) n254)
cutSegment (UnitMessage w) m_prime n = (UnitSegment (reverseMessage (ConsMessage w m_prime)))
cutSegment (ConsMessage w m) m_prime Zero = (ConsSegment (reverseMessage (ConsMessage w m_prime)) (splitSegment m))
cutSegment (ConsMessage w m) m_prime (Xsucc n) = (cutSegment m (ConsMessage w m_prime) n)
preludeXY w1 w2 = (preludeXY_prime (bYT w1 w2) (pAT w1 w2))
preludeVW w1 w2 = (preludeVW_prime (bYT w1 w2))
preludeST w1 w2 = (preludeST_prime (bYT w1 w2))
preludeXY_prime (BuildPair w w_prime) o = (bYT (h4 w) (h5 w_prime o))
preludeVW_prime (BuildPair w w_prime) = (bYT (h6 w) (h7 w_prime))
preludeST_prime (BuildPair w w_prime) = (bYT (h8 w) (h9 w_prime))
computeXY p p_prime w = (computeXY_prime p w (xOR_prime (computeVW p_prime)))
computeXY_prime (BuildPair w1 w2) w w_prime = (BuildPair (mUL1 (xOR w1 w) (fIX1 (aDD (xOR w2 w) w_prime))) (mUL2A (xOR w2 w) (fIX2 (aDD (xOR w1 w) w_prime))))
computeVW (BuildPair w1 w2) = (BuildPair (cYC w1) w2)
loop1 p p_prime (UnitMessage w) = (computeXY p p_prime w)
loop1 p p_prime (ConsMessage w m) = (loop1 (computeXY p p_prime w) (computeVW p_prime) m)
loop2 p p_prime (UnitMessage w) = (computeVW p_prime)
loop2 p p_prime (ConsMessage w m) = (loop2 (computeXY p p_prime w) (computeVW p_prime) m)
coda p p_prime (BuildPair w w_prime) = (xOR_prime (computeXY (computeXY p p_prime w) (computeVW p_prime) w_prime))
mAA (BuildKey w1 w2) m = (mAA_prime (preludeXY w1 w2) (preludeVW w1 w2) (preludeST w1 w2) m)
mAA_prime p1 p2 p3 m = (coda (loop1 p1 p2 m) (loop2 p1 p2 m) p3)
mAC k m = (mACfirst k (splitSegment m))
mACfirst k (UnitSegment m) = (mAA k m)
mACfirst k (ConsSegment m s) = (mACnext k (mAA k m) s)
mACnext k w (UnitSegment m) = (mAA k (ConsMessage w m))
mACnext k w (ConsSegment m s) = (mACnext k (mAA k (ConsMessage w m)) s)

main = do
 print (eqBlock (mUL1 x0000000F x0000000E) x000000D2)
 print (eqBlock (mUL1 xFFFFFFF0 x0000000E) xFFFFFF2D)
 print (eqBlock (mUL1 xFFFFFFF0 xFFFFFFF1) x000000D2)
 print (eqBlock (mUL2 x0000000F x0000000E) x000000D2)
 print (eqBlock (mUL2 xFFFFFFF0 x0000000E) xFFFFFF3A)
 print (eqBlock (mUL2 xFFFFFFF0 xFFFFFFF1) x000000B6)
 print (eqBlock (mUL2A x0000000F x0000000E) x000000D2)
 print (eqBlock (mUL2A xFFFFFFF0 x0000000E) xFFFFFF3A)
 print (eqBlock (mUL2A x7FFFFFF0 xFFFFFFF1) x800000C2)
 print (eqBlock (mUL2A xFFFFFFF0 x7FFFFFF1) x000000C4)
 print (eqPair (bYT x00000000 x00000000) (BuildPair x0103070F x1F3F7FFF))
 print (eqPair (bYT xFFFF00FF xFFFFFFFF) (BuildPair xFEFC07F0 xE0C08000))
 print (eqPair (bYT xAB00FFCD xFFEF0001) (BuildPair xAB01FCCD xF2EF3501))
 print (eqOctet (pAT x00000000 x00000000) xFF)
 print (eqOctet (pAT xFFFF00FF xFFFFFFFF) xFF)
 print (eqOctet (pAT xAB00FFCD xFFEF0001) x6A)
 print (eqBlock (j1_2 x00000100) x00010000)
 print (eqBlock (j1_4 x00000100) x00000001)
 print (eqBlock (j1_6 x00000100) x00010000)
 print (eqBlock (j1_8 x00000100) x00000001)
 print (eqBlock (j2_2 x00000100) x00010000)
 print (eqBlock (j2_4 x00000100) x00000002)
 print (eqBlock (j2_6 x00000100) x00020000)
 print (eqBlock (j2_8 x00000100) x00000004)
 print (eqBlock (h4 x00000100) x00000003)
 print (eqBlock (h6 x00000100) x00030000)
 print (eqBlock (h8 x00000100) x00000005)
 print (eqBlock (k1_2 x00000080) x00004000)
 print (eqBlock (k1_4 x00000080) x10000000)
 print (eqBlock (k1_5 x00000080) x00000008)
 print (eqBlock (k1_7 x00000080) x00020000)
 print (eqBlock (k1_9 x00000080) x80000000)
 print (eqBlock (k2_2 x00000080) x00004000)
 print (eqBlock (k2_4 x00000080) x10000000)
 print (eqBlock (k2_5 x00000080) x00000010)
 print (eqBlock (k2_7 x00000080) x00040000)
 print (eqBlock (k2_9 x00000080) x00000002)
 print (eqBlock (h0 x00000080) x00000018)
 print (eqBlock (q x01) x00000004)
 print (eqBlock (h5 x00000080 x01) x00000060)
 print (eqBlock (h7 x00000080) x00060000)
 print (eqBlock (h9 x00000080) x80000002)
 print (eqOctet (pAT x00000003 x00000060) xEE)
 print (eqOctet (pAT x00030000 x00060000) xBB)
 print (eqOctet (pAT x00000005 x80000002) xE6)
 print (eqPair (bYT x00000003 x00000060) (BuildPair x01030703 x1D3B7760))
 print (eqPair (bYT x00030000 x00060000) (BuildPair x0103050B x17065DBB))
 print (eqPair (bYT x00000005 x80000002) (BuildPair x01030705 x80397302))
 print (eqBlock (cYC x00000003) x00000006)
 print (eqBlock (xOR x00000006 x00000003) x00000005)
 print (eqBlock (xOR x00000002 x00000005) x00000007)
 print (eqBlock (xOR x00000003 x00000005) x00000006)
 print (eqBlock (aDD x00000005 x00000006) x0000000B)
 print (eqBlock (aDD x00000005 x00000007) x0000000C)
 print (eqBlock (yor x0000000B x00000004) x0000000F)
 print (eqBlock (yor x0000000C x00000001) x0000000D)
 print (eqBlock (xand x0000000F xFFFFFFF7) x00000007)
 print (eqBlock (xand x0000000D xFFFFFFFB) x00000009)
 print (eqBlock (mUL1 x00000007 x00000007) x00000031)
 print (eqBlock (mUL2A x00000006 x00000009) x00000036)
 print (eqBlock (xOR x00000031 x00000036) x00000007)
 print (eqBlock (cYC x00000003) x00000006)
 print (eqBlock (xOR x00000006 x00000003) x00000005)
 print (eqBlock (xOR xFFFFFFFD x00000001) xFFFFFFFC)
 print (eqBlock (xOR xFFFFFFFC x00000001) xFFFFFFFD)
 print (eqBlock (aDD x00000005 xFFFFFFFD) x00000002)
 print (eqBlock (aDD x00000005 xFFFFFFFC) x00000001)
 print (eqBlock (yor x00000002 x00000001) x00000003)
 print (eqBlock (yor x00000001 x00000004) x00000005)
 print (eqBlock (xand x00000003 xFFFFFFF9) x00000001)
 print (eqBlock (xand x00000005 xFFFFFFFC) x00000004)
 print (eqBlock (mUL1 xFFFFFFFC x00000001) xFFFFFFFC)
 print (eqBlock (mUL2A xFFFFFFFD x00000004) xFFFFFFFA)
 print (eqBlock (xOR xFFFFFFFC xFFFFFFFA) x00000006)
 print (eqBlock (cYC x00000007) x0000000E)
 print (eqBlock (xOR x0000000E x00000007) x00000009)
 print (eqBlock (xOR xFFFFFFFD x00000008) xFFFFFFF5)
 print (eqBlock (xOR xFFFFFFFC x00000008) xFFFFFFF4)
 print (eqBlock (aDD x00000009 xFFFFFFF4) xFFFFFFFD)
 print (eqBlock (aDD x00000009 xFFFFFFF5) xFFFFFFFE)
 print (eqBlock (yor xFFFFFFFD x00000001) xFFFFFFFD)
 print (eqBlock (yor xFFFFFFFE x00000002) xFFFFFFFE)
 print (eqBlock (xand xFFFFFFFD xFFFFFFFE) xFFFFFFFC)
 print (eqBlock (xand xFFFFFFFE x7FFFFFFD) x7FFFFFFC)
 print (eqBlock (mUL1 xFFFFFFF5 xFFFFFFFC) x0000001E)
 print (eqBlock (mUL2A xFFFFFFF4 x7FFFFFFC) x0000001E)
 print (eqBlock (xOR x0000001E x0000001E) x00000000)
 print (eqBlock (cYC x00000001) x00000002)
 print (eqBlock (xOR x00000002 x00000001) x00000003)
 print (eqBlock (xOR x00000001 x00000000) x00000001)
 print (eqBlock (xOR x00000002 x00000000) x00000002)
 print (eqBlock (aDD x00000003 x00000002) x00000005)
 print (eqBlock (aDD x00000003 x00000001) x00000004)
 print (eqBlock (yor x00000005 x00000002) x00000007)
 print (eqBlock (yor x00000004 x00000001) x00000005)
 print (eqBlock (xand x00000007 xFFFFFFFB) x00000003)
 print (eqBlock (xand x00000005 xFFFFFFFB) x00000001)
 print (eqBlock (mUL1 x00000001 x00000003) x00000003)
 print (eqBlock (mUL2A x00000002 x00000001) x00000002)
 print (eqBlock (xOR x00000003 x00000002) x00000001)
 print (eqBlock (cYC x00000002) x00000004)
 print (eqBlock (xOR x00000004 x00000001) x00000005)
 print (eqBlock (xOR x00000003 x00000001) x00000002)
 print (eqBlock (xOR x00000002 x00000001) x00000003)
 print (eqBlock (aDD x00000005 x00000003) x00000008)
 print (eqBlock (aDD x00000005 x00000002) x00000007)
 print (eqBlock (yor x00000008 x00000002) x0000000A)
 print (eqBlock (yor x00000007 x00000001) x00000007)
 print (eqBlock (xand x0000000A xFFFFFFFB) x0000000A)
 print (eqBlock (xand x00000007 xFFFFFFFB) x00000003)
 print (eqBlock (mUL1 x00000002 x0000000A) x00000014)
 print (eqBlock (mUL2A x00000003 x00000003) x00000009)
 print (eqBlock (xOR x00000014 x00000009) x0000001D)
 print (eqBlock (cYC x00000004) x00000008)
 print (eqBlock (xOR x00000008 x00000001) x00000009)
 print (eqBlock (xOR x00000014 x00000002) x00000016)
 print (eqBlock (xOR x00000009 x00000002) x0000000B)
 print (eqBlock (aDD x00000009 x0000000B) x00000014)
 print (eqBlock (aDD x00000009 x00000016) x0000001F)
 print (eqBlock (yor x00000014 x00000002) x00000016)
 print (eqBlock (yor x0000001F x00000001) x0000001F)
 print (eqBlock (xand x00000016 xFFFFFFFB) x00000012)
 print (eqBlock (xand x0000001F xFFFFFFFB) x0000001B)
 print (eqBlock (mUL1 x00000016 x00000012) x0000018C)
 print (eqBlock (mUL2A x0000000B x0000001B) x00000129)
 print (eqBlock (xOR x0000018C x00000129) x000000A5)
 print (eqBlock (cYC xC4EB1AEB) x89D635D7)
 print (eqBlock (xOR x89D635D7 xF6A09667) x7F76A3B0)
 print (eqBlock (xOR x21D869BA x0A202020) x2BF8499A)
 print (eqBlock (xOR x7792F9D4 x0A202020) x7DB2D9F4)
 print (eqBlock (aDD x7F76A3B0 x7DB2D9F4) xFD297DA4)
 print (eqBlock (aDD x7F76A3B0 x2BF8499A) xAB6EED4A)
 print (eqBlock (yor xFD297DA4 x02040801) xFF2D7DA5)
 print (eqBlock (yor xAB6EED4A x00804021) xABEEED6B)
 print (eqBlock (xand xFF2D7DA5 xBFEF7FDF) xBF2D7D85)
 print (eqBlock (xand xABEEED6B x7DFEFBFF) x29EEE96B)
 print (eqBlock (mUL1 x2BF8499A xBF2D7D85) x0AD67E20)
 print (eqBlock (mUL2A x7DB2D9F4 x29EEE96B) x30261492)
 print (eqOctet (pAT x00FF00FF x00000000) xFF)
 print (eqPair (preludeXY x00FF00FF x00000000) (BuildPair x4A645A01 x50DEC930))
 print (eqPair (preludeVW x00FF00FF x00000000) (BuildPair x5CCA3239 xFECCAA6E))
 print (eqPair (preludeST x00FF00FF x00000000) (BuildPair x51EDE9C7 x24B66FB5))
 print (eqPair (computeXY_prime (BuildPair x4A645A01 x50DEC930) x55555555 (xOR (nCYC n1 x5CCA3239) xFECCAA6E)) (BuildPair x48B204D6 x5834A585))
 print (eqPair (computeXY_prime (BuildPair x48B204D6 x5834A585) xAAAAAAAA (xOR (nCYC n2 x5CCA3239) xFECCAA6E)) (BuildPair x4F998E01 xBE9F0917))
 print (eqPair (computeXY_prime (BuildPair x4F998E01 xBE9F0917) x51EDE9C7 (xOR (nCYC n3 x5CCA3239) xFECCAA6E)) (BuildPair x344925FC xDB9102B0))
 print (eqPair (computeXY_prime (BuildPair x344925FC xDB9102B0) x24B66FB5 (xOR (nCYC n4 x5CCA3239) xFECCAA6E)) (BuildPair x277B4B25 xD636250D))
 print (eqBlock (xOR x277B4B25 xD636250D) xF14D6E28)
 print (eqOctet (pAT x00FF00FF x00000000) xFF)
 print (eqPair (preludeXY x00FF00FF x00000000) (BuildPair x4A645A01 x50DEC930))
 print (eqPair (preludeVW x00FF00FF x00000000) (BuildPair x5CCA3239 xFECCAA6E))
 print (eqPair (preludeST x00FF00FF x00000000) (BuildPair x51EDE9C7 x24B66FB5))
 print (eqPair (computeXY_prime (BuildPair x4A645A01 x50DEC930) xAAAAAAAA (xOR (nCYC n1 x5CCA3239) xFECCAA6E)) (BuildPair x6AEBACF8 x9DB15CF6))
 print (eqPair (computeXY_prime (BuildPair x6AEBACF8 x9DB15CF6) x55555555 (xOR (nCYC n2 x5CCA3239) xFECCAA6E)) (BuildPair x270EEDAF xB8142629))
 print (eqPair (computeXY_prime (BuildPair x270EEDAF xB8142629) x51EDE9C7 (xOR (nCYC n3 x5CCA3239) xFECCAA6E)) (BuildPair x29907CD8 xBA92DB12))
 print (eqPair (computeXY_prime (BuildPair x29907CD8 xBA92DB12) x24B66FB5 (xOR (nCYC n4 x5CCA3239) xFECCAA6E)) (BuildPair x28EAD8B3 x81D10CA3))
 print (eqBlock (xOR x28EAD8B3 x81D10CA3) xA93BD410)
 print (eqOctet (pAT x55555555 x5A35D667) x00)
 print (eqPair (preludeXY x55555555 x5A35D667) (BuildPair x34ACF886 x7397C9AE))
 print (eqPair (preludeVW x55555555 x5A35D667) (BuildPair x7201F4DC x2829040B))
 print (eqPair (preludeST x55555555 x5A35D667) (BuildPair x9E2E7B36 x13647149))
 print (eqPair (computeXY_prime (BuildPair x34ACF886 x7397C9AE) x00000000 (xOR (nCYC n1 x7201F4DC) x2829040B)) (BuildPair x2FD76FFB x550D91CE))
 print (eqPair (computeXY_prime (BuildPair x2FD76FFB x550D91CE) xFFFFFFFF (xOR (nCYC n2 x7201F4DC) x2829040B)) (BuildPair xA70FC148 x1D10D8D3))
 print (eqPair (computeXY_prime (BuildPair xA70FC148 x1D10D8D3) x9E2E7B36 (xOR (nCYC n3 x7201F4DC) x2829040B)) (BuildPair xB1CC1CC5 x29C1485F))
 print (eqPair (computeXY_prime (BuildPair xB1CC1CC5 x29C1485F) x13647149 (xOR (nCYC n4 x7201F4DC) x2829040B)) (BuildPair x288FC786 x9115A558))
 print (eqBlock (xOR x288FC786 x9115A558) xB99A62DE)
 print (eqOctet (pAT x55555555 x5A35D667) x00)
 print (eqPair (preludeXY x55555555 x5A35D667) (BuildPair x34ACF886 x7397C9AE))
 print (eqPair (preludeVW x55555555 x5A35D667) (BuildPair x7201F4DC x2829040B))
 print (eqPair (preludeST x55555555 x5A35D667) (BuildPair x9E2E7B36 x13647149))
 print (eqPair (computeXY_prime (BuildPair x34ACF886 x7397C9AE) xFFFFFFFF (xOR (nCYC n1 x7201F4DC) x2829040B)) (BuildPair x8DC8BBDE xFE4E5BDD))
 print (eqPair (computeXY_prime (BuildPair x8DC8BBDE xFE4E5BDD) x00000000 (xOR (nCYC n2 x7201F4DC) x2829040B)) (BuildPair xCBC865BA x0297AF6F))
 print (eqPair (computeXY_prime (BuildPair xCBC865BA x0297AF6F) x9E2E7B36 (xOR (nCYC n3 x7201F4DC) x2829040B)) (BuildPair x3CF3A7D2 x160EE9B5))
 print (eqPair (computeXY_prime (BuildPair x3CF3A7D2 x160EE9B5) x13647149 (xOR (nCYC n4 x7201F4DC) x2829040B)) (BuildPair xD0482465 x7050EC5E))
 print (eqBlock (xOR xD0482465 x7050EC5E) xA018C83B)
 print (eqPair (preludeXY xE6A12F07 x9D15C437) (BuildPair x21D869BA x7792F9D4))
 print (eqPair (preludeVW xE6A12F07 x9D15C437) (BuildPair xC4EB1AEB xF6A09667))
 print (eqPair (preludeST xE6A12F07 x9D15C437) (BuildPair x6D67E884 xA511987A))
 print (eqPair (computeXY_prime (BuildPair x204E80A7 x077788A2) x00000000 (xOR (nCYC n1 x17A808FD) xFEA1D334)) (BuildPair x303FF4AA x1277A6D4))
 print (eqPair (computeXY_prime (BuildPair x303FF4AA x1277A6D4) x00000000 (xOR (nCYC n2 x17A808FD) xFEA1D334)) (BuildPair x55DD063F x4C49AAE0))
 print (eqPair (computeXY_prime (BuildPair x55DD063F x4C49AAE0) x00000000 (xOR (nCYC n3 x17A808FD) xFEA1D334)) (BuildPair x51AF3C1D x5BC02502))
 print (eqPair (computeXY_prime (BuildPair x51AF3C1D x5BC02502) x00000000 (xOR (nCYC n4 x17A808FD) xFEA1D334)) (BuildPair xA44AAAC0 x63C70DBA))
 print (eqPair (computeXY_prime (BuildPair xA44AAAC0 x63C70DBA) x00000000 (xOR (nCYC n5 x17A808FD) xFEA1D334)) (BuildPair x4D53901A x2E80AC30))
 print (eqPair (computeXY_prime (BuildPair x4D53901A x2E80AC30) x00000000 (xOR (nCYC n6 x17A808FD) xFEA1D334)) (BuildPair x5F38EEF1 x2A6091AE))
 print (eqPair (computeXY_prime (BuildPair x5F38EEF1 x2A6091AE) x00000000 (xOR (nCYC n7 x17A808FD) xFEA1D334)) (BuildPair xF0239DD5 x3DD81AC6))
 print (eqPair (computeXY_prime (BuildPair xF0239DD5 x3DD81AC6) x00000000 (xOR (nCYC n8 x17A808FD) xFEA1D334)) (BuildPair xEB35B97F x9372CDC6))
 print (eqPair (computeXY_prime (BuildPair xEB35B97F x9372CDC6) x00000000 (xOR (nCYC n9 x17A808FD) xFEA1D334)) (BuildPair x4DA124A1 xC6B1317E))
 print (eqPair (computeXY_prime (BuildPair x4DA124A1 xC6B1317E) x00000000 (xOR (nCYC n10 x17A808FD) xFEA1D334)) (BuildPair x7F839576 x74B39176))
 print (eqPair (computeXY_prime (BuildPair x7F839576 x74B39176) x00000000 (xOR (nCYC n11 x17A808FD) xFEA1D334)) (BuildPair x11A9D254 xD78634BC))
 print (eqPair (computeXY_prime (BuildPair x11A9D254 xD78634BC) x00000000 (xOR (nCYC n12 x17A808FD) xFEA1D334)) (BuildPair xD8804CA5 xFDC1A8BA))
 print (eqPair (computeXY_prime (BuildPair xD8804CA5 xFDC1A8BA) x00000000 (xOR (nCYC n13 x17A808FD) xFEA1D334)) (BuildPair x3F6F7248 x11AC46B8))
 print (eqPair (computeXY_prime (BuildPair x3F6F7248 x11AC46B8) x00000000 (xOR (nCYC n14 x17A808FD) xFEA1D334)) (BuildPair xACBC13DD x33D5A466))
 print (eqPair (computeXY_prime (BuildPair xACBC13DD x33D5A466) x00000000 (xOR (nCYC n15 x17A808FD) xFEA1D334)) (BuildPair x4CE933E1 xC21A1846))
 print (eqPair (computeXY_prime (BuildPair x4CE933E1 xC21A1846) x00000000 (xOR (nCYC n16 x17A808FD) xFEA1D334)) (BuildPair xC1ED90DD xCD959B46))
 print (eqPair (computeXY_prime (BuildPair xC1ED90DD xCD959B46) x00000000 (xOR (nCYC n17 x17A808FD) xFEA1D334)) (BuildPair x3CD54DEB x613F8E2A))
 print (eqPair (computeXY_prime (BuildPair x3CD54DEB x613F8E2A) x00000000 (xOR (nCYC n18 x17A808FD) xFEA1D334)) (BuildPair xBBA57835 x07C72EAA))
 print (eqPair (computeXY_prime (BuildPair xBBA57835 x07C72EAA) x00000000 (xOR (nCYC n19 x17A808FD) xFEA1D334)) (BuildPair xD7843FDC x6AD6E8A4))
 print (eqPair (computeXY_prime (BuildPair xD7843FDC x6AD6E8A4) x00000000 (xOR (nCYC n20 x17A808FD) xFEA1D334)) (BuildPair x5EBA06C2 x91896CFA))
 print (eqPair (computeXY_prime (BuildPair x5EBA06C2 x91896CFA) x76232E5F (xOR (nCYC n21 x17A808FD) xFEA1D334)) (BuildPair x1D9C9655 x98D1CC75))
 print (eqPair (computeXY_prime (BuildPair x1D9C9655 x98D1CC75) x4FB1138A (xOR (nCYC n22 x17A808FD) xFEA1D334)) (BuildPair x7BC180AB xA0B87B77))
 print (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n20 x00000000 x00000000)) xDB79FBDC)
 print (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n16 x00000000 x07050301)) x8CE37709)
 print (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n256 x00000000 x07050301)) x717153D5)
 print (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n4100 x00000000 x07050301)) x7783C51D)
