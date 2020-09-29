module maa

import StdEnv;

:: Xbool =
     Xfalse
   | Xtrue

:: Bit =
     X0
   | X1

:: Octet =
     BuildOctet !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit

:: OctetSum =
     BuildOctetSum !Bit !Octet

:: Half =
     BuildHalf !Octet !Octet

:: HalfSum =
     BuildHalfSum !Bit !Half

:: Block =
     BuildBlock !Octet !Octet !Octet !Octet

:: BlockSum =
     BuildBlockSum !Bit !Block

:: Pair =
     BuildPair !Block !Block

:: Nat =
     Zero
   | Succ !Nat

:: Key =
     BuildKey !Block !Block

:: Message =
     UnitMessage !Block
   | ConsMessage !Block !Message

:: SegmentedMessage =
     UnitSegment !Message
   | ConsSegment !Message !SegmentedMessage

instance == Xbool where
   (==) (Xfalse) (Xfalse) = True
   (==) (Xtrue) (Xtrue) = True
   (==) rec_x rec_y = False

instance == Bit where
   (==) (X0) (X0) = True
   (==) (X1) (X1) = True
   (==) rec_x rec_y = False

instance == Octet where
   (==) (BuildOctet rec_x1 rec_x2 rec_x3 rec_x4 rec_x5 rec_x6 rec_x7 rec_x8) (BuildOctet rec_y1 rec_y2 rec_y3 rec_y4 rec_y5 rec_y6 rec_y7 rec_y8) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4) && (rec_x5 == rec_y5) && (rec_x6 == rec_y6) && (rec_x7 == rec_y7) && (rec_x8 == rec_y8)
   (==) rec_x rec_y = False

instance == OctetSum where
   (==) (BuildOctetSum rec_x1 rec_x2) (BuildOctetSum rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Half where
   (==) (BuildHalf rec_x1 rec_x2) (BuildHalf rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == HalfSum where
   (==) (BuildHalfSum rec_x1 rec_x2) (BuildHalfSum rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Block where
   (==) (BuildBlock rec_x1 rec_x2 rec_x3 rec_x4) (BuildBlock rec_y1 rec_y2 rec_y3 rec_y4) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4)
   (==) rec_x rec_y = False

instance == BlockSum where
   (==) (BuildBlockSum rec_x1 rec_x2) (BuildBlockSum rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Pair where
   (==) (BuildPair rec_x1 rec_x2) (BuildPair rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Nat where
   (==) (Zero) (Zero) = True
   (==) (Succ rec_x1) (Succ rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Key where
   (==) (BuildKey rec_x1 rec_x2) (BuildKey rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Message where
   (==) (UnitMessage rec_x1) (UnitMessage rec_y1) = (rec_x1 == rec_y1)
   (==) (ConsMessage rec_x1 rec_x2) (ConsMessage rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == SegmentedMessage where
   (==) (UnitSegment rec_x1) (UnitSegment rec_y1) = (rec_x1 == rec_y1)
   (==) (ConsSegment rec_x1 rec_x2) (ConsSegment rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"

instance <<< Bit where
   (<<<) rec_file (X0) = rec_file <<< "X0"
   (<<<) rec_file (X1) = rec_file <<< "X1"

instance <<< Octet where
   (<<<) rec_file (BuildOctet rec_x1 rec_x2 rec_x3 rec_x4 rec_x5 rec_x6 rec_x7 rec_x8) = rec_file <<< "BuildOctet" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ", " <<< rec_x5 <<< ", " <<< rec_x6 <<< ", " <<< rec_x7 <<< ", " <<< rec_x8 <<< ")"

instance <<< OctetSum where
   (<<<) rec_file (BuildOctetSum rec_x1 rec_x2) = rec_file <<< "BuildOctetSum" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Half where
   (<<<) rec_file (BuildHalf rec_x1 rec_x2) = rec_file <<< "BuildHalf" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< HalfSum where
   (<<<) rec_file (BuildHalfSum rec_x1 rec_x2) = rec_file <<< "BuildHalfSum" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Block where
   (<<<) rec_file (BuildBlock rec_x1 rec_x2 rec_x3 rec_x4) = rec_file <<< "BuildBlock" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ")"

instance <<< BlockSum where
   (<<<) rec_file (BuildBlockSum rec_x1 rec_x2) = rec_file <<< "BuildBlockSum" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Pair where
   (<<<) rec_file (BuildPair rec_x1 rec_x2) = rec_file <<< "BuildPair" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Nat where
   (<<<) rec_file (Zero) = rec_file <<< "Zero"
   (<<<) rec_file (Succ rec_x1) = rec_file <<< "Succ" <<< " (" <<< rec_x1 <<< ")"

instance <<< Key where
   (<<<) rec_file (BuildKey rec_x1 rec_x2) = rec_file <<< "BuildKey" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Message where
   (<<<) rec_file (UnitMessage rec_x1) = rec_file <<< "UnitMessage" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (ConsMessage rec_x1 rec_x2) = rec_file <<< "ConsMessage" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< SegmentedMessage where
   (<<<) rec_file (UnitSegment rec_x1) = rec_file <<< "UnitSegment" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (ConsSegment rec_x1 rec_x2) = rec_file <<< "ConsSegment" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

notBool :: !Xbool -> Xbool
notBool Xfalse = Xtrue
notBool Xtrue = Xfalse

andBool :: !Xbool !Xbool -> Xbool
andBool Xfalse l = Xfalse
andBool Xtrue l = l

orBool :: !Xbool !Xbool -> Xbool
orBool Xfalse l = l
orBool Xtrue l = Xtrue

xorBool :: !Xbool !Xbool -> Xbool
xorBool Xfalse l = l
xorBool Xtrue l = (notBool l)

notBit :: !Bit -> Bit
notBit X0 = X1
notBit X1 = X0

andBit :: !Bit !Bit -> Bit
andBit b X0 = X0
andBit b X1 = b

orBit :: !Bit !Bit -> Bit
orBit b X0 = b
orBit b X1 = X1

xorBit :: !Bit !Bit -> Bit
xorBit b X0 = b
xorBit b X1 = (notBit b)

x00 :: Octet
x00 = (BuildOctet X0 X0 X0 X0 X0 X0 X0 X0)

x01 :: Octet
x01 = (BuildOctet X0 X0 X0 X0 X0 X0 X0 X1)

x0000 :: Half
x0000 = (BuildHalf x00 x00)

halfU :: !Block -> Half
halfU (BuildBlock o1 o2 o3 o4) = (BuildHalf o1 o2)

halfL :: !Block -> Half
halfL (BuildBlock o1 o2 o3 o4) = (BuildHalf o3 o4)

eqBit :: !Bit !Bit -> Xbool
eqBit X0 X0 = Xtrue
eqBit X0 X1 = Xfalse
eqBit X1 X0 = Xfalse
eqBit X1 X1 = Xtrue

eqOctet :: !Octet !Octet -> Xbool
eqOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (andBool (eqBit b1 b_prime1) (andBool (eqBit b2 b_prime2) (andBool (eqBit b3 b_prime3) (andBool (eqBit b4 b_prime4) (andBool (eqBit b5 b_prime5) (andBool (eqBit b6 b_prime6) (andBool (eqBit b7 b_prime7) (eqBit b8 b_prime8))))))))

eqOctetSum :: !OctetSum !OctetSum -> Xbool
eqOctetSum (BuildOctetSum b o) (BuildOctetSum b_prime o_prime) = (andBool (eqBit b b_prime) (eqOctet o o_prime))

eqHalf :: !Half !Half -> Xbool
eqHalf (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (andBool (eqOctet o1 o_prime1) (eqOctet o2 o_prime2))

eqHalfSum :: !HalfSum !HalfSum -> Xbool
eqHalfSum (BuildHalfSum b h) (BuildHalfSum b_prime h_prime) = (andBool (eqBit b b_prime) (eqHalf h h_prime))

eqBlock :: !Block !Block -> Xbool
eqBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (andBool (andBool (eqOctet o1 o_prime1) (eqOctet o2 o_prime2)) (andBool (eqOctet o3 o_prime3) (eqOctet o4 o_prime4)))

eqBlockSum :: !BlockSum !BlockSum -> Xbool
eqBlockSum (BuildBlockSum b w) (BuildBlockSum b_prime w_prime) = (andBool (eqBit b b_prime) (eqBlock w w_prime))

eqPair :: !Pair !Pair -> Xbool
eqPair (BuildPair w1 w2) (BuildPair w_prime1 w_prime2) = (andBool (eqBlock w1 w_prime1) (eqBlock w2 w_prime2))

addBit :: !Bit !Bit !Bit -> Bit
addBit b b_prime bcarry = (xorBit (xorBit b b_prime) bcarry)

carBit :: !Bit !Bit !Bit -> Bit
carBit b b_prime bcarry = (orBit (andBit (andBit b b_prime) (notBit bcarry)) (andBit (orBit b b_prime) bcarry))

addOctetSum :: !Octet !Octet !Bit -> OctetSum
addOctetSum (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) bcarry = (addOctet8 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 b8 b_prime8 bcarry)

addOctet8 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet8 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 b8 b_prime8 bcarry = (addOctet7 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 (carBit b8 b_prime8 bcarry) (addBit b8 b_prime8 bcarry))

addOctet7 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet7 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 b7 b_prime7 bcarry b_second8 = (addOctet6 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 (carBit b7 b_prime7 bcarry) (addBit b7 b_prime7 bcarry) b_second8)

addOctet6 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet6 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 b6 b_prime6 bcarry b_second7 b_second8 = (addOctet5 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 (carBit b6 b_prime6 bcarry) (addBit b6 b_prime6 bcarry) b_second7 b_second8)

addOctet5 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet5 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 b5 b_prime5 bcarry b_second6 b_second7 b_second8 = (addOctet4 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 (carBit b5 b_prime5 bcarry) (addBit b5 b_prime5 bcarry) b_second6 b_second7 b_second8)

addOctet4 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet4 b1 b_prime1 b2 b_prime2 b3 b_prime3 b4 b_prime4 bcarry b_second5 b_second6 b_second7 b_second8 = (addOctet3 b1 b_prime1 b2 b_prime2 b3 b_prime3 (carBit b4 b_prime4 bcarry) (addBit b4 b_prime4 bcarry) b_second5 b_second6 b_second7 b_second8)

addOctet3 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet3 b1 b_prime1 b2 b_prime2 b3 b_prime3 bcarry b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet2 b1 b_prime1 b2 b_prime2 (carBit b3 b_prime3 bcarry) (addBit b3 b_prime3 bcarry) b_second4 b_second5 b_second6 b_second7 b_second8)

addOctet2 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet2 b1 b_prime1 b2 b_prime2 bcarry b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet1 b1 b_prime1 (carBit b2 b_prime2 bcarry) (addBit b2 b_prime2 bcarry) b_second3 b_second4 b_second5 b_second6 b_second7 b_second8)

addOctet1 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet1 b1 b_prime1 bcarry b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (addOctet0 (carBit b1 b_prime1 bcarry) (addBit b1 b_prime1 bcarry) b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8)

addOctet0 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit -> OctetSum
addOctet0 bcarry b_second1 b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8 = (BuildOctetSum bcarry (BuildOctet b_second1 b_second2 b_second3 b_second4 b_second5 b_second6 b_second7 b_second8))

dropCarryOctetSum :: !OctetSum -> Octet
dropCarryOctetSum (BuildOctetSum bcarry o) = o

addOctet :: !Octet !Octet -> Octet
addOctet o o_prime = (dropCarryOctetSum (addOctetSum o o_prime X0))

addHalfSum :: !Half !Half -> HalfSum
addHalfSum (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (addHalf2 o1 o_prime1 o2 o_prime2)

addHalf2 :: !Octet !Octet !Octet !Octet -> HalfSum
addHalf2 o1 o_prime1 o2 o_prime2 = (addHalf1 o1 o_prime1 (addOctetSum o2 o_prime2 X0))

addHalf1 :: !Octet !Octet !OctetSum -> HalfSum
addHalf1 o1 o_prime1 (BuildOctetSum b o_second2) = (addHalf0 (addOctetSum o1 o_prime1 b) o_second2)

addHalf0 :: !OctetSum !Octet -> HalfSum
addHalf0 (BuildOctetSum b o_second1) o_second2 = (BuildHalfSum b (BuildHalf o_second1 o_second2))

dropCarryHalfSum :: !HalfSum -> Half
dropCarryHalfSum (BuildHalfSum b h) = h

addHalf :: !Half !Half -> Half
addHalf h h_prime = (dropCarryHalfSum (addHalfSum h h_prime))

addHalfOctet :: !Octet !Half -> Half
addHalfOctet o h = (addHalf (BuildHalf x00 o) h)

addHalfOctets :: !Octet !Octet -> Half
addHalfOctets o o_prime = (addHalf (BuildHalf x00 o) (BuildHalf x00 o_prime))

addBlockSum :: !Block !Block -> BlockSum
addBlockSum (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (addBlock4 o1 o_prime1 o2 o_prime2 o3 o_prime3 o4 o_prime4)

addBlock4 :: !Octet !Octet !Octet !Octet !Octet !Octet !Octet !Octet -> BlockSum
addBlock4 o1 o_prime1 o2 o_prime2 o3 o_prime3 o4 o_prime4 = (addBlock3 o1 o_prime1 o2 o_prime2 o3 o_prime3 (addOctetSum o4 o_prime4 X0))

addBlock3 :: !Octet !Octet !Octet !Octet !Octet !Octet !OctetSum -> BlockSum
addBlock3 o1 o_prime1 o2 o_prime2 o3 o_prime3 (BuildOctetSum bcarry o_second4) = (addBlock2 o1 o_prime1 o2 o_prime2 (addOctetSum o3 o_prime3 bcarry) o_second4)

addBlock2 :: !Octet !Octet !Octet !Octet !OctetSum !Octet -> BlockSum
addBlock2 o1 o_prime1 o2 o_prime2 (BuildOctetSum bcarry o_second3) o_second4 = (addBlock1 o1 o_prime1 (addOctetSum o2 o_prime2 bcarry) o_second3 o_second4)

addBlock1 :: !Octet !Octet !OctetSum !Octet !Octet -> BlockSum
addBlock1 o1 o_prime1 (BuildOctetSum bcarry o_second2) o_second3 o_second4 = (addBlock0 (addOctetSum o1 o_prime1 bcarry) o_second2 o_second3 o_second4)

addBlock0 :: !OctetSum !Octet !Octet !Octet -> BlockSum
addBlock0 (BuildOctetSum bcarry o_second1) o_second2 o_second3 o_second4 = (BuildBlockSum bcarry (BuildBlock o_second1 o_second2 o_second3 o_second4))

dropCarryBlockSum :: !BlockSum -> Block
dropCarryBlockSum (BuildBlockSum bcarry w) = w

addBlock :: !Block !Block -> Block
addBlock w w_prime = (dropCarryBlockSum (addBlockSum w w_prime))

addBlockHalf :: !Half !Block -> Block
addBlockHalf (BuildHalf o1 o2) w = (addBlock (BuildBlock x00 x00 o1 o2) w)

addBlockHalves :: !Half !Half -> Block
addBlockHalves (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (addBlock (BuildBlock x00 x00 o1 o2) (BuildBlock x00 x00 o_prime1 o_prime2))

leftOctet1 :: !Octet -> Octet
leftOctet1 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b2 b3 b4 b5 b6 b7 b8 X0)

leftOctet2 :: !Octet -> Octet
leftOctet2 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b3 b4 b5 b6 b7 b8 X0 X0)

leftOctet3 :: !Octet -> Octet
leftOctet3 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b4 b5 b6 b7 b8 X0 X0 X0)

leftOctet4 :: !Octet -> Octet
leftOctet4 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b5 b6 b7 b8 X0 X0 X0 X0)

leftOctet5 :: !Octet -> Octet
leftOctet5 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b6 b7 b8 X0 X0 X0 X0 X0)

leftOctet6 :: !Octet -> Octet
leftOctet6 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b7 b8 X0 X0 X0 X0 X0 X0)

leftOctet7 :: !Octet -> Octet
leftOctet7 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet b8 X0 X0 X0 X0 X0 X0 X0)

rightOctet1 :: !Octet -> Octet
rightOctet1 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 b1 b2 b3 b4 b5 b6 b7)

rightOctet2 :: !Octet -> Octet
rightOctet2 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 b1 b2 b3 b4 b5 b6)

rightOctet3 :: !Octet -> Octet
rightOctet3 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 b1 b2 b3 b4 b5)

