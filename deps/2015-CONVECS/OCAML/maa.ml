type bool = False | True

and bit = X0 | X1

and octet = BuildOctet of bit * bit * bit * bit * bit * bit * bit * bit

and octetSum = BuildOctetSum of bit * octet

and half = BuildHalf of octet * octet

and halfSum = BuildHalfSum of bit * half

and block = BuildBlock of octet * octet * octet * octet

and blockSum = BuildBlockSum of bit * block

and pair = BuildPair of block * block

and nat = Zero | Succ of nat

and key = BuildKey of block * block

and message = UnitMessage of block | ConsMessage of block * message

and segmentedMessage = UnitSegment of message | ConsSegment of message * segmentedMessage ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | False ->
      print_string "False"
   | True ->
      print_string "True"

and print_Bit (rec_x:bit) =
   match rec_x with
   | X0 ->
      print_string "X0"
   | X1 ->
      print_string "X1"

and print_Octet (rec_x:octet) =
   match rec_x with
   | BuildOctet (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8) ->
      print_string "BuildOctet";
      print_string " (";
      print_Bit rec_x1;
      print_string ",";
      print_Bit rec_x2;
      print_string ",";
      print_Bit rec_x3;
      print_string ",";
      print_Bit rec_x4;
      print_string ",";
      print_Bit rec_x5;
      print_string ",";
      print_Bit rec_x6;
      print_string ",";
      print_Bit rec_x7;
      print_string ",";
      print_Bit rec_x8;
      print_string ")"

and print_OctetSum (rec_x:octetSum) =
   match rec_x with
   | BuildOctetSum (rec_x1, rec_x2) ->
      print_string "BuildOctetSum";
      print_string " (";
      print_Bit rec_x1;
      print_string ",";
      print_Octet rec_x2;
      print_string ")"

and print_Half (rec_x:half) =
   match rec_x with
   | BuildHalf (rec_x1, rec_x2) ->
      print_string "BuildHalf";
      print_string " (";
      print_Octet rec_x1;
      print_string ",";
      print_Octet rec_x2;
      print_string ")"

and print_HalfSum (rec_x:halfSum) =
   match rec_x with
   | BuildHalfSum (rec_x1, rec_x2) ->
      print_string "BuildHalfSum";
      print_string " (";
      print_Bit rec_x1;
      print_string ",";
      print_Half rec_x2;
      print_string ")"

and print_Block (rec_x:block) =
   match rec_x with
   | BuildBlock (rec_x1, rec_x2, rec_x3, rec_x4) ->
      print_string "BuildBlock";
      print_string " (";
      print_Octet rec_x1;
      print_string ",";
      print_Octet rec_x2;
      print_string ",";
      print_Octet rec_x3;
      print_string ",";
      print_Octet rec_x4;
      print_string ")"

and print_BlockSum (rec_x:blockSum) =
   match rec_x with
   | BuildBlockSum (rec_x1, rec_x2) ->
      print_string "BuildBlockSum";
      print_string " (";
      print_Bit rec_x1;
      print_string ",";
      print_Block rec_x2;
      print_string ")"

and print_Pair (rec_x:pair) =
   match rec_x with
   | BuildPair (rec_x1, rec_x2) ->
      print_string "BuildPair";
      print_string " (";
      print_Block rec_x1;
      print_string ",";
      print_Block rec_x2;
      print_string ")"

and print_Nat (rec_x:nat) =
   match rec_x with
   | Zero ->
      print_string "Zero"
   | Succ rec_x1 ->
      print_string "Succ";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"

and print_Key (rec_x:key) =
   match rec_x with
   | BuildKey (rec_x1, rec_x2) ->
      print_string "BuildKey";
      print_string " (";
      print_Block rec_x1;
      print_string ",";
      print_Block rec_x2;
      print_string ")"

and print_Message (rec_x:message) =
   match rec_x with
   | UnitMessage rec_x1 ->
      print_string "UnitMessage";
      print_string " (";
      print_Block rec_x1;
      print_string ")"
   | ConsMessage (rec_x1, rec_x2) ->
      print_string "ConsMessage";
      print_string " (";
      print_Block rec_x1;
      print_string ",";
      print_Message rec_x2;
      print_string ")"

and print_SegmentedMessage (rec_x:segmentedMessage) =
   match rec_x with
   | UnitSegment rec_x1 ->
      print_string "UnitSegment";
      print_string " (";
      print_Message rec_x1;
      print_string ")"
   | ConsSegment (rec_x1, rec_x2) ->
      print_string "ConsSegment";
      print_string " (";
      print_Message rec_x1;
      print_string ",";
      print_SegmentedMessage rec_x2;
      print_string ")"
;;

let rec notBool (rec_x1:bool) : bool =
   match rec_x1 with
   | False -> True
   | True -> False

and andBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | False, l -> False
   | True, l -> l

and orBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | False, l -> l
   | True, l -> True

and xorBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | False, l -> l
   | True, l -> (notBool l)

and notBit (rec_x1:bit) : bit =
   match rec_x1 with
   | X0 -> X1
   | X1 -> X0

and andBit (rec_x1:bit) (rec_x2:bit) : bit =
   match rec_x1, rec_x2 with
   | b, X0 -> X0
   | b, X1 -> b

and orBit (rec_x1:bit) (rec_x2:bit) : bit =
   match rec_x1, rec_x2 with
   | b, X0 -> b
   | b, X1 -> X1

and xorBit (rec_x1:bit) (rec_x2:bit) : bit =
   match rec_x1, rec_x2 with
   | b, X0 -> b
   | b, X1 -> (notBit b)
;;

let x00 : octet = (BuildOctet (X0, X0, X0, X0, X0, X0, X0, X0)) ;;

let x01 : octet = (BuildOctet (X0, X0, X0, X0, X0, X0, X0, X1)) ;;

let x0000 : half = (BuildHalf (x00, x00)) ;;

let rec halfU (rec_x1:block) : half =
   match rec_x1 with
   | (BuildBlock (o1, o2, o3, o4)) -> (BuildHalf (o1, o2))

and halfL (rec_x1:block) : half =
   match rec_x1 with
   | (BuildBlock (o1, o2, o3, o4)) -> (BuildHalf (o3, o4))

and eqBit (rec_x1:bit) (rec_x2:bit) : bool =
   match rec_x1, rec_x2 with
   | X0, X0 -> True
   | X0, X1 -> False
   | X1, X0 -> False
   | X1, X1 -> True

and eqOctet (rec_x1:octet) (rec_x2:octet) : bool =
   match rec_x1, rec_x2 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b_prime1, b_prime2, b_prime3, b_prime4, b_prime5, b_prime6, b_prime7, b_prime8)) -> (andBool (eqBit b1  b_prime1)  (andBool (eqBit b2  b_prime2)  (andBool (eqBit b3  b_prime3)  (andBool (eqBit b4  b_prime4)  (andBool (eqBit b5  b_prime5)  (andBool (eqBit b6  b_prime6)  (andBool (eqBit b7  b_prime7)  (eqBit b8  b_prime8))))))))

and eqOctetSum (rec_x1:octetSum) (rec_x2:octetSum) : bool =
   match rec_x1, rec_x2 with
   | (BuildOctetSum (b, o)), (BuildOctetSum (b_prime, o_prime)) -> (andBool (eqBit b  b_prime)  (eqOctet o  o_prime))

and eqHalf (rec_x1:half) (rec_x2:half) : bool =
   match rec_x1, rec_x2 with
   | (BuildHalf (o1, o2)), (BuildHalf (o_prime1, o_prime2)) -> (andBool (eqOctet o1  o_prime1)  (eqOctet o2  o_prime2))

and eqHalfSum (rec_x1:halfSum) (rec_x2:halfSum) : bool =
   match rec_x1, rec_x2 with
   | (BuildHalfSum (b, h)), (BuildHalfSum (b_prime, h_prime)) -> (andBool (eqBit b  b_prime)  (eqHalf h  h_prime))

and eqBlock (rec_x1:block) (rec_x2:block) : bool =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (andBool (andBool (eqOctet o1  o_prime1)  (eqOctet o2  o_prime2))  (andBool (eqOctet o3  o_prime3)  (eqOctet o4  o_prime4)))

and eqBlockSum (rec_x1:blockSum) (rec_x2:blockSum) : bool =
   match rec_x1, rec_x2 with
   | (BuildBlockSum (b, w)), (BuildBlockSum (b_prime, w_prime)) -> (andBool (eqBit b  b_prime)  (eqBlock w  w_prime))

and eqPair (rec_x1:pair) (rec_x2:pair) : bool =
   match rec_x1, rec_x2 with
   | (BuildPair (w1, w2)), (BuildPair (w_prime1, w_prime2)) -> (andBool (eqBlock w1  w_prime1)  (eqBlock w2  w_prime2))

and addBit (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) : bit =
   match rec_x1, rec_x2, rec_x3 with
   | b, b_prime, bcarry -> (xorBit (xorBit b  b_prime)  bcarry)

and carBit (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) : bit =
   match rec_x1, rec_x2, rec_x3 with
   | b, b_prime, bcarry -> (orBit (andBit (andBit b  b_prime)  (notBit bcarry))  (andBit (orBit b  b_prime)  bcarry))

and addOctetSum (rec_x1:octet) (rec_x2:octet) (rec_x3:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b_prime1, b_prime2, b_prime3, b_prime4, b_prime5, b_prime6, b_prime7, b_prime8)), bcarry -> (addOctet8 b1  b_prime1  b2  b_prime2  b3  b_prime3  b4  b_prime4  b5  b_prime5  b6  b_prime6  b7  b_prime7  b8  b_prime8  bcarry)

and addOctet8 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) (rec_x13:bit) (rec_x14:bit) (rec_x15:bit) (rec_x16:bit) (rec_x17:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12, rec_x13, rec_x14, rec_x15, rec_x16, rec_x17 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, b4, b_prime4, b5, b_prime5, b6, b_prime6, b7, b_prime7, b8, b_prime8, bcarry -> (addOctet7 b1  b_prime1  b2  b_prime2  b3  b_prime3  b4  b_prime4  b5  b_prime5  b6  b_prime6  b7  b_prime7  (carBit b8  b_prime8  bcarry)  (addBit b8  b_prime8  bcarry))

and addOctet7 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) (rec_x13:bit) (rec_x14:bit) (rec_x15:bit) (rec_x16:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12, rec_x13, rec_x14, rec_x15, rec_x16 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, b4, b_prime4, b5, b_prime5, b6, b_prime6, b7, b_prime7, bcarry, b_second8 -> (addOctet6 b1  b_prime1  b2  b_prime2  b3  b_prime3  b4  b_prime4  b5  b_prime5  b6  b_prime6  (carBit b7  b_prime7  bcarry)  (addBit b7  b_prime7  bcarry)  b_second8)

and addOctet6 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) (rec_x13:bit) (rec_x14:bit) (rec_x15:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12, rec_x13, rec_x14, rec_x15 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, b4, b_prime4, b5, b_prime5, b6, b_prime6, bcarry, b_second7, b_second8 -> (addOctet5 b1  b_prime1  b2  b_prime2  b3  b_prime3  b4  b_prime4  b5  b_prime5  (carBit b6  b_prime6  bcarry)  (addBit b6  b_prime6  bcarry)  b_second7  b_second8)

and addOctet5 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) (rec_x13:bit) (rec_x14:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12, rec_x13, rec_x14 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, b4, b_prime4, b5, b_prime5, bcarry, b_second6, b_second7, b_second8 -> (addOctet4 b1  b_prime1  b2  b_prime2  b3  b_prime3  b4  b_prime4  (carBit b5  b_prime5  bcarry)  (addBit b5  b_prime5  bcarry)  b_second6  b_second7  b_second8)

and addOctet4 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) (rec_x13:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12, rec_x13 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, b4, b_prime4, bcarry, b_second5, b_second6, b_second7, b_second8 -> (addOctet3 b1  b_prime1  b2  b_prime2  b3  b_prime3  (carBit b4  b_prime4  bcarry)  (addBit b4  b_prime4  bcarry)  b_second5  b_second6  b_second7  b_second8)

and addOctet3 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) (rec_x12:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11, rec_x12 with
   | b1, b_prime1, b2, b_prime2, b3, b_prime3, bcarry, b_second4, b_second5, b_second6, b_second7, b_second8 -> (addOctet2 b1  b_prime1  b2  b_prime2  (carBit b3  b_prime3  bcarry)  (addBit b3  b_prime3  bcarry)  b_second4  b_second5  b_second6  b_second7  b_second8)

and addOctet2 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) (rec_x11:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10, rec_x11 with
   | b1, b_prime1, b2, b_prime2, bcarry, b_second3, b_second4, b_second5, b_second6, b_second7, b_second8 -> (addOctet1 b1  b_prime1  (carBit b2  b_prime2  bcarry)  (addBit b2  b_prime2  bcarry)  b_second3  b_second4  b_second5  b_second6  b_second7  b_second8)

and addOctet1 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) (rec_x10:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10 with
   | b1, b_prime1, bcarry, b_second2, b_second3, b_second4, b_second5, b_second6, b_second7, b_second8 -> (addOctet0 (carBit b1  b_prime1  bcarry)  (addBit b1  b_prime1  bcarry)  b_second2  b_second3  b_second4  b_second5  b_second6  b_second7  b_second8)

and addOctet0 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:bit) : octetSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9 with
   | bcarry, b_second1, b_second2, b_second3, b_second4, b_second5, b_second6, b_second7, b_second8 -> (BuildOctetSum (bcarry, (BuildOctet (b_second1, b_second2, b_second3, b_second4, b_second5, b_second6, b_second7, b_second8))))

