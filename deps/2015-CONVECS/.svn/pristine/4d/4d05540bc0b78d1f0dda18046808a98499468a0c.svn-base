// TOM-B
import maa.term.*;
import maa.term.types.*;
public class Maa {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xfalse()
      | Xtrue()
    Bit =
      | x0()
      | x1()
    Octet =
      | buildOctet(rec_x1_1:Bit, rec_x2_1:Bit, rec_x3_1:Bit, rec_x4_1:Bit, rec_x5_1:Bit, rec_x6_1:Bit, rec_x7_1:Bit, rec_x8_1:Bit)
    OctetSum =
      | buildOctetSum(rec_x1_1:Bit, rec_x2_1:Octet)
    Half =
      | buildHalf(rec_x1_1:Octet, rec_x2_1:Octet)
    HalfSum =
      | buildHalfSum(rec_x1_1:Bit, rec_x2_1:Half)
    Block =
      | buildBlock(rec_x1_1:Octet, rec_x2_1:Octet, rec_x3_1:Octet, rec_x4_1:Octet)
    BlockSum =
      | buildBlockSum(rec_x1_1:Bit, rec_x2_1:Block)
    Pair =
      | buildPair(rec_x1_1:Block, rec_x2_1:Block)
    Xnat =
      | zero()
      | succ(rec_x1_1:Xnat)
    Key =
      | buildKey(rec_x1_1:Block, rec_x2_1:Block)
    Message =
      | unitMessage(rec_x1_1:Block)
      | consMessage(rec_x1_2:Block, rec_x2_2:Message)
    SegmentedMessage =
      | unitSegment(rec_x1_1:Message)
      | consSegment(rec_x1_2:Message, rec_x2_2:SegmentedMessage)
  }

  private static Xbool notBool (Xbool rec_x1) {
    %match (Xbool rec_x1) {
      Xfalse() -> { return `Xtrue(); }
      Xtrue() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function notBool()");
  }

  private static Xbool andBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      Xfalse(), L -> { return `Xfalse(); }
      Xtrue(), L -> { return `L; }
    }
    throw new RuntimeException ("incomplete match in function andBool()");
  }

  private static Xbool orBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      Xfalse(), L -> { return `L; }
      Xtrue(), L -> { return `Xtrue(); }
    }
    throw new RuntimeException ("incomplete match in function orBool()");
  }

  private static Xbool xorBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      Xfalse(), L -> { return `L; }
      Xtrue(), L -> { return `notBool (L); }
    }
    throw new RuntimeException ("incomplete match in function xorBool()");
  }

  private static Bit notBit (Bit rec_x1) {
    %match (Bit rec_x1) {
      x0() -> { return `x1(); }
      x1() -> { return `x0(); }
    }
    throw new RuntimeException ("incomplete match in function notBit()");
  }

  private static Bit andBit (Bit rec_x1, Bit rec_x2) {
    %match (Bit rec_x1, Bit rec_x2) {
      B, x0() -> { return `x0(); }
      B, x1() -> { return `B; }
    }
    throw new RuntimeException ("incomplete match in function andBit()");
  }

  private static Bit orBit (Bit rec_x1, Bit rec_x2) {
    %match (Bit rec_x1, Bit rec_x2) {
      B, x0() -> { return `B; }
      B, x1() -> { return `x1(); }
    }
    throw new RuntimeException ("incomplete match in function orBit()");
  }

  private static Bit xorBit (Bit rec_x1, Bit rec_x2) {
    %match (Bit rec_x1, Bit rec_x2) {
      B, x0() -> { return `B; }
      B, x1() -> { return `notBit (B); }
    }
    throw new RuntimeException ("incomplete match in function xorBit()");
  }

  private static Octet x00 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet x01 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), x0(), x1());
  }

  private static Half x0000 () {
    return `buildHalf (x00(), x00());
  }

  private static Half HalfU (Block rec_x1) {
    %match (Block rec_x1) {
      buildBlock (O1, O2, O3, O4) -> { return `buildHalf (O1, O2); }
    }
    throw new RuntimeException ("incomplete match in function HalfU()");
  }

  private static Half HalfL (Block rec_x1) {
    %match (Block rec_x1) {
      buildBlock (O1, O2, O3, O4) -> { return `buildHalf (O3, O4); }
    }
    throw new RuntimeException ("incomplete match in function HalfL()");
  }

  private static Xbool eqBit (Bit rec_x1, Bit rec_x2) {
    %match (Bit rec_x1, Bit rec_x2) {
      x0(), x0() -> { return `Xtrue(); }
      x0(), x1() -> { return `Xfalse(); }
      x1(), x0() -> { return `Xfalse(); }
      x1(), x1() -> { return `Xtrue(); }
    }
    throw new RuntimeException ("incomplete match in function eqBit()");
  }

  private static Xbool eqOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B_prime1, B_prime2, B_prime3, B_prime4, B_prime5, B_prime6, B_prime7, B_prime8) -> { return `andBool (eqBit (B1, B_prime1), andBool (eqBit (B2, B_prime2), andBool (eqBit (B3, B_prime3), andBool (eqBit (B4, B_prime4), andBool (eqBit (B5, B_prime5), andBool (eqBit (B6, B_prime6), andBool (eqBit (B7, B_prime7), eqBit (B8, B_prime8)))))))); }
    }
    throw new RuntimeException ("incomplete match in function eqOctet()");
  }

  private static Xbool eqOctetSum (OctetSum rec_x1, OctetSum rec_x2) {
    %match (OctetSum rec_x1, OctetSum rec_x2) {
      buildOctetSum (B, O), buildOctetSum (B_prime, O_prime) -> { return `andBool (eqBit (B, B_prime), eqOctet (O, O_prime)); }
    }
    throw new RuntimeException ("incomplete match in function eqOctetSum()");
  }

  private static Xbool eqHalf (Half rec_x1, Half rec_x2) {
    %match (Half rec_x1, Half rec_x2) {
      buildHalf (O1, O2), buildHalf (O_prime1, O_prime2) -> { return `andBool (eqOctet (O1, O_prime1), eqOctet (O2, O_prime2)); }
    }
    throw new RuntimeException ("incomplete match in function eqHalf()");
  }

  private static Xbool eqHalfSum (HalfSum rec_x1, HalfSum rec_x2) {
    %match (HalfSum rec_x1, HalfSum rec_x2) {
      buildHalfSum (B, H), buildHalfSum (B_prime, H_prime) -> { return `andBool (eqBit (B, B_prime), eqHalf (H, H_prime)); }
    }
    throw new RuntimeException ("incomplete match in function eqHalfSum()");
  }

  private static Xbool eqBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `andBool (andBool (eqOctet (O1, O_prime1), eqOctet (O2, O_prime2)), andBool (eqOctet (O3, O_prime3), eqOctet (O4, O_prime4))); }
    }
    throw new RuntimeException ("incomplete match in function eqBlock()");
  }

  private static Xbool eqBlockSum (BlockSum rec_x1, BlockSum rec_x2) {
    %match (BlockSum rec_x1, BlockSum rec_x2) {
      buildBlockSum (B, W), buildBlockSum (B_prime, W_prime) -> { return `andBool (eqBit (B, B_prime), eqBlock (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function eqBlockSum()");
  }

  private static Xbool eqPair (Pair rec_x1, Pair rec_x2) {
    %match (Pair rec_x1, Pair rec_x2) {
      buildPair (W1, W2), buildPair (W_prime1, W_prime2) -> { return `andBool (eqBlock (W1, W_prime1), eqBlock (W2, W_prime2)); }
    }
    throw new RuntimeException ("incomplete match in function eqPair()");
  }

  private static Bit addBit (Bit rec_x1, Bit rec_x2, Bit rec_x3) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3) {
      B, B_prime, Bcarry -> { return `xorBit (xorBit (B, B_prime), Bcarry); }
    }
    throw new RuntimeException ("incomplete match in function addBit()");
  }

  private static Bit carBit (Bit rec_x1, Bit rec_x2, Bit rec_x3) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3) {
      B, B_prime, Bcarry -> { return `orBit (andBit (andBit (B, B_prime), notBit (Bcarry)), andBit (orBit (B, B_prime), Bcarry)); }
    }
    throw new RuntimeException ("incomplete match in function carBit()");
  }

  private static OctetSum addOctetSum (Octet rec_x1, Octet rec_x2, Bit rec_x3) {
    %match (Octet rec_x1, Octet rec_x2, Bit rec_x3) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B_prime1, B_prime2, B_prime3, B_prime4, B_prime5, B_prime6, B_prime7, B_prime8), Bcarry -> { return `addOctet8 (B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, B7, B_prime7, B8, B_prime8, Bcarry); }
    }
    throw new RuntimeException ("incomplete match in function addOctetSum()");
  }

  private static OctetSum addOctet8 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15, Bit rec_x16, Bit rec_x17) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15, Bit rec_x16, Bit rec_x17) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, B7, B_prime7, B8, B_prime8, Bcarry -> { return `addOctet7 (B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, B7, B_prime7, carBit (B8, B_prime8, Bcarry), addBit (B8, B_prime8, Bcarry)); }
    }
    throw new RuntimeException ("incomplete match in function addOctet8()");
  }

  private static OctetSum addOctet7 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15, Bit rec_x16) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15, Bit rec_x16) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, B7, B_prime7, Bcarry, B_second8 -> { return `addOctet6 (B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, carBit (B7, B_prime7, Bcarry), addBit (B7, B_prime7, Bcarry), B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet7()");
  }

  private static OctetSum addOctet6 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14, Bit rec_x15) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, B6, B_prime6, Bcarry, B_second7, B_second8 -> { return `addOctet5 (B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, carBit (B6, B_prime6, Bcarry), addBit (B6, B_prime6, Bcarry), B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet6()");
  }

  private static OctetSum addOctet5 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13, Bit rec_x14) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, B5, B_prime5, Bcarry, B_second6, B_second7, B_second8 -> { return `addOctet4 (B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, carBit (B5, B_prime5, Bcarry), addBit (B5, B_prime5, Bcarry), B_second6, B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet5()");
  }

  private static OctetSum addOctet4 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12, Bit rec_x13) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, B4, B_prime4, Bcarry, B_second5, B_second6, B_second7, B_second8 -> { return `addOctet3 (B1, B_prime1, B2, B_prime2, B3, B_prime3, carBit (B4, B_prime4, Bcarry), addBit (B4, B_prime4, Bcarry), B_second5, B_second6, B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet4()");
  }

  private static OctetSum addOctet3 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11, Bit rec_x12) {
      B1, B_prime1, B2, B_prime2, B3, B_prime3, Bcarry, B_second4, B_second5, B_second6, B_second7, B_second8 -> { return `addOctet2 (B1, B_prime1, B2, B_prime2, carBit (B3, B_prime3, Bcarry), addBit (B3, B_prime3, Bcarry), B_second4, B_second5, B_second6, B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet3()");
  }

  private static OctetSum addOctet2 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10, Bit rec_x11) {
      B1, B_prime1, B2, B_prime2, Bcarry, B_second3, B_second4, B_second5, B_second6, B_second7, B_second8 -> { return `addOctet1 (B1, B_prime1, carBit (B2, B_prime2, Bcarry), addBit (B2, B_prime2, Bcarry), B_second3, B_second4, B_second5, B_second6, B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet2()");
  }

  private static OctetSum addOctet1 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9, Bit rec_x10) {
      B1, B_prime1, Bcarry, B_second2, B_second3, B_second4, B_second5, B_second6, B_second7, B_second8 -> { return `addOctet0 (carBit (B1, B_prime1, Bcarry), addBit (B1, B_prime1, Bcarry), B_second2, B_second3, B_second4, B_second5, B_second6, B_second7, B_second8); }
    }
    throw new RuntimeException ("incomplete match in function addOctet1()");
  }

  private static OctetSum addOctet0 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Bit rec_x9) {
      Bcarry, B_second1, B_second2, B_second3, B_second4, B_second5, B_second6, B_second7, B_second8 -> { return `buildOctetSum (Bcarry, buildOctet (B_second1, B_second2, B_second3, B_second4, B_second5, B_second6, B_second7, B_second8)); }
    }
    throw new RuntimeException ("incomplete match in function addOctet0()");
  }

  private static Octet dropCarryOctetSum (OctetSum rec_x1) {
    %match (OctetSum rec_x1) {
      buildOctetSum (Bcarry, O) -> { return `O; }
    }
    throw new RuntimeException ("incomplete match in function dropCarryOctetSum()");
  }

  private static Octet addOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      O, O_prime -> { return `dropCarryOctetSum (addOctetSum (O, O_prime, x0())); }
    }
    throw new RuntimeException ("incomplete match in function addOctet()");
  }

  private static HalfSum addHalfSum (Half rec_x1, Half rec_x2) {
    %match (Half rec_x1, Half rec_x2) {
      buildHalf (O1, O2), buildHalf (O_prime1, O_prime2) -> { return `addHalf2 (O1, O_prime1, O2, O_prime2); }
    }
    throw new RuntimeException ("incomplete match in function addHalfSum()");
  }

  private static HalfSum addHalf2 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
      O1, O_prime1, O2, O_prime2 -> { return `addHalf1 (O1, O_prime1, addOctetSum (O2, O_prime2, x0())); }
    }
    throw new RuntimeException ("incomplete match in function addHalf2()");
  }

  private static HalfSum addHalf1 (Octet rec_x1, Octet rec_x2, OctetSum rec_x3) {
    %match (Octet rec_x1, Octet rec_x2, OctetSum rec_x3) {
      O1, O_prime1, buildOctetSum (B, O_second2) -> { return `addHalf0 (addOctetSum (O1, O_prime1, B), O_second2); }
    }
    throw new RuntimeException ("incomplete match in function addHalf1()");
  }

  private static HalfSum addHalf0 (OctetSum rec_x1, Octet rec_x2) {
    %match (OctetSum rec_x1, Octet rec_x2) {
      buildOctetSum (B, O_second1), O_second2 -> { return `buildHalfSum (B, buildHalf (O_second1, O_second2)); }
    }
    throw new RuntimeException ("incomplete match in function addHalf0()");
  }

  private static Half dropCarryHalfSum (HalfSum rec_x1) {
    %match (HalfSum rec_x1) {
      buildHalfSum (B, H) -> { return `H; }
    }
    throw new RuntimeException ("incomplete match in function dropCarryHalfSum()");
  }

  private static Half addHalf (Half rec_x1, Half rec_x2) {
    %match (Half rec_x1, Half rec_x2) {
      H, H_prime -> { return `dropCarryHalfSum (addHalfSum (H, H_prime)); }
    }
    throw new RuntimeException ("incomplete match in function addHalf()");
  }

  private static Half addHalfOctet (Octet rec_x1, Half rec_x2) {
    %match (Octet rec_x1, Half rec_x2) {
      O, H -> { return `addHalf (buildHalf (x00(), O), H); }
    }
    throw new RuntimeException ("incomplete match in function addHalfOctet()");
  }

  private static Half addHalfOctets (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      O, O_prime -> { return `addHalf (buildHalf (x00(), O), buildHalf (x00(), O_prime)); }
    }
    throw new RuntimeException ("incomplete match in function addHalfOctets()");
  }

  private static BlockSum addBlockSum (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `addBlock4 (O1, O_prime1, O2, O_prime2, O3, O_prime3, O4, O_prime4); }
    }
    throw new RuntimeException ("incomplete match in function addBlockSum()");
  }

  private static BlockSum addBlock4 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8) {
      O1, O_prime1, O2, O_prime2, O3, O_prime3, O4, O_prime4 -> { return `addBlock3 (O1, O_prime1, O2, O_prime2, O3, O_prime3, addOctetSum (O4, O_prime4, x0())); }
    }
    throw new RuntimeException ("incomplete match in function addBlock4()");
  }

  private static BlockSum addBlock3 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, OctetSum rec_x7) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, OctetSum rec_x7) {
      O1, O_prime1, O2, O_prime2, O3, O_prime3, buildOctetSum (Bcarry, O_second4) -> { return `addBlock2 (O1, O_prime1, O2, O_prime2, addOctetSum (O3, O_prime3, Bcarry), O_second4); }
    }
    throw new RuntimeException ("incomplete match in function addBlock3()");
  }

  private static BlockSum addBlock2 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, OctetSum rec_x5, Octet rec_x6) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, OctetSum rec_x5, Octet rec_x6) {
      O1, O_prime1, O2, O_prime2, buildOctetSum (Bcarry, O_second3), O_second4 -> { return `addBlock1 (O1, O_prime1, addOctetSum (O2, O_prime2, Bcarry), O_second3, O_second4); }
    }
    throw new RuntimeException ("incomplete match in function addBlock2()");
  }

  private static BlockSum addBlock1 (Octet rec_x1, Octet rec_x2, OctetSum rec_x3, Octet rec_x4, Octet rec_x5) {
    %match (Octet rec_x1, Octet rec_x2, OctetSum rec_x3, Octet rec_x4, Octet rec_x5) {
      O1, O_prime1, buildOctetSum (Bcarry, O_second2), O_second3, O_second4 -> { return `addBlock0 (addOctetSum (O1, O_prime1, Bcarry), O_second2, O_second3, O_second4); }
    }
    throw new RuntimeException ("incomplete match in function addBlock1()");
  }

  private static BlockSum addBlock0 (OctetSum rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
    %match (OctetSum rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
      buildOctetSum (Bcarry, O_second1), O_second2, O_second3, O_second4 -> { return `buildBlockSum (Bcarry, buildBlock (O_second1, O_second2, O_second3, O_second4)); }
    }
    throw new RuntimeException ("incomplete match in function addBlock0()");
  }

  private static Block dropCarryBlockSum (BlockSum rec_x1) {
    %match (BlockSum rec_x1) {
      buildBlockSum (Bcarry, W) -> { return `W; }
    }
    throw new RuntimeException ("incomplete match in function dropCarryBlockSum()");
  }

  private static Block addBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `dropCarryBlockSum (addBlockSum (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function addBlock()");
  }

  private static Block addBlockHalf (Half rec_x1, Block rec_x2) {
    %match (Half rec_x1, Block rec_x2) {
      buildHalf (O1, O2), W -> { return `addBlock (buildBlock (x00(), x00(), O1, O2), W); }
    }
    throw new RuntimeException ("incomplete match in function addBlockHalf()");
  }

  private static Block addBlockHalves (Half rec_x1, Half rec_x2) {
    %match (Half rec_x1, Half rec_x2) {
      buildHalf (O1, O2), buildHalf (O_prime1, O_prime2) -> { return `addBlock (buildBlock (x00(), x00(), O1, O2), buildBlock (x00(), x00(), O_prime1, O_prime2)); }
    }
    throw new RuntimeException ("incomplete match in function addBlockHalves()");
  }

  private static Octet leftOctet1 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B2, B3, B4, B5, B6, B7, B8, x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet1()");
  }

  private static Octet leftOctet2 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B3, B4, B5, B6, B7, B8, x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet2()");
  }

  private static Octet leftOctet3 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B4, B5, B6, B7, B8, x0(), x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet3()");
  }

  private static Octet leftOctet4 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B5, B6, B7, B8, x0(), x0(), x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet4()");
  }

  private static Octet leftOctet5 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B6, B7, B8, x0(), x0(), x0(), x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet5()");
  }

  private static Octet leftOctet6 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B7, B8, x0(), x0(), x0(), x0(), x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet6()");
  }

  private static Octet leftOctet7 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (B8, x0(), x0(), x0(), x0(), x0(), x0(), x0()); }
    }
    throw new RuntimeException ("incomplete match in function leftOctet7()");
  }

  private static Octet rightOctet1 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), B1, B2, B3, B4, B5, B6, B7); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet1()");
  }

  private static Octet rightOctet2 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), B1, B2, B3, B4, B5, B6); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet2()");
  }

  private static Octet rightOctet3 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), x0(), B1, B2, B3, B4, B5); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet3()");
  }

  private static Octet rightOctet4 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), x0(), x0(), B1, B2, B3, B4); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet4()");
  }

  private static Octet rightOctet5 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), x0(), x0(), x0(), B1, B2, B3); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet5()");
  }

  private static Octet rightOctet6 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), B1, B2); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet6()");
  }

  private static Octet rightOctet7 (Octet rec_x1) {
    %match (Octet rec_x1) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8) -> { return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), x0(), B1); }
    }
    throw new RuntimeException ("incomplete match in function rightOctet7()");
  }

  private static Half mulOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), O_prime -> { return `mulOctet1 (B1, B2, B3, B4, B5, B6, B7, B8, O_prime, x0000()); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet()");
  }

  private static Half mulOctet1 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Octet rec_x9, Half rec_x10) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Bit rec_x8, Octet rec_x9, Half rec_x10) {
      x0(), B2, B3, B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet2 (B2, B3, B4, B5, B6, B7, B8, O_prime, H); }
      x1(), B2, B3, B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet2 (B2, B3, B4, B5, B6, B7, B8, O_prime, mulOctetA (H, rightOctet1 (O_prime), leftOctet7 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet1()");
  }

  private static Half mulOctet2 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Octet rec_x8, Half rec_x9) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Bit rec_x7, Octet rec_x8, Half rec_x9) {
      x0(), B3, B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet3 (B3, B4, B5, B6, B7, B8, O_prime, H); }
      x1(), B3, B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet3 (B3, B4, B5, B6, B7, B8, O_prime, mulOctetA (H, rightOctet2 (O_prime), leftOctet6 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet2()");
  }

  private static Half mulOctet3 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Octet rec_x7, Half rec_x8) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Bit rec_x6, Octet rec_x7, Half rec_x8) {
      x0(), B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet4 (B4, B5, B6, B7, B8, O_prime, H); }
      x1(), B4, B5, B6, B7, B8, O_prime, H -> { return `mulOctet4 (B4, B5, B6, B7, B8, O_prime, mulOctetA (H, rightOctet3 (O_prime), leftOctet5 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet3()");
  }

  private static Half mulOctet4 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Octet rec_x6, Half rec_x7) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Bit rec_x5, Octet rec_x6, Half rec_x7) {
      x0(), B5, B6, B7, B8, O_prime, H -> { return `mulOctet5 (B5, B6, B7, B8, O_prime, H); }
      x1(), B5, B6, B7, B8, O_prime, H -> { return `mulOctet5 (B5, B6, B7, B8, O_prime, mulOctetA (H, rightOctet4 (O_prime), leftOctet4 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet4()");
  }

  private static Half mulOctet5 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Octet rec_x5, Half rec_x6) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Bit rec_x4, Octet rec_x5, Half rec_x6) {
      x0(), B6, B7, B8, O_prime, H -> { return `mulOctet6 (B6, B7, B8, O_prime, H); }
      x1(), B6, B7, B8, O_prime, H -> { return `mulOctet6 (B6, B7, B8, O_prime, mulOctetA (H, rightOctet5 (O_prime), leftOctet3 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet5()");
  }

  private static Half mulOctet6 (Bit rec_x1, Bit rec_x2, Bit rec_x3, Octet rec_x4, Half rec_x5) {
    %match (Bit rec_x1, Bit rec_x2, Bit rec_x3, Octet rec_x4, Half rec_x5) {
      x0(), B7, B8, O_prime, H -> { return `mulOctet7 (B7, B8, O_prime, H); }
      x1(), B7, B8, O_prime, H -> { return `mulOctet7 (B7, B8, O_prime, mulOctetA (H, rightOctet6 (O_prime), leftOctet2 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet6()");
  }

  private static Half mulOctet7 (Bit rec_x1, Bit rec_x2, Octet rec_x3, Half rec_x4) {
    %match (Bit rec_x1, Bit rec_x2, Octet rec_x3, Half rec_x4) {
      x0(), B8, O_prime, H -> { return `mulOctet8 (B8, O_prime, H); }
      x1(), B8, O_prime, H -> { return `mulOctet8 (B8, O_prime, mulOctetA (H, rightOctet7 (O_prime), leftOctet1 (O_prime))); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet7()");
  }

  private static Half mulOctet8 (Bit rec_x1, Octet rec_x2, Half rec_x3) {
    %match (Bit rec_x1, Octet rec_x2, Half rec_x3) {
      x0(), O_prime, H -> { return `H; }
      x1(), O_prime, H -> { return `mulOctetA (H, x00(), O_prime); }
    }
    throw new RuntimeException ("incomplete match in function mulOctet8()");
  }

  private static Half mulOctetA (Half rec_x1, Octet rec_x2, Octet rec_x3) {
    %match (Half rec_x1, Octet rec_x2, Octet rec_x3) {
      buildHalf (O1, O2), O_prime1, O_prime2 -> { return `mulOctetB (addOctet (O1, O_prime1), addOctetSum (O2, O_prime2, x0())); }
    }
    throw new RuntimeException ("incomplete match in function mulOctetA()");
  }

  private static Half mulOctetB (Octet rec_x1, OctetSum rec_x2) {
    %match (Octet rec_x1, OctetSum rec_x2) {
      O1, buildOctetSum (x0(), O2) -> { return `buildHalf (O1, O2); }
      O1, buildOctetSum (x1(), O2) -> { return `buildHalf (addOctet (O1, x01()), O2); }
    }
    throw new RuntimeException ("incomplete match in function mulOctetB()");
  }

  private static Block mulHalf (Half rec_x1, Half rec_x2) {
    %match (Half rec_x1, Half rec_x2) {
      buildHalf (O1, O2), buildHalf (O_prime1, O_prime2) -> { return `mulHalfA (mulOctet (O1, O_prime1), mulOctet (O1, O_prime2), mulOctet (O2, O_prime1), mulOctet (O2, O_prime2)); }
    }
    throw new RuntimeException ("incomplete match in function mulHalf()");
  }

  private static Block mulHalfA (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
    %match (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
      buildHalf (O11U, O11L), buildHalf (O12U, O12L), buildHalf (O21U, O21L), buildHalf (O22U, O22L) -> { return `mulHalf4 (O11U, O11L, O12U, O12L, O21U, O21L, O22U, O22L); }
    }
    throw new RuntimeException ("incomplete match in function mulHalfA()");
  }

  private static Block mulHalf4 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8) {
      O11U, O11L, O12U, O12L, O21U, O21L, O22U, O_second4 -> { return `mulHalf3 (O11U, O11L, O12U, O21U, addHalfOctet (O12L, addHalfOctets (O21L, O22U)), O_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulHalf4()");
  }

  private static Block mulHalf3 (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Half rec_x5, Octet rec_x6) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Half rec_x5, Octet rec_x6) {
      O11U, O11L, O12U, O21U, buildHalf (Ocarry, O_second3), O_second4 -> { return `mulHalf2 (O11U, addHalfOctet (Ocarry, addHalfOctet (O11L, addHalfOctets (O12U, O21U))), O_second3, O_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulHalf3()");
  }

  private static Block mulHalf2 (Octet rec_x1, Half rec_x2, Octet rec_x3, Octet rec_x4) {
    %match (Octet rec_x1, Half rec_x2, Octet rec_x3, Octet rec_x4) {
      O11U, buildHalf (Ocarry, O_second2), O_second3, O_second4 -> { return `mulHalf1 (addHalfOctets (Ocarry, O11U), O_second2, O_second3, O_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulHalf2()");
  }

  private static Block mulHalf1 (Half rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
    %match (Half rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4) {
      buildHalf (Ocarry, O_second1), O_second2, O_second3, O_second4 -> { return `buildBlock (O_second1, O_second2, O_second3, O_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulHalf1()");
  }

  private static Pair mulBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W1, W2 -> { return `mulBlockA (mulHalf (HalfU (W1), HalfU (W2)), mulHalf (HalfU (W1), HalfL (W2)), mulHalf (HalfL (W1), HalfU (W2)), mulHalf (HalfL (W1), HalfL (W2))); }
    }
    throw new RuntimeException ("incomplete match in function mulBlock()");
  }

  private static Pair mulBlockA (Block rec_x1, Block rec_x2, Block rec_x3, Block rec_x4) {
    %match (Block rec_x1, Block rec_x2, Block rec_x3, Block rec_x4) {
      W11, W12, W21, W22 -> { return `mulBlock4 (HalfU (W11), HalfL (W11), HalfU (W12), HalfL (W12), HalfU (W21), HalfL (W21), HalfU (W22), HalfL (W22)); }
    }
    throw new RuntimeException ("incomplete match in function mulBlockA()");
  }

  private static Pair mulBlock4 (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4, Half rec_x5, Half rec_x6, Half rec_x7, Half rec_x8) {
    %match (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4, Half rec_x5, Half rec_x6, Half rec_x7, Half rec_x8) {
      H11U, H11L, H12U, H12L, H21U, H21L, H22U, H_second4 -> { return `mulBlock3 (H11U, H11L, H12U, H21U, addBlockHalf (H12L, addBlockHalves (H21L, H22U)), H_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulBlock4()");
  }

  private static Pair mulBlock3 (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4, Block rec_x5, Half rec_x6) {
    %match (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4, Block rec_x5, Half rec_x6) {
      H11U, H11L, H12U, H21U, W, H_second4 -> { return `mulBlock2 (H11U, addBlockHalf (HalfU (W), addBlockHalf (H11L, addBlockHalves (H12U, H21U))), HalfL (W), H_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulBlock3()");
  }

  private static Pair mulBlock2 (Half rec_x1, Block rec_x2, Half rec_x3, Half rec_x4) {
    %match (Half rec_x1, Block rec_x2, Half rec_x3, Half rec_x4) {
      H11U, W, H_second3, H_second4 -> { return `mulBlock1 (addBlockHalves (HalfU (W), H11U), HalfL (W), H_second3, H_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulBlock2()");
  }

  private static Pair mulBlock1 (Block rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
    %match (Block rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
      W, H_second2, H_second3, H_second4 -> { return `mulBlockB (HalfL (W), H_second2, H_second3, H_second4); }
    }
    throw new RuntimeException ("incomplete match in function mulBlock1()");
  }

  private static Pair mulBlockB (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
    %match (Half rec_x1, Half rec_x2, Half rec_x3, Half rec_x4) {
      buildHalf (O1U, O1L), buildHalf (O2U, O2L), buildHalf (O3U, O3L), buildHalf (O4U, O4L) -> { return `buildPair (buildBlock (O1U, O1L, O2U, O2L), buildBlock (O3U, O3L, O4U, O4L)); }
    }
    throw new RuntimeException ("incomplete match in function mulBlockB()");
  }

  private static Xnat addNat (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      N, zero() -> { return `N; }
      N, succ (N_prime) -> { return `addNat (succ (N), N_prime); }
    }
    throw new RuntimeException ("incomplete match in function addNat()");
  }

  private static Xnat multNat (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      N, zero() -> { return `zero(); }
      N, succ (N_prime) -> { return `addNat (N, multNat (N, N_prime)); }
    }
    throw new RuntimeException ("incomplete match in function multNat()");
  }

  private static Xbool eqNat (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      zero(), zero() -> { return `Xtrue(); }
      zero(), succ (N_prime) -> { return `Xfalse(); }
      succ (N), zero() -> { return `Xfalse(); }
      succ (N), succ (N_prime) -> { return `eqNat (N, N_prime); }
    }
    throw new RuntimeException ("incomplete match in function eqNat()");
  }

  private static Xbool ltNat (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      zero(), zero() -> { return `Xfalse(); }
      zero(), succ (N_prime) -> { return `Xtrue(); }
      succ (N_prime), zero() -> { return `Xfalse(); }
      succ (N), succ (N_prime) -> { return `ltNat (N, N_prime); }
    }
    throw new RuntimeException ("incomplete match in function ltNat()");
  }

  private static Xnat n1 () {
    return `succ (zero());
  }

  private static Xnat n2 () {
    return `succ (n1());
  }

  private static Xnat n3 () {
    return `succ (n2());
  }

  private static Xnat n4 () {
    return `succ (n3());
  }

  private static Xnat n5 () {
    return `succ (n4());
  }

  private static Xnat n6 () {
    return `succ (n5());
  }

  private static Xnat n7 () {
    return `succ (n6());
  }

  private static Xnat n8 () {
    return `succ (n7());
  }

  private static Xnat n9 () {
    return `succ (n8());
  }

  private static Xnat n10 () {
    return `succ (n9());
  }

  private static Xnat n11 () {
    return `succ (n10());
  }

  private static Xnat n12 () {
    return `succ (n11());
  }

  private static Xnat n13 () {
    return `succ (n12());
  }

  private static Xnat n14 () {
    return `succ (n13());
  }

  private static Xnat n15 () {
    return `succ (n14());
  }

  private static Xnat n16 () {
    return `succ (n15());
  }

  private static Xnat n17 () {
    return `succ (n16());
  }

  private static Xnat n18 () {
    return `succ (n17());
  }

  private static Xnat n19 () {
    return `succ (n18());
  }

  private static Xnat n20 () {
    return `succ (n19());
  }

  private static Xnat n21 () {
    return `succ (n20());
  }

  private static Xnat n22 () {
    return `succ (n21());
  }

  private static Xnat n254 () {
    return `addNat (n12(), multNat (n11(), n22()));
  }

  private static Xnat n256 () {
    return `multNat (n16(), n16());
  }

  private static Xnat n4100 () {
    return `addNat (n4(), multNat (n16(), n256()));
  }

  private static Octet andOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B_prime1, B_prime2, B_prime3, B_prime4, B_prime5, B_prime6, B_prime7, B_prime8) -> { return `buildOctet (andBit (B1, B_prime1), andBit (B2, B_prime2), andBit (B3, B_prime3), andBit (B4, B_prime4), andBit (B5, B_prime5), andBit (B6, B_prime6), andBit (B7, B_prime7), andBit (B8, B_prime8)); }
    }
    throw new RuntimeException ("incomplete match in function andOctet()");
  }

  private static Octet orOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B_prime1, B_prime2, B_prime3, B_prime4, B_prime5, B_prime6, B_prime7, B_prime8) -> { return `buildOctet (orBit (B1, B_prime1), orBit (B2, B_prime2), orBit (B3, B_prime3), orBit (B4, B_prime4), orBit (B5, B_prime5), orBit (B6, B_prime6), orBit (B7, B_prime7), orBit (B8, B_prime8)); }
    }
    throw new RuntimeException ("incomplete match in function orOctet()");
  }

  private static Octet xorOctet (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B_prime1, B_prime2, B_prime3, B_prime4, B_prime5, B_prime6, B_prime7, B_prime8) -> { return `buildOctet (xorBit (B1, B_prime1), xorBit (B2, B_prime2), xorBit (B3, B_prime3), xorBit (B4, B_prime4), xorBit (B5, B_prime5), xorBit (B6, B_prime6), xorBit (B7, B_prime7), xorBit (B8, B_prime8)); }
    }
    throw new RuntimeException ("incomplete match in function xorOctet()");
  }

  private static Octet x02 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), x1(), x0());
  }

  private static Octet x03 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet x04 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet x05 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet x06 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet x07 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x0(), x1(), x1(), x1());
  }

  private static Octet x08 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet x09 () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet x0A () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet x0B () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet x0C () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet x0D () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet x0E () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet x0F () {
    return `buildOctet (x0(), x0(), x0(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet x10 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet x11 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet x12 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet x13 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet x14 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet x15 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet x16 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet x17 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet x18 () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet x1A () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet x1B () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet x1C () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet x1D () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet x1E () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet x1F () {
    return `buildOctet (x0(), x0(), x0(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet x20 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet x21 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet x23 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet x24 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet x25 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet x26 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet x27 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x0(), x1(), x1(), x1());
  }

  private static Octet x28 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet x29 () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet x2A () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet x2B () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet x2D () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet x2E () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet x2F () {
    return `buildOctet (x0(), x0(), x1(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet x30 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet x31 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet x32 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet x33 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet x34 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet x35 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet x36 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet x37 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet x38 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet x39 () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet x3A () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet x3B () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet x3D () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet x3C () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet x3F () {
    return `buildOctet (x0(), x0(), x1(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet x40 () {
    return `buildOctet (x0(), x1(), x0(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet x46 () {
    return `buildOctet (x0(), x1(), x0(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet x48 () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet x49 () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet x4A () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet x4B () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet x4C () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet x4D () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet x4E () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet x4F () {
    return `buildOctet (x0(), x1(), x0(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet x50 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet x51 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet x53 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet x54 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet x55 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet x58 () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet x5A () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet x5B () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet x5C () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet x5D () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet x5E () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet x5F () {
    return `buildOctet (x0(), x1(), x0(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet x60 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet x61 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet x62 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x0(), x1(), x0());
  }

  private static Octet x63 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet x64 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet x65 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet x66 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet x67 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x0(), x1(), x1(), x1());
  }

  private static Octet x69 () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet x6A () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet x6B () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet x6C () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet x6D () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet x6E () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet x6F () {
    return `buildOctet (x0(), x1(), x1(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet x70 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet x71 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet x72 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet x73 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet x74 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet x75 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet x76 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet x77 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet x78 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet x79 () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet x7A () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet x7B () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet x7C () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet x7D () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet x7E () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet x7F () {
    return `buildOctet (x0(), x1(), x1(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet x80 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet x81 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet x83 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet x84 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet x85 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet x86 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet x88 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet x89 () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet x8A () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet x8C () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet x8D () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet x8E () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet x8F () {
    return `buildOctet (x1(), x0(), x0(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet x90 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet x91 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet x92 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet x93 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet x95 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet x96 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet x97 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet x98 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet x99 () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet x9A () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet x9B () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet x9C () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet x9D () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet x9E () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet x9F () {
    return `buildOctet (x1(), x0(), x0(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet xA1 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet xA0 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet xA2 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x0(), x1(), x0());
  }

  private static Octet xA3 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet xA4 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet xA5 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet xA6 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet xA7 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x0(), x1(), x1(), x1());
  }

  private static Octet xA8 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet xA9 () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet xAA () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet xAB () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet xAC () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet xAE () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet xAF () {
    return `buildOctet (x1(), x0(), x1(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet xB0 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet xB1 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet xB2 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet xB3 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet xB5 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet xB6 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet xB8 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet xB9 () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet xBA () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet xBB () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet xBC () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet xBE () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet xBF () {
    return `buildOctet (x1(), x0(), x1(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet xC0 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet xC1 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet xC2 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x0(), x1(), x0());
  }

  private static Octet xC4 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x1(), x0(), x0());
  }

  private static Octet xC5 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x1(), x0(), x1());
  }

  private static Octet xC6 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet xC7 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x0(), x1(), x1(), x1());
  }

  private static Octet xC8 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet xC9 () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet xCA () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet xCB () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet xCC () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet xCD () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet xCE () {
    return `buildOctet (x1(), x1(), x0(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet xD0 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet xD1 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet xD2 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet xD3 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet xD4 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet xD5 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet xD6 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet xD7 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet xD8 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet xD9 () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet xDB () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet xDC () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet xDD () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet xDE () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet xDF () {
    return `buildOctet (x1(), x1(), x0(), x1(), x1(), x1(), x1(), x1());
  }

  private static Octet xE0 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x0(), x0(), x0(), x0());
  }

  private static Octet xE1 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x0(), x0(), x0(), x1());
  }

  private static Octet xE3 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x0(), x0(), x1(), x1());
  }

  private static Octet xE6 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x0(), x1(), x1(), x0());
  }

  private static Octet xE8 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x0(), x0(), x0());
  }

  private static Octet xE9 () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x0(), x0(), x1());
  }

  private static Octet xEA () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x0(), x1(), x0());
  }

  private static Octet xEB () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x0(), x1(), x1());
  }

  private static Octet xEC () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x1(), x0(), x0());
  }

  private static Octet xED () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x1(), x0(), x1());
  }

  private static Octet xEE () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x1(), x1(), x0());
  }

  private static Octet xEF () {
    return `buildOctet (x1(), x1(), x1(), x0(), x1(), x1(), x1(), x1());
  }

  private static Octet xF0 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x0(), x0(), x0());
  }

  private static Octet xF1 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x0(), x0(), x1());
  }

  private static Octet xF2 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x0(), x1(), x0());
  }

  private static Octet xF3 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x0(), x1(), x1());
  }

  private static Octet xF4 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x1(), x0(), x0());
  }

  private static Octet xF5 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x1(), x0(), x1());
  }

  private static Octet xF6 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x1(), x1(), x0());
  }

  private static Octet xF7 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x0(), x1(), x1(), x1());
  }

  private static Octet xF8 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x0(), x0(), x0());
  }

  private static Octet xF9 () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x0(), x0(), x1());
  }

  private static Octet xFA () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x0(), x1(), x0());
  }

  private static Octet xFB () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x0(), x1(), x1());
  }

  private static Octet xFC () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x1(), x0(), x0());
  }

  private static Octet xFD () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x1(), x0(), x1());
  }

  private static Octet xFE () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x1(), x1(), x0());
  }

  private static Octet xFF () {
    return `buildOctet (x1(), x1(), x1(), x1(), x1(), x1(), x1(), x1());
  }

  private static Block andBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `buildBlock (andOctet (O1, O_prime1), andOctet (O2, O_prime2), andOctet (O3, O_prime3), andOctet (O4, O_prime4)); }
    }
    throw new RuntimeException ("incomplete match in function andBlock()");
  }

  private static Block orBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `buildBlock (orOctet (O1, O_prime1), orOctet (O2, O_prime2), orOctet (O3, O_prime3), orOctet (O4, O_prime4)); }
    }
    throw new RuntimeException ("incomplete match in function orBlock()");
  }

  private static Block xorBlock (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `buildBlock (xorOctet (O1, O_prime1), xorOctet (O2, O_prime2), xorOctet (O3, O_prime3), xorOctet (O4, O_prime4)); }
    }
    throw new RuntimeException ("incomplete match in function xorBlock()");
  }

  private static Half x0001 () {
    return `buildHalf (x00(), x01());
  }

  private static Block x00000000 () {
    return `buildBlock (x00(), x00(), x00(), x00());
  }

  private static Block x00000001 () {
    return `buildBlock (x00(), x00(), x00(), x01());
  }

  private static Block x00000002 () {
    return `buildBlock (x00(), x00(), x00(), x02());
  }

  private static Block x00000003 () {
    return `buildBlock (x00(), x00(), x00(), x03());
  }

  private static Block x00000004 () {
    return `buildBlock (x00(), x00(), x00(), x04());
  }

  private static Block x00000005 () {
    return `buildBlock (x00(), x00(), x00(), x05());
  }

  private static Block x00000006 () {
    return `buildBlock (x00(), x00(), x00(), x06());
  }

  private static Block x00000007 () {
    return `buildBlock (x00(), x00(), x00(), x07());
  }

  private static Block x00000008 () {
    return `buildBlock (x00(), x00(), x00(), x08());
  }

  private static Block x00000009 () {
    return `buildBlock (x00(), x00(), x00(), x09());
  }

  private static Block x0000000A () {
    return `buildBlock (x00(), x00(), x00(), x0A());
  }

  private static Block x0000000B () {
    return `buildBlock (x00(), x00(), x00(), x0B());
  }

  private static Block x0000000C () {
    return `buildBlock (x00(), x00(), x00(), x0C());
  }

  private static Block x0000000D () {
    return `buildBlock (x00(), x00(), x00(), x0D());
  }

  private static Block x0000000E () {
    return `buildBlock (x00(), x00(), x00(), x0E());
  }

  private static Block x0000000F () {
    return `buildBlock (x00(), x00(), x00(), x0F());
  }

  private static Block x00000010 () {
    return `buildBlock (x00(), x00(), x00(), x10());
  }

  private static Block x00000012 () {
    return `buildBlock (x00(), x00(), x00(), x12());
  }

  private static Block x00000014 () {
    return `buildBlock (x00(), x00(), x00(), x14());
  }

  private static Block x00000016 () {
    return `buildBlock (x00(), x00(), x00(), x16());
  }

  private static Block x00000018 () {
    return `buildBlock (x00(), x00(), x00(), x18());
  }

  private static Block x0000001B () {
    return `buildBlock (x00(), x00(), x00(), x1B());
  }

  private static Block x0000001D () {
    return `buildBlock (x00(), x00(), x00(), x1D());
  }

  private static Block x0000001E () {
    return `buildBlock (x00(), x00(), x00(), x1E());
  }

  private static Block x0000001F () {
    return `buildBlock (x00(), x00(), x00(), x1F());
  }

  private static Block x00000031 () {
    return `buildBlock (x00(), x00(), x00(), x31());
  }

  private static Block x00000036 () {
    return `buildBlock (x00(), x00(), x00(), x36());
  }

  private static Block x00000060 () {
    return `buildBlock (x00(), x00(), x00(), x60());
  }

  private static Block x00000080 () {
    return `buildBlock (x00(), x00(), x00(), x80());
  }

  private static Block x000000A5 () {
    return `buildBlock (x00(), x00(), x00(), xA5());
  }

  private static Block x000000B6 () {
    return `buildBlock (x00(), x00(), x00(), xB6());
  }

  private static Block x000000C4 () {
    return `buildBlock (x00(), x00(), x00(), xC4());
  }

  private static Block x000000D2 () {
    return `buildBlock (x00(), x00(), x00(), xD2());
  }

  private static Block x00000100 () {
    return `buildBlock (x00(), x00(), x01(), x00());
  }

  private static Block x00000129 () {
    return `buildBlock (x00(), x00(), x01(), x29());
  }

  private static Block x0000018C () {
    return `buildBlock (x00(), x00(), x01(), x8C());
  }

  private static Block x00004000 () {
    return `buildBlock (x00(), x00(), x40(), x00());
  }

  private static Block x00010000 () {
    return `buildBlock (x00(), x01(), x00(), x00());
  }

  private static Block x00020000 () {
    return `buildBlock (x00(), x02(), x00(), x00());
  }

  private static Block x00030000 () {
    return `buildBlock (x00(), x03(), x00(), x00());
  }

  private static Block x00040000 () {
    return `buildBlock (x00(), x04(), x00(), x00());
  }

  private static Block x00060000 () {
    return `buildBlock (x00(), x06(), x00(), x00());
  }

  private static Block x00804021 () {
    return `buildBlock (x00(), x80(), x40(), x21());
  }

  private static Block x00FF00FF () {
    return `buildBlock (x00(), xFF(), x00(), xFF());
  }

  private static Block x0103050B () {
    return `buildBlock (x01(), x03(), x05(), x0B());
  }

  private static Block x01030703 () {
    return `buildBlock (x01(), x03(), x07(), x03());
  }

  private static Block x01030705 () {
    return `buildBlock (x01(), x03(), x07(), x05());
  }

  private static Block x0103070F () {
    return `buildBlock (x01(), x03(), x07(), x0F());
  }

  private static Block x02040801 () {
    return `buildBlock (x02(), x04(), x08(), x01());
  }

  private static Block x0297AF6F () {
    return `buildBlock (x02(), x97(), xAF(), x6F());
  }

  private static Block x07050301 () {
    return `buildBlock (x07(), x05(), x03(), x01());
  }

  private static Block x077788A2 () {
    return `buildBlock (x07(), x77(), x88(), xA2());
  }

  private static Block x07C72EAA () {
    return `buildBlock (x07(), xC7(), x2E(), xAA());
  }

  private static Block x0A202020 () {
    return `buildBlock (x0A(), x20(), x20(), x20());
  }

  private static Block x0AD67E20 () {
    return `buildBlock (x0A(), xD6(), x7E(), x20());
  }

  private static Block x10000000 () {
    return `buildBlock (x10(), x00(), x00(), x00());
  }

  private static Block x11A9D254 () {
    return `buildBlock (x11(), xA9(), xD2(), x54());
  }

  private static Block x11AC46B8 () {
    return `buildBlock (x11(), xAC(), x46(), xB8());
  }

  private static Block x1277A6D4 () {
    return `buildBlock (x12(), x77(), xA6(), xD4());
  }

  private static Block x13647149 () {
    return `buildBlock (x13(), x64(), x71(), x49());
  }

  private static Block x160EE9B5 () {
    return `buildBlock (x16(), x0E(), xE9(), xB5());
  }

  private static Block x17065DBB () {
    return `buildBlock (x17(), x06(), x5D(), xBB());
  }

  private static Block x17A808FD () {
    return `buildBlock (x17(), xA8(), x08(), xFD());
  }

  private static Block x1D10D8D3 () {
    return `buildBlock (x1D(), x10(), xD8(), xD3());
  }

  private static Block x1D3B7760 () {
    return `buildBlock (x1D(), x3B(), x77(), x60());
  }

  private static Block x1D9C9655 () {
    return `buildBlock (x1D(), x9C(), x96(), x55());
  }

  private static Block x1F3F7FFF () {
    return `buildBlock (x1F(), x3F(), x7F(), xFF());
  }

  private static Block x204E80A7 () {
    return `buildBlock (x20(), x4E(), x80(), xA7());
  }

  private static Block x21D869BA () {
    return `buildBlock (x21(), xD8(), x69(), xBA());
  }

  private static Block x24B66FB5 () {
    return `buildBlock (x24(), xB6(), x6F(), xB5());
  }

  private static Block x270EEDAF () {
    return `buildBlock (x27(), x0E(), xED(), xAF());
  }

  private static Block x277B4B25 () {
    return `buildBlock (x27(), x7B(), x4B(), x25());
  }

  private static Block x2829040B () {
    return `buildBlock (x28(), x29(), x04(), x0B());
  }

  private static Block x288FC786 () {
    return `buildBlock (x28(), x8F(), xC7(), x86());
  }

  private static Block x28EAD8B3 () {
    return `buildBlock (x28(), xEA(), xD8(), xB3());
  }

  private static Block x29907CD8 () {
    return `buildBlock (x29(), x90(), x7C(), xD8());
  }

  private static Block x29C1485F () {
    return `buildBlock (x29(), xC1(), x48(), x5F());
  }

  private static Block x29EEE96B () {
    return `buildBlock (x29(), xEE(), xE9(), x6B());
  }

  private static Block x2A6091AE () {
    return `buildBlock (x2A(), x60(), x91(), xAE());
  }

  private static Block x2BF8499A () {
    return `buildBlock (x2B(), xF8(), x49(), x9A());
  }

  private static Block x2E80AC30 () {
    return `buildBlock (x2E(), x80(), xAC(), x30());
  }

  private static Block x2FD76FFB () {
    return `buildBlock (x2F(), xD7(), x6F(), xFB());
  }

  private static Block x30261492 () {
    return `buildBlock (x30(), x26(), x14(), x92());
  }

  private static Block x303FF4AA () {
    return `buildBlock (x30(), x3F(), xF4(), xAA());
  }

  private static Block x33D5A466 () {
    return `buildBlock (x33(), xD5(), xA4(), x66());
  }

  private static Block x344925FC () {
    return `buildBlock (x34(), x49(), x25(), xFC());
  }

  private static Block x34ACF886 () {
    return `buildBlock (x34(), xAC(), xF8(), x86());
  }

  private static Block x3CD54DEB () {
    return `buildBlock (x3C(), xD5(), x4D(), xEB());
  }

  private static Block x3CF3A7D2 () {
    return `buildBlock (x3C(), xF3(), xA7(), xD2());
  }

  private static Block x3DD81AC6 () {
    return `buildBlock (x3D(), xD8(), x1A(), xC6());
  }

  private static Block x3F6F7248 () {
    return `buildBlock (x3F(), x6F(), x72(), x48());
  }

  private static Block x48B204D6 () {
    return `buildBlock (x48(), xB2(), x04(), xD6());
  }

  private static Block x4A645A01 () {
    return `buildBlock (x4A(), x64(), x5A(), x01());
  }

  private static Block x4C49AAE0 () {
    return `buildBlock (x4C(), x49(), xAA(), xE0());
  }

  private static Block x4CE933E1 () {
    return `buildBlock (x4C(), xE9(), x33(), xE1());
  }

  private static Block x4D53901A () {
    return `buildBlock (x4D(), x53(), x90(), x1A());
  }

  private static Block x4DA124A1 () {
    return `buildBlock (x4D(), xA1(), x24(), xA1());
  }

  private static Block x4F998E01 () {
    return `buildBlock (x4F(), x99(), x8E(), x01());
  }

  private static Block x4FB1138A () {
    return `buildBlock (x4F(), xB1(), x13(), x8A());
  }

  private static Block x50DEC930 () {
    return `buildBlock (x50(), xDE(), xC9(), x30());
  }

  private static Block x51AF3C1D () {
    return `buildBlock (x51(), xAF(), x3C(), x1D());
  }

  private static Block x51EDE9C7 () {
    return `buildBlock (x51(), xED(), xE9(), xC7());
  }

  private static Block x550D91CE () {
    return `buildBlock (x55(), x0D(), x91(), xCE());
  }

  private static Block x55555555 () {
    return `buildBlock (x55(), x55(), x55(), x55());
  }

  private static Block x55DD063F () {
    return `buildBlock (x55(), xDD(), x06(), x3F());
  }

  private static Block x5834A585 () {
    return `buildBlock (x58(), x34(), xA5(), x85());
  }

  private static Block x5A35D667 () {
    return `buildBlock (x5A(), x35(), xD6(), x67());
  }

  private static Block x5BC02502 () {
    return `buildBlock (x5B(), xC0(), x25(), x02());
  }

  private static Block x5CCA3239 () {
    return `buildBlock (x5C(), xCA(), x32(), x39());
  }

  private static Block x5EBA06C2 () {
    return `buildBlock (x5E(), xBA(), x06(), xC2());
  }

  private static Block x5F38EEF1 () {
    return `buildBlock (x5F(), x38(), xEE(), xF1());
  }

  private static Block x613F8E2A () {
    return `buildBlock (x61(), x3F(), x8E(), x2A());
  }

  private static Block x63C70DBA () {
    return `buildBlock (x63(), xC7(), x0D(), xBA());
  }

  private static Block x6AD6E8A4 () {
    return `buildBlock (x6A(), xD6(), xE8(), xA4());
  }

  private static Block x6AEBACF8 () {
    return `buildBlock (x6A(), xEB(), xAC(), xF8());
  }

  private static Block x6D67E884 () {
    return `buildBlock (x6D(), x67(), xE8(), x84());
  }

  private static Block x7050EC5E () {
    return `buildBlock (x70(), x50(), xEC(), x5E());
  }

  private static Block x717153D5 () {
    return `buildBlock (x71(), x71(), x53(), xD5());
  }

  private static Block x7201F4DC () {
    return `buildBlock (x72(), x01(), xF4(), xDC());
  }

  private static Block x7397C9AE () {
    return `buildBlock (x73(), x97(), xC9(), xAE());
  }

  private static Block x74B39176 () {
    return `buildBlock (x74(), xB3(), x91(), x76());
  }

  private static Block x76232E5F () {
    return `buildBlock (x76(), x23(), x2E(), x5F());
  }

  private static Block x7783C51D () {
    return `buildBlock (x77(), x83(), xC5(), x1D());
  }

  private static Block x7792F9D4 () {
    return `buildBlock (x77(), x92(), xF9(), xD4());
  }

  private static Block x7BC180AB () {
    return `buildBlock (x7B(), xC1(), x80(), xAB());
  }

  private static Block x7DB2D9F4 () {
    return `buildBlock (x7D(), xB2(), xD9(), xF4());
  }

  private static Block x7DFEFBFF () {
    return `buildBlock (x7D(), xFE(), xFB(), xFF());
  }

  private static Block x7F76A3B0 () {
    return `buildBlock (x7F(), x76(), xA3(), xB0());
  }

  private static Block x7F839576 () {
    return `buildBlock (x7F(), x83(), x95(), x76());
  }

  private static Block x7FFFFFF0 () {
    return `buildBlock (x7F(), xFF(), xFF(), xF0());
  }

  private static Block x7FFFFFF1 () {
    return `buildBlock (x7F(), xFF(), xFF(), xF1());
  }

  private static Block x7FFFFFFC () {
    return `buildBlock (x7F(), xFF(), xFF(), xFC());
  }

  private static Block x7FFFFFFD () {
    return `buildBlock (x7F(), xFF(), xFF(), xFD());
  }

  private static Block x80000000 () {
    return `buildBlock (x80(), x00(), x00(), x00());
  }

  private static Block x80000002 () {
    return `buildBlock (x80(), x00(), x00(), x02());
  }

  private static Block x800000C2 () {
    return `buildBlock (x80(), x00(), x00(), xC2());
  }

  private static Block x80018000 () {
    return `buildBlock (x80(), x01(), x80(), x00());
  }

  private static Block x80018001 () {
    return `buildBlock (x80(), x01(), x80(), x01());
  }

  private static Block x80397302 () {
    return `buildBlock (x80(), x39(), x73(), x02());
  }

  private static Block x81D10CA3 () {
    return `buildBlock (x81(), xD1(), x0C(), xA3());
  }

  private static Block x89D635D7 () {
    return `buildBlock (x89(), xD6(), x35(), xD7());
  }

  private static Block x8CE37709 () {
    return `buildBlock (x8C(), xE3(), x77(), x09());
  }

  private static Block x8DC8BBDE () {
    return `buildBlock (x8D(), xC8(), xBB(), xDE());
  }

  private static Block x9115A558 () {
    return `buildBlock (x91(), x15(), xA5(), x58());
  }

  private static Block x91896CFA () {
    return `buildBlock (x91(), x89(), x6C(), xFA());
  }

  private static Block x9372CDC6 () {
    return `buildBlock (x93(), x72(), xCD(), xC6());
  }

  private static Block x98D1CC75 () {
    return `buildBlock (x98(), xD1(), xCC(), x75());
  }

  private static Block x9D15C437 () {
    return `buildBlock (x9D(), x15(), xC4(), x37());
  }

  private static Block x9DB15CF6 () {
    return `buildBlock (x9D(), xB1(), x5C(), xF6());
  }

  private static Block x9E2E7B36 () {
    return `buildBlock (x9E(), x2E(), x7B(), x36());
  }

  private static Block xA018C83B () {
    return `buildBlock (xA0(), x18(), xC8(), x3B());
  }

  private static Block xA0B87B77 () {
    return `buildBlock (xA0(), xB8(), x7B(), x77());
  }

  private static Block xA44AAAC0 () {
    return `buildBlock (xA4(), x4A(), xAA(), xC0());
  }

  private static Block xA511987A () {
    return `buildBlock (xA5(), x11(), x98(), x7A());
  }

  private static Block xA70FC148 () {
    return `buildBlock (xA7(), x0F(), xC1(), x48());
  }

  private static Block xA93BD410 () {
    return `buildBlock (xA9(), x3B(), xD4(), x10());
  }

  private static Block xAAAAAAAA () {
    return `buildBlock (xAA(), xAA(), xAA(), xAA());
  }

  private static Block xAB00FFCD () {
    return `buildBlock (xAB(), x00(), xFF(), xCD());
  }

  private static Block xAB01FCCD () {
    return `buildBlock (xAB(), x01(), xFC(), xCD());
  }

  private static Block xAB6EED4A () {
    return `buildBlock (xAB(), x6E(), xED(), x4A());
  }

  private static Block xABEEED6B () {
    return `buildBlock (xAB(), xEE(), xED(), x6B());
  }

  private static Block xACBC13DD () {
    return `buildBlock (xAC(), xBC(), x13(), xDD());
  }

  private static Block xB1CC1CC5 () {
    return `buildBlock (xB1(), xCC(), x1C(), xC5());
  }

  private static Block xB8142629 () {
    return `buildBlock (xB8(), x14(), x26(), x29());
  }

  private static Block xB99A62DE () {
    return `buildBlock (xB9(), x9A(), x62(), xDE());
  }

  private static Block xBA92DB12 () {
    return `buildBlock (xBA(), x92(), xDB(), x12());
  }

  private static Block xBBA57835 () {
    return `buildBlock (xBB(), xA5(), x78(), x35());
  }

  private static Block xBE9F0917 () {
    return `buildBlock (xBE(), x9F(), x09(), x17());
  }

  private static Block xBF2D7D85 () {
    return `buildBlock (xBF(), x2D(), x7D(), x85());
  }

  private static Block xBFEF7FDF () {
    return `buildBlock (xBF(), xEF(), x7F(), xDF());
  }

  private static Block xC1ED90DD () {
    return `buildBlock (xC1(), xED(), x90(), xDD());
  }

  private static Block xC21A1846 () {
    return `buildBlock (xC2(), x1A(), x18(), x46());
  }

  private static Block xC4EB1AEB () {
    return `buildBlock (xC4(), xEB(), x1A(), xEB());
  }

  private static Block xC6B1317E () {
    return `buildBlock (xC6(), xB1(), x31(), x7E());
  }

  private static Block xCBC865BA () {
    return `buildBlock (xCB(), xC8(), x65(), xBA());
  }

  private static Block xCD959B46 () {
    return `buildBlock (xCD(), x95(), x9B(), x46());
  }

  private static Block xD0482465 () {
    return `buildBlock (xD0(), x48(), x24(), x65());
  }

  private static Block xD636250D () {
    return `buildBlock (xD6(), x36(), x25(), x0D());
  }

  private static Block xD7843FDC () {
    return `buildBlock (xD7(), x84(), x3F(), xDC());
  }

  private static Block xD78634BC () {
    return `buildBlock (xD7(), x86(), x34(), xBC());
  }

  private static Block xD8804CA5 () {
    return `buildBlock (xD8(), x80(), x4C(), xA5());
  }

  private static Block xDB79FBDC () {
    return `buildBlock (xDB(), x79(), xFB(), xDC());
  }

  private static Block xDB9102B0 () {
    return `buildBlock (xDB(), x91(), x02(), xB0());
  }

  private static Block xE0C08000 () {
    return `buildBlock (xE0(), xC0(), x80(), x00());
  }

  private static Block xE6A12F07 () {
    return `buildBlock (xE6(), xA1(), x2F(), x07());
  }

  private static Block xEB35B97F () {
    return `buildBlock (xEB(), x35(), xB9(), x7F());
  }

  private static Block xF0239DD5 () {
    return `buildBlock (xF0(), x23(), x9D(), xD5());
  }

  private static Block xF14D6E28 () {
    return `buildBlock (xF1(), x4D(), x6E(), x28());
  }

  private static Block xF2EF3501 () {
    return `buildBlock (xF2(), xEF(), x35(), x01());
  }

  private static Block xF6A09667 () {
    return `buildBlock (xF6(), xA0(), x96(), x67());
  }

  private static Block xFD297DA4 () {
    return `buildBlock (xFD(), x29(), x7D(), xA4());
  }

  private static Block xFDC1A8BA () {
    return `buildBlock (xFD(), xC1(), xA8(), xBA());
  }

  private static Block xFE4E5BDD () {
    return `buildBlock (xFE(), x4E(), x5B(), xDD());
  }

  private static Block xFEA1D334 () {
    return `buildBlock (xFE(), xA1(), xD3(), x34());
  }

  private static Block xFECCAA6E () {
    return `buildBlock (xFE(), xCC(), xAA(), x6E());
  }

  private static Block xFEFC07F0 () {
    return `buildBlock (xFE(), xFC(), x07(), xF0());
  }

  private static Block xFF2D7DA5 () {
    return `buildBlock (xFF(), x2D(), x7D(), xA5());
  }

  private static Block xFFEF0001 () {
    return `buildBlock (xFF(), xEF(), x00(), x01());
  }

  private static Block xFFFF00FF () {
    return `buildBlock (xFF(), xFF(), x00(), xFF());
  }

  private static Block xFFFFFF2D () {
    return `buildBlock (xFF(), xFF(), xFF(), x2D());
  }

  private static Block xFFFFFF3A () {
    return `buildBlock (xFF(), xFF(), xFF(), x3A());
  }

  private static Block xFFFFFFF0 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF0());
  }

  private static Block xFFFFFFF1 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF1());
  }

  private static Block xFFFFFFF4 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF4());
  }

  private static Block xFFFFFFF5 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF5());
  }

  private static Block xFFFFFFF7 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF7());
  }

  private static Block xFFFFFFF9 () {
    return `buildBlock (xFF(), xFF(), xFF(), xF9());
  }

  private static Block xFFFFFFFA () {
    return `buildBlock (xFF(), xFF(), xFF(), xFA());
  }

  private static Block xFFFFFFFB () {
    return `buildBlock (xFF(), xFF(), xFF(), xFB());
  }

  private static Block xFFFFFFFC () {
    return `buildBlock (xFF(), xFF(), xFF(), xFC());
  }

  private static Block xFFFFFFFD () {
    return `buildBlock (xFF(), xFF(), xFF(), xFD());
  }

  private static Block xFFFFFFFE () {
    return `buildBlock (xFF(), xFF(), xFF(), xFE());
  }

  private static Block xFFFFFFFF () {
    return `buildBlock (xFF(), xFF(), xFF(), xFF());
  }

  private static Message appendMessage (Message rec_x1, Block rec_x2) {
    %match (Message rec_x1, Block rec_x2) {
      unitMessage (W), W_prime -> { return `consMessage (W, unitMessage (W_prime)); }
      consMessage (W, M), W_prime -> { return `consMessage (W, appendMessage (M, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function appendMessage()");
  }

  private static Message reverseMessage (Message rec_x1) {
    %match (Message rec_x1) {
      unitMessage (W) -> { return `unitMessage (W); }
      consMessage (W, M) -> { return `appendMessage (reverseMessage (M), W); }
    }
    throw new RuntimeException ("incomplete match in function reverseMessage()");
  }

  private static Message makeMessage (Xnat rec_x1, Block rec_x2, Block rec_x3) {
    %match (Xnat rec_x1, Block rec_x2, Block rec_x3) {
      succ (N), W, W_prime -> { if (`eqNat (N, zero()) == `Xtrue()) { return `unitMessage (W); } }
      succ (N), W, W_prime -> { if (`eqNat (N, zero()) == `Xfalse()) { return `consMessage (W, makeMessage (N, ADD (W, W_prime), W_prime)); } }
    }
    throw new RuntimeException ("incomplete match in function makeMessage()");
  }

  private static Block ADD (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `addBlock (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function ADD()");
  }

  private static Block AND (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `andBlock (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function AND()");
  }

  private static Pair MUL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `mulBlock (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL()");
  }

  private static Block OR (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `orBlock (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function OR()");
  }

  private static Block XOR (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `xorBlock (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function XOR()");
  }

  private static Block XOR_prime (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `XOR (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function XOR_prime()");
  }

  private static Block CYC (Block rec_x1) {
    %match (Block rec_x1) {
      buildBlock (buildOctet (B1, B2, B3, B4, B5, B6, B7, B8), buildOctet (B9, B10, B11, B12, B13, B14, B15, B16), buildOctet (B17, B18, B19, B20, B21, B22, B23, B24), buildOctet (B25, B26, B27, B28, B29, B30, B31, B32)) -> { return `buildBlock (buildOctet (B2, B3, B4, B5, B6, B7, B8, B9), buildOctet (B10, B11, B12, B13, B14, B15, B16, B17), buildOctet (B18, B19, B20, B21, B22, B23, B24, B25), buildOctet (B26, B27, B28, B29, B30, B31, B32, B1)); }
    }
    throw new RuntimeException ("incomplete match in function CYC()");
  }

  private static Block nCYC (Xnat rec_x1, Block rec_x2) {
    %match (Xnat rec_x1, Block rec_x2) {
      zero(), W -> { return `W; }
      succ (N), W -> { return `CYC (nCYC (N, W)); }
    }
    throw new RuntimeException ("incomplete match in function nCYC()");
  }

  private static Block FIX1 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `AND (OR (W, x02040801()), xBFEF7FDF()); }
    }
    throw new RuntimeException ("incomplete match in function FIX1()");
  }

  private static Block FIX2 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `AND (OR (W, x00804021()), x7DFEFBFF()); }
    }
    throw new RuntimeException ("incomplete match in function FIX2()");
  }

  private static Xbool needAdjust (Octet rec_x1) {
    %match (Octet rec_x1) {
      O -> { return `orBool (eqOctet (O, x00()), eqOctet (O, xFF())); }
    }
    throw new RuntimeException ("incomplete match in function needAdjust()");
  }

  private static Bit adjustCode (Octet rec_x1) {
    %match (Octet rec_x1) {
      O -> { if (`needAdjust (O) == `Xtrue()) { return `x1(); } }
      O -> { if (`needAdjust (O) == `Xfalse()) { return `x0(); } }
    }
    throw new RuntimeException ("incomplete match in function adjustCode()");
  }

  private static Octet adjust (Octet rec_x1, Octet rec_x2) {
    %match (Octet rec_x1, Octet rec_x2) {
      O, O_prime -> { if (`needAdjust (O) == `Xtrue()) { return `xorOctet (O, O_prime); } }
      O, O_prime -> { if (`needAdjust (O) == `Xfalse()) { return `O; } }
    }
    throw new RuntimeException ("incomplete match in function adjust()");
  }

  private static Octet PAT (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `buildOctet (adjustCode (O1), adjustCode (O2), adjustCode (O3), adjustCode (O4), adjustCode (O_prime1), adjustCode (O_prime2), adjustCode (O_prime3), adjustCode (O_prime4)); }
    }
    throw new RuntimeException ("incomplete match in function PAT()");
  }

  private static Pair BYT (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4) -> { return `BYT_prime (O1, O2, O3, O4, O_prime1, O_prime2, O_prime3, O_prime4, PAT (buildBlock (O1, O2, O3, O4), buildBlock (O_prime1, O_prime2, O_prime3, O_prime4))); }
    }
    throw new RuntimeException ("incomplete match in function BYT()");
  }

  private static Pair BYT_prime (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8, Octet rec_x9) {
    %match (Octet rec_x1, Octet rec_x2, Octet rec_x3, Octet rec_x4, Octet rec_x5, Octet rec_x6, Octet rec_x7, Octet rec_x8, Octet rec_x9) {
      O1, O2, O3, O4, O_prime1, O_prime2, O_prime3, O_prime4, Opat -> { return `buildPair (buildBlock (adjust (O1, rightOctet7 (Opat)), adjust (O2, rightOctet6 (Opat)), adjust (O3, rightOctet5 (Opat)), adjust (O4, rightOctet4 (Opat))), buildBlock (adjust (O_prime1, rightOctet3 (Opat)), adjust (O_prime2, rightOctet2 (Opat)), adjust (O_prime3, rightOctet1 (Opat)), adjust (O_prime4, Opat))); }
    }
    throw new RuntimeException ("incomplete match in function BYT_prime()");
  }

  private static Pair ADDC (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `ADDC_prime (addBlockSum (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function ADDC()");
  }

  private static Pair ADDC_prime (BlockSum rec_x1) {
    %match (BlockSum rec_x1) {
      buildBlockSum (x0(), W) -> { return `buildPair (x00000000(), W); }
      buildBlockSum (x1(), W) -> { return `buildPair (x00000001(), W); }
    }
    throw new RuntimeException ("incomplete match in function ADDC_prime()");
  }

  private static Block MUL1 (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL1XY (MUL (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL1()");
  }

  private static Block MUL1XY (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `MUL1UL (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL1XY()");
  }

  private static Block MUL1UL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL1SC (ADDC (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL1UL()");
  }

  private static Block MUL1SC (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (Wcarry, W) -> { return `ADD (W, Wcarry); }
    }
    throw new RuntimeException ("incomplete match in function MUL1SC()");
  }

  private static Block MUL2 (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2XY (MUL (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2()");
  }

  private static Block MUL2XY (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `MUL2UL (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL2XY()");
  }

  private static Block MUL2UL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2DEL (ADDC (W, W), W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL2UL()");
  }

  private static Block MUL2DEL (Pair rec_x1, Block rec_x2) {
    %match (Pair rec_x1, Block rec_x2) {
      buildPair (Wcarry, W), W_prime -> { return `MUL2FL (ADD (W, ADD (Wcarry, Wcarry)), W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL2DEL()");
  }

  private static Block MUL2FL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2SC (ADDC (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2FL()");
  }

  private static Block MUL2SC (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (Wcarry, W) -> { return `ADD (W, ADD (Wcarry, Wcarry)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2SC()");
  }

  private static Block MUL2A (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2AXY (MUL (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2A()");
  }

  private static Block MUL2AXY (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `MUL2AUL (W, W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL2AXY()");
  }

  private static Block MUL2AUL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2ADL (ADD (W, W), W_prime); }
    }
    throw new RuntimeException ("incomplete match in function MUL2AUL()");
  }

  private static Block MUL2ADL (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W, W_prime -> { return `MUL2ASC (ADDC (W, W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2ADL()");
  }

  private static Block MUL2ASC (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (Wcarry, W) -> { return `ADD (W, ADD (Wcarry, Wcarry)); }
    }
    throw new RuntimeException ("incomplete match in function MUL2ASC()");
  }

  private static Block squareHalf (Half rec_x1) {
    %match (Half rec_x1) {
      H -> { return `mulHalf (H, H); }
    }
    throw new RuntimeException ("incomplete match in function squareHalf()");
  }

  private static Block Q (Octet rec_x1) {
    %match (Octet rec_x1) {
      O -> { return `squareHalf (addHalf (buildHalf (x00(), O), x0001())); }
    }
    throw new RuntimeException ("incomplete match in function Q()");
  }

  private static Block J1_2 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (W, W); }
    }
    throw new RuntimeException ("incomplete match in function J1_2()");
  }

  private static Block J1_4 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (J1_2 (W), J1_2 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J1_4()");
  }

  private static Block J1_6 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (J1_2 (W), J1_4 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J1_6()");
  }

  private static Block J1_8 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (J1_2 (W), J1_6 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J1_8()");
  }

  private static Block J2_2 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (W, W); }
    }
    throw new RuntimeException ("incomplete match in function J2_2()");
  }

  private static Block J2_4 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (J2_2 (W), J2_2 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J2_4()");
  }

  private static Block J2_6 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (J2_2 (W), J2_4 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J2_6()");
  }

  private static Block J2_8 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (J2_2 (W), J2_6 (W)); }
    }
    throw new RuntimeException ("incomplete match in function J2_8()");
  }

  private static Block K1_2 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (W, W); }
    }
    throw new RuntimeException ("incomplete match in function K1_2()");
  }

  private static Block K1_4 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (K1_2 (W), K1_2 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K1_4()");
  }

  private static Block K1_5 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (W, K1_4 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K1_5()");
  }

  private static Block K1_7 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (K1_2 (W), K1_5 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K1_7()");
  }

  private static Block K1_9 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL1 (K1_2 (W), K1_7 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K1_9()");
  }

  private static Block K2_2 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (W, W); }
    }
    throw new RuntimeException ("incomplete match in function K2_2()");
  }

  private static Block K2_4 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (K2_2 (W), K2_2 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K2_4()");
  }

  private static Block K2_5 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (W, K2_4 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K2_5()");
  }

  private static Block K2_7 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (K2_2 (W), K2_5 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K2_7()");
  }

  private static Block K2_9 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `MUL2 (K2_2 (W), K2_7 (W)); }
    }
    throw new RuntimeException ("incomplete match in function K2_9()");
  }

  private static Block H4 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (J1_4 (W), J2_4 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H4()");
  }

  private static Block H6 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (J1_6 (W), J2_6 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H6()");
  }

  private static Block H8 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (J1_8 (W), J2_8 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H8()");
  }

  private static Block H0 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (K1_5 (W), K2_5 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H0()");
  }

  private static Block H5 (Block rec_x1, Octet rec_x2) {
    %match (Block rec_x1, Octet rec_x2) {
      W, O -> { return `MUL2 (H0 (W), Q (O)); }
    }
    throw new RuntimeException ("incomplete match in function H5()");
  }

  private static Block H7 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (K1_7 (W), K2_7 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H7()");
  }

  private static Block H9 (Block rec_x1) {
    %match (Block rec_x1) {
      W -> { return `XOR (K1_9 (W), K2_9 (W)); }
    }
    throw new RuntimeException ("incomplete match in function H9()");
  }

  private static SegmentedMessage splitSegment (Message rec_x1) {
    %match (Message rec_x1) {
      unitMessage (W) -> { return `unitSegment (unitMessage (W)); }
      consMessage (W, M) -> { return `cutSegment (M, unitMessage (W), n254()); }
    }
    throw new RuntimeException ("incomplete match in function splitSegment()");
  }

  private static SegmentedMessage cutSegment (Message rec_x1, Message rec_x2, Xnat rec_x3) {
    %match (Message rec_x1, Message rec_x2, Xnat rec_x3) {
      unitMessage (W), M_prime, N -> { return `unitSegment (reverseMessage (consMessage (W, M_prime))); }
      consMessage (W, M), M_prime, zero() -> { return `consSegment (reverseMessage (consMessage (W, M_prime)), splitSegment (M)); }
      consMessage (W, M), M_prime, succ (N) -> { return `cutSegment (M, consMessage (W, M_prime), N); }
    }
    throw new RuntimeException ("incomplete match in function cutSegment()");
  }

  private static Pair preludeXY (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W1, W2 -> { return `preludeXY_prime (BYT (W1, W2), PAT (W1, W2)); }
    }
    throw new RuntimeException ("incomplete match in function preludeXY()");
  }

  private static Pair preludeVW (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W1, W2 -> { return `preludeVW_prime (BYT (W1, W2)); }
    }
    throw new RuntimeException ("incomplete match in function preludeVW()");
  }

  private static Pair preludeST (Block rec_x1, Block rec_x2) {
    %match (Block rec_x1, Block rec_x2) {
      W1, W2 -> { return `preludeST_prime (BYT (W1, W2)); }
    }
    throw new RuntimeException ("incomplete match in function preludeST()");
  }

  private static Pair preludeXY_prime (Pair rec_x1, Octet rec_x2) {
    %match (Pair rec_x1, Octet rec_x2) {
      buildPair (W, W_prime), O -> { return `BYT (H4 (W), H5 (W_prime, O)); }
    }
    throw new RuntimeException ("incomplete match in function preludeXY_prime()");
  }

  private static Pair preludeVW_prime (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `BYT (H6 (W), H7 (W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function preludeVW_prime()");
  }

  private static Pair preludeST_prime (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W, W_prime) -> { return `BYT (H8 (W), H9 (W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function preludeST_prime()");
  }

  private static Pair computeXY (Pair rec_x1, Pair rec_x2, Block rec_x3) {
    %match (Pair rec_x1, Pair rec_x2, Block rec_x3) {
      P, P_prime, W -> { return `computeXY_prime (P, W, XOR_prime (computeVW (P_prime))); }
    }
    throw new RuntimeException ("incomplete match in function computeXY()");
  }

  private static Pair computeXY_prime (Pair rec_x1, Block rec_x2, Block rec_x3) {
    %match (Pair rec_x1, Block rec_x2, Block rec_x3) {
      buildPair (W1, W2), W, W_prime -> { return `buildPair (MUL1 (XOR (W1, W), FIX1 (ADD (XOR (W2, W), W_prime))), MUL2A (XOR (W2, W), FIX2 (ADD (XOR (W1, W), W_prime)))); }
    }
    throw new RuntimeException ("incomplete match in function computeXY_prime()");
  }

  private static Pair computeVW (Pair rec_x1) {
    %match (Pair rec_x1) {
      buildPair (W1, W2) -> { return `buildPair (CYC (W1), W2); }
    }
    throw new RuntimeException ("incomplete match in function computeVW()");
  }

  private static Pair loop1 (Pair rec_x1, Pair rec_x2, Message rec_x3) {
    %match (Pair rec_x1, Pair rec_x2, Message rec_x3) {
      P, P_prime, unitMessage (W) -> { return `computeXY (P, P_prime, W); }
      P, P_prime, consMessage (W, M) -> { return `loop1 (computeXY (P, P_prime, W), computeVW (P_prime), M); }
    }
    throw new RuntimeException ("incomplete match in function loop1()");
  }

  private static Pair loop2 (Pair rec_x1, Pair rec_x2, Message rec_x3) {
    %match (Pair rec_x1, Pair rec_x2, Message rec_x3) {
      P, P_prime, unitMessage (W) -> { return `computeVW (P_prime); }
      P, P_prime, consMessage (W, M) -> { return `loop2 (computeXY (P, P_prime, W), computeVW (P_prime), M); }
    }
    throw new RuntimeException ("incomplete match in function loop2()");
  }

  private static Block coda (Pair rec_x1, Pair rec_x2, Pair rec_x3) {
    %match (Pair rec_x1, Pair rec_x2, Pair rec_x3) {
      P, P_prime, buildPair (W, W_prime) -> { return `XOR_prime (computeXY (computeXY (P, P_prime, W), computeVW (P_prime), W_prime)); }
    }
    throw new RuntimeException ("incomplete match in function coda()");
  }

  private static Block Xmaa (Key rec_x1, Message rec_x2) {
    %match (Key rec_x1, Message rec_x2) {
      buildKey (W1, W2), M -> { return `MAA_prime (preludeXY (W1, W2), preludeVW (W1, W2), preludeST (W1, W2), M); }
    }
    throw new RuntimeException ("incomplete match in function Xmaa()");
  }

  private static Block MAA_prime (Pair rec_x1, Pair rec_x2, Pair rec_x3, Message rec_x4) {
    %match (Pair rec_x1, Pair rec_x2, Pair rec_x3, Message rec_x4) {
      P1, P2, P3, M -> { return `coda (loop1 (P1, P2, M), loop2 (P1, P2, M), P3); }
    }
    throw new RuntimeException ("incomplete match in function MAA_prime()");
  }

  private static Block MAC (Key rec_x1, Message rec_x2) {
    %match (Key rec_x1, Message rec_x2) {
      K, M -> { return `MACfirst (K, splitSegment (M)); }
    }
    throw new RuntimeException ("incomplete match in function MAC()");
  }

  private static Block MACfirst (Key rec_x1, SegmentedMessage rec_x2) {
    %match (Key rec_x1, SegmentedMessage rec_x2) {
      K, unitSegment (M) -> { return `Xmaa (K, M); }
      K, consSegment (M, S) -> { return `MACnext (K, Xmaa (K, M), S); }
    }
    throw new RuntimeException ("incomplete match in function MACfirst()");
  }

  private static Block MACnext (Key rec_x1, Block rec_x2, SegmentedMessage rec_x3) {
    %match (Key rec_x1, Block rec_x2, SegmentedMessage rec_x3) {
      K, W, unitSegment (M) -> { return `Xmaa (K, consMessage (W, M)); }
      K, W, consSegment (M, S) -> { return `MACnext (K, Xmaa (K, consMessage (W, M)), S); }
    }
    throw new RuntimeException ("incomplete match in function MACnext()");
  }

  public static void main (String[] args) {
    System.out.println (`eqBlock (MUL1 (x0000000F(), x0000000E()), x000000D2()));
    System.out.println (`eqBlock (MUL1 (xFFFFFFF0(), x0000000E()), xFFFFFF2D()));
    System.out.println (`eqBlock (MUL1 (xFFFFFFF0(), xFFFFFFF1()), x000000D2()));
    System.out.println (`eqBlock (MUL2 (x0000000F(), x0000000E()), x000000D2()));
    System.out.println (`eqBlock (MUL2 (xFFFFFFF0(), x0000000E()), xFFFFFF3A()));
    System.out.println (`eqBlock (MUL2 (xFFFFFFF0(), xFFFFFFF1()), x000000B6()));
    System.out.println (`eqBlock (MUL2A (x0000000F(), x0000000E()), x000000D2()));
    System.out.println (`eqBlock (MUL2A (xFFFFFFF0(), x0000000E()), xFFFFFF3A()));
    System.out.println (`eqBlock (MUL2A (x7FFFFFF0(), xFFFFFFF1()), x800000C2()));
    System.out.println (`eqBlock (MUL2A (xFFFFFFF0(), x7FFFFFF1()), x000000C4()));
    System.out.println (`eqPair (BYT (x00000000(), x00000000()), buildPair (x0103070F(), x1F3F7FFF())));
    System.out.println (`eqPair (BYT (xFFFF00FF(), xFFFFFFFF()), buildPair (xFEFC07F0(), xE0C08000())));
    System.out.println (`eqPair (BYT (xAB00FFCD(), xFFEF0001()), buildPair (xAB01FCCD(), xF2EF3501())));
    System.out.println (`eqOctet (PAT (x00000000(), x00000000()), xFF()));
    System.out.println (`eqOctet (PAT (xFFFF00FF(), xFFFFFFFF()), xFF()));
    System.out.println (`eqOctet (PAT (xAB00FFCD(), xFFEF0001()), x6A()));
    System.out.println (`eqBlock (J1_2 (x00000100()), x00010000()));
    System.out.println (`eqBlock (J1_4 (x00000100()), x00000001()));
    System.out.println (`eqBlock (J1_6 (x00000100()), x00010000()));
    System.out.println (`eqBlock (J1_8 (x00000100()), x00000001()));
    System.out.println (`eqBlock (J2_2 (x00000100()), x00010000()));
    System.out.println (`eqBlock (J2_4 (x00000100()), x00000002()));
    System.out.println (`eqBlock (J2_6 (x00000100()), x00020000()));
    System.out.println (`eqBlock (J2_8 (x00000100()), x00000004()));
    System.out.println (`eqBlock (H4 (x00000100()), x00000003()));
    System.out.println (`eqBlock (H6 (x00000100()), x00030000()));
    System.out.println (`eqBlock (H8 (x00000100()), x00000005()));
    System.out.println (`eqBlock (K1_2 (x00000080()), x00004000()));
    System.out.println (`eqBlock (K1_4 (x00000080()), x10000000()));
    System.out.println (`eqBlock (K1_5 (x00000080()), x00000008()));
    System.out.println (`eqBlock (K1_7 (x00000080()), x00020000()));
    System.out.println (`eqBlock (K1_9 (x00000080()), x80000000()));
    System.out.println (`eqBlock (K2_2 (x00000080()), x00004000()));
    System.out.println (`eqBlock (K2_4 (x00000080()), x10000000()));
    System.out.println (`eqBlock (K2_5 (x00000080()), x00000010()));
    System.out.println (`eqBlock (K2_7 (x00000080()), x00040000()));
    System.out.println (`eqBlock (K2_9 (x00000080()), x00000002()));
    System.out.println (`eqBlock (H0 (x00000080()), x00000018()));
    System.out.println (`eqBlock (Q (x01()), x00000004()));
    System.out.println (`eqBlock (H5 (x00000080(), x01()), x00000060()));
    System.out.println (`eqBlock (H7 (x00000080()), x00060000()));
    System.out.println (`eqBlock (H9 (x00000080()), x80000002()));
    System.out.println (`eqOctet (PAT (x00000003(), x00000060()), xEE()));
    System.out.println (`eqOctet (PAT (x00030000(), x00060000()), xBB()));
    System.out.println (`eqOctet (PAT (x00000005(), x80000002()), xE6()));
    System.out.println (`eqPair (BYT (x00000003(), x00000060()), buildPair (x01030703(), x1D3B7760())));
    System.out.println (`eqPair (BYT (x00030000(), x00060000()), buildPair (x0103050B(), x17065DBB())));
    System.out.println (`eqPair (BYT (x00000005(), x80000002()), buildPair (x01030705(), x80397302())));
    System.out.println (`eqBlock (CYC (x00000003()), x00000006()));
    System.out.println (`eqBlock (XOR (x00000006(), x00000003()), x00000005()));
    System.out.println (`eqBlock (XOR (x00000002(), x00000005()), x00000007()));
    System.out.println (`eqBlock (XOR (x00000003(), x00000005()), x00000006()));
    System.out.println (`eqBlock (ADD (x00000005(), x00000006()), x0000000B()));
    System.out.println (`eqBlock (ADD (x00000005(), x00000007()), x0000000C()));
    System.out.println (`eqBlock (OR (x0000000B(), x00000004()), x0000000F()));
    System.out.println (`eqBlock (OR (x0000000C(), x00000001()), x0000000D()));
    System.out.println (`eqBlock (AND (x0000000F(), xFFFFFFF7()), x00000007()));
    System.out.println (`eqBlock (AND (x0000000D(), xFFFFFFFB()), x00000009()));
    System.out.println (`eqBlock (MUL1 (x00000007(), x00000007()), x00000031()));
    System.out.println (`eqBlock (MUL2A (x00000006(), x00000009()), x00000036()));
    System.out.println (`eqBlock (XOR (x00000031(), x00000036()), x00000007()));
    System.out.println (`eqBlock (CYC (x00000003()), x00000006()));
    System.out.println (`eqBlock (XOR (x00000006(), x00000003()), x00000005()));
    System.out.println (`eqBlock (XOR (xFFFFFFFD(), x00000001()), xFFFFFFFC()));
    System.out.println (`eqBlock (XOR (xFFFFFFFC(), x00000001()), xFFFFFFFD()));
    System.out.println (`eqBlock (ADD (x00000005(), xFFFFFFFD()), x00000002()));
    System.out.println (`eqBlock (ADD (x00000005(), xFFFFFFFC()), x00000001()));
    System.out.println (`eqBlock (OR (x00000002(), x00000001()), x00000003()));
    System.out.println (`eqBlock (OR (x00000001(), x00000004()), x00000005()));
    System.out.println (`eqBlock (AND (x00000003(), xFFFFFFF9()), x00000001()));
    System.out.println (`eqBlock (AND (x00000005(), xFFFFFFFC()), x00000004()));
    System.out.println (`eqBlock (MUL1 (xFFFFFFFC(), x00000001()), xFFFFFFFC()));
    System.out.println (`eqBlock (MUL2A (xFFFFFFFD(), x00000004()), xFFFFFFFA()));
    System.out.println (`eqBlock (XOR (xFFFFFFFC(), xFFFFFFFA()), x00000006()));
    System.out.println (`eqBlock (CYC (x00000007()), x0000000E()));
    System.out.println (`eqBlock (XOR (x0000000E(), x00000007()), x00000009()));
    System.out.println (`eqBlock (XOR (xFFFFFFFD(), x00000008()), xFFFFFFF5()));
    System.out.println (`eqBlock (XOR (xFFFFFFFC(), x00000008()), xFFFFFFF4()));
    System.out.println (`eqBlock (ADD (x00000009(), xFFFFFFF4()), xFFFFFFFD()));
    System.out.println (`eqBlock (ADD (x00000009(), xFFFFFFF5()), xFFFFFFFE()));
    System.out.println (`eqBlock (OR (xFFFFFFFD(), x00000001()), xFFFFFFFD()));
    System.out.println (`eqBlock (OR (xFFFFFFFE(), x00000002()), xFFFFFFFE()));
    System.out.println (`eqBlock (AND (xFFFFFFFD(), xFFFFFFFE()), xFFFFFFFC()));
    System.out.println (`eqBlock (AND (xFFFFFFFE(), x7FFFFFFD()), x7FFFFFFC()));
    System.out.println (`eqBlock (MUL1 (xFFFFFFF5(), xFFFFFFFC()), x0000001E()));
    System.out.println (`eqBlock (MUL2A (xFFFFFFF4(), x7FFFFFFC()), x0000001E()));
    System.out.println (`eqBlock (XOR (x0000001E(), x0000001E()), x00000000()));
    System.out.println (`eqBlock (CYC (x00000001()), x00000002()));
    System.out.println (`eqBlock (XOR (x00000002(), x00000001()), x00000003()));
    System.out.println (`eqBlock (XOR (x00000001(), x00000000()), x00000001()));
  main1();
  }
  static void main1 () {
    System.out.println (`eqBlock (XOR (x00000002(), x00000000()), x00000002()));
    System.out.println (`eqBlock (ADD (x00000003(), x00000002()), x00000005()));
    System.out.println (`eqBlock (ADD (x00000003(), x00000001()), x00000004()));
    System.out.println (`eqBlock (OR (x00000005(), x00000002()), x00000007()));
    System.out.println (`eqBlock (OR (x00000004(), x00000001()), x00000005()));
    System.out.println (`eqBlock (AND (x00000007(), xFFFFFFFB()), x00000003()));
    System.out.println (`eqBlock (AND (x00000005(), xFFFFFFFB()), x00000001()));
    System.out.println (`eqBlock (MUL1 (x00000001(), x00000003()), x00000003()));
    System.out.println (`eqBlock (MUL2A (x00000002(), x00000001()), x00000002()));
    System.out.println (`eqBlock (XOR (x00000003(), x00000002()), x00000001()));
    System.out.println (`eqBlock (CYC (x00000002()), x00000004()));
    System.out.println (`eqBlock (XOR (x00000004(), x00000001()), x00000005()));
    System.out.println (`eqBlock (XOR (x00000003(), x00000001()), x00000002()));
    System.out.println (`eqBlock (XOR (x00000002(), x00000001()), x00000003()));
    System.out.println (`eqBlock (ADD (x00000005(), x00000003()), x00000008()));
    System.out.println (`eqBlock (ADD (x00000005(), x00000002()), x00000007()));
    System.out.println (`eqBlock (OR (x00000008(), x00000002()), x0000000A()));
    System.out.println (`eqBlock (OR (x00000007(), x00000001()), x00000007()));
    System.out.println (`eqBlock (AND (x0000000A(), xFFFFFFFB()), x0000000A()));
    System.out.println (`eqBlock (AND (x00000007(), xFFFFFFFB()), x00000003()));
    System.out.println (`eqBlock (MUL1 (x00000002(), x0000000A()), x00000014()));
    System.out.println (`eqBlock (MUL2A (x00000003(), x00000003()), x00000009()));
    System.out.println (`eqBlock (XOR (x00000014(), x00000009()), x0000001D()));
    System.out.println (`eqBlock (CYC (x00000004()), x00000008()));
    System.out.println (`eqBlock (XOR (x00000008(), x00000001()), x00000009()));
    System.out.println (`eqBlock (XOR (x00000014(), x00000002()), x00000016()));
    System.out.println (`eqBlock (XOR (x00000009(), x00000002()), x0000000B()));
    System.out.println (`eqBlock (ADD (x00000009(), x0000000B()), x00000014()));
    System.out.println (`eqBlock (ADD (x00000009(), x00000016()), x0000001F()));
    System.out.println (`eqBlock (OR (x00000014(), x00000002()), x00000016()));
    System.out.println (`eqBlock (OR (x0000001F(), x00000001()), x0000001F()));
    System.out.println (`eqBlock (AND (x00000016(), xFFFFFFFB()), x00000012()));
    System.out.println (`eqBlock (AND (x0000001F(), xFFFFFFFB()), x0000001B()));
    System.out.println (`eqBlock (MUL1 (x00000016(), x00000012()), x0000018C()));
    System.out.println (`eqBlock (MUL2A (x0000000B(), x0000001B()), x00000129()));
    System.out.println (`eqBlock (XOR (x0000018C(), x00000129()), x000000A5()));
    System.out.println (`eqBlock (CYC (xC4EB1AEB()), x89D635D7()));
    System.out.println (`eqBlock (XOR (x89D635D7(), xF6A09667()), x7F76A3B0()));
    System.out.println (`eqBlock (XOR (x21D869BA(), x0A202020()), x2BF8499A()));
    System.out.println (`eqBlock (XOR (x7792F9D4(), x0A202020()), x7DB2D9F4()));
    System.out.println (`eqBlock (ADD (x7F76A3B0(), x7DB2D9F4()), xFD297DA4()));
    System.out.println (`eqBlock (ADD (x7F76A3B0(), x2BF8499A()), xAB6EED4A()));
    System.out.println (`eqBlock (OR (xFD297DA4(), x02040801()), xFF2D7DA5()));
    System.out.println (`eqBlock (OR (xAB6EED4A(), x00804021()), xABEEED6B()));
    System.out.println (`eqBlock (AND (xFF2D7DA5(), xBFEF7FDF()), xBF2D7D85()));
    System.out.println (`eqBlock (AND (xABEEED6B(), x7DFEFBFF()), x29EEE96B()));
    System.out.println (`eqBlock (MUL1 (x2BF8499A(), xBF2D7D85()), x0AD67E20()));
    System.out.println (`eqBlock (MUL2A (x7DB2D9F4(), x29EEE96B()), x30261492()));
    System.out.println (`eqOctet (PAT (x00FF00FF(), x00000000()), xFF()));
    System.out.println (`eqPair (preludeXY (x00FF00FF(), x00000000()), buildPair (x4A645A01(), x50DEC930())));
    System.out.println (`eqPair (preludeVW (x00FF00FF(), x00000000()), buildPair (x5CCA3239(), xFECCAA6E())));
    System.out.println (`eqPair (preludeST (x00FF00FF(), x00000000()), buildPair (x51EDE9C7(), x24B66FB5())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4A645A01(), x50DEC930()), x55555555(), XOR (nCYC (n1(), x5CCA3239()), xFECCAA6E())), buildPair (x48B204D6(), x5834A585())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x48B204D6(), x5834A585()), xAAAAAAAA(), XOR (nCYC (n2(), x5CCA3239()), xFECCAA6E())), buildPair (x4F998E01(), xBE9F0917())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4F998E01(), xBE9F0917()), x51EDE9C7(), XOR (nCYC (n3(), x5CCA3239()), xFECCAA6E())), buildPair (x344925FC(), xDB9102B0())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x344925FC(), xDB9102B0()), x24B66FB5(), XOR (nCYC (n4(), x5CCA3239()), xFECCAA6E())), buildPair (x277B4B25(), xD636250D())));
    System.out.println (`eqBlock (XOR (x277B4B25(), xD636250D()), xF14D6E28()));
    System.out.println (`eqOctet (PAT (x00FF00FF(), x00000000()), xFF()));
    System.out.println (`eqPair (preludeXY (x00FF00FF(), x00000000()), buildPair (x4A645A01(), x50DEC930())));
    System.out.println (`eqPair (preludeVW (x00FF00FF(), x00000000()), buildPair (x5CCA3239(), xFECCAA6E())));
    System.out.println (`eqPair (preludeST (x00FF00FF(), x00000000()), buildPair (x51EDE9C7(), x24B66FB5())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4A645A01(), x50DEC930()), xAAAAAAAA(), XOR (nCYC (n1(), x5CCA3239()), xFECCAA6E())), buildPair (x6AEBACF8(), x9DB15CF6())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x6AEBACF8(), x9DB15CF6()), x55555555(), XOR (nCYC (n2(), x5CCA3239()), xFECCAA6E())), buildPair (x270EEDAF(), xB8142629())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x270EEDAF(), xB8142629()), x51EDE9C7(), XOR (nCYC (n3(), x5CCA3239()), xFECCAA6E())), buildPair (x29907CD8(), xBA92DB12())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x29907CD8(), xBA92DB12()), x24B66FB5(), XOR (nCYC (n4(), x5CCA3239()), xFECCAA6E())), buildPair (x28EAD8B3(), x81D10CA3())));
    System.out.println (`eqBlock (XOR (x28EAD8B3(), x81D10CA3()), xA93BD410()));
    System.out.println (`eqOctet (PAT (x55555555(), x5A35D667()), x00()));
    System.out.println (`eqPair (preludeXY (x55555555(), x5A35D667()), buildPair (x34ACF886(), x7397C9AE())));
    System.out.println (`eqPair (preludeVW (x55555555(), x5A35D667()), buildPair (x7201F4DC(), x2829040B())));
    System.out.println (`eqPair (preludeST (x55555555(), x5A35D667()), buildPair (x9E2E7B36(), x13647149())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x34ACF886(), x7397C9AE()), x00000000(), XOR (nCYC (n1(), x7201F4DC()), x2829040B())), buildPair (x2FD76FFB(), x550D91CE())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x2FD76FFB(), x550D91CE()), xFFFFFFFF(), XOR (nCYC (n2(), x7201F4DC()), x2829040B())), buildPair (xA70FC148(), x1D10D8D3())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xA70FC148(), x1D10D8D3()), x9E2E7B36(), XOR (nCYC (n3(), x7201F4DC()), x2829040B())), buildPair (xB1CC1CC5(), x29C1485F())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xB1CC1CC5(), x29C1485F()), x13647149(), XOR (nCYC (n4(), x7201F4DC()), x2829040B())), buildPair (x288FC786(), x9115A558())));
    System.out.println (`eqBlock (XOR (x288FC786(), x9115A558()), xB99A62DE()));
    System.out.println (`eqOctet (PAT (x55555555(), x5A35D667()), x00()));
    System.out.println (`eqPair (preludeXY (x55555555(), x5A35D667()), buildPair (x34ACF886(), x7397C9AE())));
    System.out.println (`eqPair (preludeVW (x55555555(), x5A35D667()), buildPair (x7201F4DC(), x2829040B())));
    System.out.println (`eqPair (preludeST (x55555555(), x5A35D667()), buildPair (x9E2E7B36(), x13647149())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x34ACF886(), x7397C9AE()), xFFFFFFFF(), XOR (nCYC (n1(), x7201F4DC()), x2829040B())), buildPair (x8DC8BBDE(), xFE4E5BDD())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x8DC8BBDE(), xFE4E5BDD()), x00000000(), XOR (nCYC (n2(), x7201F4DC()), x2829040B())), buildPair (xCBC865BA(), x0297AF6F())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xCBC865BA(), x0297AF6F()), x9E2E7B36(), XOR (nCYC (n3(), x7201F4DC()), x2829040B())), buildPair (x3CF3A7D2(), x160EE9B5())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x3CF3A7D2(), x160EE9B5()), x13647149(), XOR (nCYC (n4(), x7201F4DC()), x2829040B())), buildPair (xD0482465(), x7050EC5E())));
    System.out.println (`eqBlock (XOR (xD0482465(), x7050EC5E()), xA018C83B()));
    System.out.println (`eqPair (preludeXY (xE6A12F07(), x9D15C437()), buildPair (x21D869BA(), x7792F9D4())));
    System.out.println (`eqPair (preludeVW (xE6A12F07(), x9D15C437()), buildPair (xC4EB1AEB(), xF6A09667())));
    System.out.println (`eqPair (preludeST (xE6A12F07(), x9D15C437()), buildPair (x6D67E884(), xA511987A())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x204E80A7(), x077788A2()), x00000000(), XOR (nCYC (n1(), x17A808FD()), xFEA1D334())), buildPair (x303FF4AA(), x1277A6D4())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x303FF4AA(), x1277A6D4()), x00000000(), XOR (nCYC (n2(), x17A808FD()), xFEA1D334())), buildPair (x55DD063F(), x4C49AAE0())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x55DD063F(), x4C49AAE0()), x00000000(), XOR (nCYC (n3(), x17A808FD()), xFEA1D334())), buildPair (x51AF3C1D(), x5BC02502())));
  main2();
  }
  static void main2 () {
    System.out.println (`eqPair (computeXY_prime (buildPair (x51AF3C1D(), x5BC02502()), x00000000(), XOR (nCYC (n4(), x17A808FD()), xFEA1D334())), buildPair (xA44AAAC0(), x63C70DBA())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xA44AAAC0(), x63C70DBA()), x00000000(), XOR (nCYC (n5(), x17A808FD()), xFEA1D334())), buildPair (x4D53901A(), x2E80AC30())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4D53901A(), x2E80AC30()), x00000000(), XOR (nCYC (n6(), x17A808FD()), xFEA1D334())), buildPair (x5F38EEF1(), x2A6091AE())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x5F38EEF1(), x2A6091AE()), x00000000(), XOR (nCYC (n7(), x17A808FD()), xFEA1D334())), buildPair (xF0239DD5(), x3DD81AC6())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xF0239DD5(), x3DD81AC6()), x00000000(), XOR (nCYC (n8(), x17A808FD()), xFEA1D334())), buildPair (xEB35B97F(), x9372CDC6())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xEB35B97F(), x9372CDC6()), x00000000(), XOR (nCYC (n9(), x17A808FD()), xFEA1D334())), buildPair (x4DA124A1(), xC6B1317E())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4DA124A1(), xC6B1317E()), x00000000(), XOR (nCYC (n10(), x17A808FD()), xFEA1D334())), buildPair (x7F839576(), x74B39176())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x7F839576(), x74B39176()), x00000000(), XOR (nCYC (n11(), x17A808FD()), xFEA1D334())), buildPair (x11A9D254(), xD78634BC())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x11A9D254(), xD78634BC()), x00000000(), XOR (nCYC (n12(), x17A808FD()), xFEA1D334())), buildPair (xD8804CA5(), xFDC1A8BA())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xD8804CA5(), xFDC1A8BA()), x00000000(), XOR (nCYC (n13(), x17A808FD()), xFEA1D334())), buildPair (x3F6F7248(), x11AC46B8())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x3F6F7248(), x11AC46B8()), x00000000(), XOR (nCYC (n14(), x17A808FD()), xFEA1D334())), buildPair (xACBC13DD(), x33D5A466())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xACBC13DD(), x33D5A466()), x00000000(), XOR (nCYC (n15(), x17A808FD()), xFEA1D334())), buildPair (x4CE933E1(), xC21A1846())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x4CE933E1(), xC21A1846()), x00000000(), XOR (nCYC (n16(), x17A808FD()), xFEA1D334())), buildPair (xC1ED90DD(), xCD959B46())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xC1ED90DD(), xCD959B46()), x00000000(), XOR (nCYC (n17(), x17A808FD()), xFEA1D334())), buildPair (x3CD54DEB(), x613F8E2A())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x3CD54DEB(), x613F8E2A()), x00000000(), XOR (nCYC (n18(), x17A808FD()), xFEA1D334())), buildPair (xBBA57835(), x07C72EAA())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xBBA57835(), x07C72EAA()), x00000000(), XOR (nCYC (n19(), x17A808FD()), xFEA1D334())), buildPair (xD7843FDC(), x6AD6E8A4())));
    System.out.println (`eqPair (computeXY_prime (buildPair (xD7843FDC(), x6AD6E8A4()), x00000000(), XOR (nCYC (n20(), x17A808FD()), xFEA1D334())), buildPair (x5EBA06C2(), x91896CFA())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x5EBA06C2(), x91896CFA()), x76232E5F(), XOR (nCYC (n21(), x17A808FD()), xFEA1D334())), buildPair (x1D9C9655(), x98D1CC75())));
    System.out.println (`eqPair (computeXY_prime (buildPair (x1D9C9655(), x98D1CC75()), x4FB1138A(), XOR (nCYC (n22(), x17A808FD()), xFEA1D334())), buildPair (x7BC180AB(), xA0B87B77())));
    System.out.println (`eqBlock (MAC (buildKey (x80018001(), x80018000()), makeMessage (n20(), x00000000(), x00000000())), xDB79FBDC()));
    System.out.println (`eqBlock (MAC (buildKey (x80018001(), x80018000()), makeMessage (n16(), x00000000(), x07050301())), x8CE37709()));
    System.out.println (`eqBlock (MAC (buildKey (x80018001(), x80018000()), makeMessage (n256(), x00000000(), x07050301())), x717153D5()));
    System.out.println (`eqBlock (MAC (buildKey (x80018001(), x80018000()), makeMessage (n4100(), x00000000(), x07050301())), x7783C51D()));
  }
}