rightOctet4 :: !Octet -> Octet
rightOctet4 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 b1 b2 b3 b4)

rightOctet5 :: !Octet -> Octet
rightOctet5 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 b1 b2 b3)

rightOctet6 :: !Octet -> Octet
rightOctet6 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 X0 b1 b2)

rightOctet7 :: !Octet -> Octet
rightOctet7 (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) = (BuildOctet X0 X0 X0 X0 X0 X0 X0 b1)

mulOctet :: !Octet !Octet -> Half
mulOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) o_prime = (mulOctet1 b1 b2 b3 b4 b5 b6 b7 b8 o_prime x0000)

mulOctet1 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Octet !Half -> Half
mulOctet1 X0 b2 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet2 b2 b3 b4 b5 b6 b7 b8 o_prime h)
mulOctet1 X1 b2 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet2 b2 b3 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet1 o_prime) (leftOctet7 o_prime)))

mulOctet2 :: !Bit !Bit !Bit !Bit !Bit !Bit !Bit !Octet !Half -> Half
mulOctet2 X0 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet3 b3 b4 b5 b6 b7 b8 o_prime h)
mulOctet2 X1 b3 b4 b5 b6 b7 b8 o_prime h = (mulOctet3 b3 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet2 o_prime) (leftOctet6 o_prime)))

mulOctet3 :: !Bit !Bit !Bit !Bit !Bit !Bit !Octet !Half -> Half
mulOctet3 X0 b4 b5 b6 b7 b8 o_prime h = (mulOctet4 b4 b5 b6 b7 b8 o_prime h)
mulOctet3 X1 b4 b5 b6 b7 b8 o_prime h = (mulOctet4 b4 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet3 o_prime) (leftOctet5 o_prime)))

mulOctet4 :: !Bit !Bit !Bit !Bit !Bit !Octet !Half -> Half
mulOctet4 X0 b5 b6 b7 b8 o_prime h = (mulOctet5 b5 b6 b7 b8 o_prime h)
mulOctet4 X1 b5 b6 b7 b8 o_prime h = (mulOctet5 b5 b6 b7 b8 o_prime (mulOctetA h (rightOctet4 o_prime) (leftOctet4 o_prime)))

mulOctet5 :: !Bit !Bit !Bit !Bit !Octet !Half -> Half
mulOctet5 X0 b6 b7 b8 o_prime h = (mulOctet6 b6 b7 b8 o_prime h)
mulOctet5 X1 b6 b7 b8 o_prime h = (mulOctet6 b6 b7 b8 o_prime (mulOctetA h (rightOctet5 o_prime) (leftOctet3 o_prime)))

mulOctet6 :: !Bit !Bit !Bit !Octet !Half -> Half
mulOctet6 X0 b7 b8 o_prime h = (mulOctet7 b7 b8 o_prime h)
mulOctet6 X1 b7 b8 o_prime h = (mulOctet7 b7 b8 o_prime (mulOctetA h (rightOctet6 o_prime) (leftOctet2 o_prime)))

mulOctet7 :: !Bit !Bit !Octet !Half -> Half
mulOctet7 X0 b8 o_prime h = (mulOctet8 b8 o_prime h)
mulOctet7 X1 b8 o_prime h = (mulOctet8 b8 o_prime (mulOctetA h (rightOctet7 o_prime) (leftOctet1 o_prime)))

mulOctet8 :: !Bit !Octet !Half -> Half
mulOctet8 X0 o_prime h = h
mulOctet8 X1 o_prime h = (mulOctetA h x00 o_prime)

mulOctetA :: !Half !Octet !Octet -> Half
mulOctetA (BuildHalf o1 o2) o_prime1 o_prime2 = (mulOctetB (addOctet o1 o_prime1) (addOctetSum o2 o_prime2 X0))

mulOctetB :: !Octet !OctetSum -> Half
mulOctetB o1 (BuildOctetSum X0 o2) = (BuildHalf o1 o2)
mulOctetB o1 (BuildOctetSum X1 o2) = (BuildHalf (addOctet o1 x01) o2)

mulHalf :: !Half !Half -> Block
mulHalf (BuildHalf o1 o2) (BuildHalf o_prime1 o_prime2) = (mulHalfA (mulOctet o1 o_prime1) (mulOctet o1 o_prime2) (mulOctet o2 o_prime1) (mulOctet o2 o_prime2))

mulHalfA :: !Half !Half !Half !Half -> Block
mulHalfA (BuildHalf o11U o11L) (BuildHalf o12U o12L) (BuildHalf o21U o21L) (BuildHalf o22U o22L) = (mulHalf4 o11U o11L o12U o12L o21U o21L o22U o22L)

mulHalf4 :: !Octet !Octet !Octet !Octet !Octet !Octet !Octet !Octet -> Block
mulHalf4 o11U o11L o12U o12L o21U o21L o22U o_second4 = (mulHalf3 o11U o11L o12U o21U (addHalfOctet o12L (addHalfOctets o21L o22U)) o_second4)

mulHalf3 :: !Octet !Octet !Octet !Octet !Half !Octet -> Block
mulHalf3 o11U o11L o12U o21U (BuildHalf ocarry o_second3) o_second4 = (mulHalf2 o11U (addHalfOctet ocarry (addHalfOctet o11L (addHalfOctets o12U o21U))) o_second3 o_second4)

mulHalf2 :: !Octet !Half !Octet !Octet -> Block
mulHalf2 o11U (BuildHalf ocarry o_second2) o_second3 o_second4 = (mulHalf1 (addHalfOctets ocarry o11U) o_second2 o_second3 o_second4)

mulHalf1 :: !Half !Octet !Octet !Octet -> Block
mulHalf1 (BuildHalf ocarry o_second1) o_second2 o_second3 o_second4 = (BuildBlock o_second1 o_second2 o_second3 o_second4)

mulBlock :: !Block !Block -> Pair
mulBlock w1 w2 = (mulBlockA (mulHalf (halfU w1) (halfU w2)) (mulHalf (halfU w1) (halfL w2)) (mulHalf (halfL w1) (halfU w2)) (mulHalf (halfL w1) (halfL w2)))

mulBlockA :: !Block !Block !Block !Block -> Pair
mulBlockA w11 w12 w21 w22 = (mulBlock4 (halfU w11) (halfL w11) (halfU w12) (halfL w12) (halfU w21) (halfL w21) (halfU w22) (halfL w22))

mulBlock4 :: !Half !Half !Half !Half !Half !Half !Half !Half -> Pair
mulBlock4 h11U h11L h12U h12L h21U h21L h22U h_second4 = (mulBlock3 h11U h11L h12U h21U (addBlockHalf h12L (addBlockHalves h21L h22U)) h_second4)

mulBlock3 :: !Half !Half !Half !Half !Block !Half -> Pair
mulBlock3 h11U h11L h12U h21U w h_second4 = (mulBlock2 h11U (addBlockHalf (halfU w) (addBlockHalf h11L (addBlockHalves h12U h21U))) (halfL w) h_second4)

mulBlock2 :: !Half !Block !Half !Half -> Pair
mulBlock2 h11U w h_second3 h_second4 = (mulBlock1 (addBlockHalves (halfU w) h11U) (halfL w) h_second3 h_second4)

mulBlock1 :: !Block !Half !Half !Half -> Pair
mulBlock1 w h_second2 h_second3 h_second4 = (mulBlockB (halfL w) h_second2 h_second3 h_second4)

mulBlockB :: !Half !Half !Half !Half -> Pair
mulBlockB (BuildHalf o1U o1L) (BuildHalf o2U o2L) (BuildHalf o3U o3L) (BuildHalf o4U o4L) = (BuildPair (BuildBlock o1U o1L o2U o2L) (BuildBlock o3U o3L o4U o4L))

addNat :: !Nat !Nat -> Nat
addNat n Zero = n
addNat n (Succ n_prime) = (addNat (Succ n) n_prime)

multNat :: !Nat !Nat -> Nat
multNat n Zero = Zero
multNat n (Succ n_prime) = (addNat n (multNat n n_prime))

eqNat :: !Nat !Nat -> Xbool
eqNat Zero Zero = Xtrue
eqNat Zero (Succ n_prime) = Xfalse
eqNat (Succ n) Zero = Xfalse
eqNat (Succ n) (Succ n_prime) = (eqNat n n_prime)

ltNat :: !Nat !Nat -> Xbool
ltNat Zero Zero = Xfalse
ltNat Zero (Succ n_prime) = Xtrue
ltNat (Succ n_prime) Zero = Xfalse
ltNat (Succ n) (Succ n_prime) = (ltNat n n_prime)

n1 :: Nat
n1 = (Succ Zero)

n2 :: Nat
n2 = (Succ n1)

n3 :: Nat
n3 = (Succ n2)

n4 :: Nat
n4 = (Succ n3)

n5 :: Nat
n5 = (Succ n4)

n6 :: Nat
n6 = (Succ n5)

n7 :: Nat
n7 = (Succ n6)

n8 :: Nat
n8 = (Succ n7)

n9 :: Nat
n9 = (Succ n8)

n10 :: Nat
n10 = (Succ n9)

n11 :: Nat
n11 = (Succ n10)

n12 :: Nat
n12 = (Succ n11)

n13 :: Nat
n13 = (Succ n12)

n14 :: Nat
n14 = (Succ n13)

n15 :: Nat
n15 = (Succ n14)

n16 :: Nat
n16 = (Succ n15)

n17 :: Nat
n17 = (Succ n16)

n18 :: Nat
n18 = (Succ n17)

n19 :: Nat
n19 = (Succ n18)

n20 :: Nat
n20 = (Succ n19)

n21 :: Nat
n21 = (Succ n20)

n22 :: Nat
n22 = (Succ n21)

n254 :: Nat
n254 = (addNat n12 (multNat n11 n22))

n256 :: Nat
n256 = (multNat n16 n16)

n4100 :: Nat
n4100 = (addNat n4 (multNat n16 n256))

andOctet :: !Octet !Octet -> Octet
andOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (andBit b1 b_prime1) (andBit b2 b_prime2) (andBit b3 b_prime3) (andBit b4 b_prime4) (andBit b5 b_prime5) (andBit b6 b_prime6) (andBit b7 b_prime7) (andBit b8 b_prime8))

orOctet :: !Octet !Octet -> Octet
orOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (orBit b1 b_prime1) (orBit b2 b_prime2) (orBit b3 b_prime3) (orBit b4 b_prime4) (orBit b5 b_prime5) (orBit b6 b_prime6) (orBit b7 b_prime7) (orBit b8 b_prime8))

xorOctet :: !Octet !Octet -> Octet
xorOctet (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b_prime1 b_prime2 b_prime3 b_prime4 b_prime5 b_prime6 b_prime7 b_prime8) = (BuildOctet (xorBit b1 b_prime1) (xorBit b2 b_prime2) (xorBit b3 b_prime3) (xorBit b4 b_prime4) (xorBit b5 b_prime5) (xorBit b6 b_prime6) (xorBit b7 b_prime7) (xorBit b8 b_prime8))