and dropCarryOctetSum (rec_x1:octetSum) : octet =
   match rec_x1 with
   | (BuildOctetSum (bcarry, o)) -> o

and addOctet (rec_x1:octet) (rec_x2:octet) : octet =
   match rec_x1, rec_x2 with
   | o, o_prime -> (dropCarryOctetSum (addOctetSum o  o_prime  X0))

and addHalfSum (rec_x1:half) (rec_x2:half) : halfSum =
   match rec_x1, rec_x2 with
   | (BuildHalf (o1, o2)), (BuildHalf (o_prime1, o_prime2)) -> (addHalf2 o1  o_prime1  o2  o_prime2)

and addHalf2 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) : halfSum =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | o1, o_prime1, o2, o_prime2 -> (addHalf1 o1  o_prime1  (addOctetSum o2  o_prime2  X0))

and addHalf1 (rec_x1:octet) (rec_x2:octet) (rec_x3:octetSum) : halfSum =
   match rec_x1, rec_x2, rec_x3 with
   | o1, o_prime1, (BuildOctetSum (b, o_second2)) -> (addHalf0 (addOctetSum o1  o_prime1  b)  o_second2)

and addHalf0 (rec_x1:octetSum) (rec_x2:octet) : halfSum =
   match rec_x1, rec_x2 with
   | (BuildOctetSum (b, o_second1)), o_second2 -> (BuildHalfSum (b, (BuildHalf (o_second1, o_second2))))

and dropCarryHalfSum (rec_x1:halfSum) : half =
   match rec_x1 with
   | (BuildHalfSum (b, h)) -> h

and addHalf (rec_x1:half) (rec_x2:half) : half =
   match rec_x1, rec_x2 with
   | h, h_prime -> (dropCarryHalfSum (addHalfSum h  h_prime))

and addHalfOctet (rec_x1:octet) (rec_x2:half) : half =
   match rec_x1, rec_x2 with
   | o, h -> (addHalf (BuildHalf (x00, o))  h)

and addHalfOctets (rec_x1:octet) (rec_x2:octet) : half =
   match rec_x1, rec_x2 with
   | o, o_prime -> (addHalf (BuildHalf (x00, o))  (BuildHalf (x00, o_prime)))

and addBlockSum (rec_x1:block) (rec_x2:block) : blockSum =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (addBlock4 o1  o_prime1  o2  o_prime2  o3  o_prime3  o4  o_prime4)

and addBlock4 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:octet) (rec_x6:octet) (rec_x7:octet) (rec_x8:octet) : blockSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8 with
   | o1, o_prime1, o2, o_prime2, o3, o_prime3, o4, o_prime4 -> (addBlock3 o1  o_prime1  o2  o_prime2  o3  o_prime3  (addOctetSum o4  o_prime4  X0))

and addBlock3 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:octet) (rec_x6:octet) (rec_x7:octetSum) : blockSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7 with
   | o1, o_prime1, o2, o_prime2, o3, o_prime3, (BuildOctetSum (bcarry, o_second4)) -> (addBlock2 o1  o_prime1  o2  o_prime2  (addOctetSum o3  o_prime3  bcarry)  o_second4)

and addBlock2 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:octetSum) (rec_x6:octet) : blockSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6 with
   | o1, o_prime1, o2, o_prime2, (BuildOctetSum (bcarry, o_second3)), o_second4 -> (addBlock1 o1  o_prime1  (addOctetSum o2  o_prime2  bcarry)  o_second3  o_second4)

and addBlock1 (rec_x1:octet) (rec_x2:octet) (rec_x3:octetSum) (rec_x4:octet) (rec_x5:octet) : blockSum =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | o1, o_prime1, (BuildOctetSum (bcarry, o_second2)), o_second3, o_second4 -> (addBlock0 (addOctetSum o1  o_prime1  bcarry)  o_second2  o_second3  o_second4)

and addBlock0 (rec_x1:octetSum) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) : blockSum =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | (BuildOctetSum (bcarry, o_second1)), o_second2, o_second3, o_second4 -> (BuildBlockSum (bcarry, (BuildBlock (o_second1, o_second2, o_second3, o_second4))))

and dropCarryBlockSum (rec_x1:blockSum) : block =
   match rec_x1 with
   | (BuildBlockSum (bcarry, w)) -> w

and addBlock (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (dropCarryBlockSum (addBlockSum w  w_prime))

and addBlockHalf (rec_x1:half) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | (BuildHalf (o1, o2)), w -> (addBlock (BuildBlock (x00, x00, o1, o2))  w)

and addBlockHalves (rec_x1:half) (rec_x2:half) : block =
   match rec_x1, rec_x2 with
   | (BuildHalf (o1, o2)), (BuildHalf (o_prime1, o_prime2)) -> (addBlock (BuildBlock (x00, x00, o1, o2))  (BuildBlock (x00, x00, o_prime1, o_prime2)))

and leftOctet1 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b2, b3, b4, b5, b6, b7, b8, X0))

and leftOctet2 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b3, b4, b5, b6, b7, b8, X0, X0))

and leftOctet3 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b4, b5, b6, b7, b8, X0, X0, X0))

and leftOctet4 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b5, b6, b7, b8, X0, X0, X0, X0))

and leftOctet5 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b6, b7, b8, X0, X0, X0, X0, X0))

and leftOctet6 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b7, b8, X0, X0, X0, X0, X0, X0))

and leftOctet7 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (b8, X0, X0, X0, X0, X0, X0, X0))

and rightOctet1 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, b1, b2, b3, b4, b5, b6, b7))

and rightOctet2 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, b1, b2, b3, b4, b5, b6))

and rightOctet3 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, X0, b1, b2, b3, b4, b5))

and rightOctet4 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, X0, X0, b1, b2, b3, b4))

and rightOctet5 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, X0, X0, X0, b1, b2, b3))

and rightOctet6 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, X0, X0, X0, X0, b1, b2))

and rightOctet7 (rec_x1:octet) : octet =
   match rec_x1 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)) -> (BuildOctet (X0, X0, X0, X0, X0, X0, X0, b1))

and mulOctet (rec_x1:octet) (rec_x2:octet) : half =
   match rec_x1, rec_x2 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), o_prime -> (mulOctet1 b1  b2  b3  b4  b5  b6  b7  b8  o_prime  x0000)

and mulOctet1 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:bit) (rec_x9:octet) (rec_x10:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9, rec_x10 with
   | X0, b2, b3, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet2 b2  b3  b4  b5  b6  b7  b8  o_prime  h)
   | X1, b2, b3, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet2 b2  b3  b4  b5  b6  b7  b8  o_prime  (mulOctetA h  (rightOctet1 o_prime)  (leftOctet7 o_prime)))

and mulOctet2 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:bit) (rec_x8:octet) (rec_x9:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9 with
   | X0, b3, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet3 b3  b4  b5  b6  b7  b8  o_prime  h)
   | X1, b3, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet3 b3  b4  b5  b6  b7  b8  o_prime  (mulOctetA h  (rightOctet2 o_prime)  (leftOctet6 o_prime)))

and mulOctet3 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:bit) (rec_x7:octet) (rec_x8:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8 with
   | X0, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet4 b4  b5  b6  b7  b8  o_prime  h)
   | X1, b4, b5, b6, b7, b8, o_prime, h -> (mulOctet4 b4  b5  b6  b7  b8  o_prime  (mulOctetA h  (rightOctet3 o_prime)  (leftOctet5 o_prime)))

