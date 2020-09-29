// TOM-B
import binarysearch.term.*;
import binarysearch.term.types.*;
public class Binarysearch {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | T()
      | F()
    Pos =
      | One()
      | cDub(rec_x1_1:Xbool, rec_x2_1:Pos)
    Xint =
      | cInt(rec_x1_1:Xnat)
      | cNeg(rec_x1_2:Pos)
    Xnat =
      | Zero()
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
      One(),One() -> { return `T(); }
      One(),cDub (b,p) -> { return `F(); }
      cDub (b,p),One() -> { return `F(); }
      cDub (b,p),cDub (c,q) -> { return `and (eqBool (b,c), eqPos (p,q)); }
    }
    throw new RuntimeException ("incomplete match in function eqPos()");
  }

  private static Xbool lePos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      One(),p -> { return `T(); }
      cDub (b,p),One() -> { return `F(); }
      cDub (b,p),cDub (c,q) -> { if (`b == `c) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `F()) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `T()) { return `ltPos (p,q); } }
    }
    throw new RuntimeException ("incomplete match in function lePos()");
  }

  private static Xbool ltPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,One() -> { return `F(); }
      One(),cDub (b,p) -> { return `T(); }
      cDub (b,p),cDub (c,q) -> { if (`b == `c) { return `ltPos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `F()) { return `lePos (p,q); } }
      cDub (b,p),cDub (c,q) -> { if (`b != `c && `b == `T()) { return `ltPos (p,q); } }
    }
    throw new RuntimeException ("incomplete match in function ltPos()");
  }

  private static Xbool gePos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,q -> { return `lePos (q,p); }
    }
    throw new RuntimeException ("incomplete match in function gePos()");
  }

  private static Pos succ2Pos (Pos rec_x1) {
    %match (Pos rec_x1) {
      One() -> { return `cDub (F(),One()); }
      cDub (F(),p) -> { return `cDub (T(),p); }
      cDub (T(),p) -> { return `cDub (F(),succ2Pos (p)); }
    }
    throw new RuntimeException ("incomplete match in function succ2Pos()");
  }

  private static Pos plusPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,q -> { return `addc (F(),p,q); }
    }
    throw new RuntimeException ("incomplete match in function plusPos()");
  }

  private static Pos addc (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
    %match (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
      F(),One(),p -> { return `succ2Pos (p); }
      T(),One(),p -> { return `succ2Pos (succ2Pos (p)); }
      F(),p,One() -> { return `succ2Pos (p); }
      T(),p,One() -> { return `succ2Pos (succ2Pos (p)); }
      b,cDub (c,p),cDub (d,q) -> { if (`c == `d) { return `cDub (b,addc (c,p,q)); } }
      b,cDub (c,p),cDub (d,q) -> { if (`c != `d) { return `cDub (Xnot (b),addc (b,p,q)); } }
    }
    throw new RuntimeException ("incomplete match in function addc()");
  }

  private static Xnat lambda0 (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4) {
      n,y,x,h -> { if (`lt (f (h),n) == `T()) { return `bs2 (n,h,y); } }
      n,y,x,h -> { if (`lt (f (h),n) == `F()) { return `bs2 (n,x,h); } }
    }
    throw new RuntimeException ("incomplete match in function lambda0()");
  }

  private static Xnat max2Int (Xint rec_x1, Xnat rec_x2) {
    %match (Xint rec_x1, Xnat rec_x2) {
      cInt (m),n -> { return `max2 (m,n); }
      cNeg (p),n -> { return `n; }
    }
    throw new RuntimeException ("incomplete match in function max2Int()");
  }

  private static Xint min2 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      Zero() -> { return `cInt (Zero()); }
      cNat (p) -> { return `cNeg (p); }
    }
    throw new RuntimeException ("incomplete match in function min2()");
  }

  private static Xint minus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      m,n -> { if (`ge (m,n) == `T()) { return `cInt (gtesubtn (m,n)); } }
      m,n -> { if (`lt (m,n) == `T()) { return `min2 (gtesubtn (n,m)); } }
    }
    throw new RuntimeException ("incomplete match in function minus()");
  }

  private static Xbool eq (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      Zero(),Zero() -> { return `T(); }
      Zero(),cNat (p) -> { return `F(); }
      cNat (p),Zero() -> { return `F(); }
      cNat (p),cNat (q) -> { return `eqPos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function eq()");
  }

  private static Xnat ite (Xbool rec_x1, Xnat rec_x2, Xnat rec_x3) {
    %match (Xbool rec_x1, Xnat rec_x2, Xnat rec_x3) {
      T(),m,n -> { return `m; }
      F(),m,n -> { return `n; }
    }
    throw new RuntimeException ("incomplete match in function ite()");
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

  private static Xbool le (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      Zero(),n -> { return `T(); }
      cNat (p),Zero() -> { return `F(); }
      cNat (p),cNat (q) -> { return `lePos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function le()");
  }

  private static Xbool lt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      n,Zero() -> { return `F(); }
      Zero(),cNat (p) -> { return `T(); }
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

  private static Xnat max2 (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      m,n -> { return `ite (le (m,n),n,m); }
    }
    throw new RuntimeException ("incomplete match in function max2()");
  }

  private static Pos succ2 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      Zero() -> { return `One(); }
      cNat (p) -> { return `succ2Pos (p); }
    }
    throw new RuntimeException ("incomplete match in function succ2()");
  }

  private static Xnat pred2 (Pos rec_x1) {
    %match (Pos rec_x1) {
      One() -> { return `Zero(); }
      cDub (T(),p) -> { return `cNat (cDub (F(),p)); }
      cDub (F(),p) -> { return `dub (T(),pred2 (p)); }
    }
    throw new RuntimeException ("incomplete match in function pred2()");
  }

  private static Xnat dub (Xbool rec_x1, Xnat rec_x2) {
    %match (Xbool rec_x1, Xnat rec_x2) {
      F(),Zero() -> { return `Zero(); }
      T(),Zero() -> { return `cNat (One()); }
      b,cNat (p) -> { return `cNat (cDub (b,p)); }
    }
    throw new RuntimeException ("incomplete match in function dub()");
  }

  private static Pos plusNatPos (Xnat rec_x1, Pos rec_x2) {
    %match (Xnat rec_x1, Pos rec_x2) {
      Zero(),p -> { return `p; }
      cNat (p),q -> { return `plusPos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function plusNatPos()");
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      Zero(),n -> { return `n; }
      n,Zero() -> { return `n; }
      cNat (p),cNat (q) -> { return `cNat (addc (F(),p,q)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat gtesubtp (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,q -> { return `gtesubtb (F(),p,q); }
    }
    throw new RuntimeException ("incomplete match in function gtesubtp()");
  }

  private static Xnat gtesubtn (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      n,Zero() -> { return `n; }
      cNat (p),cNat (q) -> { return `gtesubtp (p,q); }
    }
    throw new RuntimeException ("incomplete match in function gtesubtn()");
  }

  private static Xnat gtesubtb (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
    %match (Xbool rec_x1, Pos rec_x2, Pos rec_x3) {
      F(),p,One() -> { return `pred2 (p); }
      T(),p,One() -> { return `pred2 (Nat2Pos (pred2 (p))); }
      b,cDub (c,p),cDub (d,q) -> { if (`c == `d) { return `dub (b,gtesubtb (b,p,q)); } }
      b,cDub (c,p),cDub (d,q) -> { if (`c != `d) { return `dub (Xnot (b),gtesubtb (d,p,q)); } }
    }
    throw new RuntimeException ("incomplete match in function gtesubtb()");
  }

  private static Xnat dividePos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      p,q -> { if (`gePos (p,q) == `T()) { return `cNat (succ2 (divide (gtesubtp (p,q),q))); } }
      p,q -> { if (`ltPos (p,q) == `T()) { return `Zero(); } }
    }
    throw new RuntimeException ("incomplete match in function dividePos()");
  }

  private static Xnat divide (Xnat rec_x1, Pos rec_x2) {
    %match (Xnat rec_x1, Pos rec_x2) {
      Zero(),p -> { return `Zero(); }
      cNat (p),q -> { return `dividePos (p,q); }
    }
    throw new RuntimeException ("incomplete match in function divide()");
  }

  private static Xnat f (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      Zero() -> { return `Zero(); }
      cNat (One()) -> { return `cNat (One()); }
      cNat (cDub (b,p)) -> { return `plus (f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (One())),Zero())),f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (cDub (F(),One()))),Zero()))); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  private static Xnat bs (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      n,m -> { return `bs2 (n,Zero(),m); }
    }
    throw new RuntimeException ("incomplete match in function bs()");
  }

  private static Xnat bs2 (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3) {
      n,x,y -> { if (`eq (Pos2Nat (plusNatPos (x,One())),y) == `T()) { return `x; } }
      n,x,y -> { if (`eq (Pos2Nat (plusNatPos (x,One())),y) == `F()) { return `lambda0 (n,y,x,divide (plus (x,y),cDub (F(),One()))); } }
    }
    throw new RuntimeException ("incomplete match in function bs2()");
  }

  public static void main (String[] args) {
    System.out.println (`bs (Pos2Nat (cDub (T(),cDub (T(),cDub (F(),cDub (T(),cDub (F(),cDub (T(),cDub (T(),cDub (F(),cDub (T(),cDub (F(),cDub (T(),One())))))))))))),Pos2Nat (cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),One())))))))));
  }
}