x02 :: Octet
x02 = (BuildOctet X0 X0 X0 X0 X0 X0 X1 X0)

x03 :: Octet
x03 = (BuildOctet X0 X0 X0 X0 X0 X0 X1 X1)

x04 :: Octet
x04 = (BuildOctet X0 X0 X0 X0 X0 X1 X0 X0)

x05 :: Octet
x05 = (BuildOctet X0 X0 X0 X0 X0 X1 X0 X1)

x06 :: Octet
x06 = (BuildOctet X0 X0 X0 X0 X0 X1 X1 X0)

x07 :: Octet
x07 = (BuildOctet X0 X0 X0 X0 X0 X1 X1 X1)

x08 :: Octet
x08 = (BuildOctet X0 X0 X0 X0 X1 X0 X0 X0)

x09 :: Octet
x09 = (BuildOctet X0 X0 X0 X0 X1 X0 X0 X1)

x0A :: Octet
x0A = (BuildOctet X0 X0 X0 X0 X1 X0 X1 X0)

x0B :: Octet
x0B = (BuildOctet X0 X0 X0 X0 X1 X0 X1 X1)

x0C :: Octet
x0C = (BuildOctet X0 X0 X0 X0 X1 X1 X0 X0)

x0D :: Octet
x0D = (BuildOctet X0 X0 X0 X0 X1 X1 X0 X1)

x0E :: Octet
x0E = (BuildOctet X0 X0 X0 X0 X1 X1 X1 X0)

x0F :: Octet
x0F = (BuildOctet X0 X0 X0 X0 X1 X1 X1 X1)

x10 :: Octet
x10 = (BuildOctet X0 X0 X0 X1 X0 X0 X0 X0)

x11 :: Octet
x11 = (BuildOctet X0 X0 X0 X1 X0 X0 X0 X1)

x12 :: Octet
x12 = (BuildOctet X0 X0 X0 X1 X0 X0 X1 X0)

x13 :: Octet
x13 = (BuildOctet X0 X0 X0 X1 X0 X0 X1 X1)

x14 :: Octet
x14 = (BuildOctet X0 X0 X0 X1 X0 X1 X0 X0)

x15 :: Octet
x15 = (BuildOctet X0 X0 X0 X1 X0 X1 X0 X1)

x16 :: Octet
x16 = (BuildOctet X0 X0 X0 X1 X0 X1 X1 X0)

x17 :: Octet
x17 = (BuildOctet X0 X0 X0 X1 X0 X1 X1 X1)

x18 :: Octet
x18 = (BuildOctet X0 X0 X0 X1 X1 X0 X0 X0)

x1A :: Octet
x1A = (BuildOctet X0 X0 X0 X1 X1 X0 X1 X0)

x1B :: Octet
x1B = (BuildOctet X0 X0 X0 X1 X1 X0 X1 X1)

x1C :: Octet
x1C = (BuildOctet X0 X0 X0 X1 X1 X1 X0 X0)

x1D :: Octet
x1D = (BuildOctet X0 X0 X0 X1 X1 X1 X0 X1)

x1E :: Octet
x1E = (BuildOctet X0 X0 X0 X1 X1 X1 X1 X0)

x1F :: Octet
x1F = (BuildOctet X0 X0 X0 X1 X1 X1 X1 X1)

x20 :: Octet
x20 = (BuildOctet X0 X0 X1 X0 X0 X0 X0 X0)

x21 :: Octet
x21 = (BuildOctet X0 X0 X1 X0 X0 X0 X0 X1)

x23 :: Octet
x23 = (BuildOctet X0 X0 X1 X0 X0 X0 X1 X1)

x24 :: Octet
x24 = (BuildOctet X0 X0 X1 X0 X0 X1 X0 X0)

x25 :: Octet
x25 = (BuildOctet X0 X0 X1 X0 X0 X1 X0 X1)

x26 :: Octet
x26 = (BuildOctet X0 X0 X1 X0 X0 X1 X1 X0)

x27 :: Octet
x27 = (BuildOctet X0 X0 X1 X0 X0 X1 X1 X1)

x28 :: Octet
x28 = (BuildOctet X0 X0 X1 X0 X1 X0 X0 X0)

x29 :: Octet
x29 = (BuildOctet X0 X0 X1 X0 X1 X0 X0 X1)

x2A :: Octet
x2A = (BuildOctet X0 X0 X1 X0 X1 X0 X1 X0)

x2B :: Octet
x2B = (BuildOctet X0 X0 X1 X0 X1 X0 X1 X1)

x2D :: Octet
x2D = (BuildOctet X0 X0 X1 X0 X1 X1 X0 X1)

x2E :: Octet
x2E = (BuildOctet X0 X0 X1 X0 X1 X1 X1 X0)

x2F :: Octet
x2F = (BuildOctet X0 X0 X1 X0 X1 X1 X1 X1)

x30 :: Octet
x30 = (BuildOctet X0 X0 X1 X1 X0 X0 X0 X0)

x31 :: Octet
x31 = (BuildOctet X0 X0 X1 X1 X0 X0 X0 X1)

x32 :: Octet
x32 = (BuildOctet X0 X0 X1 X1 X0 X0 X1 X0)

x33 :: Octet
x33 = (BuildOctet X0 X0 X1 X1 X0 X0 X1 X1)

x34 :: Octet
x34 = (BuildOctet X0 X0 X1 X1 X0 X1 X0 X0)

x35 :: Octet
x35 = (BuildOctet X0 X0 X1 X1 X0 X1 X0 X1)

x36 :: Octet
x36 = (BuildOctet X0 X0 X1 X1 X0 X1 X1 X0)

x37 :: Octet
x37 = (BuildOctet X0 X0 X1 X1 X0 X1 X1 X1)

x38 :: Octet
x38 = (BuildOctet X0 X0 X1 X1 X1 X0 X0 X0)

x39 :: Octet
x39 = (BuildOctet X0 X0 X1 X1 X1 X0 X0 X1)

x3A :: Octet
x3A = (BuildOctet X0 X0 X1 X1 X1 X0 X1 X0)

x3B :: Octet
x3B = (BuildOctet X0 X0 X1 X1 X1 X0 X1 X1)

x3D :: Octet
x3D = (BuildOctet X0 X0 X1 X1 X1 X1 X0 X1)

x3C :: Octet
x3C = (BuildOctet X0 X0 X1 X1 X1 X1 X0 X0)

x3F :: Octet
x3F = (BuildOctet X0 X0 X1 X1 X1 X1 X1 X1)

x40 :: Octet
x40 = (BuildOctet X0 X1 X0 X0 X0 X0 X0 X0)

x46 :: Octet
x46 = (BuildOctet X0 X1 X0 X0 X0 X1 X1 X0)

x48 :: Octet
x48 = (BuildOctet X0 X1 X0 X0 X1 X0 X0 X0)

x49 :: Octet
x49 = (BuildOctet X0 X1 X0 X0 X1 X0 X0 X1)

x4A :: Octet
x4A = (BuildOctet X0 X1 X0 X0 X1 X0 X1 X0)

x4B :: Octet
x4B = (BuildOctet X0 X1 X0 X0 X1 X0 X1 X1)

x4C :: Octet
x4C = (BuildOctet X0 X1 X0 X0 X1 X1 X0 X0)

x4D :: Octet
x4D = (BuildOctet X0 X1 X0 X0 X1 X1 X0 X1)

x4E :: Octet
x4E = (BuildOctet X0 X1 X0 X0 X1 X1 X1 X0)

x4F :: Octet
x4F = (BuildOctet X0 X1 X0 X0 X1 X1 X1 X1)

x50 :: Octet
x50 = (BuildOctet X0 X1 X0 X1 X0 X0 X0 X0)

x51 :: Octet
x51 = (BuildOctet X0 X1 X0 X1 X0 X0 X0 X1)

x53 :: Octet
x53 = (BuildOctet X0 X1 X0 X1 X0 X0 X1 X1)

x54 :: Octet
x54 = (BuildOctet X0 X1 X0 X1 X0 X1 X0 X0)

x55 :: Octet
x55 = (BuildOctet X0 X1 X0 X1 X0 X1 X0 X1)

x58 :: Octet
x58 = (BuildOctet X0 X1 X0 X1 X1 X0 X0 X0)

x5A :: Octet
x5A = (BuildOctet X0 X1 X0 X1 X1 X0 X1 X0)

x5B :: Octet
x5B = (BuildOctet X0 X1 X0 X1 X1 X0 X1 X1)

x5C :: Octet
x5C = (BuildOctet X0 X1 X0 X1 X1 X1 X0 X0)

x5D :: Octet
x5D = (BuildOctet X0 X1 X0 X1 X1 X1 X0 X1)

x5E :: Octet
x5E = (BuildOctet X0 X1 X0 X1 X1 X1 X1 X0)

x5F :: Octet
x5F = (BuildOctet X0 X1 X0 X1 X1 X1 X1 X1)

x60 :: Octet
x60 = (BuildOctet X0 X1 X1 X0 X0 X0 X0 X0)

x61 :: Octet
x61 = (BuildOctet X0 X1 X1 X0 X0 X0 X0 X1)

x62 :: Octet
x62 = (BuildOctet X0 X1 X1 X0 X0 X0 X1 X0)

x63 :: Octet
x63 = (BuildOctet X0 X1 X1 X0 X0 X0 X1 X1)

x64 :: Octet
x64 = (BuildOctet X0 X1 X1 X0 X0 X1 X0 X0)

x65 :: Octet
x65 = (BuildOctet X0 X1 X1 X0 X0 X1 X0 X1)

x66 :: Octet
x66 = (BuildOctet X0 X1 X1 X0 X0 X1 X1 X0)

x67 :: Octet
x67 = (BuildOctet X0 X1 X1 X0 X0 X1 X1 X1)

x69 :: Octet
x69 = (BuildOctet X0 X1 X1 X0 X1 X0 X0 X1)

x6A :: Octet
x6A = (BuildOctet X0 X1 X1 X0 X1 X0 X1 X0)

x6B :: Octet
x6B = (BuildOctet X0 X1 X1 X0 X1 X0 X1 X1)

x6C :: Octet
x6C = (BuildOctet X0 X1 X1 X0 X1 X1 X0 X0)

x6D :: Octet
x6D = (BuildOctet X0 X1 X1 X0 X1 X1 X0 X1)

x6E :: Octet
x6E = (BuildOctet X0 X1 X1 X0 X1 X1 X1 X0)

x6F :: Octet
x6F = (BuildOctet X0 X1 X1 X0 X1 X1 X1 X1)

x70 :: Octet
x70 = (BuildOctet X0 X1 X1 X1 X0 X0 X0 X0)

x71 :: Octet
x71 = (BuildOctet X0 X1 X1 X1 X0 X0 X0 X1)

x72 :: Octet
x72 = (BuildOctet X0 X1 X1 X1 X0 X0 X1 X0)

x73 :: Octet
x73 = (BuildOctet X0 X1 X1 X1 X0 X0 X1 X1)

x74 :: Octet
x74 = (BuildOctet X0 X1 X1 X1 X0 X1 X0 X0)

x75 :: Octet
x75 = (BuildOctet X0 X1 X1 X1 X0 X1 X0 X1)

x76 :: Octet
x76 = (BuildOctet X0 X1 X1 X1 X0 X1 X1 X0)

x77 :: Octet
x77 = (BuildOctet X0 X1 X1 X1 X0 X1 X1 X1)

x78 :: Octet
x78 = (BuildOctet X0 X1 X1 X1 X1 X0 X0 X0)

x79 :: Octet
x79 = (BuildOctet X0 X1 X1 X1 X1 X0 X0 X1)

x7A :: Octet
x7A = (BuildOctet X0 X1 X1 X1 X1 X0 X1 X0)

x7B :: Octet
x7B = (BuildOctet X0 X1 X1 X1 X1 X0 X1 X1)

x7C :: Octet
x7C = (BuildOctet X0 X1 X1 X1 X1 X1 X0 X0)

x7D :: Octet
x7D = (BuildOctet X0 X1 X1 X1 X1 X1 X0 X1)

x7E :: Octet
x7E = (BuildOctet X0 X1 X1 X1 X1 X1 X1 X0)

x7F :: Octet
x7F = (BuildOctet X0 X1 X1 X1 X1 X1 X1 X1)

x80 :: Octet
x80 = (BuildOctet X1 X0 X0 X0 X0 X0 X0 X0)

x81 :: Octet
x81 = (BuildOctet X1 X0 X0 X0 X0 X0 X0 X1)

x83 :: Octet
x83 = (BuildOctet X1 X0 X0 X0 X0 X0 X1 X1)

x84 :: Octet
x84 = (BuildOctet X1 X0 X0 X0 X0 X1 X0 X0)

x85 :: Octet
x85 = (BuildOctet X1 X0 X0 X0 X0 X1 X0 X1)

x86 :: Octet
x86 = (BuildOctet X1 X0 X0 X0 X0 X1 X1 X0)

x88 :: Octet
x88 = (BuildOctet X1 X0 X0 X0 X1 X0 X0 X0)

x89 :: Octet
x89 = (BuildOctet X1 X0 X0 X0 X1 X0 X0 X1)

x8A :: Octet
x8A = (BuildOctet X1 X0 X0 X0 X1 X0 X1 X0)

x8C :: Octet
x8C = (BuildOctet X1 X0 X0 X0 X1 X1 X0 X0)

x8D :: Octet
x8D = (BuildOctet X1 X0 X0 X0 X1 X1 X0 X1)

x8E :: Octet
x8E = (BuildOctet X1 X0 X0 X0 X1 X1 X1 X0)

x8F :: Octet
x8F = (BuildOctet X1 X0 X0 X0 X1 X1 X1 X1)

x90 :: Octet
x90 = (BuildOctet X1 X0 X0 X1 X0 X0 X0 X0)