and mulOctet4 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:bit) (rec_x6:octet) (rec_x7:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7 with
   | X0, b5, b6, b7, b8, o_prime, h -> (mulOctet5 b5  b6  b7  b8  o_prime  h)
   | X1, b5, b6, b7, b8, o_prime, h -> (mulOctet5 b5  b6  b7  b8  o_prime  (mulOctetA h  (rightOctet4 o_prime)  (leftOctet4 o_prime)))

and mulOctet5 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:bit) (rec_x5:octet) (rec_x6:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6 with
   | X0, b6, b7, b8, o_prime, h -> (mulOctet6 b6  b7  b8  o_prime  h)
   | X1, b6, b7, b8, o_prime, h -> (mulOctet6 b6  b7  b8  o_prime  (mulOctetA h  (rightOctet5 o_prime)  (leftOctet3 o_prime)))

and mulOctet6 (rec_x1:bit) (rec_x2:bit) (rec_x3:bit) (rec_x4:octet) (rec_x5:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | X0, b7, b8, o_prime, h -> (mulOctet7 b7  b8  o_prime  h)
   | X1, b7, b8, o_prime, h -> (mulOctet7 b7  b8  o_prime  (mulOctetA h  (rightOctet6 o_prime)  (leftOctet2 o_prime)))

and mulOctet7 (rec_x1:bit) (rec_x2:bit) (rec_x3:octet) (rec_x4:half) : half =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | X0, b8, o_prime, h -> (mulOctet8 b8  o_prime  h)
   | X1, b8, o_prime, h -> (mulOctet8 b8  o_prime  (mulOctetA h  (rightOctet7 o_prime)  (leftOctet1 o_prime)))

and mulOctet8 (rec_x1:bit) (rec_x2:octet) (rec_x3:half) : half =
   match rec_x1, rec_x2, rec_x3 with
   | X0, o_prime, h -> h
   | X1, o_prime, h -> (mulOctetA h  x00  o_prime)

and mulOctetA (rec_x1:half) (rec_x2:octet) (rec_x3:octet) : half =
   match rec_x1, rec_x2, rec_x3 with
   | (BuildHalf (o1, o2)), o_prime1, o_prime2 -> (mulOctetB (addOctet o1  o_prime1)  (addOctetSum o2  o_prime2  X0))

and mulOctetB (rec_x1:octet) (rec_x2:octetSum) : half =
   match rec_x1, rec_x2 with
   | o1, (BuildOctetSum (X0, o2)) -> (BuildHalf (o1, o2))
   | o1, (BuildOctetSum (X1, o2)) -> (BuildHalf ((addOctet o1  x01), o2))

and mulHalf (rec_x1:half) (rec_x2:half) : block =
   match rec_x1, rec_x2 with
   | (BuildHalf (o1, o2)), (BuildHalf (o_prime1, o_prime2)) -> (mulHalfA (mulOctet o1  o_prime1)  (mulOctet o1  o_prime2)  (mulOctet o2  o_prime1)  (mulOctet o2  o_prime2))

and mulHalfA (rec_x1:half) (rec_x2:half) (rec_x3:half) (rec_x4:half) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | (BuildHalf (o11U, o11L)), (BuildHalf (o12U, o12L)), (BuildHalf (o21U, o21L)), (BuildHalf (o22U, o22L)) -> (mulHalf4 o11U  o11L  o12U  o12L  o21U  o21L  o22U  o22L)

and mulHalf4 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:octet) (rec_x6:octet) (rec_x7:octet) (rec_x8:octet) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8 with
   | o11U, o11L, o12U, o12L, o21U, o21L, o22U, o_second4 -> (mulHalf3 o11U  o11L  o12U  o21U  (addHalfOctet o12L  (addHalfOctets o21L  o22U))  o_second4)

and mulHalf3 (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:half) (rec_x6:octet) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6 with
   | o11U, o11L, o12U, o21U, (BuildHalf (ocarry, o_second3)), o_second4 -> (mulHalf2 o11U  (addHalfOctet ocarry  (addHalfOctet o11L  (addHalfOctets o12U  o21U)))  o_second3  o_second4)

and mulHalf2 (rec_x1:octet) (rec_x2:half) (rec_x3:octet) (rec_x4:octet) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | o11U, (BuildHalf (ocarry, o_second2)), o_second3, o_second4 -> (mulHalf1 (addHalfOctets ocarry  o11U)  o_second2  o_second3  o_second4)

and mulHalf1 (rec_x1:half) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | (BuildHalf (ocarry, o_second1)), o_second2, o_second3, o_second4 -> (BuildBlock (o_second1, o_second2, o_second3, o_second4))

and mulBlock (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w1, w2 -> (mulBlockA (mulHalf (halfU w1)  (halfU w2))  (mulHalf (halfU w1)  (halfL w2))  (mulHalf (halfL w1)  (halfU w2))  (mulHalf (halfL w1)  (halfL w2)))

and mulBlockA (rec_x1:block) (rec_x2:block) (rec_x3:block) (rec_x4:block) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | w11, w12, w21, w22 -> (mulBlock4 (halfU w11)  (halfL w11)  (halfU w12)  (halfL w12)  (halfU w21)  (halfL w21)  (halfU w22)  (halfL w22))

and mulBlock4 (rec_x1:half) (rec_x2:half) (rec_x3:half) (rec_x4:half) (rec_x5:half) (rec_x6:half) (rec_x7:half) (rec_x8:half) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8 with
   | h11U, h11L, h12U, h12L, h21U, h21L, h22U, h_second4 -> (mulBlock3 h11U  h11L  h12U  h21U  (addBlockHalf h12L  (addBlockHalves h21L  h22U))  h_second4)

and mulBlock3 (rec_x1:half) (rec_x2:half) (rec_x3:half) (rec_x4:half) (rec_x5:block) (rec_x6:half) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6 with
   | h11U, h11L, h12U, h21U, w, h_second4 -> (mulBlock2 h11U  (addBlockHalf (halfU w)  (addBlockHalf h11L  (addBlockHalves h12U  h21U)))  (halfL w)  h_second4)

and mulBlock2 (rec_x1:half) (rec_x2:block) (rec_x3:half) (rec_x4:half) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | h11U, w, h_second3, h_second4 -> (mulBlock1 (addBlockHalves (halfU w)  h11U)  (halfL w)  h_second3  h_second4)

and mulBlock1 (rec_x1:block) (rec_x2:half) (rec_x3:half) (rec_x4:half) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | w, h_second2, h_second3, h_second4 -> (mulBlockB (halfL w)  h_second2  h_second3  h_second4)

and mulBlockB (rec_x1:half) (rec_x2:half) (rec_x3:half) (rec_x4:half) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | (BuildHalf (o1U, o1L)), (BuildHalf (o2U, o2L)), (BuildHalf (o3U, o3L)), (BuildHalf (o4U, o4L)) -> (BuildPair ((BuildBlock (o1U, o1L, o2U, o2L)), (BuildBlock (o3U, o3L, o4U, o4L))))

and addNat (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | n, Zero -> n
   | n, (Succ n_prime) -> (addNat (Succ n)  n_prime)

and multNat (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | n, Zero -> Zero
   | n, (Succ n_prime) -> (addNat n  (multNat n  n_prime))

and eqNat (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | Zero, Zero -> True
   | Zero, (Succ n_prime) -> False
   | (Succ n), Zero -> False
   | (Succ n), (Succ n_prime) -> (eqNat n  n_prime)

and ltNat (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | Zero, Zero -> False
   | Zero, (Succ n_prime) -> True
   | (Succ n_prime), Zero -> False
   | (Succ n), (Succ n_prime) -> (ltNat n  n_prime)
;;

let n1 : nat = (Succ Zero) ;;

let n2 : nat = (Succ n1) ;;

let n3 : nat = (Succ n2) ;;

let n4 : nat = (Succ n3) ;;

let n5 : nat = (Succ n4) ;;

let n6 : nat = (Succ n5) ;;

let n7 : nat = (Succ n6) ;;

let n8 : nat = (Succ n7) ;;

let n9 : nat = (Succ n8) ;;

let n10 : nat = (Succ n9) ;;

let n11 : nat = (Succ n10) ;;

let n12 : nat = (Succ n11) ;;

let n13 : nat = (Succ n12) ;;

let n14 : nat = (Succ n13) ;;

let n15 : nat = (Succ n14) ;;

let n16 : nat = (Succ n15) ;;

let n17 : nat = (Succ n16) ;;

let n18 : nat = (Succ n17) ;;

let n19 : nat = (Succ n18) ;;

let n20 : nat = (Succ n19) ;;

let n21 : nat = (Succ n20) ;;

let n22 : nat = (Succ n21) ;;

let n254 : nat = (addNat n12  (multNat n11  n22)) ;;

let n256 : nat = (multNat n16  n16) ;;

let n4100 : nat = (addNat n4  (multNat n16  n256)) ;;

let rec andOctet (rec_x1:octet) (rec_x2:octet) : octet =
   match rec_x1, rec_x2 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b_prime1, b_prime2, b_prime3, b_prime4, b_prime5, b_prime6, b_prime7, b_prime8)) -> (BuildOctet ((andBit b1  b_prime1), (andBit b2  b_prime2), (andBit b3  b_prime3), (andBit b4  b_prime4), (andBit b5  b_prime5), (andBit b6  b_prime6), (andBit b7  b_prime7), (andBit b8  b_prime8)))

and orOctet (rec_x1:octet) (rec_x2:octet) : octet =
   match rec_x1, rec_x2 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b_prime1, b_prime2, b_prime3, b_prime4, b_prime5, b_prime6, b_prime7, b_prime8)) -> (BuildOctet ((orBit b1  b_prime1), (orBit b2  b_prime2), (orBit b3  b_prime3), (orBit b4  b_prime4), (orBit b5  b_prime5), (orBit b6  b_prime6), (orBit b7  b_prime7), (orBit b8  b_prime8)))

and xorOctet (rec_x1:octet) (rec_x2:octet) : octet =
   match rec_x1, rec_x2 with
   | (BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b_prime1, b_prime2, b_prime3, b_prime4, b_prime5, b_prime6, b_prime7, b_prime8)) -> (BuildOctet ((xorBit b1  b_prime1), (xorBit b2  b_prime2), (xorBit b3  b_prime3), (xorBit b4  b_prime4), (xorBit b5  b_prime5), (xorBit b6  b_prime6), (xorBit b7  b_prime7), (xorBit b8  b_prime8)))
;;

let x02 : octet = (BuildOctet (X0, X0, X0, X0, X0, X0, X1, X0)) ;;

let x03 : octet = (BuildOctet (X0, X0, X0, X0, X0, X0, X1, X1)) ;;

let x04 : octet = (BuildOctet (X0, X0, X0, X0, X0, X1, X0, X0)) ;;

let x05 : octet = (BuildOctet (X0, X0, X0, X0, X0, X1, X0, X1)) ;;

let x06 : octet = (BuildOctet (X0, X0, X0, X0, X0, X1, X1, X0)) ;;

let x07 : octet = (BuildOctet (X0, X0, X0, X0, X0, X1, X1, X1)) ;;

let x08 : octet = (BuildOctet (X0, X0, X0, X0, X1, X0, X0, X0)) ;;

let x09 : octet = (BuildOctet (X0, X0, X0, X0, X1, X0, X0, X1)) ;;

let x0A : octet = (BuildOctet (X0, X0, X0, X0, X1, X0, X1, X0)) ;;

let x0B : octet = (BuildOctet (X0, X0, X0, X0, X1, X0, X1, X1)) ;;

let x0C : octet = (BuildOctet (X0, X0, X0, X0, X1, X1, X0, X0)) ;;

let x0D : octet = (BuildOctet (X0, X0, X0, X0, X1, X1, X0, X1)) ;;

let x0E : octet = (BuildOctet (X0, X0, X0, X0, X1, X1, X1, X0)) ;;

let x0F : octet = (BuildOctet (X0, X0, X0, X0, X1, X1, X1, X1)) ;;

let x10 : octet = (BuildOctet (X0, X0, X0, X1, X0, X0, X0, X0)) ;;

let x11 : octet = (BuildOctet (X0, X0, X0, X1, X0, X0, X0, X1)) ;;

let x12 : octet = (BuildOctet (X0, X0, X0, X1, X0, X0, X1, X0)) ;;

let x13 : octet = (BuildOctet (X0, X0, X0, X1, X0, X0, X1, X1)) ;;

let x14 : octet = (BuildOctet (X0, X0, X0, X1, X0, X1, X0, X0)) ;;

let x15 : octet = (BuildOctet (X0, X0, X0, X1, X0, X1, X0, X1)) ;;

let x16 : octet = (BuildOctet (X0, X0, X0, X1, X0, X1, X1, X0)) ;;

let x17 : octet = (BuildOctet (X0, X0, X0, X1, X0, X1, X1, X1)) ;;

let x18 : octet = (BuildOctet (X0, X0, X0, X1, X1, X0, X0, X0)) ;;

let x1A : octet = (BuildOctet (X0, X0, X0, X1, X1, X0, X1, X0)) ;;

let x1B : octet = (BuildOctet (X0, X0, X0, X1, X1, X0, X1, X1)) ;;

let x1C : octet = (BuildOctet (X0, X0, X0, X1, X1, X1, X0, X0)) ;;

let x1D : octet = (BuildOctet (X0, X0, X0, X1, X1, X1, X0, X1)) ;;

let x1E : octet = (BuildOctet (X0, X0, X0, X1, X1, X1, X1, X0)) ;;

let x1F : octet = (BuildOctet (X0, X0, X0, X1, X1, X1, X1, X1)) ;;

let x20 : octet = (BuildOctet (X0, X0, X1, X0, X0, X0, X0, X0)) ;;

let x21 : octet = (BuildOctet (X0, X0, X1, X0, X0, X0, X0, X1)) ;;

let x23 : octet = (BuildOctet (X0, X0, X1, X0, X0, X0, X1, X1)) ;;

let x24 : octet = (BuildOctet (X0, X0, X1, X0, X0, X1, X0, X0)) ;;

let x25 : octet = (BuildOctet (X0, X0, X1, X0, X0, X1, X0, X1)) ;;

let x26 : octet = (BuildOctet (X0, X0, X1, X0, X0, X1, X1, X0)) ;;

let x27 : octet = (BuildOctet (X0, X0, X1, X0, X0, X1, X1, X1)) ;;

let x28 : octet = (BuildOctet (X0, X0, X1, X0, X1, X0, X0, X0)) ;;

let x29 : octet = (BuildOctet (X0, X0, X1, X0, X1, X0, X0, X1)) ;;

let x2A : octet = (BuildOctet (X0, X0, X1, X0, X1, X0, X1, X0)) ;;

let x2B : octet = (BuildOctet (X0, X0, X1, X0, X1, X0, X1, X1)) ;;

let x2D : octet = (BuildOctet (X0, X0, X1, X0, X1, X1, X0, X1)) ;;

let x2E : octet = (BuildOctet (X0, X0, X1, X0, X1, X1, X1, X0)) ;;

let x2F : octet = (BuildOctet (X0, X0, X1, X0, X1, X1, X1, X1)) ;;

let x30 : octet = (BuildOctet (X0, X0, X1, X1, X0, X0, X0, X0)) ;;

let x31 : octet = (BuildOctet (X0, X0, X1, X1, X0, X0, X0, X1)) ;;

let x32 : octet = (BuildOctet (X0, X0, X1, X1, X0, X0, X1, X0)) ;;

let x33 : octet = (BuildOctet (X0, X0, X1, X1, X0, X0, X1, X1)) ;;

let x34 : octet = (BuildOctet (X0, X0, X1, X1, X0, X1, X0, X0)) ;;

let x35 : octet = (BuildOctet (X0, X0, X1, X1, X0, X1, X0, X1)) ;;

let x36 : octet = (BuildOctet (X0, X0, X1, X1, X0, X1, X1, X0)) ;;

let x37 : octet = (BuildOctet (X0, X0, X1, X1, X0, X1, X1, X1)) ;;

let x38 : octet = (BuildOctet (X0, X0, X1, X1, X1, X0, X0, X0)) ;;

let x39 : octet = (BuildOctet (X0, X0, X1, X1, X1, X0, X0, X1)) ;;

let x3A : octet = (BuildOctet (X0, X0, X1, X1, X1, X0, X1, X0)) ;;

let x3B : octet = (BuildOctet (X0, X0, X1, X1, X1, X0, X1, X1)) ;;

let x3D : octet = (BuildOctet (X0, X0, X1, X1, X1, X1, X0, X1)) ;;

let x3C : octet = (BuildOctet (X0, X0, X1, X1, X1, X1, X0, X0)) ;;

let x3F : octet = (BuildOctet (X0, X0, X1, X1, X1, X1, X1, X1)) ;;

let x40 : octet = (BuildOctet (X0, X1, X0, X0, X0, X0, X0, X0)) ;;

let x46 : octet = (BuildOctet (X0, X1, X0, X0, X0, X1, X1, X0)) ;;

let x48 : octet = (BuildOctet (X0, X1, X0, X0, X1, X0, X0, X0)) ;;

let x49 : octet = (BuildOctet (X0, X1, X0, X0, X1, X0, X0, X1)) ;;

let x4A : octet = (BuildOctet (X0, X1, X0, X0, X1, X0, X1, X0)) ;;

let x4B : octet = (BuildOctet (X0, X1, X0, X0, X1, X0, X1, X1)) ;;

let x4C : octet = (BuildOctet (X0, X1, X0, X0, X1, X1, X0, X0)) ;;

let x4D : octet = (BuildOctet (X0, X1, X0, X0, X1, X1, X0, X1)) ;;

let x4E : octet = (BuildOctet (X0, X1, X0, X0, X1, X1, X1, X0)) ;;

let x4F : octet = (BuildOctet (X0, X1, X0, X0, X1, X1, X1, X1)) ;;

let x50 : octet = (BuildOctet (X0, X1, X0, X1, X0, X0, X0, X0)) ;;

let x51 : octet = (BuildOctet (X0, X1, X0, X1, X0, X0, X0, X1)) ;;

let x53 : octet = (BuildOctet (X0, X1, X0, X1, X0, X0, X1, X1)) ;;

let x54 : octet = (BuildOctet (X0, X1, X0, X1, X0, X1, X0, X0)) ;;

let x55 : octet = (BuildOctet (X0, X1, X0, X1, X0, X1, X0, X1)) ;;

let x58 : octet = (BuildOctet (X0, X1, X0, X1, X1, X0, X0, X0)) ;;

let x5A : octet = (BuildOctet (X0, X1, X0, X1, X1, X0, X1, X0)) ;;

let x5B : octet = (BuildOctet (X0, X1, X0, X1, X1, X0, X1, X1)) ;;

let x5C : octet = (BuildOctet (X0, X1, X0, X1, X1, X1, X0, X0)) ;;

let x5D : octet = (BuildOctet (X0, X1, X0, X1, X1, X1, X0, X1)) ;;

let x5E : octet = (BuildOctet (X0, X1, X0, X1, X1, X1, X1, X0)) ;;

let x5F : octet = (BuildOctet (X0, X1, X0, X1, X1, X1, X1, X1)) ;;

let x60 : octet = (BuildOctet (X0, X1, X1, X0, X0, X0, X0, X0)) ;;

let x61 : octet = (BuildOctet (X0, X1, X1, X0, X0, X0, X0, X1)) ;;

let x62 : octet = (BuildOctet (X0, X1, X1, X0, X0, X0, X1, X0)) ;;

let x63 : octet = (BuildOctet (X0, X1, X1, X0, X0, X0, X1, X1)) ;;

let x64 : octet = (BuildOctet (X0, X1, X1, X0, X0, X1, X0, X0)) ;;

let x65 : octet = (BuildOctet (X0, X1, X1, X0, X0, X1, X0, X1)) ;;

let x66 : octet = (BuildOctet (X0, X1, X1, X0, X0, X1, X1, X0)) ;;

let x67 : octet = (BuildOctet (X0, X1, X1, X0, X0, X1, X1, X1)) ;;

let x69 : octet = (BuildOctet (X0, X1, X1, X0, X1, X0, X0, X1)) ;;

let x6A : octet = (BuildOctet (X0, X1, X1, X0, X1, X0, X1, X0)) ;;

let x6B : octet = (BuildOctet (X0, X1, X1, X0, X1, X0, X1, X1)) ;;

let x6C : octet = (BuildOctet (X0, X1, X1, X0, X1, X1, X0, X0)) ;;

let x6D : octet = (BuildOctet (X0, X1, X1, X0, X1, X1, X0, X1)) ;;

let x6E : octet = (BuildOctet (X0, X1, X1, X0, X1, X1, X1, X0)) ;;

let x6F : octet = (BuildOctet (X0, X1, X1, X0, X1, X1, X1, X1)) ;;

let x70 : octet = (BuildOctet (X0, X1, X1, X1, X0, X0, X0, X0)) ;;

let x71 : octet = (BuildOctet (X0, X1, X1, X1, X0, X0, X0, X1)) ;;

let x72 : octet = (BuildOctet (X0, X1, X1, X1, X0, X0, X1, X0)) ;;

let x73 : octet = (BuildOctet (X0, X1, X1, X1, X0, X0, X1, X1)) ;;

let x74 : octet = (BuildOctet (X0, X1, X1, X1, X0, X1, X0, X0)) ;;

let x75 : octet = (BuildOctet (X0, X1, X1, X1, X0, X1, X0, X1)) ;;

let x76 : octet = (BuildOctet (X0, X1, X1, X1, X0, X1, X1, X0)) ;;

let x77 : octet = (BuildOctet (X0, X1, X1, X1, X0, X1, X1, X1)) ;;

let x78 : octet = (BuildOctet (X0, X1, X1, X1, X1, X0, X0, X0)) ;;

let x79 : octet = (BuildOctet (X0, X1, X1, X1, X1, X0, X0, X1)) ;;

let x7A : octet = (BuildOctet (X0, X1, X1, X1, X1, X0, X1, X0)) ;;

let x7B : octet = (BuildOctet (X0, X1, X1, X1, X1, X0, X1, X1)) ;;

let x7C : octet = (BuildOctet (X0, X1, X1, X1, X1, X1, X0, X0)) ;;

let x7D : octet = (BuildOctet (X0, X1, X1, X1, X1, X1, X0, X1)) ;;

let x7E : octet = (BuildOctet (X0, X1, X1, X1, X1, X1, X1, X0)) ;;

let x7F : octet = (BuildOctet (X0, X1, X1, X1, X1, X1, X1, X1)) ;;

let x80 : octet = (BuildOctet (X1, X0, X0, X0, X0, X0, X0, X0)) ;;

let x81 : octet = (BuildOctet (X1, X0, X0, X0, X0, X0, X0, X1)) ;;

let x83 : octet = (BuildOctet (X1, X0, X0, X0, X0, X0, X1, X1)) ;;

let x84 : octet = (BuildOctet (X1, X0, X0, X0, X0, X1, X0, X0)) ;;

let x85 : octet = (BuildOctet (X1, X0, X0, X0, X0, X1, X0, X1)) ;;

let x86 : octet = (BuildOctet (X1, X0, X0, X0, X0, X1, X1, X0)) ;;

let x88 : octet = (BuildOctet (X1, X0, X0, X0, X1, X0, X0, X0)) ;;

let x89 : octet = (BuildOctet (X1, X0, X0, X0, X1, X0, X0, X1)) ;;

let x8A : octet = (BuildOctet (X1, X0, X0, X0, X1, X0, X1, X0)) ;;

let x8C : octet = (BuildOctet (X1, X0, X0, X0, X1, X1, X0, X0)) ;;

let x8D : octet = (BuildOctet (X1, X0, X0, X0, X1, X1, X0, X1)) ;;

let x8E : octet = (BuildOctet (X1, X0, X0, X0, X1, X1, X1, X0)) ;;

let x8F : octet = (BuildOctet (X1, X0, X0, X0, X1, X1, X1, X1)) ;;

let x90 : octet = (BuildOctet (X1, X0, X0, X1, X0, X0, X0, X0)) ;;

let x91 : octet = (BuildOctet (X1, X0, X0, X1, X0, X0, X0, X1)) ;;

let x92 : octet = (BuildOctet (X1, X0, X0, X1, X0, X0, X1, X0)) ;;

let x93 : octet = (BuildOctet (X1, X0, X0, X1, X0, X0, X1, X1)) ;;

let x95 : octet = (BuildOctet (X1, X0, X0, X1, X0, X1, X0, X1)) ;;

let x96 : octet = (BuildOctet (X1, X0, X0, X1, X0, X1, X1, X0)) ;;

let x97 : octet = (BuildOctet (X1, X0, X0, X1, X0, X1, X1, X1)) ;;

let x98 : octet = (BuildOctet (X1, X0, X0, X1, X1, X0, X0, X0)) ;;

let x99 : octet = (BuildOctet (X1, X0, X0, X1, X1, X0, X0, X1)) ;;

let x9A : octet = (BuildOctet (X1, X0, X0, X1, X1, X0, X1, X0)) ;;

let x9B : octet = (BuildOctet (X1, X0, X0, X1, X1, X0, X1, X1)) ;;

let x9C : octet = (BuildOctet (X1, X0, X0, X1, X1, X1, X0, X0)) ;;

let x9D : octet = (BuildOctet (X1, X0, X0, X1, X1, X1, X0, X1)) ;;

let x9E : octet = (BuildOctet (X1, X0, X0, X1, X1, X1, X1, X0)) ;;

let x9F : octet = (BuildOctet (X1, X0, X0, X1, X1, X1, X1, X1)) ;;

let xA1 : octet = (BuildOctet (X1, X0, X1, X0, X0, X0, X0, X1)) ;;

let xA0 : octet = (BuildOctet (X1, X0, X1, X0, X0, X0, X0, X0)) ;;

let xA2 : octet = (BuildOctet (X1, X0, X1, X0, X0, X0, X1, X0)) ;;

let xA3 : octet = (BuildOctet (X1, X0, X1, X0, X0, X0, X1, X1)) ;;

let xA4 : octet = (BuildOctet (X1, X0, X1, X0, X0, X1, X0, X0)) ;;

let xA5 : octet = (BuildOctet (X1, X0, X1, X0, X0, X1, X0, X1)) ;;

let xA6 : octet = (BuildOctet (X1, X0, X1, X0, X0, X1, X1, X0)) ;;

let xA7 : octet = (BuildOctet (X1, X0, X1, X0, X0, X1, X1, X1)) ;;

let xA8 : octet = (BuildOctet (X1, X0, X1, X0, X1, X0, X0, X0)) ;;

let xA9 : octet = (BuildOctet (X1, X0, X1, X0, X1, X0, X0, X1)) ;;

let xAA : octet = (BuildOctet (X1, X0, X1, X0, X1, X0, X1, X0)) ;;

let xAB : octet = (BuildOctet (X1, X0, X1, X0, X1, X0, X1, X1)) ;;

let xAC : octet = (BuildOctet (X1, X0, X1, X0, X1, X1, X0, X0)) ;;

let xAE : octet = (BuildOctet (X1, X0, X1, X0, X1, X1, X1, X0)) ;;

let xAF : octet = (BuildOctet (X1, X0, X1, X0, X1, X1, X1, X1)) ;;

let xB0 : octet = (BuildOctet (X1, X0, X1, X1, X0, X0, X0, X0)) ;;

let xB1 : octet = (BuildOctet (X1, X0, X1, X1, X0, X0, X0, X1)) ;;

let xB2 : octet = (BuildOctet (X1, X0, X1, X1, X0, X0, X1, X0)) ;;

let xB3 : octet = (BuildOctet (X1, X0, X1, X1, X0, X0, X1, X1)) ;;

let xB5 : octet = (BuildOctet (X1, X0, X1, X1, X0, X1, X0, X1)) ;;

let xB6 : octet = (BuildOctet (X1, X0, X1, X1, X0, X1, X1, X0)) ;;

let xB8 : octet = (BuildOctet (X1, X0, X1, X1, X1, X0, X0, X0)) ;;

let xB9 : octet = (BuildOctet (X1, X0, X1, X1, X1, X0, X0, X1)) ;;

let xBA : octet = (BuildOctet (X1, X0, X1, X1, X1, X0, X1, X0)) ;;

let xBB : octet = (BuildOctet (X1, X0, X1, X1, X1, X0, X1, X1)) ;;

let xBC : octet = (BuildOctet (X1, X0, X1, X1, X1, X1, X0, X0)) ;;

let xBE : octet = (BuildOctet (X1, X0, X1, X1, X1, X1, X1, X0)) ;;

let xBF : octet = (BuildOctet (X1, X0, X1, X1, X1, X1, X1, X1)) ;;

let xC0 : octet = (BuildOctet (X1, X1, X0, X0, X0, X0, X0, X0)) ;;

let xC1 : octet = (BuildOctet (X1, X1, X0, X0, X0, X0, X0, X1)) ;;

let xC2 : octet = (BuildOctet (X1, X1, X0, X0, X0, X0, X1, X0)) ;;

let xC4 : octet = (BuildOctet (X1, X1, X0, X0, X0, X1, X0, X0)) ;;

let xC5 : octet = (BuildOctet (X1, X1, X0, X0, X0, X1, X0, X1)) ;;

let xC6 : octet = (BuildOctet (X1, X1, X0, X0, X0, X1, X1, X0)) ;;

let xC7 : octet = (BuildOctet (X1, X1, X0, X0, X0, X1, X1, X1)) ;;

let xC8 : octet = (BuildOctet (X1, X1, X0, X0, X1, X0, X0, X0)) ;;

let xC9 : octet = (BuildOctet (X1, X1, X0, X0, X1, X0, X0, X1)) ;;

let xCA : octet = (BuildOctet (X1, X1, X0, X0, X1, X0, X1, X0)) ;;

let xCB : octet = (BuildOctet (X1, X1, X0, X0, X1, X0, X1, X1)) ;;

let xCC : octet = (BuildOctet (X1, X1, X0, X0, X1, X1, X0, X0)) ;;

let xCD : octet = (BuildOctet (X1, X1, X0, X0, X1, X1, X0, X1)) ;;

let xCE : octet = (BuildOctet (X1, X1, X0, X0, X1, X1, X1, X0)) ;;

let xD0 : octet = (BuildOctet (X1, X1, X0, X1, X0, X0, X0, X0)) ;;

let xD1 : octet = (BuildOctet (X1, X1, X0, X1, X0, X0, X0, X1)) ;;

let xD2 : octet = (BuildOctet (X1, X1, X0, X1, X0, X0, X1, X0)) ;;

let xD3 : octet = (BuildOctet (X1, X1, X0, X1, X0, X0, X1, X1)) ;;

let xD4 : octet = (BuildOctet (X1, X1, X0, X1, X0, X1, X0, X0)) ;;

let xD5 : octet = (BuildOctet (X1, X1, X0, X1, X0, X1, X0, X1)) ;;

let xD6 : octet = (BuildOctet (X1, X1, X0, X1, X0, X1, X1, X0)) ;;

let xD7 : octet = (BuildOctet (X1, X1, X0, X1, X0, X1, X1, X1)) ;;

let xD8 : octet = (BuildOctet (X1, X1, X0, X1, X1, X0, X0, X0)) ;;

let xD9 : octet = (BuildOctet (X1, X1, X0, X1, X1, X0, X0, X1)) ;;

let xDB : octet = (BuildOctet (X1, X1, X0, X1, X1, X0, X1, X1)) ;;

let xDC : octet = (BuildOctet (X1, X1, X0, X1, X1, X1, X0, X0)) ;;

let xDD : octet = (BuildOctet (X1, X1, X0, X1, X1, X1, X0, X1)) ;;

let xDE : octet = (BuildOctet (X1, X1, X0, X1, X1, X1, X1, X0)) ;;

let xDF : octet = (BuildOctet (X1, X1, X0, X1, X1, X1, X1, X1)) ;;

let xE0 : octet = (BuildOctet (X1, X1, X1, X0, X0, X0, X0, X0)) ;;

let xE1 : octet = (BuildOctet (X1, X1, X1, X0, X0, X0, X0, X1)) ;;

let xE3 : octet = (BuildOctet (X1, X1, X1, X0, X0, X0, X1, X1)) ;;

let xE6 : octet = (BuildOctet (X1, X1, X1, X0, X0, X1, X1, X0)) ;;

let xE8 : octet = (BuildOctet (X1, X1, X1, X0, X1, X0, X0, X0)) ;;

let xE9 : octet = (BuildOctet (X1, X1, X1, X0, X1, X0, X0, X1)) ;;

let xEA : octet = (BuildOctet (X1, X1, X1, X0, X1, X0, X1, X0)) ;;

let xEB : octet = (BuildOctet (X1, X1, X1, X0, X1, X0, X1, X1)) ;;

let xEC : octet = (BuildOctet (X1, X1, X1, X0, X1, X1, X0, X0)) ;;

let xED : octet = (BuildOctet (X1, X1, X1, X0, X1, X1, X0, X1)) ;;

let xEE : octet = (BuildOctet (X1, X1, X1, X0, X1, X1, X1, X0)) ;;

let xEF : octet = (BuildOctet (X1, X1, X1, X0, X1, X1, X1, X1)) ;;

let xF0 : octet = (BuildOctet (X1, X1, X1, X1, X0, X0, X0, X0)) ;;

let xF1 : octet = (BuildOctet (X1, X1, X1, X1, X0, X0, X0, X1)) ;;

let xF2 : octet = (BuildOctet (X1, X1, X1, X1, X0, X0, X1, X0)) ;;

let xF3 : octet = (BuildOctet (X1, X1, X1, X1, X0, X0, X1, X1)) ;;

let xF4 : octet = (BuildOctet (X1, X1, X1, X1, X0, X1, X0, X0)) ;;

let xF5 : octet = (BuildOctet (X1, X1, X1, X1, X0, X1, X0, X1)) ;;

let xF6 : octet = (BuildOctet (X1, X1, X1, X1, X0, X1, X1, X0)) ;;

let xF7 : octet = (BuildOctet (X1, X1, X1, X1, X0, X1, X1, X1)) ;;

let xF8 : octet = (BuildOctet (X1, X1, X1, X1, X1, X0, X0, X0)) ;;

let xF9 : octet = (BuildOctet (X1, X1, X1, X1, X1, X0, X0, X1)) ;;

let xFA : octet = (BuildOctet (X1, X1, X1, X1, X1, X0, X1, X0)) ;;

let xFB : octet = (BuildOctet (X1, X1, X1, X1, X1, X0, X1, X1)) ;;

let xFC : octet = (BuildOctet (X1, X1, X1, X1, X1, X1, X0, X0)) ;;

let xFD : octet = (BuildOctet (X1, X1, X1, X1, X1, X1, X0, X1)) ;;

let xFE : octet = (BuildOctet (X1, X1, X1, X1, X1, X1, X1, X0)) ;;

let xFF : octet = (BuildOctet (X1, X1, X1, X1, X1, X1, X1, X1)) ;;

let rec andBlock (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (BuildBlock ((andOctet o1  o_prime1), (andOctet o2  o_prime2), (andOctet o3  o_prime3), (andOctet o4  o_prime4)))

and orBlock (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (BuildBlock ((orOctet o1  o_prime1), (orOctet o2  o_prime2), (orOctet o3  o_prime3), (orOctet o4  o_prime4)))

and xorBlock (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (BuildBlock ((xorOctet o1  o_prime1), (xorOctet o2  o_prime2), (xorOctet o3  o_prime3), (xorOctet o4  o_prime4)))
;;

let x0001 : half = (BuildHalf (x00, x01)) ;;

let x00000000 : block = (BuildBlock (x00, x00, x00, x00)) ;;

let x00000001 : block = (BuildBlock (x00, x00, x00, x01)) ;;

let x00000002 : block = (BuildBlock (x00, x00, x00, x02)) ;;

let x00000003 : block = (BuildBlock (x00, x00, x00, x03)) ;;

let x00000004 : block = (BuildBlock (x00, x00, x00, x04)) ;;

let x00000005 : block = (BuildBlock (x00, x00, x00, x05)) ;;

let x00000006 : block = (BuildBlock (x00, x00, x00, x06)) ;;

let x00000007 : block = (BuildBlock (x00, x00, x00, x07)) ;;

let x00000008 : block = (BuildBlock (x00, x00, x00, x08)) ;;

let x00000009 : block = (BuildBlock (x00, x00, x00, x09)) ;;

let x0000000A : block = (BuildBlock (x00, x00, x00, x0A)) ;;

let x0000000B : block = (BuildBlock (x00, x00, x00, x0B)) ;;

let x0000000C : block = (BuildBlock (x00, x00, x00, x0C)) ;;

let x0000000D : block = (BuildBlock (x00, x00, x00, x0D)) ;;

let x0000000E : block = (BuildBlock (x00, x00, x00, x0E)) ;;

let x0000000F : block = (BuildBlock (x00, x00, x00, x0F)) ;;

let x00000010 : block = (BuildBlock (x00, x00, x00, x10)) ;;

let x00000012 : block = (BuildBlock (x00, x00, x00, x12)) ;;

let x00000014 : block = (BuildBlock (x00, x00, x00, x14)) ;;

let x00000016 : block = (BuildBlock (x00, x00, x00, x16)) ;;

let x00000018 : block = (BuildBlock (x00, x00, x00, x18)) ;;

let x0000001B : block = (BuildBlock (x00, x00, x00, x1B)) ;;

let x0000001D : block = (BuildBlock (x00, x00, x00, x1D)) ;;

let x0000001E : block = (BuildBlock (x00, x00, x00, x1E)) ;;

let x0000001F : block = (BuildBlock (x00, x00, x00, x1F)) ;;

let x00000031 : block = (BuildBlock (x00, x00, x00, x31)) ;;

let x00000036 : block = (BuildBlock (x00, x00, x00, x36)) ;;

let x00000060 : block = (BuildBlock (x00, x00, x00, x60)) ;;

let x00000080 : block = (BuildBlock (x00, x00, x00, x80)) ;;

let x000000A5 : block = (BuildBlock (x00, x00, x00, xA5)) ;;

let x000000B6 : block = (BuildBlock (x00, x00, x00, xB6)) ;;

let x000000C4 : block = (BuildBlock (x00, x00, x00, xC4)) ;;

let x000000D2 : block = (BuildBlock (x00, x00, x00, xD2)) ;;

let x00000100 : block = (BuildBlock (x00, x00, x01, x00)) ;;

let x00000129 : block = (BuildBlock (x00, x00, x01, x29)) ;;

let x0000018C : block = (BuildBlock (x00, x00, x01, x8C)) ;;

let x00004000 : block = (BuildBlock (x00, x00, x40, x00)) ;;

let x00010000 : block = (BuildBlock (x00, x01, x00, x00)) ;;

let x00020000 : block = (BuildBlock (x00, x02, x00, x00)) ;;

let x00030000 : block = (BuildBlock (x00, x03, x00, x00)) ;;

let x00040000 : block = (BuildBlock (x00, x04, x00, x00)) ;;

let x00060000 : block = (BuildBlock (x00, x06, x00, x00)) ;;

let x00804021 : block = (BuildBlock (x00, x80, x40, x21)) ;;

let x00FF00FF : block = (BuildBlock (x00, xFF, x00, xFF)) ;;

let x0103050B : block = (BuildBlock (x01, x03, x05, x0B)) ;;

let x01030703 : block = (BuildBlock (x01, x03, x07, x03)) ;;

let x01030705 : block = (BuildBlock (x01, x03, x07, x05)) ;;

let x0103070F : block = (BuildBlock (x01, x03, x07, x0F)) ;;

let x02040801 : block = (BuildBlock (x02, x04, x08, x01)) ;;

let x0297AF6F : block = (BuildBlock (x02, x97, xAF, x6F)) ;;

let x07050301 : block = (BuildBlock (x07, x05, x03, x01)) ;;

let x077788A2 : block = (BuildBlock (x07, x77, x88, xA2)) ;;

let x07C72EAA : block = (BuildBlock (x07, xC7, x2E, xAA)) ;;

let x0A202020 : block = (BuildBlock (x0A, x20, x20, x20)) ;;

let x0AD67E20 : block = (BuildBlock (x0A, xD6, x7E, x20)) ;;

let x10000000 : block = (BuildBlock (x10, x00, x00, x00)) ;;

let x11A9D254 : block = (BuildBlock (x11, xA9, xD2, x54)) ;;

let x11AC46B8 : block = (BuildBlock (x11, xAC, x46, xB8)) ;;

let x1277A6D4 : block = (BuildBlock (x12, x77, xA6, xD4)) ;;

let x13647149 : block = (BuildBlock (x13, x64, x71, x49)) ;;

let x160EE9B5 : block = (BuildBlock (x16, x0E, xE9, xB5)) ;;

let x17065DBB : block = (BuildBlock (x17, x06, x5D, xBB)) ;;

let x17A808FD : block = (BuildBlock (x17, xA8, x08, xFD)) ;;

let x1D10D8D3 : block = (BuildBlock (x1D, x10, xD8, xD3)) ;;

let x1D3B7760 : block = (BuildBlock (x1D, x3B, x77, x60)) ;;

let x1D9C9655 : block = (BuildBlock (x1D, x9C, x96, x55)) ;;

let x1F3F7FFF : block = (BuildBlock (x1F, x3F, x7F, xFF)) ;;

let x204E80A7 : block = (BuildBlock (x20, x4E, x80, xA7)) ;;

let x21D869BA : block = (BuildBlock (x21, xD8, x69, xBA)) ;;

let x24B66FB5 : block = (BuildBlock (x24, xB6, x6F, xB5)) ;;

let x270EEDAF : block = (BuildBlock (x27, x0E, xED, xAF)) ;;

let x277B4B25 : block = (BuildBlock (x27, x7B, x4B, x25)) ;;

let x2829040B : block = (BuildBlock (x28, x29, x04, x0B)) ;;

let x288FC786 : block = (BuildBlock (x28, x8F, xC7, x86)) ;;

let x28EAD8B3 : block = (BuildBlock (x28, xEA, xD8, xB3)) ;;

let x29907CD8 : block = (BuildBlock (x29, x90, x7C, xD8)) ;;

let x29C1485F : block = (BuildBlock (x29, xC1, x48, x5F)) ;;

let x29EEE96B : block = (BuildBlock (x29, xEE, xE9, x6B)) ;;

let x2A6091AE : block = (BuildBlock (x2A, x60, x91, xAE)) ;;

let x2BF8499A : block = (BuildBlock (x2B, xF8, x49, x9A)) ;;

let x2E80AC30 : block = (BuildBlock (x2E, x80, xAC, x30)) ;;

let x2FD76FFB : block = (BuildBlock (x2F, xD7, x6F, xFB)) ;;

let x30261492 : block = (BuildBlock (x30, x26, x14, x92)) ;;

let x303FF4AA : block = (BuildBlock (x30, x3F, xF4, xAA)) ;;

let x33D5A466 : block = (BuildBlock (x33, xD5, xA4, x66)) ;;

let x344925FC : block = (BuildBlock (x34, x49, x25, xFC)) ;;

let x34ACF886 : block = (BuildBlock (x34, xAC, xF8, x86)) ;;

let x3CD54DEB : block = (BuildBlock (x3C, xD5, x4D, xEB)) ;;

let x3CF3A7D2 : block = (BuildBlock (x3C, xF3, xA7, xD2)) ;;

let x3DD81AC6 : block = (BuildBlock (x3D, xD8, x1A, xC6)) ;;

let x3F6F7248 : block = (BuildBlock (x3F, x6F, x72, x48)) ;;

let x48B204D6 : block = (BuildBlock (x48, xB2, x04, xD6)) ;;

let x4A645A01 : block = (BuildBlock (x4A, x64, x5A, x01)) ;;

let x4C49AAE0 : block = (BuildBlock (x4C, x49, xAA, xE0)) ;;

let x4CE933E1 : block = (BuildBlock (x4C, xE9, x33, xE1)) ;;

let x4D53901A : block = (BuildBlock (x4D, x53, x90, x1A)) ;;

let x4DA124A1 : block = (BuildBlock (x4D, xA1, x24, xA1)) ;;

let x4F998E01 : block = (BuildBlock (x4F, x99, x8E, x01)) ;;

let x4FB1138A : block = (BuildBlock (x4F, xB1, x13, x8A)) ;;

let x50DEC930 : block = (BuildBlock (x50, xDE, xC9, x30)) ;;

let x51AF3C1D : block = (BuildBlock (x51, xAF, x3C, x1D)) ;;

let x51EDE9C7 : block = (BuildBlock (x51, xED, xE9, xC7)) ;;

let x550D91CE : block = (BuildBlock (x55, x0D, x91, xCE)) ;;

let x55555555 : block = (BuildBlock (x55, x55, x55, x55)) ;;

let x55DD063F : block = (BuildBlock (x55, xDD, x06, x3F)) ;;

let x5834A585 : block = (BuildBlock (x58, x34, xA5, x85)) ;;

let x5A35D667 : block = (BuildBlock (x5A, x35, xD6, x67)) ;;

let x5BC02502 : block = (BuildBlock (x5B, xC0, x25, x02)) ;;

let x5CCA3239 : block = (BuildBlock (x5C, xCA, x32, x39)) ;;

let x5EBA06C2 : block = (BuildBlock (x5E, xBA, x06, xC2)) ;;

let x5F38EEF1 : block = (BuildBlock (x5F, x38, xEE, xF1)) ;;

let x613F8E2A : block = (BuildBlock (x61, x3F, x8E, x2A)) ;;

let x63C70DBA : block = (BuildBlock (x63, xC7, x0D, xBA)) ;;

let x6AD6E8A4 : block = (BuildBlock (x6A, xD6, xE8, xA4)) ;;

let x6AEBACF8 : block = (BuildBlock (x6A, xEB, xAC, xF8)) ;;

let x6D67E884 : block = (BuildBlock (x6D, x67, xE8, x84)) ;;

let x7050EC5E : block = (BuildBlock (x70, x50, xEC, x5E)) ;;

let x717153D5 : block = (BuildBlock (x71, x71, x53, xD5)) ;;

let x7201F4DC : block = (BuildBlock (x72, x01, xF4, xDC)) ;;

let x7397C9AE : block = (BuildBlock (x73, x97, xC9, xAE)) ;;

let x74B39176 : block = (BuildBlock (x74, xB3, x91, x76)) ;;

let x76232E5F : block = (BuildBlock (x76, x23, x2E, x5F)) ;;

let x7783C51D : block = (BuildBlock (x77, x83, xC5, x1D)) ;;

let x7792F9D4 : block = (BuildBlock (x77, x92, xF9, xD4)) ;;

let x7BC180AB : block = (BuildBlock (x7B, xC1, x80, xAB)) ;;

let x7DB2D9F4 : block = (BuildBlock (x7D, xB2, xD9, xF4)) ;;

let x7DFEFBFF : block = (BuildBlock (x7D, xFE, xFB, xFF)) ;;

let x7F76A3B0 : block = (BuildBlock (x7F, x76, xA3, xB0)) ;;

let x7F839576 : block = (BuildBlock (x7F, x83, x95, x76)) ;;

let x7FFFFFF0 : block = (BuildBlock (x7F, xFF, xFF, xF0)) ;;

let x7FFFFFF1 : block = (BuildBlock (x7F, xFF, xFF, xF1)) ;;

let x7FFFFFFC : block = (BuildBlock (x7F, xFF, xFF, xFC)) ;;

let x7FFFFFFD : block = (BuildBlock (x7F, xFF, xFF, xFD)) ;;

let x80000000 : block = (BuildBlock (x80, x00, x00, x00)) ;;

let x80000002 : block = (BuildBlock (x80, x00, x00, x02)) ;;

let x800000C2 : block = (BuildBlock (x80, x00, x00, xC2)) ;;

let x80018000 : block = (BuildBlock (x80, x01, x80, x00)) ;;

let x80018001 : block = (BuildBlock (x80, x01, x80, x01)) ;;

let x80397302 : block = (BuildBlock (x80, x39, x73, x02)) ;;

let x81D10CA3 : block = (BuildBlock (x81, xD1, x0C, xA3)) ;;

let x89D635D7 : block = (BuildBlock (x89, xD6, x35, xD7)) ;;

let x8CE37709 : block = (BuildBlock (x8C, xE3, x77, x09)) ;;

let x8DC8BBDE : block = (BuildBlock (x8D, xC8, xBB, xDE)) ;;

let x9115A558 : block = (BuildBlock (x91, x15, xA5, x58)) ;;

let x91896CFA : block = (BuildBlock (x91, x89, x6C, xFA)) ;;

let x9372CDC6 : block = (BuildBlock (x93, x72, xCD, xC6)) ;;

let x98D1CC75 : block = (BuildBlock (x98, xD1, xCC, x75)) ;;

let x9D15C437 : block = (BuildBlock (x9D, x15, xC4, x37)) ;;

let x9DB15CF6 : block = (BuildBlock (x9D, xB1, x5C, xF6)) ;;

let x9E2E7B36 : block = (BuildBlock (x9E, x2E, x7B, x36)) ;;

let xA018C83B : block = (BuildBlock (xA0, x18, xC8, x3B)) ;;

let xA0B87B77 : block = (BuildBlock (xA0, xB8, x7B, x77)) ;;

let xA44AAAC0 : block = (BuildBlock (xA4, x4A, xAA, xC0)) ;;

let xA511987A : block = (BuildBlock (xA5, x11, x98, x7A)) ;;

let xA70FC148 : block = (BuildBlock (xA7, x0F, xC1, x48)) ;;

let xA93BD410 : block = (BuildBlock (xA9, x3B, xD4, x10)) ;;

let xAAAAAAAA : block = (BuildBlock (xAA, xAA, xAA, xAA)) ;;

let xAB00FFCD : block = (BuildBlock (xAB, x00, xFF, xCD)) ;;

let xAB01FCCD : block = (BuildBlock (xAB, x01, xFC, xCD)) ;;

let xAB6EED4A : block = (BuildBlock (xAB, x6E, xED, x4A)) ;;

let xABEEED6B : block = (BuildBlock (xAB, xEE, xED, x6B)) ;;

let xACBC13DD : block = (BuildBlock (xAC, xBC, x13, xDD)) ;;

let xB1CC1CC5 : block = (BuildBlock (xB1, xCC, x1C, xC5)) ;;

let xB8142629 : block = (BuildBlock (xB8, x14, x26, x29)) ;;

let xB99A62DE : block = (BuildBlock (xB9, x9A, x62, xDE)) ;;

let xBA92DB12 : block = (BuildBlock (xBA, x92, xDB, x12)) ;;

let xBBA57835 : block = (BuildBlock (xBB, xA5, x78, x35)) ;;

let xBE9F0917 : block = (BuildBlock (xBE, x9F, x09, x17)) ;;

let xBF2D7D85 : block = (BuildBlock (xBF, x2D, x7D, x85)) ;;

let xBFEF7FDF : block = (BuildBlock (xBF, xEF, x7F, xDF)) ;;

let xC1ED90DD : block = (BuildBlock (xC1, xED, x90, xDD)) ;;

let xC21A1846 : block = (BuildBlock (xC2, x1A, x18, x46)) ;;

let xC4EB1AEB : block = (BuildBlock (xC4, xEB, x1A, xEB)) ;;

let xC6B1317E : block = (BuildBlock (xC6, xB1, x31, x7E)) ;;

let xCBC865BA : block = (BuildBlock (xCB, xC8, x65, xBA)) ;;

let xCD959B46 : block = (BuildBlock (xCD, x95, x9B, x46)) ;;

let xD0482465 : block = (BuildBlock (xD0, x48, x24, x65)) ;;

let xD636250D : block = (BuildBlock (xD6, x36, x25, x0D)) ;;

let xD7843FDC : block = (BuildBlock (xD7, x84, x3F, xDC)) ;;

let xD78634BC : block = (BuildBlock (xD7, x86, x34, xBC)) ;;

let xD8804CA5 : block = (BuildBlock (xD8, x80, x4C, xA5)) ;;

let xDB79FBDC : block = (BuildBlock (xDB, x79, xFB, xDC)) ;;

let xDB9102B0 : block = (BuildBlock (xDB, x91, x02, xB0)) ;;

let xE0C08000 : block = (BuildBlock (xE0, xC0, x80, x00)) ;;

let xE6A12F07 : block = (BuildBlock (xE6, xA1, x2F, x07)) ;;

let xEB35B97F : block = (BuildBlock (xEB, x35, xB9, x7F)) ;;

let xF0239DD5 : block = (BuildBlock (xF0, x23, x9D, xD5)) ;;

let xF14D6E28 : block = (BuildBlock (xF1, x4D, x6E, x28)) ;;

let xF2EF3501 : block = (BuildBlock (xF2, xEF, x35, x01)) ;;

let xF6A09667 : block = (BuildBlock (xF6, xA0, x96, x67)) ;;

let xFD297DA4 : block = (BuildBlock (xFD, x29, x7D, xA4)) ;;

let xFDC1A8BA : block = (BuildBlock (xFD, xC1, xA8, xBA)) ;;

let xFE4E5BDD : block = (BuildBlock (xFE, x4E, x5B, xDD)) ;;

let xFEA1D334 : block = (BuildBlock (xFE, xA1, xD3, x34)) ;;

let xFECCAA6E : block = (BuildBlock (xFE, xCC, xAA, x6E)) ;;

let xFEFC07F0 : block = (BuildBlock (xFE, xFC, x07, xF0)) ;;

let xFF2D7DA5 : block = (BuildBlock (xFF, x2D, x7D, xA5)) ;;

let xFFEF0001 : block = (BuildBlock (xFF, xEF, x00, x01)) ;;

let xFFFF00FF : block = (BuildBlock (xFF, xFF, x00, xFF)) ;;

let xFFFFFF2D : block = (BuildBlock (xFF, xFF, xFF, x2D)) ;;

let xFFFFFF3A : block = (BuildBlock (xFF, xFF, xFF, x3A)) ;;

let xFFFFFFF0 : block = (BuildBlock (xFF, xFF, xFF, xF0)) ;;

let xFFFFFFF1 : block = (BuildBlock (xFF, xFF, xFF, xF1)) ;;

let xFFFFFFF4 : block = (BuildBlock (xFF, xFF, xFF, xF4)) ;;

let xFFFFFFF5 : block = (BuildBlock (xFF, xFF, xFF, xF5)) ;;

let xFFFFFFF7 : block = (BuildBlock (xFF, xFF, xFF, xF7)) ;;

let xFFFFFFF9 : block = (BuildBlock (xFF, xFF, xFF, xF9)) ;;

let xFFFFFFFA : block = (BuildBlock (xFF, xFF, xFF, xFA)) ;;

let xFFFFFFFB : block = (BuildBlock (xFF, xFF, xFF, xFB)) ;;

let xFFFFFFFC : block = (BuildBlock (xFF, xFF, xFF, xFC)) ;;

let xFFFFFFFD : block = (BuildBlock (xFF, xFF, xFF, xFD)) ;;

let xFFFFFFFE : block = (BuildBlock (xFF, xFF, xFF, xFE)) ;;

let xFFFFFFFF : block = (BuildBlock (xFF, xFF, xFF, xFF)) ;;

let rec appendMessage (rec_x1:message) (rec_x2:block) : message =
   match rec_x1, rec_x2 with
   | (UnitMessage w), w_prime -> (ConsMessage (w, (UnitMessage w_prime)))
   | (ConsMessage (w, m)), w_prime -> (ConsMessage (w, (appendMessage m  w_prime)))

and reverseMessage (rec_x1:message) : message =
   match rec_x1 with
   | (UnitMessage w) -> (UnitMessage w)
   | (ConsMessage (w, m)) -> (appendMessage (reverseMessage m)  w)

and makeMessage (rec_x1:nat) (rec_x2:block) (rec_x3:block) : message =
   match rec_x1, rec_x2, rec_x3 with
   | (Succ n), w, w_prime when (eqNat n  Zero) = True -> (UnitMessage w)
   | (Succ n), w, w_prime when (eqNat n  Zero) = False -> (ConsMessage (w, (makeMessage n  (aDD w  w_prime)  w_prime)))

and aDD (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (addBlock w  w_prime)

and xand (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (andBlock w  w_prime)

and mUL (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mulBlock w  w_prime)

and yor (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (orBlock w  w_prime)

and xOR (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (xorBlock w  w_prime)

and xOR_prime (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (xOR w  w_prime)

and cYC (rec_x1:block) : block =
   match rec_x1 with
   | (BuildBlock ((BuildOctet (b1, b2, b3, b4, b5, b6, b7, b8)), (BuildOctet (b9, b10, b11, b12, b13, b14, b15, b16)), (BuildOctet (b17, b18, b19, b20, b21, b22, b23, b24)), (BuildOctet (b25, b26, b27, b28, b29, b30, b31, b32)))) -> (BuildBlock ((BuildOctet (b2, b3, b4, b5, b6, b7, b8, b9)), (BuildOctet (b10, b11, b12, b13, b14, b15, b16, b17)), (BuildOctet (b18, b19, b20, b21, b22, b23, b24, b25)), (BuildOctet (b26, b27, b28, b29, b30, b31, b32, b1))))

and nCYC (rec_x1:nat) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | Zero, w -> w
   | (Succ n), w -> (cYC (nCYC n  w))

and fIX1 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xand (yor w  x02040801)  xBFEF7FDF)

and fIX2 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xand (yor w  x00804021)  x7DFEFBFF)

and needAdjust (rec_x1:octet) : bool =
   match rec_x1 with
   | o -> (orBool (eqOctet o  x00)  (eqOctet o  xFF))

and adjustCode (rec_x1:octet) : bit =
   match rec_x1 with
   | o when (needAdjust o) = True -> X1
   | o when (needAdjust o) = False -> X0

and adjust (rec_x1:octet) (rec_x2:octet) : octet =
   match rec_x1, rec_x2 with
   | o, o_prime when (needAdjust o) = True -> (xorOctet o  o_prime)
   | o, o_prime when (needAdjust o) = False -> o

and pAT (rec_x1:block) (rec_x2:block) : octet =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (BuildOctet ((adjustCode o1), (adjustCode o2), (adjustCode o3), (adjustCode o4), (adjustCode o_prime1), (adjustCode o_prime2), (adjustCode o_prime3), (adjustCode o_prime4)))

and bYT (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | (BuildBlock (o1, o2, o3, o4)), (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4)) -> (bYT_prime o1  o2  o3  o4  o_prime1  o_prime2  o_prime3  o_prime4  (pAT (BuildBlock (o1, o2, o3, o4))  (BuildBlock (o_prime1, o_prime2, o_prime3, o_prime4))))

and bYT_prime (rec_x1:octet) (rec_x2:octet) (rec_x3:octet) (rec_x4:octet) (rec_x5:octet) (rec_x6:octet) (rec_x7:octet) (rec_x8:octet) (rec_x9:octet) : pair =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6, rec_x7, rec_x8, rec_x9 with
   | o1, o2, o3, o4, o_prime1, o_prime2, o_prime3, o_prime4, opat -> (BuildPair ((BuildBlock ((adjust o1  (rightOctet7 opat)), (adjust o2  (rightOctet6 opat)), (adjust o3  (rightOctet5 opat)), (adjust o4  (rightOctet4 opat)))), (BuildBlock ((adjust o_prime1  (rightOctet3 opat)), (adjust o_prime2  (rightOctet2 opat)), (adjust o_prime3  (rightOctet1 opat)), (adjust o_prime4  opat)))))

and aDDC (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w, w_prime -> (aDDC_prime (addBlockSum w  w_prime))

and aDDC_prime (rec_x1:blockSum) : pair =
   match rec_x1 with
   | (BuildBlockSum (X0, w)) -> (BuildPair (x00000000, w))
   | (BuildBlockSum (X1, w)) -> (BuildPair (x00000001, w))

and mUL1 (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL1XY (mUL w  w_prime))

and mUL1XY (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (mUL1UL w  w_prime)

and mUL1UL (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL1SC (aDDC w  w_prime))

and mUL1SC (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (wcarry, w)) -> (aDD w  wcarry)

and mUL2 (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2XY (mUL w  w_prime))

and mUL2XY (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (mUL2UL w  w_prime)

and mUL2UL (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2DEL (aDDC w  w)  w_prime)

and mUL2DEL (rec_x1:pair) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | (BuildPair (wcarry, w)), w_prime -> (mUL2FL (aDD w  (aDD wcarry  wcarry))  w_prime)

and mUL2FL (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2SC (aDDC w  w_prime))

and mUL2SC (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (wcarry, w)) -> (aDD w  (aDD wcarry  wcarry))

and mUL2A (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2AXY (mUL w  w_prime))

and mUL2AXY (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (mUL2AUL w  w_prime)

and mUL2AUL (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2ADL (aDD w  w)  w_prime)

and mUL2ADL (rec_x1:block) (rec_x2:block) : block =
   match rec_x1, rec_x2 with
   | w, w_prime -> (mUL2ASC (aDDC w  w_prime))

and mUL2ASC (rec_x1:pair) : block =
   match rec_x1 with
   | (BuildPair (wcarry, w)) -> (aDD w  (aDD wcarry  wcarry))

and squareHalf (rec_x1:half) : block =
   match rec_x1 with
   | h -> (mulHalf h  h)

and q (rec_x1:octet) : block =
   match rec_x1 with
   | o -> (squareHalf (addHalf (BuildHalf (x00, o))  x0001))

and j1_2 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 w  w)

and j1_4 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (j1_2 w)  (j1_2 w))

and j1_6 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (j1_2 w)  (j1_4 w))

and j1_8 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (j1_2 w)  (j1_6 w))

and j2_2 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 w  w)

and j2_4 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (j2_2 w)  (j2_2 w))

and j2_6 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (j2_2 w)  (j2_4 w))

and j2_8 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (j2_2 w)  (j2_6 w))

and k1_2 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 w  w)

and k1_4 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (k1_2 w)  (k1_2 w))

and k1_5 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 w  (k1_4 w))

