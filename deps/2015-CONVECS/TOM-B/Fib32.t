// TOM-B
import fib32.term.*;
import fib32.term.types.*;
public class Fib32 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | T()
      | F()
    Pos =
      | d1()
      | cDub(rec_x1_1:Xbool, rec_x2_1:Pos)
    Xint =
      | cInt(rec_x1_1:Xnat)
      | cNeg(rec_x1_2:Pos)
    Xnat =
      | d0()
      | cNat(rec_x1_1:Pos)
  }

  private static Xbool eqBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      T(),b -> { return `b; }
      F(),T() -> { return `F(); }
      F(),F() -> { return `T(); }
    }
    throw new RuntimeException ("incomplete match in function eqBool()");
  }

  private static Xbool and (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      T(),b -> { return `b; }
      F(),b -> { return `F(); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Xbool Xnot (Xbool rec_x1) {
    %match (Xbool rec_x1) {
      T() -> { return `F(); }
      F() -> { return `T(); }
    }
    throw new RuntimeException ("incomplete match in function Xnot()");
  }

  private static Xbool eqPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      d1(),d1() -> { return `T(); }
      d1(),cDub (b,p) -> { return `F(); }
      cDub (b,p),d1() -> { return `F(); }
      cDub (b,p),cDub (c,q) -> { return `and (eqBool (b,c),eqPos (p,q)); }
    }
    throw new RuntimeException ("incomplete match in function eqPos()");
  }

  private static Xbool lePos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      d1(),p -> { return `T(); }
      cDub (b,p),d1() -> { return `F(); }
      cDub (b,p),cDub (c,q) -> { if (`b == `c) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `F()) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `T()) { return `ltPos (p,q); } }
    }
    throw new RuntimeException ("incomplete match in function lePos()");
  }

  private static Xbool ltPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,d1() -> { return `F(); }
      d1(),cDub (b,p) -> { return `T(); }
      cDub (b,p),cDub (c,q) -> { if (`b == `c) { return `ltPos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `F()) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `T()) { return `ltPos (p,q); } }
    }
    throw new RuntimeException ("incomplete match in function ltPos()");
  }

  private static Pos s (Pos rec_x1) {
    %match (Pos rec_x1) {
      d1() -> { return `cDub (F(),d1()); }
      cDub (F(),p) -> { return `cDub (T(),p); }
      cDub (T(),p) -> { return `cDub (F(),s (p)); }
    }
    throw new RuntimeException ("incomplete match in function s()");
  }

  private static Pos addc (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
    %match (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
      F(),d1(),p -> { return `s (p); }
      T(),d1(),p -> { return `s (s (p)); }
      F(),p,d1() -> { return `s (p); }
      T(),p,d1() -> { return `s (s (p)); }
      b,cDub (c,p),cDub (d,q) -> { if (`c == `d) { return `cDub (b,addc (c,p,q)); } }
      b,cDub (c,p),cDub (d,q) -> { if (`c != `d) { return `cDub (Xnot (b),addc (c,p,q)); } }
    }
    throw new RuntimeException ("incomplete match in function addc()");
  }

  private static Xnat Int2Nat (Xint rec_x1) {
    %match (Xint rec_x1) {
      cInt (n) -> { return `n; }
    }
    throw new RuntimeException ("incomplete match in function Int2Nat()");
  }

  private static Xint minus (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `cInt (d0()); }
      cNat (p) -> { return `cNeg (p); }
    }
    throw new RuntimeException ("incomplete match in function minus()");
  }

  private static Xint minus2 (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      m,n -> { if (`ge (m,n) == `T()) { return `cInt (gtesubt (m,n)); } }
      m,n -> { if (`ge (m,n) == `F()) { return `minus (gtesubt (n,m)); } }
    }
    throw new RuntimeException ("incomplete match in function minus2()");
  }

  private static Xnat Pos2Nat (Pos rec_x1) {
    %match (Pos rec_x1) {
      p -> { return `cNat (p); }
    }
    throw new RuntimeException ("incomplete match in function Pos2Nat()");
  }

  private static Pos Nat2Pos (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      cNat (p) -> { return `p; }
    }
    throw new RuntimeException ("incomplete match in function Nat2Pos()");
  }

  private static Xbool eq (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(),d0() -> { return `T(); }
      d0(),cNat (p) -> { return `F(); }
      cNat (p),d0() -> { return `F(); }
      cNat (p),cNat (q) -> { return `eqPos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function eq()");
  }

  private static Xbool le (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(),n -> { return `T(); }
      cNat (p),d0() -> { return `F(); }
      cNat (p),cNat (q) -> { return `lePos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function le()");
  }

  private static Xbool lt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      n,d0() -> { return `F(); }
      d0(),cNat (p) -> { return `T(); }
      cNat (p),cNat (q) -> { return `ltPos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function lt()");
  }

  private static Xbool ge (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      m,n -> { return `le (n,m); }
    }
    throw new RuntimeException ("incomplete match in function ge()");
  }

  private static Xbool gt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      m,n -> { return `lt (n,m); }
    }
    throw new RuntimeException ("incomplete match in function gt()");
  }

  private static Xnat pre (Pos rec_x1) {
    %match (Pos rec_x1) {
      d1() -> { return `d0(); }
      cDub (T(),p) -> { return `cNat (cDub (F(),p)); }
      cDub (F(),p) -> { return `dub (T(),pre (p)); }
    }
    throw new RuntimeException ("incomplete match in function pre()");
  }

  private static Xnat dub (Xbool rec_x1, Xnat rec_x2) {
    %match (Xbool rec_x1, Xnat rec_x2) {
      F(),d0() -> { return `d0(); }
      T(),d0() -> { return `cNat (d1()); }
      b,cNat (p) -> { return `cNat (cDub (b,p)); }
    }
    throw new RuntimeException ("incomplete match in function dub()");
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(),n -> { return `n; }
      n,d0() -> { return `n; }
      cNat (p),cNat (q) -> { return `cNat (addc (F(),p,q)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat gtesubtPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,q -> { return `gtesubtb (F(),p,q); }
    }
    throw new RuntimeException ("incomplete match in function gtesubtPos()");
  }

  private static Xnat gtesubt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      n,d0() -> { return `n; }
      cNat (p),cNat (q) -> { return `gtesubtPos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function gtesubt()");
  }

  private static Xnat gtesubtb (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
    %match (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
      F(),p,d1() -> { return `pre (p); }
      T(),p,d1() -> { return `pre (Nat2Pos (pre (p))); }
      b,cDub (c,p),cDub (d,q) -> { if (`c == `d) { return `dub (b,gtesubtb (b,p,q)); } }
      b,cDub (c,p),cDub (d,q) -> { if (`c != `d && `c == `F()) { return `dub (Xnot (b),gtesubtb (T(),p,q)); } }
      b,cDub (c,p),cDub (d,q) -> { if (`c != `d && `c == `T()) { return `dub (Xnot (b),gtesubtb (d,p,q)); } }
    }
    throw new RuntimeException ("incomplete match in function gtesubtb()");
  }

  private static Xnat fib (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `d0(); }
      cNat (d1()) -> { return `cNat (d1()); }
      cNat (cDub (b,p)) -> { return `plus (fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (d1())))),fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (cDub (F(),d1())))))); }
    }
    throw new RuntimeException ("incomplete match in function fib()");
  }

  public static void main (String[] args) {
    System.out.println (`fib (Pos2Nat (cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),d1()))))))));
  }
}