x91 :: Octet
x91 = (BuildOctet X1 X0 X0 X1 X0 X0 X0 X1)

x92 :: Octet
x92 = (BuildOctet X1 X0 X0 X1 X0 X0 X1 X0)

x93 :: Octet
x93 = (BuildOctet X1 X0 X0 X1 X0 X0 X1 X1)

x95 :: Octet
x95 = (BuildOctet X1 X0 X0 X1 X0 X1 X0 X1)

x96 :: Octet
x96 = (BuildOctet X1 X0 X0 X1 X0 X1 X1 X0)

x97 :: Octet
x97 = (BuildOctet X1 X0 X0 X1 X0 X1 X1 X1)

x98 :: Octet
x98 = (BuildOctet X1 X0 X0 X1 X1 X0 X0 X0)

x99 :: Octet
x99 = (BuildOctet X1 X0 X0 X1 X1 X0 X0 X1)

x9A :: Octet
x9A = (BuildOctet X1 X0 X0 X1 X1 X0 X1 X0)

x9B :: Octet
x9B = (BuildOctet X1 X0 X0 X1 X1 X0 X1 X1)

x9C :: Octet
x9C = (BuildOctet X1 X0 X0 X1 X1 X1 X0 X0)

x9D :: Octet
x9D = (BuildOctet X1 X0 X0 X1 X1 X1 X0 X1)

x9E :: Octet
x9E = (BuildOctet X1 X0 X0 X1 X1 X1 X1 X0)

x9F :: Octet
x9F = (BuildOctet X1 X0 X0 X1 X1 X1 X1 X1)

xA1 :: Octet
xA1 = (BuildOctet X1 X0 X1 X0 X0 X0 X0 X1)

xA0 :: Octet
xA0 = (BuildOctet X1 X0 X1 X0 X0 X0 X0 X0)

xA2 :: Octet
xA2 = (BuildOctet X1 X0 X1 X0 X0 X0 X1 X0)

xA3 :: Octet
xA3 = (BuildOctet X1 X0 X1 X0 X0 X0 X1 X1)

xA4 :: Octet
xA4 = (BuildOctet X1 X0 X1 X0 X0 X1 X0 X0)

xA5 :: Octet
xA5 = (BuildOctet X1 X0 X1 X0 X0 X1 X0 X1)

xA6 :: Octet
xA6 = (BuildOctet X1 X0 X1 X0 X0 X1 X1 X0)

xA7 :: Octet
xA7 = (BuildOctet X1 X0 X1 X0 X0 X1 X1 X1)

xA8 :: Octet
xA8 = (BuildOctet X1 X0 X1 X0 X1 X0 X0 X0)

xA9 :: Octet
xA9 = (BuildOctet X1 X0 X1 X0 X1 X0 X0 X1)

xAA :: Octet
xAA = (BuildOctet X1 X0 X1 X0 X1 X0 X1 X0)

xAB :: Octet
xAB = (BuildOctet X1 X0 X1 X0 X1 X0 X1 X1)

xAC :: Octet
xAC = (BuildOctet X1 X0 X1 X0 X1 X1 X0 X0)

xAE :: Octet
xAE = (BuildOctet X1 X0 X1 X0 X1 X1 X1 X0)

xAF :: Octet
xAF = (BuildOctet X1 X0 X1 X0 X1 X1 X1 X1)

xB0 :: Octet
xB0 = (BuildOctet X1 X0 X1 X1 X0 X0 X0 X0)

xB1 :: Octet
xB1 = (BuildOctet X1 X0 X1 X1 X0 X0 X0 X1)

xB2 :: Octet
xB2 = (BuildOctet X1 X0 X1 X1 X0 X0 X1 X0)

xB3 :: Octet
xB3 = (BuildOctet X1 X0 X1 X1 X0 X0 X1 X1)

xB5 :: Octet
xB5 = (BuildOctet X1 X0 X1 X1 X0 X1 X0 X1)

xB6 :: Octet
xB6 = (BuildOctet X1 X0 X1 X1 X0 X1 X1 X0)

xB8 :: Octet
xB8 = (BuildOctet X1 X0 X1 X1 X1 X0 X0 X0)

xB9 :: Octet
xB9 = (BuildOctet X1 X0 X1 X1 X1 X0 X0 X1)

xBA :: Octet
xBA = (BuildOctet X1 X0 X1 X1 X1 X0 X1 X0)

xBB :: Octet
xBB = (BuildOctet X1 X0 X1 X1 X1 X0 X1 X1)

xBC :: Octet
xBC = (BuildOctet X1 X0 X1 X1 X1 X1 X0 X0)

xBE :: Octet
xBE = (BuildOctet X1 X0 X1 X1 X1 X1 X1 X0)

xBF :: Octet
xBF = (BuildOctet X1 X0 X1 X1 X1 X1 X1 X1)

xC0 :: Octet
xC0 = (BuildOctet X1 X1 X0 X0 X0 X0 X0 X0)

xC1 :: Octet
xC1 = (BuildOctet X1 X1 X0 X0 X0 X0 X0 X1)

xC2 :: Octet
xC2 = (BuildOctet X1 X1 X0 X0 X0 X0 X1 X0)

xC4 :: Octet
xC4 = (BuildOctet X1 X1 X0 X0 X0 X1 X0 X0)

xC5 :: Octet
xC5 = (BuildOctet X1 X1 X0 X0 X0 X1 X0 X1)

xC6 :: Octet
xC6 = (BuildOctet X1 X1 X0 X0 X0 X1 X1 X0)

xC7 :: Octet
xC7 = (BuildOctet X1 X1 X0 X0 X0 X1 X1 X1)

xC8 :: Octet
xC8 = (BuildOctet X1 X1 X0 X0 X1 X0 X0 X0)

xC9 :: Octet
xC9 = (BuildOctet X1 X1 X0 X0 X1 X0 X0 X1)

xCA :: Octet
xCA = (BuildOctet X1 X1 X0 X0 X1 X0 X1 X0)

xCB :: Octet
xCB = (BuildOctet X1 X1 X0 X0 X1 X0 X1 X1)

xCC :: Octet
xCC = (BuildOctet X1 X1 X0 X0 X1 X1 X0 X0)

xCD :: Octet
xCD = (BuildOctet X1 X1 X0 X0 X1 X1 X0 X1)

xCE :: Octet
xCE = (BuildOctet X1 X1 X0 X0 X1 X1 X1 X0)

xD0 :: Octet
xD0 = (BuildOctet X1 X1 X0 X1 X0 X0 X0 X0)

xD1 :: Octet
xD1 = (BuildOctet X1 X1 X0 X1 X0 X0 X0 X1)

xD2 :: Octet
xD2 = (BuildOctet X1 X1 X0 X1 X0 X0 X1 X0)

xD3 :: Octet
xD3 = (BuildOctet X1 X1 X0 X1 X0 X0 X1 X1)

xD4 :: Octet
xD4 = (BuildOctet X1 X1 X0 X1 X0 X1 X0 X0)

xD5 :: Octet
xD5 = (BuildOctet X1 X1 X0 X1 X0 X1 X0 X1)

xD6 :: Octet
xD6 = (BuildOctet X1 X1 X0 X1 X0 X1 X1 X0)

xD7 :: Octet
xD7 = (BuildOctet X1 X1 X0 X1 X0 X1 X1 X1)

xD8 :: Octet
xD8 = (BuildOctet X1 X1 X0 X1 X1 X0 X0 X0)

xD9 :: Octet
xD9 = (BuildOctet X1 X1 X0 X1 X1 X0 X0 X1)

xDB :: Octet
xDB = (BuildOctet X1 X1 X0 X1 X1 X0 X1 X1)

xDC :: Octet
xDC = (BuildOctet X1 X1 X0 X1 X1 X1 X0 X0)

xDD :: Octet
xDD = (BuildOctet X1 X1 X0 X1 X1 X1 X0 X1)

xDE :: Octet
xDE = (BuildOctet X1 X1 X0 X1 X1 X1 X1 X0)

xDF :: Octet
xDF = (BuildOctet X1 X1 X0 X1 X1 X1 X1 X1)

xE0 :: Octet
xE0 = (BuildOctet X1 X1 X1 X0 X0 X0 X0 X0)

xE1 :: Octet
xE1 = (BuildOctet X1 X1 X1 X0 X0 X0 X0 X1)

xE3 :: Octet
xE3 = (BuildOctet X1 X1 X1 X0 X0 X0 X1 X1)

xE6 :: Octet
xE6 = (BuildOctet X1 X1 X1 X0 X0 X1 X1 X0)

xE8 :: Octet
xE8 = (BuildOctet X1 X1 X1 X0 X1 X0 X0 X0)

xE9 :: Octet
xE9 = (BuildOctet X1 X1 X1 X0 X1 X0 X0 X1)

xEA :: Octet
xEA = (BuildOctet X1 X1 X1 X0 X1 X0 X1 X0)

xEB :: Octet
xEB = (BuildOctet X1 X1 X1 X0 X1 X0 X1 X1)

xEC :: Octet
xEC = (BuildOctet X1 X1 X1 X0 X1 X1 X0 X0)

xED :: Octet
xED = (BuildOctet X1 X1 X1 X0 X1 X1 X0 X1)

xEE :: Octet
xEE = (BuildOctet X1 X1 X1 X0 X1 X1 X1 X0)

xEF :: Octet
xEF = (BuildOctet X1 X1 X1 X0 X1 X1 X1 X1)

xF0 :: Octet
xF0 = (BuildOctet X1 X1 X1 X1 X0 X0 X0 X0)

xF1 :: Octet
xF1 = (BuildOctet X1 X1 X1 X1 X0 X0 X0 X1)

xF2 :: Octet
xF2 = (BuildOctet X1 X1 X1 X1 X0 X0 X1 X0)

xF3 :: Octet
xF3 = (BuildOctet X1 X1 X1 X1 X0 X0 X1 X1)

xF4 :: Octet
xF4 = (BuildOctet X1 X1 X1 X1 X0 X1 X0 X0)

xF5 :: Octet
xF5 = (BuildOctet X1 X1 X1 X1 X0 X1 X0 X1)

xF6 :: Octet
xF6 = (BuildOctet X1 X1 X1 X1 X0 X1 X1 X0)

xF7 :: Octet
xF7 = (BuildOctet X1 X1 X1 X1 X0 X1 X1 X1)

xF8 :: Octet
xF8 = (BuildOctet X1 X1 X1 X1 X1 X0 X0 X0)

xF9 :: Octet
xF9 = (BuildOctet X1 X1 X1 X1 X1 X0 X0 X1)

xFA :: Octet
xFA = (BuildOctet X1 X1 X1 X1 X1 X0 X1 X0)

xFB :: Octet
xFB = (BuildOctet X1 X1 X1 X1 X1 X0 X1 X1)

xFC :: Octet
xFC = (BuildOctet X1 X1 X1 X1 X1 X1 X0 X0)

xFD :: Octet
xFD = (BuildOctet X1 X1 X1 X1 X1 X1 X0 X1)

xFE :: Octet
xFE = (BuildOctet X1 X1 X1 X1 X1 X1 X1 X0)

xFF :: Octet
xFF = (BuildOctet X1 X1 X1 X1 X1 X1 X1 X1)

andBlock :: !Block !Block -> Block
andBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (andOctet o1 o_prime1) (andOctet o2 o_prime2) (andOctet o3 o_prime3) (andOctet o4 o_prime4))

orBlock :: !Block !Block -> Block
orBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (orOctet o1 o_prime1) (orOctet o2 o_prime2) (orOctet o3 o_prime3) (orOctet o4 o_prime4))

xorBlock :: !Block !Block -> Block
xorBlock (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildBlock (xorOctet o1 o_prime1) (xorOctet o2 o_prime2) (xorOctet o3 o_prime3) (xorOctet o4 o_prime4))

x0001 :: Half
x0001 = (BuildHalf x00 x01)

x00000000 :: Block
x00000000 = (BuildBlock x00 x00 x00 x00)

x00000001 :: Block
x00000001 = (BuildBlock x00 x00 x00 x01)

x00000002 :: Block
x00000002 = (BuildBlock x00 x00 x00 x02)

x00000003 :: Block
x00000003 = (BuildBlock x00 x00 x00 x03)

x00000004 :: Block
x00000004 = (BuildBlock x00 x00 x00 x04)

x00000005 :: Block
x00000005 = (BuildBlock x00 x00 x00 x05)

x00000006 :: Block
x00000006 = (BuildBlock x00 x00 x00 x06)

x00000007 :: Block
x00000007 = (BuildBlock x00 x00 x00 x07)

x00000008 :: Block
x00000008 = (BuildBlock x00 x00 x00 x08)

x00000009 :: Block
x00000009 = (BuildBlock x00 x00 x00 x09)

x0000000A :: Block
x0000000A = (BuildBlock x00 x00 x00 x0A)

x0000000B :: Block
x0000000B = (BuildBlock x00 x00 x00 x0B)

x0000000C :: Block
x0000000C = (BuildBlock x00 x00 x00 x0C)

x0000000D :: Block
x0000000D = (BuildBlock x00 x00 x00 x0D)

x0000000E :: Block
x0000000E = (BuildBlock x00 x00 x00 x0E)

x0000000F :: Block
x0000000F = (BuildBlock x00 x00 x00 x0F)

x00000010 :: Block
x00000010 = (BuildBlock x00 x00 x00 x10)

x00000012 :: Block
x00000012 = (BuildBlock x00 x00 x00 x12)

x00000014 :: Block
x00000014 = (BuildBlock x00 x00 x00 x14)

x00000016 :: Block
x00000016 = (BuildBlock x00 x00 x00 x16)

x00000018 :: Block
x00000018 = (BuildBlock x00 x00 x00 x18)

x0000001B :: Block
x0000001B = (BuildBlock x00 x00 x00 x1B)