and k1_7 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (k1_2 w)  (k1_5 w))

and k1_9 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL1 (k1_2 w)  (k1_7 w))

and k2_2 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 w  w)

and k2_4 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (k2_2 w)  (k2_2 w))

and k2_5 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 w  (k2_4 w))

and k2_7 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (k2_2 w)  (k2_5 w))

and k2_9 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (mUL2 (k2_2 w)  (k2_7 w))

and h4 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (j1_4 w)  (j2_4 w))

and h6 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (j1_6 w)  (j2_6 w))

and h8 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (j1_8 w)  (j2_8 w))

and h0 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (k1_5 w)  (k2_5 w))

and h5 (rec_x1:block) (rec_x2:octet) : block =
   match rec_x1, rec_x2 with
   | w, o -> (mUL2 (h0 w)  (q o))

and h7 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (k1_7 w)  (k2_7 w))

and h9 (rec_x1:block) : block =
   match rec_x1 with
   | w -> (xOR (k1_9 w)  (k2_9 w))

and splitSegment (rec_x1:message) : segmentedMessage =
   match rec_x1 with
   | (UnitMessage w) -> (UnitSegment (UnitMessage w))
   | (ConsMessage (w, m)) -> (cutSegment m  (UnitMessage w)  n254)

and cutSegment (rec_x1:message) (rec_x2:message) (rec_x3:nat) : segmentedMessage =
   match rec_x1, rec_x2, rec_x3 with
   | (UnitMessage w), m_prime, n -> (UnitSegment (reverseMessage (ConsMessage (w, m_prime))))
   | (ConsMessage (w, m)), m_prime, Zero -> (ConsSegment ((reverseMessage (ConsMessage (w, m_prime))), (splitSegment m)))
   | (ConsMessage (w, m)), m_prime, (Succ n) -> (cutSegment m  (ConsMessage (w, m_prime))  n)