x0000001D :: Block
x0000001D = (BuildBlock x00 x00 x00 x1D)

x0000001E :: Block
x0000001E = (BuildBlock x00 x00 x00 x1E)

x0000001F :: Block
x0000001F = (BuildBlock x00 x00 x00 x1F)

x00000031 :: Block
x00000031 = (BuildBlock x00 x00 x00 x31)

x00000036 :: Block
x00000036 = (BuildBlock x00 x00 x00 x36)

x00000060 :: Block
x00000060 = (BuildBlock x00 x00 x00 x60)

x00000080 :: Block
x00000080 = (BuildBlock x00 x00 x00 x80)

x000000A5 :: Block
x000000A5 = (BuildBlock x00 x00 x00 xA5)

x000000B6 :: Block
x000000B6 = (BuildBlock x00 x00 x00 xB6)

x000000C4 :: Block
x000000C4 = (BuildBlock x00 x00 x00 xC4)

x000000D2 :: Block
x000000D2 = (BuildBlock x00 x00 x00 xD2)

x00000100 :: Block
x00000100 = (BuildBlock x00 x00 x01 x00)

x00000129 :: Block
x00000129 = (BuildBlock x00 x00 x01 x29)

x0000018C :: Block
x0000018C = (BuildBlock x00 x00 x01 x8C)

x00004000 :: Block
x00004000 = (BuildBlock x00 x00 x40 x00)

x00010000 :: Block
x00010000 = (BuildBlock x00 x01 x00 x00)

x00020000 :: Block
x00020000 = (BuildBlock x00 x02 x00 x00)

x00030000 :: Block
x00030000 = (BuildBlock x00 x03 x00 x00)

x00040000 :: Block
x00040000 = (BuildBlock x00 x04 x00 x00)

x00060000 :: Block
x00060000 = (BuildBlock x00 x06 x00 x00)

x00804021 :: Block
x00804021 = (BuildBlock x00 x80 x40 x21)

x00FF00FF :: Block
x00FF00FF = (BuildBlock x00 xFF x00 xFF)

x0103050B :: Block
x0103050B = (BuildBlock x01 x03 x05 x0B)

x01030703 :: Block
x01030703 = (BuildBlock x01 x03 x07 x03)

x01030705 :: Block
x01030705 = (BuildBlock x01 x03 x07 x05)

x0103070F :: Block
x0103070F = (BuildBlock x01 x03 x07 x0F)

x02040801 :: Block
x02040801 = (BuildBlock x02 x04 x08 x01)

x0297AF6F :: Block
x0297AF6F = (BuildBlock x02 x97 xAF x6F)

x07050301 :: Block
x07050301 = (BuildBlock x07 x05 x03 x01)

x077788A2 :: Block
x077788A2 = (BuildBlock x07 x77 x88 xA2)

x07C72EAA :: Block
x07C72EAA = (BuildBlock x07 xC7 x2E xAA)

x0A202020 :: Block
x0A202020 = (BuildBlock x0A x20 x20 x20)

x0AD67E20 :: Block
x0AD67E20 = (BuildBlock x0A xD6 x7E x20)

x10000000 :: Block
x10000000 = (BuildBlock x10 x00 x00 x00)

x11A9D254 :: Block
x11A9D254 = (BuildBlock x11 xA9 xD2 x54)

x11AC46B8 :: Block
x11AC46B8 = (BuildBlock x11 xAC x46 xB8)

x1277A6D4 :: Block
x1277A6D4 = (BuildBlock x12 x77 xA6 xD4)

x13647149 :: Block
x13647149 = (BuildBlock x13 x64 x71 x49)

x160EE9B5 :: Block
x160EE9B5 = (BuildBlock x16 x0E xE9 xB5)

x17065DBB :: Block
x17065DBB = (BuildBlock x17 x06 x5D xBB)

x17A808FD :: Block
x17A808FD = (BuildBlock x17 xA8 x08 xFD)

x1D10D8D3 :: Block
x1D10D8D3 = (BuildBlock x1D x10 xD8 xD3)

x1D3B7760 :: Block
x1D3B7760 = (BuildBlock x1D x3B x77 x60)

x1D9C9655 :: Block
x1D9C9655 = (BuildBlock x1D x9C x96 x55)

x1F3F7FFF :: Block
x1F3F7FFF = (BuildBlock x1F x3F x7F xFF)

x204E80A7 :: Block
x204E80A7 = (BuildBlock x20 x4E x80 xA7)

x21D869BA :: Block
x21D869BA = (BuildBlock x21 xD8 x69 xBA)

x24B66FB5 :: Block
x24B66FB5 = (BuildBlock x24 xB6 x6F xB5)

x270EEDAF :: Block
x270EEDAF = (BuildBlock x27 x0E xED xAF)

x277B4B25 :: Block
x277B4B25 = (BuildBlock x27 x7B x4B x25)

x2829040B :: Block
x2829040B = (BuildBlock x28 x29 x04 x0B)

x288FC786 :: Block
x288FC786 = (BuildBlock x28 x8F xC7 x86)

x28EAD8B3 :: Block
x28EAD8B3 = (BuildBlock x28 xEA xD8 xB3)

x29907CD8 :: Block
x29907CD8 = (BuildBlock x29 x90 x7C xD8)

x29C1485F :: Block
x29C1485F = (BuildBlock x29 xC1 x48 x5F)

x29EEE96B :: Block
x29EEE96B = (BuildBlock x29 xEE xE9 x6B)

x2A6091AE :: Block
x2A6091AE = (BuildBlock x2A x60 x91 xAE)

x2BF8499A :: Block
x2BF8499A = (BuildBlock x2B xF8 x49 x9A)

x2E80AC30 :: Block
x2E80AC30 = (BuildBlock x2E x80 xAC x30)

x2FD76FFB :: Block
x2FD76FFB = (BuildBlock x2F xD7 x6F xFB)

x30261492 :: Block
x30261492 = (BuildBlock x30 x26 x14 x92)

x303FF4AA :: Block
x303FF4AA = (BuildBlock x30 x3F xF4 xAA)

x33D5A466 :: Block
x33D5A466 = (BuildBlock x33 xD5 xA4 x66)

x344925FC :: Block
x344925FC = (BuildBlock x34 x49 x25 xFC)

x34ACF886 :: Block
x34ACF886 = (BuildBlock x34 xAC xF8 x86)

x3CD54DEB :: Block
x3CD54DEB = (BuildBlock x3C xD5 x4D xEB)

x3CF3A7D2 :: Block
x3CF3A7D2 = (BuildBlock x3C xF3 xA7 xD2)

x3DD81AC6 :: Block
x3DD81AC6 = (BuildBlock x3D xD8 x1A xC6)

x3F6F7248 :: Block
x3F6F7248 = (BuildBlock x3F x6F x72 x48)

x48B204D6 :: Block
x48B204D6 = (BuildBlock x48 xB2 x04 xD6)

x4A645A01 :: Block
x4A645A01 = (BuildBlock x4A x64 x5A x01)

x4C49AAE0 :: Block
x4C49AAE0 = (BuildBlock x4C x49 xAA xE0)

x4CE933E1 :: Block
x4CE933E1 = (BuildBlock x4C xE9 x33 xE1)

x4D53901A :: Block
x4D53901A = (BuildBlock x4D x53 x90 x1A)

x4DA124A1 :: Block
x4DA124A1 = (BuildBlock x4D xA1 x24 xA1)

x4F998E01 :: Block
x4F998E01 = (BuildBlock x4F x99 x8E x01)

x4FB1138A :: Block
x4FB1138A = (BuildBlock x4F xB1 x13 x8A)

x50DEC930 :: Block
x50DEC930 = (BuildBlock x50 xDE xC9 x30)

x51AF3C1D :: Block
x51AF3C1D = (BuildBlock x51 xAF x3C x1D)

x51EDE9C7 :: Block
x51EDE9C7 = (BuildBlock x51 xED xE9 xC7)

x550D91CE :: Block
x550D91CE = (BuildBlock x55 x0D x91 xCE)

x55555555 :: Block
x55555555 = (BuildBlock x55 x55 x55 x55)

x55DD063F :: Block
x55DD063F = (BuildBlock x55 xDD x06 x3F)

x5834A585 :: Block
x5834A585 = (BuildBlock x58 x34 xA5 x85)

x5A35D667 :: Block
x5A35D667 = (BuildBlock x5A x35 xD6 x67)

x5BC02502 :: Block
x5BC02502 = (BuildBlock x5B xC0 x25 x02)

x5CCA3239 :: Block
x5CCA3239 = (BuildBlock x5C xCA x32 x39)

x5EBA06C2 :: Block
x5EBA06C2 = (BuildBlock x5E xBA x06 xC2)

x5F38EEF1 :: Block
x5F38EEF1 = (BuildBlock x5F x38 xEE xF1)

x613F8E2A :: Block
x613F8E2A = (BuildBlock x61 x3F x8E x2A)

x63C70DBA :: Block
x63C70DBA = (BuildBlock x63 xC7 x0D xBA)

x6AD6E8A4 :: Block
x6AD6E8A4 = (BuildBlock x6A xD6 xE8 xA4)

x6AEBACF8 :: Block
x6AEBACF8 = (BuildBlock x6A xEB xAC xF8)

x6D67E884 :: Block
x6D67E884 = (BuildBlock x6D x67 xE8 x84)

x7050EC5E :: Block
x7050EC5E = (BuildBlock x70 x50 xEC x5E)

x717153D5 :: Block
x717153D5 = (BuildBlock x71 x71 x53 xD5)

x7201F4DC :: Block
x7201F4DC = (BuildBlock x72 x01 xF4 xDC)

x7397C9AE :: Block
x7397C9AE = (BuildBlock x73 x97 xC9 xAE)

x74B39176 :: Block
x74B39176 = (BuildBlock x74 xB3 x91 x76)

x76232E5F :: Block
x76232E5F = (BuildBlock x76 x23 x2E x5F)

x7783C51D :: Block
x7783C51D = (BuildBlock x77 x83 xC5 x1D)

x7792F9D4 :: Block
x7792F9D4 = (BuildBlock x77 x92 xF9 xD4)

x7BC180AB :: Block
x7BC180AB = (BuildBlock x7B xC1 x80 xAB)

x7DB2D9F4 :: Block
x7DB2D9F4 = (BuildBlock x7D xB2 xD9 xF4)

x7DFEFBFF :: Block
x7DFEFBFF = (BuildBlock x7D xFE xFB xFF)

x7F76A3B0 :: Block
x7F76A3B0 = (BuildBlock x7F x76 xA3 xB0)

x7F839576 :: Block
x7F839576 = (BuildBlock x7F x83 x95 x76)

x7FFFFFF0 :: Block
x7FFFFFF0 = (BuildBlock x7F xFF xFF xF0)

x7FFFFFF1 :: Block
x7FFFFFF1 = (BuildBlock x7F xFF xFF xF1)

x7FFFFFFC :: Block
x7FFFFFFC = (BuildBlock x7F xFF xFF xFC)

x7FFFFFFD :: Block
x7FFFFFFD = (BuildBlock x7F xFF xFF xFD)

x80000000 :: Block
x80000000 = (BuildBlock x80 x00 x00 x00)

x80000002 :: Block
x80000002 = (BuildBlock x80 x00 x00 x02)

x800000C2 :: Block
x800000C2 = (BuildBlock x80 x00 x00 xC2)

x80018000 :: Block
x80018000 = (BuildBlock x80 x01 x80 x00)

x80018001 :: Block
x80018001 = (BuildBlock x80 x01 x80 x01)

x80397302 :: Block
x80397302 = (BuildBlock x80 x39 x73 x02)

x81D10CA3 :: Block
x81D10CA3 = (BuildBlock x81 xD1 x0C xA3)

x89D635D7 :: Block
x89D635D7 = (BuildBlock x89 xD6 x35 xD7)

x8CE37709 :: Block
x8CE37709 = (BuildBlock x8C xE3 x77 x09)

x8DC8BBDE :: Block
x8DC8BBDE = (BuildBlock x8D xC8 xBB xDE)

x9115A558 :: Block
x9115A558 = (BuildBlock x91 x15 xA5 x58)

x91896CFA :: Block
x91896CFA = (BuildBlock x91 x89 x6C xFA)

x9372CDC6 :: Block
x9372CDC6 = (BuildBlock x93 x72 xCD xC6)

x98D1CC75 :: Block
x98D1CC75 = (BuildBlock x98 xD1 xCC x75)

x9D15C437 :: Block
x9D15C437 = (BuildBlock x9D x15 xC4 x37)

x9DB15CF6 :: Block
x9DB15CF6 = (BuildBlock x9D xB1 x5C xF6)

x9E2E7B36 :: Block
x9E2E7B36 = (BuildBlock x9E x2E x7B x36)

xA018C83B :: Block
xA018C83B = (BuildBlock xA0 x18 xC8 x3B)

xA0B87B77 :: Block
xA0B87B77 = (BuildBlock xA0 xB8 x7B x77)

xA44AAAC0 :: Block
xA44AAAC0 = (BuildBlock xA4 x4A xAA xC0)

xA511987A :: Block
xA511987A = (BuildBlock xA5 x11 x98 x7A)

xA70FC148 :: Block
xA70FC148 = (BuildBlock xA7 x0F xC1 x48)

xA93BD410 :: Block
xA93BD410 = (BuildBlock xA9 x3B xD4 x10)

xAAAAAAAA :: Block
xAAAAAAAA = (BuildBlock xAA xAA xAA xAA)

xAB00FFCD :: Block
xAB00FFCD = (BuildBlock xAB x00 xFF xCD)

xAB01FCCD :: Block
xAB01FCCD = (BuildBlock xAB x01 xFC xCD)

xAB6EED4A :: Block
xAB6EED4A = (BuildBlock xAB x6E xED x4A)

xABEEED6B :: Block
xABEEED6B = (BuildBlock xAB xEE xED x6B)

xACBC13DD :: Block
xACBC13DD = (BuildBlock xAC xBC x13 xDD)

xB1CC1CC5 :: Block
xB1CC1CC5 = (BuildBlock xB1 xCC x1C xC5)

xB8142629 :: Block
xB8142629 = (BuildBlock xB8 x14 x26 x29)

xB99A62DE :: Block
xB99A62DE = (BuildBlock xB9 x9A x62 xDE)

xBA92DB12 :: Block
xBA92DB12 = (BuildBlock xBA x92 xDB x12)

xBBA57835 :: Block
xBBA57835 = (BuildBlock xBB xA5 x78 x35)

xBE9F0917 :: Block
xBE9F0917 = (BuildBlock xBE x9F x09 x17)

xBF2D7D85 :: Block
xBF2D7D85 = (BuildBlock xBF x2D x7D x85)

xBFEF7FDF :: Block
xBFEF7FDF = (BuildBlock xBF xEF x7F xDF)

xC1ED90DD :: Block
xC1ED90DD = (BuildBlock xC1 xED x90 xDD)

xC21A1846 :: Block
xC21A1846 = (BuildBlock xC2 x1A x18 x46)

xC4EB1AEB :: Block
xC4EB1AEB = (BuildBlock xC4 xEB x1A xEB)

xC6B1317E :: Block
xC6B1317E = (BuildBlock xC6 xB1 x31 x7E)

xCBC865BA :: Block
xCBC865BA = (BuildBlock xCB xC8 x65 xBA)

xCD959B46 :: Block
xCD959B46 = (BuildBlock xCD x95 x9B x46)

xD0482465 :: Block
xD0482465 = (BuildBlock xD0 x48 x24 x65)

xD636250D :: Block
xD636250D = (BuildBlock xD6 x36 x25 x0D)

xD7843FDC :: Block
xD7843FDC = (BuildBlock xD7 x84 x3F xDC)

xD78634BC :: Block
xD78634BC = (BuildBlock xD7 x86 x34 xBC)

xD8804CA5 :: Block
xD8804CA5 = (BuildBlock xD8 x80 x4C xA5)

xDB79FBDC :: Block
xDB79FBDC = (BuildBlock xDB x79 xFB xDC)

xDB9102B0 :: Block
xDB9102B0 = (BuildBlock xDB x91 x02 xB0)

xE0C08000 :: Block
xE0C08000 = (BuildBlock xE0 xC0 x80 x00)

xE6A12F07 :: Block
xE6A12F07 = (BuildBlock xE6 xA1 x2F x07)

xEB35B97F :: Block
xEB35B97F = (BuildBlock xEB x35 xB9 x7F)

xF0239DD5 :: Block
xF0239DD5 = (BuildBlock xF0 x23 x9D xD5)

xF14D6E28 :: Block
xF14D6E28 = (BuildBlock xF1 x4D x6E x28)

xF2EF3501 :: Block
xF2EF3501 = (BuildBlock xF2 xEF x35 x01)

xF6A09667 :: Block
xF6A09667 = (BuildBlock xF6 xA0 x96 x67)

xFD297DA4 :: Block
xFD297DA4 = (BuildBlock xFD x29 x7D xA4)

xFDC1A8BA :: Block
xFDC1A8BA = (BuildBlock xFD xC1 xA8 xBA)

xFE4E5BDD :: Block
xFE4E5BDD = (BuildBlock xFE x4E x5B xDD)

xFEA1D334 :: Block
xFEA1D334 = (BuildBlock xFE xA1 xD3 x34)

xFECCAA6E :: Block
xFECCAA6E = (BuildBlock xFE xCC xAA x6E)

xFEFC07F0 :: Block
xFEFC07F0 = (BuildBlock xFE xFC x07 xF0)

xFF2D7DA5 :: Block
xFF2D7DA5 = (BuildBlock xFF x2D x7D xA5)

xFFEF0001 :: Block
xFFEF0001 = (BuildBlock xFF xEF x00 x01)

xFFFF00FF :: Block
xFFFF00FF = (BuildBlock xFF xFF x00 xFF)

xFFFFFF2D :: Block
xFFFFFF2D = (BuildBlock xFF xFF xFF x2D)

xFFFFFF3A :: Block
xFFFFFF3A = (BuildBlock xFF xFF xFF x3A)

xFFFFFFF0 :: Block
xFFFFFFF0 = (BuildBlock xFF xFF xFF xF0)

xFFFFFFF1 :: Block
xFFFFFFF1 = (BuildBlock xFF xFF xFF xF1)

xFFFFFFF4 :: Block
xFFFFFFF4 = (BuildBlock xFF xFF xFF xF4)

xFFFFFFF5 :: Block
xFFFFFFF5 = (BuildBlock xFF xFF xFF xF5)

xFFFFFFF7 :: Block
xFFFFFFF7 = (BuildBlock xFF xFF xFF xF7)

xFFFFFFF9 :: Block
xFFFFFFF9 = (BuildBlock xFF xFF xFF xF9)

xFFFFFFFA :: Block
xFFFFFFFA = (BuildBlock xFF xFF xFF xFA)

xFFFFFFFB :: Block
xFFFFFFFB = (BuildBlock xFF xFF xFF xFB)

xFFFFFFFC :: Block
xFFFFFFFC = (BuildBlock xFF xFF xFF xFC)

xFFFFFFFD :: Block
xFFFFFFFD = (BuildBlock xFF xFF xFF xFD)

xFFFFFFFE :: Block
xFFFFFFFE = (BuildBlock xFF xFF xFF xFE)

xFFFFFFFF :: Block
xFFFFFFFF = (BuildBlock xFF xFF xFF xFF)

appendMessage :: !Message !Block -> Message
appendMessage (UnitMessage w) w_prime = (ConsMessage w (UnitMessage w_prime))
appendMessage (ConsMessage w m) w_prime = (ConsMessage w (appendMessage m w_prime))

reverseMessage :: !Message -> Message
reverseMessage (UnitMessage w) = (UnitMessage w)
reverseMessage (ConsMessage w m) = (appendMessage (reverseMessage m) w)

makeMessage :: !Nat !Block !Block -> Message
makeMessage (Succ n) w w_prime 
| ((eqNat n Zero) == Xtrue) = (UnitMessage w)
| ((eqNat n Zero) == Xfalse) = (ConsMessage w (makeMessage n (aDD w w_prime) w_prime))

aDD :: !Block !Block -> Block
aDD w w_prime = (addBlock w w_prime)

xand :: !Block !Block -> Block
xand w w_prime = (andBlock w w_prime)

mUL :: !Block !Block -> Pair
mUL w w_prime = (mulBlock w w_prime)

yor :: !Block !Block -> Block
yor w w_prime = (orBlock w w_prime)

xOR :: !Block !Block -> Block
xOR w w_prime = (xorBlock w w_prime)

xOR_prime :: !Pair -> Block
xOR_prime (BuildPair w w_prime) = (xOR w w_prime)

cYC :: !Block -> Block
cYC (BuildBlock (BuildOctet b1 b2 b3 b4 b5 b6 b7 b8) (BuildOctet b9 b10 b11 b12 b13 b14 b15 b16) (BuildOctet b17 b18 b19 b20 b21 b22 b23 b24) (BuildOctet b25 b26 b27 b28 b29 b30 b31 b32)) = (BuildBlock (BuildOctet b2 b3 b4 b5 b6 b7 b8 b9) (BuildOctet b10 b11 b12 b13 b14 b15 b16 b17) (BuildOctet b18 b19 b20 b21 b22 b23 b24 b25) (BuildOctet b26 b27 b28 b29 b30 b31 b32 b1))

nCYC :: !Nat !Block -> Block
nCYC Zero w = w
nCYC (Succ n) w = (cYC (nCYC n w))

fIX1 :: !Block -> Block
fIX1 w = (xand (yor w x02040801) xBFEF7FDF)

fIX2 :: !Block -> Block
fIX2 w = (xand (yor w x00804021) x7DFEFBFF)

needAdjust :: !Octet -> Xbool
needAdjust o = (orBool (eqOctet o x00) (eqOctet o xFF))

adjustCode :: !Octet -> Bit
adjustCode o 
| ((needAdjust o) == Xtrue) = X1
| ((needAdjust o) == Xfalse) = X0

adjust :: !Octet !Octet -> Octet
adjust o o_prime 
| ((needAdjust o) == Xtrue) = (xorOctet o o_prime)
| ((needAdjust o) == Xfalse) = o

pAT :: !Block !Block -> Octet
pAT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (BuildOctet (adjustCode o1) (adjustCode o2) (adjustCode o3) (adjustCode o4) (adjustCode o_prime1) (adjustCode o_prime2) (adjustCode o_prime3) (adjustCode o_prime4))

bYT :: !Block !Block -> Pair
bYT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4) = (bYT_prime o1 o2 o3 o4 o_prime1 o_prime2 o_prime3 o_prime4 (pAT (BuildBlock o1 o2 o3 o4) (BuildBlock o_prime1 o_prime2 o_prime3 o_prime4)))

bYT_prime :: !Octet !Octet !Octet !Octet !Octet !Octet !Octet !Octet !Octet -> Pair
bYT_prime o1 o2 o3 o4 o_prime1 o_prime2 o_prime3 o_prime4 opat = (BuildPair (BuildBlock (adjust o1 (rightOctet7 opat)) (adjust o2 (rightOctet6 opat)) (adjust o3 (rightOctet5 opat)) (adjust o4 (rightOctet4 opat))) (BuildBlock (adjust o_prime1 (rightOctet3 opat)) (adjust o_prime2 (rightOctet2 opat)) (adjust o_prime3 (rightOctet1 opat)) (adjust o_prime4 opat)))

aDDC :: !Block !Block -> Pair
aDDC w w_prime = (aDDC_prime (addBlockSum w w_prime))

aDDC_prime :: !BlockSum -> Pair
aDDC_prime (BuildBlockSum X0 w) = (BuildPair x00000000 w)
aDDC_prime (BuildBlockSum X1 w) = (BuildPair x00000001 w)

mUL1 :: !Block !Block -> Block
mUL1 w w_prime = (mUL1XY (mUL w w_prime))

mUL1XY :: !Pair -> Block
mUL1XY (BuildPair w w_prime) = (mUL1UL w w_prime)

mUL1UL :: !Block !Block -> Block
mUL1UL w w_prime = (mUL1SC (aDDC w w_prime))

mUL1SC :: !Pair -> Block
mUL1SC (BuildPair wcarry w) = (aDD w wcarry)

mUL2 :: !Block !Block -> Block
mUL2 w w_prime = (mUL2XY (mUL w w_prime))

mUL2XY :: !Pair -> Block
mUL2XY (BuildPair w w_prime) = (mUL2UL w w_prime)

mUL2UL :: !Block !Block -> Block
mUL2UL w w_prime = (mUL2DEL (aDDC w w) w_prime)

mUL2DEL :: !Pair !Block -> Block
mUL2DEL (BuildPair wcarry w) w_prime = (mUL2FL (aDD w (aDD wcarry wcarry)) w_prime)

mUL2FL :: !Block !Block -> Block
mUL2FL w w_prime = (mUL2SC (aDDC w w_prime))

mUL2SC :: !Pair -> Block
mUL2SC (BuildPair wcarry w) = (aDD w (aDD wcarry wcarry))

mUL2A :: !Block !Block -> Block
mUL2A w w_prime = (mUL2AXY (mUL w w_prime))

mUL2AXY :: !Pair -> Block
mUL2AXY (BuildPair w w_prime) = (mUL2AUL w w_prime)

mUL2AUL :: !Block !Block -> Block
mUL2AUL w w_prime = (mUL2ADL (aDD w w) w_prime)

mUL2ADL :: !Block !Block -> Block
mUL2ADL w w_prime = (mUL2ASC (aDDC w w_prime))

mUL2ASC :: !Pair -> Block
mUL2ASC (BuildPair wcarry w) = (aDD w (aDD wcarry wcarry))

squareHalf :: !Half -> Block
squareHalf h = (mulHalf h h)

q :: !Octet -> Block
q o = (squareHalf (addHalf (BuildHalf x00 o) x0001))

j1_2 :: !Block -> Block
j1_2 w = (mUL1 w w)

j1_4 :: !Block -> Block
j1_4 w = (mUL1 (j1_2 w) (j1_2 w))

j1_6 :: !Block -> Block
j1_6 w = (mUL1 (j1_2 w) (j1_4 w))

j1_8 :: !Block -> Block
j1_8 w = (mUL1 (j1_2 w) (j1_6 w))

j2_2 :: !Block -> Block
j2_2 w = (mUL2 w w)

j2_4 :: !Block -> Block
j2_4 w = (mUL2 (j2_2 w) (j2_2 w))

j2_6 :: !Block -> Block
j2_6 w = (mUL2 (j2_2 w) (j2_4 w))

j2_8 :: !Block -> Block
j2_8 w = (mUL2 (j2_2 w) (j2_6 w))

k1_2 :: !Block -> Block
k1_2 w = (mUL1 w w)

k1_4 :: !Block -> Block
k1_4 w = (mUL1 (k1_2 w) (k1_2 w))

k1_5 :: !Block -> Block
k1_5 w = (mUL1 w (k1_4 w))

k1_7 :: !Block -> Block
k1_7 w = (mUL1 (k1_2 w) (k1_5 w))

k1_9 :: !Block -> Block
k1_9 w = (mUL1 (k1_2 w) (k1_7 w))

k2_2 :: !Block -> Block
k2_2 w = (mUL2 w w)

k2_4 :: !Block -> Block
k2_4 w = (mUL2 (k2_2 w) (k2_2 w))