and preludeXY (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w1, w2 -> (preludeXY_prime (bYT w1  w2)  (pAT w1  w2))

and preludeVW (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w1, w2 -> (preludeVW_prime (bYT w1  w2))

and preludeST (rec_x1:block) (rec_x2:block) : pair =
   match rec_x1, rec_x2 with
   | w1, w2 -> (preludeST_prime (bYT w1  w2))

and preludeXY_prime (rec_x1:pair) (rec_x2:octet) : pair =
   match rec_x1, rec_x2 with
   | (BuildPair (w, w_prime)), o -> (bYT (h4 w)  (h5 w_prime  o))

and preludeVW_prime (rec_x1:pair) : pair =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (bYT (h6 w)  (h7 w_prime))

and preludeST_prime (rec_x1:pair) : pair =
   match rec_x1 with
   | (BuildPair (w, w_prime)) -> (bYT (h8 w)  (h9 w_prime))

and computeXY (rec_x1:pair) (rec_x2:pair) (rec_x3:block) : pair =
   match rec_x1, rec_x2, rec_x3 with
   | p, p_prime, w -> (computeXY_prime p  w  (xOR_prime (computeVW p_prime)))

and computeXY_prime (rec_x1:pair) (rec_x2:block) (rec_x3:block) : pair =
   match rec_x1, rec_x2, rec_x3 with
   | (BuildPair (w1, w2)), w, w_prime -> (BuildPair ((mUL1 (xOR w1  w)  (fIX1 (aDD (xOR w2  w)  w_prime))), (mUL2A (xOR w2  w)  (fIX2 (aDD (xOR w1  w)  w_prime)))))

and computeVW (rec_x1:pair) : pair =
   match rec_x1 with
   | (BuildPair (w1, w2)) -> (BuildPair ((cYC w1), w2))

and loop1 (rec_x1:pair) (rec_x2:pair) (rec_x3:message) : pair =
   match rec_x1, rec_x2, rec_x3 with
   | p, p_prime, (UnitMessage w) -> (computeXY p  p_prime  w)
   | p, p_prime, (ConsMessage (w, m)) -> (loop1 (computeXY p  p_prime  w)  (computeVW p_prime)  m)

and loop2 (rec_x1:pair) (rec_x2:pair) (rec_x3:message) : pair =
   match rec_x1, rec_x2, rec_x3 with
   | p, p_prime, (UnitMessage w) -> (computeVW p_prime)
   | p, p_prime, (ConsMessage (w, m)) -> (loop2 (computeXY p  p_prime  w)  (computeVW p_prime)  m)

and coda (rec_x1:pair) (rec_x2:pair) (rec_x3:pair) : block =
   match rec_x1, rec_x2, rec_x3 with
   | p, p_prime, (BuildPair (w, w_prime)) -> (xOR_prime (computeXY (computeXY p  p_prime  w)  (computeVW p_prime)  w_prime))

and mAA (rec_x1:key) (rec_x2:message) : block =
   match rec_x1, rec_x2 with
   | (BuildKey (w1, w2)), m -> (mAA_prime (preludeXY w1  w2)  (preludeVW w1  w2)  (preludeST w1  w2)  m)

and mAA_prime (rec_x1:pair) (rec_x2:pair) (rec_x3:pair) (rec_x4:message) : block =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | p1, p2, p3, m -> (coda (loop1 p1  p2  m)  (loop2 p1  p2  m)  p3)

and mAC (rec_x1:key) (rec_x2:message) : block =
   match rec_x1, rec_x2 with
   | k, m -> (mACfirst k  (splitSegment m))

and mACfirst (rec_x1:key) (rec_x2:segmentedMessage) : block =
   match rec_x1, rec_x2 with
   | k, (UnitSegment m) -> (mAA k  m)
   | k, (ConsSegment (m, s)) -> (mACnext k  (mAA k  m)  s)

and mACnext (rec_x1:key) (rec_x2:block) (rec_x3:segmentedMessage) : block =
   match rec_x1, rec_x2, rec_x3 with
   | k, w, (UnitSegment m) -> (mAA k  (ConsMessage (w, m)))
   | k, w, (ConsSegment (m, s)) -> (mACnext k  (mAA k  (ConsMessage (w, m)))  s)
;;

let main () =
   print_Bool ((eqBlock (mUL1 x0000000F  x0000000E)  x000000D2));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 xFFFFFFF0  x0000000E)  xFFFFFF2D));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 xFFFFFFF0  xFFFFFFF1)  x000000D2));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2 x0000000F  x0000000E)  x000000D2));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2 xFFFFFFF0  x0000000E)  xFFFFFF3A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2 xFFFFFFF0  xFFFFFFF1)  x000000B6));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x0000000F  x0000000E)  x000000D2));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A xFFFFFFF0  x0000000E)  xFFFFFF3A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x7FFFFFF0  xFFFFFFF1)  x800000C2));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A xFFFFFFF0  x7FFFFFF1)  x000000C4));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT x00000000  x00000000)  (BuildPair (x0103070F, x1F3F7FFF))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT xFFFF00FF  xFFFFFFFF)  (BuildPair (xFEFC07F0, xE0C08000))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT xAB00FFCD  xFFEF0001)  (BuildPair (xAB01FCCD, xF2EF3501))));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00000000  x00000000)  xFF));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT xFFFF00FF  xFFFFFFFF)  xFF));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT xAB00FFCD  xFFEF0001)  x6A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j1_2 x00000100)  x00010000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j1_4 x00000100)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j1_6 x00000100)  x00010000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j1_8 x00000100)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j2_2 x00000100)  x00010000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j2_4 x00000100)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j2_6 x00000100)  x00020000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (j2_8 x00000100)  x00000004));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h4 x00000100)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h6 x00000100)  x00030000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h8 x00000100)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k1_2 x00000080)  x00004000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k1_4 x00000080)  x10000000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k1_5 x00000080)  x00000008));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k1_7 x00000080)  x00020000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k1_9 x00000080)  x80000000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k2_2 x00000080)  x00004000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k2_4 x00000080)  x10000000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k2_5 x00000080)  x00000010));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k2_7 x00000080)  x00040000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (k2_9 x00000080)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h0 x00000080)  x00000018));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (q x01)  x00000004));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h5 x00000080  x01)  x00000060));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h7 x00000080)  x00060000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (h9 x00000080)  x80000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00000003  x00000060)  xEE));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00030000  x00060000)  xBB));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00000005  x80000002)  xE6));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT x00000003  x00000060)  (BuildPair (x01030703, x1D3B7760))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT x00030000  x00060000)  (BuildPair (x0103050B, x17065DBB))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (bYT x00000005  x80000002)  (BuildPair (x01030705, x80397302))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000003)  x00000006));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000006  x00000003)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000002  x00000005)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000003  x00000005)  x00000006));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  x00000006)  x0000000B));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  x00000007)  x0000000C));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x0000000B  x00000004)  x0000000F));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x0000000C  x00000001)  x0000000D));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x0000000F  xFFFFFFF7)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x0000000D  xFFFFFFFB)  x00000009));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 x00000007  x00000007)  x00000031));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x00000006  x00000009)  x00000036));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000031  x00000036)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000003)  x00000006));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000006  x00000003)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xFFFFFFFD  x00000001)  xFFFFFFFC));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xFFFFFFFC  x00000001)  xFFFFFFFD));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  xFFFFFFFD)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  xFFFFFFFC)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000002  x00000001)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000001  x00000004)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000003  xFFFFFFF9)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000005  xFFFFFFFC)  x00000004));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 xFFFFFFFC  x00000001)  xFFFFFFFC));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A xFFFFFFFD  x00000004)  xFFFFFFFA));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xFFFFFFFC  xFFFFFFFA)  x00000006));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000007)  x0000000E));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x0000000E  x00000007)  x00000009));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xFFFFFFFD  x00000008)  xFFFFFFF5));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xFFFFFFFC  x00000008)  xFFFFFFF4));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000009  xFFFFFFF4)  xFFFFFFFD));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000009  xFFFFFFF5)  xFFFFFFFE));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor xFFFFFFFD  x00000001)  xFFFFFFFD));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor xFFFFFFFE  x00000002)  xFFFFFFFE));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand xFFFFFFFD  xFFFFFFFE)  xFFFFFFFC));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand xFFFFFFFE  x7FFFFFFD)  x7FFFFFFC));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 xFFFFFFF5  xFFFFFFFC)  x0000001E));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A xFFFFFFF4  x7FFFFFFC)  x0000001E));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x0000001E  x0000001E)  x00000000));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000001)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000002  x00000001)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000001  x00000000)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000002  x00000000)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000003  x00000002)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000003  x00000001)  x00000004));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000005  x00000002)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000004  x00000001)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000007  xFFFFFFFB)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000005  xFFFFFFFB)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 x00000001  x00000003)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x00000002  x00000001)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000003  x00000002)  x00000001));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000002)  x00000004));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000004  x00000001)  x00000005));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000003  x00000001)  x00000002));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000002  x00000001)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  x00000003)  x00000008));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000005  x00000002)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000008  x00000002)  x0000000A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000007  x00000001)  x00000007));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x0000000A  xFFFFFFFB)  x0000000A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000007  xFFFFFFFB)  x00000003));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 x00000002  x0000000A)  x00000014));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x00000003  x00000003)  x00000009));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000014  x00000009)  x0000001D));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC x00000004)  x00000008));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000008  x00000001)  x00000009));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000014  x00000002)  x00000016));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x00000009  x00000002)  x0000000B));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000009  x0000000B)  x00000014));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x00000009  x00000016)  x0000001F));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x00000014  x00000002)  x00000016));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor x0000001F  x00000001)  x0000001F));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x00000016  xFFFFFFFB)  x00000012));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand x0000001F  xFFFFFFFB)  x0000001B));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 x00000016  x00000012)  x0000018C));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x0000000B  x0000001B)  x00000129));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x0000018C  x00000129)  x000000A5));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (cYC xC4EB1AEB)  x89D635D7));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x89D635D7  xF6A09667)  x7F76A3B0));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x21D869BA  x0A202020)  x2BF8499A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x7792F9D4  x0A202020)  x7DB2D9F4));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x7F76A3B0  x7DB2D9F4)  xFD297DA4));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (aDD x7F76A3B0  x2BF8499A)  xAB6EED4A));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor xFD297DA4  x02040801)  xFF2D7DA5));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (yor xAB6EED4A  x00804021)  xABEEED6B));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand xFF2D7DA5  xBFEF7FDF)  xBF2D7D85));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xand xABEEED6B  x7DFEFBFF)  x29EEE96B));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL1 x2BF8499A  xBF2D7D85)  x0AD67E20));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mUL2A x7DB2D9F4  x29EEE96B)  x30261492));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00FF00FF  x00000000)  xFF));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeXY x00FF00FF  x00000000)  (BuildPair (x4A645A01, x50DEC930))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeVW x00FF00FF  x00000000)  (BuildPair (x5CCA3239, xFECCAA6E))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeST x00FF00FF  x00000000)  (BuildPair (x51EDE9C7, x24B66FB5))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4A645A01, x50DEC930))  x55555555  (xOR (nCYC n1  x5CCA3239)  xFECCAA6E))  (BuildPair (x48B204D6, x5834A585))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x48B204D6, x5834A585))  xAAAAAAAA  (xOR (nCYC n2  x5CCA3239)  xFECCAA6E))  (BuildPair (x4F998E01, xBE9F0917))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4F998E01, xBE9F0917))  x51EDE9C7  (xOR (nCYC n3  x5CCA3239)  xFECCAA6E))  (BuildPair (x344925FC, xDB9102B0))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x344925FC, xDB9102B0))  x24B66FB5  (xOR (nCYC n4  x5CCA3239)  xFECCAA6E))  (BuildPair (x277B4B25, xD636250D))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x277B4B25  xD636250D)  xF14D6E28));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x00FF00FF  x00000000)  xFF));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeXY x00FF00FF  x00000000)  (BuildPair (x4A645A01, x50DEC930))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeVW x00FF00FF  x00000000)  (BuildPair (x5CCA3239, xFECCAA6E))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeST x00FF00FF  x00000000)  (BuildPair (x51EDE9C7, x24B66FB5))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4A645A01, x50DEC930))  xAAAAAAAA  (xOR (nCYC n1  x5CCA3239)  xFECCAA6E))  (BuildPair (x6AEBACF8, x9DB15CF6))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x6AEBACF8, x9DB15CF6))  x55555555  (xOR (nCYC n2  x5CCA3239)  xFECCAA6E))  (BuildPair (x270EEDAF, xB8142629))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x270EEDAF, xB8142629))  x51EDE9C7  (xOR (nCYC n3  x5CCA3239)  xFECCAA6E))  (BuildPair (x29907CD8, xBA92DB12))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x29907CD8, xBA92DB12))  x24B66FB5  (xOR (nCYC n4  x5CCA3239)  xFECCAA6E))  (BuildPair (x28EAD8B3, x81D10CA3))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x28EAD8B3  x81D10CA3)  xA93BD410));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x55555555  x5A35D667)  x00));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeXY x55555555  x5A35D667)  (BuildPair (x34ACF886, x7397C9AE))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeVW x55555555  x5A35D667)  (BuildPair (x7201F4DC, x2829040B))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeST x55555555  x5A35D667)  (BuildPair (x9E2E7B36, x13647149))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x34ACF886, x7397C9AE))  x00000000  (xOR (nCYC n1  x7201F4DC)  x2829040B))  (BuildPair (x2FD76FFB, x550D91CE))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x2FD76FFB, x550D91CE))  xFFFFFFFF  (xOR (nCYC n2  x7201F4DC)  x2829040B))  (BuildPair (xA70FC148, x1D10D8D3))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xA70FC148, x1D10D8D3))  x9E2E7B36  (xOR (nCYC n3  x7201F4DC)  x2829040B))  (BuildPair (xB1CC1CC5, x29C1485F))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xB1CC1CC5, x29C1485F))  x13647149  (xOR (nCYC n4  x7201F4DC)  x2829040B))  (BuildPair (x288FC786, x9115A558))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR x288FC786  x9115A558)  xB99A62DE));
   print_newline ();
   flush stdout;
   print_Bool ((eqOctet (pAT x55555555  x5A35D667)  x00));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeXY x55555555  x5A35D667)  (BuildPair (x34ACF886, x7397C9AE))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeVW x55555555  x5A35D667)  (BuildPair (x7201F4DC, x2829040B))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeST x55555555  x5A35D667)  (BuildPair (x9E2E7B36, x13647149))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x34ACF886, x7397C9AE))  xFFFFFFFF  (xOR (nCYC n1  x7201F4DC)  x2829040B))  (BuildPair (x8DC8BBDE, xFE4E5BDD))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x8DC8BBDE, xFE4E5BDD))  x00000000  (xOR (nCYC n2  x7201F4DC)  x2829040B))  (BuildPair (xCBC865BA, x0297AF6F))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xCBC865BA, x0297AF6F))  x9E2E7B36  (xOR (nCYC n3  x7201F4DC)  x2829040B))  (BuildPair (x3CF3A7D2, x160EE9B5))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x3CF3A7D2, x160EE9B5))  x13647149  (xOR (nCYC n4  x7201F4DC)  x2829040B))  (BuildPair (xD0482465, x7050EC5E))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (xOR xD0482465  x7050EC5E)  xA018C83B));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeXY xE6A12F07  x9D15C437)  (BuildPair (x21D869BA, x7792F9D4))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeVW xE6A12F07  x9D15C437)  (BuildPair (xC4EB1AEB, xF6A09667))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (preludeST xE6A12F07  x9D15C437)  (BuildPair (x6D67E884, xA511987A))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x204E80A7, x077788A2))  x00000000  (xOR (nCYC n1  x17A808FD)  xFEA1D334))  (BuildPair (x303FF4AA, x1277A6D4))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x303FF4AA, x1277A6D4))  x00000000  (xOR (nCYC n2  x17A808FD)  xFEA1D334))  (BuildPair (x55DD063F, x4C49AAE0))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x55DD063F, x4C49AAE0))  x00000000  (xOR (nCYC n3  x17A808FD)  xFEA1D334))  (BuildPair (x51AF3C1D, x5BC02502))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x51AF3C1D, x5BC02502))  x00000000  (xOR (nCYC n4  x17A808FD)  xFEA1D334))  (BuildPair (xA44AAAC0, x63C70DBA))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xA44AAAC0, x63C70DBA))  x00000000  (xOR (nCYC n5  x17A808FD)  xFEA1D334))  (BuildPair (x4D53901A, x2E80AC30))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4D53901A, x2E80AC30))  x00000000  (xOR (nCYC n6  x17A808FD)  xFEA1D334))  (BuildPair (x5F38EEF1, x2A6091AE))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x5F38EEF1, x2A6091AE))  x00000000  (xOR (nCYC n7  x17A808FD)  xFEA1D334))  (BuildPair (xF0239DD5, x3DD81AC6))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xF0239DD5, x3DD81AC6))  x00000000  (xOR (nCYC n8  x17A808FD)  xFEA1D334))  (BuildPair (xEB35B97F, x9372CDC6))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xEB35B97F, x9372CDC6))  x00000000  (xOR (nCYC n9  x17A808FD)  xFEA1D334))  (BuildPair (x4DA124A1, xC6B1317E))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4DA124A1, xC6B1317E))  x00000000  (xOR (nCYC n10  x17A808FD)  xFEA1D334))  (BuildPair (x7F839576, x74B39176))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x7F839576, x74B39176))  x00000000  (xOR (nCYC n11  x17A808FD)  xFEA1D334))  (BuildPair (x11A9D254, xD78634BC))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x11A9D254, xD78634BC))  x00000000  (xOR (nCYC n12  x17A808FD)  xFEA1D334))  (BuildPair (xD8804CA5, xFDC1A8BA))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xD8804CA5, xFDC1A8BA))  x00000000  (xOR (nCYC n13  x17A808FD)  xFEA1D334))  (BuildPair (x3F6F7248, x11AC46B8))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x3F6F7248, x11AC46B8))  x00000000  (xOR (nCYC n14  x17A808FD)  xFEA1D334))  (BuildPair (xACBC13DD, x33D5A466))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xACBC13DD, x33D5A466))  x00000000  (xOR (nCYC n15  x17A808FD)  xFEA1D334))  (BuildPair (x4CE933E1, xC21A1846))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x4CE933E1, xC21A1846))  x00000000  (xOR (nCYC n16  x17A808FD)  xFEA1D334))  (BuildPair (xC1ED90DD, xCD959B46))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xC1ED90DD, xCD959B46))  x00000000  (xOR (nCYC n17  x17A808FD)  xFEA1D334))  (BuildPair (x3CD54DEB, x613F8E2A))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x3CD54DEB, x613F8E2A))  x00000000  (xOR (nCYC n18  x17A808FD)  xFEA1D334))  (BuildPair (xBBA57835, x07C72EAA))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xBBA57835, x07C72EAA))  x00000000  (xOR (nCYC n19  x17A808FD)  xFEA1D334))  (BuildPair (xD7843FDC, x6AD6E8A4))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (xD7843FDC, x6AD6E8A4))  x00000000  (xOR (nCYC n20  x17A808FD)  xFEA1D334))  (BuildPair (x5EBA06C2, x91896CFA))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x5EBA06C2, x91896CFA))  x76232E5F  (xOR (nCYC n21  x17A808FD)  xFEA1D334))  (BuildPair (x1D9C9655, x98D1CC75))));
   print_newline ();
   flush stdout;
   print_Bool ((eqPair (computeXY_prime (BuildPair (x1D9C9655, x98D1CC75))  x4FB1138A  (xOR (nCYC n22  x17A808FD)  xFEA1D334))  (BuildPair (x7BC180AB, xA0B87B77))));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mAC (BuildKey (x80018001, x80018000))  (makeMessage n20  x00000000  x00000000))  xDB79FBDC));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mAC (BuildKey (x80018001, x80018000))  (makeMessage n16  x00000000  x07050301))  x8CE37709));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mAC (BuildKey (x80018001, x80018000))  (makeMessage n256  x00000000  x07050301))  x717153D5));
   print_newline ();
   flush stdout;
   print_Bool ((eqBlock (mAC (BuildKey (x80018001, x80018000))  (makeMessage n4100  x00000000  x07050301))  x7783C51D));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