k2_5 :: !Block -> Block
k2_5 w = (mUL2 w (k2_4 w))

k2_7 :: !Block -> Block
k2_7 w = (mUL2 (k2_2 w) (k2_5 w))

k2_9 :: !Block -> Block
k2_9 w = (mUL2 (k2_2 w) (k2_7 w))

h4 :: !Block -> Block
h4 w = (xOR (j1_4 w) (j2_4 w))

h6 :: !Block -> Block
h6 w = (xOR (j1_6 w) (j2_6 w))

h8 :: !Block -> Block
h8 w = (xOR (j1_8 w) (j2_8 w))

h0 :: !Block -> Block
h0 w = (xOR (k1_5 w) (k2_5 w))

h5 :: !Block !Octet -> Block
h5 w o = (mUL2 (h0 w) (q o))

h7 :: !Block -> Block
h7 w = (xOR (k1_7 w) (k2_7 w))

h9 :: !Block -> Block
h9 w = (xOR (k1_9 w) (k2_9 w))

splitSegment :: !Message -> SegmentedMessage
splitSegment (UnitMessage w) = (UnitSegment (UnitMessage w))
splitSegment (ConsMessage w m) = (cutSegment m (UnitMessage w) n254)

cutSegment :: !Message !Message !Nat -> SegmentedMessage
cutSegment (UnitMessage w) m_prime n = (UnitSegment (reverseMessage (ConsMessage w m_prime)))
cutSegment (ConsMessage w m) m_prime Zero = (ConsSegment (reverseMessage (ConsMessage w m_prime)) (splitSegment m))
cutSegment (ConsMessage w m) m_prime (Succ n) = (cutSegment m (ConsMessage w m_prime) n)

preludeXY :: !Block !Block -> Pair
preludeXY w1 w2 = (preludeXY_prime (bYT w1 w2) (pAT w1 w2))

preludeVW :: !Block !Block -> Pair
preludeVW w1 w2 = (preludeVW_prime (bYT w1 w2))

preludeST :: !Block !Block -> Pair
preludeST w1 w2 = (preludeST_prime (bYT w1 w2))

preludeXY_prime :: !Pair !Octet -> Pair
preludeXY_prime (BuildPair w w_prime) o = (bYT (h4 w) (h5 w_prime o))

preludeVW_prime :: !Pair -> Pair
preludeVW_prime (BuildPair w w_prime) = (bYT (h6 w) (h7 w_prime))

preludeST_prime :: !Pair -> Pair
preludeST_prime (BuildPair w w_prime) = (bYT (h8 w) (h9 w_prime))

computeXY :: !Pair !Pair !Block -> Pair
computeXY p p_prime w = (computeXY_prime p w (xOR_prime (computeVW p_prime)))

computeXY_prime :: !Pair !Block !Block -> Pair
computeXY_prime (BuildPair w1 w2) w w_prime = (BuildPair (mUL1 (xOR w1 w) (fIX1 (aDD (xOR w2 w) w_prime))) (mUL2A (xOR w2 w) (fIX2 (aDD (xOR w1 w) w_prime))))

computeVW :: !Pair -> Pair
computeVW (BuildPair w1 w2) = (BuildPair (cYC w1) w2)

loop1 :: !Pair !Pair !Message -> Pair
loop1 p p_prime (UnitMessage w) = (computeXY p p_prime w)
loop1 p p_prime (ConsMessage w m) = (loop1 (computeXY p p_prime w) (computeVW p_prime) m)

loop2 :: !Pair !Pair !Message -> Pair
loop2 p p_prime (UnitMessage w) = (computeVW p_prime)
loop2 p p_prime (ConsMessage w m) = (loop2 (computeXY p p_prime w) (computeVW p_prime) m)

coda :: !Pair !Pair !Pair -> Block
coda p p_prime (BuildPair w w_prime) = (xOR_prime (computeXY (computeXY p p_prime w) (computeVW p_prime) w_prime))

mAA :: !Key !Message -> Block
mAA (BuildKey w1 w2) m = (mAA_prime (preludeXY w1 w2) (preludeVW w1 w2) (preludeST w1 w2) m)

mAA_prime :: !Pair !Pair !Pair !Message -> Block
mAA_prime p1 p2 p3 m = (coda (loop1 p1 p2 m) (loop2 p1 p2 m) p3)

mAC :: !Key !Message -> Block
mAC k m = (mACfirst k (splitSegment m))

mACfirst :: !Key !SegmentedMessage -> Block
mACfirst k (UnitSegment m) = (mAA k m)
mACfirst k (ConsSegment m s) = (mACnext k (mAA k m) s)

mACnext :: !Key !Block !SegmentedMessage -> Block
mACnext k w (UnitSegment m) = (mAA k (ConsMessage w m))
mACnext k w (ConsSegment m s) = (mACnext k (mAA k (ConsMessage w m)) s)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (eqBlock (mUL1 x0000000F x0000000E) x000000D2) <<< "\n"
   # console = console <<< (eqBlock (mUL1 xFFFFFFF0 x0000000E) xFFFFFF2D) <<< "\n"
   # console = console <<< (eqBlock (mUL1 xFFFFFFF0 xFFFFFFF1) x000000D2) <<< "\n"
   # console = console <<< (eqBlock (mUL2 x0000000F x0000000E) x000000D2) <<< "\n"
   # console = console <<< (eqBlock (mUL2 xFFFFFFF0 x0000000E) xFFFFFF3A) <<< "\n"
   # console = console <<< (eqBlock (mUL2 xFFFFFFF0 xFFFFFFF1) x000000B6) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x0000000F x0000000E) x000000D2) <<< "\n"
   # console = console <<< (eqBlock (mUL2A xFFFFFFF0 x0000000E) xFFFFFF3A) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x7FFFFFF0 xFFFFFFF1) x800000C2) <<< "\n"
   # console = console <<< (eqBlock (mUL2A xFFFFFFF0 x7FFFFFF1) x000000C4) <<< "\n"
   # console = console <<< (eqPair (bYT x00000000 x00000000) (BuildPair x0103070F x1F3F7FFF)) <<< "\n"
   # console = console <<< (eqPair (bYT xFFFF00FF xFFFFFFFF) (BuildPair xFEFC07F0 xE0C08000)) <<< "\n"
   # console = console <<< (eqPair (bYT xAB00FFCD xFFEF0001) (BuildPair xAB01FCCD xF2EF3501)) <<< "\n"
   # console = console <<< (eqOctet (pAT x00000000 x00000000) xFF) <<< "\n"
   # console = console <<< (eqOctet (pAT xFFFF00FF xFFFFFFFF) xFF) <<< "\n"
   # console = console <<< (eqOctet (pAT xAB00FFCD xFFEF0001) x6A) <<< "\n"
   # console = console <<< (eqBlock (j1_2 x00000100) x00010000) <<< "\n"
   # console = console <<< (eqBlock (j1_4 x00000100) x00000001) <<< "\n"
   # console = console <<< (eqBlock (j1_6 x00000100) x00010000) <<< "\n"
   # console = console <<< (eqBlock (j1_8 x00000100) x00000001) <<< "\n"
   # console = console <<< (eqBlock (j2_2 x00000100) x00010000) <<< "\n"
   # console = console <<< (eqBlock (j2_4 x00000100) x00000002) <<< "\n"
   # console = console <<< (eqBlock (j2_6 x00000100) x00020000) <<< "\n"
   # console = console <<< (eqBlock (j2_8 x00000100) x00000004) <<< "\n"
   # console = console <<< (eqBlock (h4 x00000100) x00000003) <<< "\n"
   # console = console <<< (eqBlock (h6 x00000100) x00030000) <<< "\n"
   # console = console <<< (eqBlock (h8 x00000100) x00000005) <<< "\n"
   # console = console <<< (eqBlock (k1_2 x00000080) x00004000) <<< "\n"
   # console = console <<< (eqBlock (k1_4 x00000080) x10000000) <<< "\n"
   # console = console <<< (eqBlock (k1_5 x00000080) x00000008) <<< "\n"
   # console = console <<< (eqBlock (k1_7 x00000080) x00020000) <<< "\n"
   # console = console <<< (eqBlock (k1_9 x00000080) x80000000) <<< "\n"
   # console = console <<< (eqBlock (k2_2 x00000080) x00004000) <<< "\n"
   # console = console <<< (eqBlock (k2_4 x00000080) x10000000) <<< "\n"
   # console = console <<< (eqBlock (k2_5 x00000080) x00000010) <<< "\n"
   # console = console <<< (eqBlock (k2_7 x00000080) x00040000) <<< "\n"
   # console = console <<< (eqBlock (k2_9 x00000080) x00000002) <<< "\n"
   # console = console <<< (eqBlock (h0 x00000080) x00000018) <<< "\n"
   # console = console <<< (eqBlock (q x01) x00000004) <<< "\n"
   # console = console <<< (eqBlock (h5 x00000080 x01) x00000060) <<< "\n"
   # console = console <<< (eqBlock (h7 x00000080) x00060000) <<< "\n"
   # console = console <<< (eqBlock (h9 x00000080) x80000002) <<< "\n"
   # console = console <<< (eqOctet (pAT x00000003 x00000060) xEE) <<< "\n"
   # console = console <<< (eqOctet (pAT x00030000 x00060000) xBB) <<< "\n"
   # console = console <<< (eqOctet (pAT x00000005 x80000002) xE6) <<< "\n"
   # console = console <<< (eqPair (bYT x00000003 x00000060) (BuildPair x01030703 x1D3B7760)) <<< "\n"
   # console = console <<< (eqPair (bYT x00030000 x00060000) (BuildPair x0103050B x17065DBB)) <<< "\n"
   # console = console <<< (eqPair (bYT x00000005 x80000002) (BuildPair x01030705 x80397302)) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000003) x00000006) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000006 x00000003) x00000005) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000002 x00000005) x00000007) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000003 x00000005) x00000006) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 x00000006) x0000000B) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 x00000007) x0000000C) <<< "\n"
   # console = console <<< (eqBlock (yor x0000000B x00000004) x0000000F) <<< "\n"
   # console = console <<< (eqBlock (yor x0000000C x00000001) x0000000D) <<< "\n"
   # console = console <<< (eqBlock (xand x0000000F xFFFFFFF7) x00000007) <<< "\n"
   # console = console <<< (eqBlock (xand x0000000D xFFFFFFFB) x00000009) <<< "\n"
   # console = console <<< (eqBlock (mUL1 x00000007 x00000007) x00000031) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x00000006 x00000009) x00000036) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000031 x00000036) x00000007) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000003) x00000006) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000006 x00000003) x00000005) <<< "\n"
   # console = console <<< (eqBlock (xOR xFFFFFFFD x00000001) xFFFFFFFC) <<< "\n"
   # console = console <<< (eqBlock (xOR xFFFFFFFC x00000001) xFFFFFFFD) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 xFFFFFFFD) x00000002) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 xFFFFFFFC) x00000001) <<< "\n"
   # console = console <<< (eqBlock (yor x00000002 x00000001) x00000003) <<< "\n"
   # console = console <<< (eqBlock (yor x00000001 x00000004) x00000005) <<< "\n"
   # console = console <<< (eqBlock (xand x00000003 xFFFFFFF9) x00000001) <<< "\n"
   # console = console <<< (eqBlock (xand x00000005 xFFFFFFFC) x00000004) <<< "\n"
   # console = console <<< (eqBlock (mUL1 xFFFFFFFC x00000001) xFFFFFFFC) <<< "\n"
   # console = console <<< (eqBlock (mUL2A xFFFFFFFD x00000004) xFFFFFFFA) <<< "\n"
   # console = console <<< (eqBlock (xOR xFFFFFFFC xFFFFFFFA) x00000006) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000007) x0000000E) <<< "\n"
   # console = console <<< (eqBlock (xOR x0000000E x00000007) x00000009) <<< "\n"
   # console = console <<< (eqBlock (xOR xFFFFFFFD x00000008) xFFFFFFF5) <<< "\n"
   # console = console <<< (eqBlock (xOR xFFFFFFFC x00000008) xFFFFFFF4) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000009 xFFFFFFF4) xFFFFFFFD) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000009 xFFFFFFF5) xFFFFFFFE) <<< "\n"
   # console = console <<< (eqBlock (yor xFFFFFFFD x00000001) xFFFFFFFD) <<< "\n"
   # console = console <<< (eqBlock (yor xFFFFFFFE x00000002) xFFFFFFFE) <<< "\n"
   # console = console <<< (eqBlock (xand xFFFFFFFD xFFFFFFFE) xFFFFFFFC) <<< "\n"
   # console = console <<< (eqBlock (xand xFFFFFFFE x7FFFFFFD) x7FFFFFFC) <<< "\n"
   # console = console <<< (eqBlock (mUL1 xFFFFFFF5 xFFFFFFFC) x0000001E) <<< "\n"
   # console = console <<< (eqBlock (mUL2A xFFFFFFF4 x7FFFFFFC) x0000001E) <<< "\n"
   # console = console <<< (eqBlock (xOR x0000001E x0000001E) x00000000) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000001) x00000002) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000002 x00000001) x00000003) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000001 x00000000) x00000001) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000002 x00000000) x00000002) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000003 x00000002) x00000005) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000003 x00000001) x00000004) <<< "\n"
   # console = console <<< (eqBlock (yor x00000005 x00000002) x00000007) <<< "\n"
   # console = console <<< (eqBlock (yor x00000004 x00000001) x00000005) <<< "\n"
   # console = console <<< (eqBlock (xand x00000007 xFFFFFFFB) x00000003) <<< "\n"
   # console = console <<< (eqBlock (xand x00000005 xFFFFFFFB) x00000001) <<< "\n"
   # console = console <<< (eqBlock (mUL1 x00000001 x00000003) x00000003) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x00000002 x00000001) x00000002) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000003 x00000002) x00000001) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000002) x00000004) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000004 x00000001) x00000005) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000003 x00000001) x00000002) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000002 x00000001) x00000003) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 x00000003) x00000008) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000005 x00000002) x00000007) <<< "\n"
   # console = console <<< (eqBlock (yor x00000008 x00000002) x0000000A) <<< "\n"
   # console = console <<< (eqBlock (yor x00000007 x00000001) x00000007) <<< "\n"
   # console = console <<< (eqBlock (xand x0000000A xFFFFFFFB) x0000000A) <<< "\n"
   # console = console <<< (eqBlock (xand x00000007 xFFFFFFFB) x00000003) <<< "\n"
   # console = console <<< (eqBlock (mUL1 x00000002 x0000000A) x00000014) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x00000003 x00000003) x00000009) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000014 x00000009) x0000001D) <<< "\n"
   # console = console <<< (eqBlock (cYC x00000004) x00000008) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000008 x00000001) x00000009) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000014 x00000002) x00000016) <<< "\n"
   # console = console <<< (eqBlock (xOR x00000009 x00000002) x0000000B) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000009 x0000000B) x00000014) <<< "\n"
   # console = console <<< (eqBlock (aDD x00000009 x00000016) x0000001F) <<< "\n"
   # console = console <<< (eqBlock (yor x00000014 x00000002) x00000016) <<< "\n"
   # console = console <<< (eqBlock (yor x0000001F x00000001) x0000001F) <<< "\n"
   # console = console <<< (eqBlock (xand x00000016 xFFFFFFFB) x00000012) <<< "\n"
   # console = console <<< (eqBlock (xand x0000001F xFFFFFFFB) x0000001B) <<< "\n"
   # console = console <<< (eqBlock (mUL1 x00000016 x00000012) x0000018C) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x0000000B x0000001B) x00000129) <<< "\n"
   # console = console <<< (eqBlock (xOR x0000018C x00000129) x000000A5) <<< "\n"
   # console = console <<< (eqBlock (cYC xC4EB1AEB) x89D635D7) <<< "\n"
   # console = console <<< (eqBlock (xOR x89D635D7 xF6A09667) x7F76A3B0) <<< "\n"
   # console = console <<< (eqBlock (xOR x21D869BA x0A202020) x2BF8499A) <<< "\n"
   # console = console <<< (eqBlock (xOR x7792F9D4 x0A202020) x7DB2D9F4) <<< "\n"
   # console = console <<< (eqBlock (aDD x7F76A3B0 x7DB2D9F4) xFD297DA4) <<< "\n"
   # console = console <<< (eqBlock (aDD x7F76A3B0 x2BF8499A) xAB6EED4A) <<< "\n"
   # console = console <<< (eqBlock (yor xFD297DA4 x02040801) xFF2D7DA5) <<< "\n"
   # console = console <<< (eqBlock (yor xAB6EED4A x00804021) xABEEED6B) <<< "\n"
   # console = console <<< (eqBlock (xand xFF2D7DA5 xBFEF7FDF) xBF2D7D85) <<< "\n"
   # console = console <<< (eqBlock (xand xABEEED6B x7DFEFBFF) x29EEE96B) <<< "\n"
   # console = console <<< (eqBlock (mUL1 x2BF8499A xBF2D7D85) x0AD67E20) <<< "\n"
   # console = console <<< (eqBlock (mUL2A x7DB2D9F4 x29EEE96B) x30261492) <<< "\n"
   # console = console <<< (eqOctet (pAT x00FF00FF x00000000) xFF) <<< "\n"
   # console = console <<< (eqPair (preludeXY x00FF00FF x00000000) (BuildPair x4A645A01 x50DEC930)) <<< "\n"
   # console = console <<< (eqPair (preludeVW x00FF00FF x00000000) (BuildPair x5CCA3239 xFECCAA6E)) <<< "\n"
   # console = console <<< (eqPair (preludeST x00FF00FF x00000000) (BuildPair x51EDE9C7 x24B66FB5)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4A645A01 x50DEC930) x55555555 (xOR (nCYC n1 x5CCA3239) xFECCAA6E)) (BuildPair x48B204D6 x5834A585)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x48B204D6 x5834A585) xAAAAAAAA (xOR (nCYC n2 x5CCA3239) xFECCAA6E)) (BuildPair x4F998E01 xBE9F0917)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4F998E01 xBE9F0917) x51EDE9C7 (xOR (nCYC n3 x5CCA3239) xFECCAA6E)) (BuildPair x344925FC xDB9102B0)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x344925FC xDB9102B0) x24B66FB5 (xOR (nCYC n4 x5CCA3239) xFECCAA6E)) (BuildPair x277B4B25 xD636250D)) <<< "\n"
   # console = console <<< (eqBlock (xOR x277B4B25 xD636250D) xF14D6E28) <<< "\n"
   # console = console <<< (eqOctet (pAT x00FF00FF x00000000) xFF) <<< "\n"
   # console = console <<< (eqPair (preludeXY x00FF00FF x00000000) (BuildPair x4A645A01 x50DEC930)) <<< "\n"
   # console = console <<< (eqPair (preludeVW x00FF00FF x00000000) (BuildPair x5CCA3239 xFECCAA6E)) <<< "\n"
   # console = console <<< (eqPair (preludeST x00FF00FF x00000000) (BuildPair x51EDE9C7 x24B66FB5)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4A645A01 x50DEC930) xAAAAAAAA (xOR (nCYC n1 x5CCA3239) xFECCAA6E)) (BuildPair x6AEBACF8 x9DB15CF6)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x6AEBACF8 x9DB15CF6) x55555555 (xOR (nCYC n2 x5CCA3239) xFECCAA6E)) (BuildPair x270EEDAF xB8142629)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x270EEDAF xB8142629) x51EDE9C7 (xOR (nCYC n3 x5CCA3239) xFECCAA6E)) (BuildPair x29907CD8 xBA92DB12)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x29907CD8 xBA92DB12) x24B66FB5 (xOR (nCYC n4 x5CCA3239) xFECCAA6E)) (BuildPair x28EAD8B3 x81D10CA3)) <<< "\n"
   # console = console <<< (eqBlock (xOR x28EAD8B3 x81D10CA3) xA93BD410) <<< "\n"
   # console = console <<< (eqOctet (pAT x55555555 x5A35D667) x00) <<< "\n"
   # console = console <<< (eqPair (preludeXY x55555555 x5A35D667) (BuildPair x34ACF886 x7397C9AE)) <<< "\n"
   # console = console <<< (eqPair (preludeVW x55555555 x5A35D667) (BuildPair x7201F4DC x2829040B)) <<< "\n"
   # console = console <<< (eqPair (preludeST x55555555 x5A35D667) (BuildPair x9E2E7B36 x13647149)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x34ACF886 x7397C9AE) x00000000 (xOR (nCYC n1 x7201F4DC) x2829040B)) (BuildPair x2FD76FFB x550D91CE)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x2FD76FFB x550D91CE) xFFFFFFFF (xOR (nCYC n2 x7201F4DC) x2829040B)) (BuildPair xA70FC148 x1D10D8D3)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xA70FC148 x1D10D8D3) x9E2E7B36 (xOR (nCYC n3 x7201F4DC) x2829040B)) (BuildPair xB1CC1CC5 x29C1485F)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xB1CC1CC5 x29C1485F) x13647149 (xOR (nCYC n4 x7201F4DC) x2829040B)) (BuildPair x288FC786 x9115A558)) <<< "\n"
   # console = console <<< (eqBlock (xOR x288FC786 x9115A558) xB99A62DE) <<< "\n"
   # console = console <<< (eqOctet (pAT x55555555 x5A35D667) x00) <<< "\n"
   # console = console <<< (eqPair (preludeXY x55555555 x5A35D667) (BuildPair x34ACF886 x7397C9AE)) <<< "\n"
   # console = console <<< (eqPair (preludeVW x55555555 x5A35D667) (BuildPair x7201F4DC x2829040B)) <<< "\n"
   # console = console <<< (eqPair (preludeST x55555555 x5A35D667) (BuildPair x9E2E7B36 x13647149)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x34ACF886 x7397C9AE) xFFFFFFFF (xOR (nCYC n1 x7201F4DC) x2829040B)) (BuildPair x8DC8BBDE xFE4E5BDD)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x8DC8BBDE xFE4E5BDD) x00000000 (xOR (nCYC n2 x7201F4DC) x2829040B)) (BuildPair xCBC865BA x0297AF6F)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xCBC865BA x0297AF6F) x9E2E7B36 (xOR (nCYC n3 x7201F4DC) x2829040B)) (BuildPair x3CF3A7D2 x160EE9B5)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x3CF3A7D2 x160EE9B5) x13647149 (xOR (nCYC n4 x7201F4DC) x2829040B)) (BuildPair xD0482465 x7050EC5E)) <<< "\n"
   # console = console <<< (eqBlock (xOR xD0482465 x7050EC5E) xA018C83B) <<< "\n"
   # console = console <<< (eqPair (preludeXY xE6A12F07 x9D15C437) (BuildPair x21D869BA x7792F9D4)) <<< "\n"
   # console = console <<< (eqPair (preludeVW xE6A12F07 x9D15C437) (BuildPair xC4EB1AEB xF6A09667)) <<< "\n"
   # console = console <<< (eqPair (preludeST xE6A12F07 x9D15C437) (BuildPair x6D67E884 xA511987A)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x204E80A7 x077788A2) x00000000 (xOR (nCYC n1 x17A808FD) xFEA1D334)) (BuildPair x303FF4AA x1277A6D4)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x303FF4AA x1277A6D4) x00000000 (xOR (nCYC n2 x17A808FD) xFEA1D334)) (BuildPair x55DD063F x4C49AAE0)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x55DD063F x4C49AAE0) x00000000 (xOR (nCYC n3 x17A808FD) xFEA1D334)) (BuildPair x51AF3C1D x5BC02502)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x51AF3C1D x5BC02502) x00000000 (xOR (nCYC n4 x17A808FD) xFEA1D334)) (BuildPair xA44AAAC0 x63C70DBA)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xA44AAAC0 x63C70DBA) x00000000 (xOR (nCYC n5 x17A808FD) xFEA1D334)) (BuildPair x4D53901A x2E80AC30)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4D53901A x2E80AC30) x00000000 (xOR (nCYC n6 x17A808FD) xFEA1D334)) (BuildPair x5F38EEF1 x2A6091AE)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x5F38EEF1 x2A6091AE) x00000000 (xOR (nCYC n7 x17A808FD) xFEA1D334)) (BuildPair xF0239DD5 x3DD81AC6)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xF0239DD5 x3DD81AC6) x00000000 (xOR (nCYC n8 x17A808FD) xFEA1D334)) (BuildPair xEB35B97F x9372CDC6)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xEB35B97F x9372CDC6) x00000000 (xOR (nCYC n9 x17A808FD) xFEA1D334)) (BuildPair x4DA124A1 xC6B1317E)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4DA124A1 xC6B1317E) x00000000 (xOR (nCYC n10 x17A808FD) xFEA1D334)) (BuildPair x7F839576 x74B39176)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x7F839576 x74B39176) x00000000 (xOR (nCYC n11 x17A808FD) xFEA1D334)) (BuildPair x11A9D254 xD78634BC)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x11A9D254 xD78634BC) x00000000 (xOR (nCYC n12 x17A808FD) xFEA1D334)) (BuildPair xD8804CA5 xFDC1A8BA)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xD8804CA5 xFDC1A8BA) x00000000 (xOR (nCYC n13 x17A808FD) xFEA1D334)) (BuildPair x3F6F7248 x11AC46B8)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x3F6F7248 x11AC46B8) x00000000 (xOR (nCYC n14 x17A808FD) xFEA1D334)) (BuildPair xACBC13DD x33D5A466)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xACBC13DD x33D5A466) x00000000 (xOR (nCYC n15 x17A808FD) xFEA1D334)) (BuildPair x4CE933E1 xC21A1846)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x4CE933E1 xC21A1846) x00000000 (xOR (nCYC n16 x17A808FD) xFEA1D334)) (BuildPair xC1ED90DD xCD959B46)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xC1ED90DD xCD959B46) x00000000 (xOR (nCYC n17 x17A808FD) xFEA1D334)) (BuildPair x3CD54DEB x613F8E2A)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x3CD54DEB x613F8E2A) x00000000 (xOR (nCYC n18 x17A808FD) xFEA1D334)) (BuildPair xBBA57835 x07C72EAA)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xBBA57835 x07C72EAA) x00000000 (xOR (nCYC n19 x17A808FD) xFEA1D334)) (BuildPair xD7843FDC x6AD6E8A4)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair xD7843FDC x6AD6E8A4) x00000000 (xOR (nCYC n20 x17A808FD) xFEA1D334)) (BuildPair x5EBA06C2 x91896CFA)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x5EBA06C2 x91896CFA) x76232E5F (xOR (nCYC n21 x17A808FD) xFEA1D334)) (BuildPair x1D9C9655 x98D1CC75)) <<< "\n"
   # console = console <<< (eqPair (computeXY_prime (BuildPair x1D9C9655 x98D1CC75) x4FB1138A (xOR (nCYC n22 x17A808FD) xFEA1D334)) (BuildPair x7BC180AB xA0B87B77)) <<< "\n"
   # console = console <<< (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n20 x00000000 x00000000)) xDB79FBDC) <<< "\n"
   # console = console <<< (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n16 x00000000 x07050301)) x8CE37709) <<< "\n"
   # console = console <<< (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n256 x00000000 x07050301)) x717153D5) <<< "\n"
   # console = console <<< (eqBlock (mAC (BuildKey x80018001 x80018000) (makeMessage n4100 x00000000 x07050301)) x7783C51D) <<< "\n"
   = snd (fclose console world)
