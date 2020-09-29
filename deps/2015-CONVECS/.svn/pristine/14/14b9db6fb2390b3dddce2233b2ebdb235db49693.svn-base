// TOM-B
import evalexpr.term.*;
import evalexpr.term.types.*;
public class Evalexpr {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Pos =
      | d1()
      | cDub(rec_x1_1:Xbool, rec_x2_1:Pos)
    ENat =
      | Exz()
      | Exs(rec_x1_1:ENat)
      | Explus(rec_x1_2:ENat, rec_x2_2:ENat)
      | Exmult(rec_x1_3:ENat, rec_x2_3:ENat)
      | Exexp(rec_x1_4:ENat, rec_x2_4:ENat)
    SNat =
      | Z()
      | S(rec_x1_1:SNat)
  }

  private static Xbool eqBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      Xtrue(),b -> { return `b; }
      Xfalse(),Xtrue() -> { return `Xfalse(); }
      Xfalse(),Xfalse() -> { return `Xtrue(); }
    }
    throw new RuntimeException ("incomplete match in function eqBool()");
  }

  private static Xbool and (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      b,Xtrue() -> { return `b; }
      b,Xfalse() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Xbool eqPos (Pos rec_x1, Pos rec_x2) {
    %match (Pos rec_x1, Pos rec_x2) {
      d1(),d1() -> { return `Xtrue(); }
      d1(),cDub (b,p) -> { return `Xfalse(); }
      cDub (b,p),d1() -> { return `Xfalse(); }
      cDub (b,p),cDub (c,q) -> { return `and (eqBool (b,c), eqPos (p,q)); }
    }
    throw new RuntimeException ("incomplete match in function eqPos()");
  }

  private static Xbool lambda0 (ENat rec_x1) {
    %match (ENat rec_x1) {
      m -> { return `eq (eval17 (m),evalexp17 (m)); }
    }
    throw new RuntimeException ("incomplete match in function lambda0()");
  }

  private static Xbool eq (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      Z(),Z() -> { return `Xtrue(); }
      Z(),S (r) -> { return `Xfalse(); }
      S (r),Z() -> { return `Xfalse(); }
      S (r),S (t) -> { return `eq (r,t); }
    }
    throw new RuntimeException ("incomplete match in function eq()");
  }

  private static Xbool eqENat (ENat rec_x1, ENat rec_x2) {
    %match (ENat rec_x1, ENat rec_x2) {
      Exz(),Exz() -> { return `Xtrue(); }
      Exz(),Exs (m) -> { return `Xfalse(); }
      Exz(),Explus (m,n) -> { return `Xfalse(); }
      Exz(),Exmult (m,n) -> { return `Xfalse(); }
      Exz(),Exexp (m,n) -> { return `Xfalse(); }
      Exs (m),Exz() -> { return `Xfalse(); }
      Exs (n),Exs (m) -> { return `eqENat (n,m); }
      Exs (m),Explus (n,o) -> { return `Xfalse(); }
      Exs (n),Exmult (m,o) -> { return `Xfalse(); }
      Exs (m),Exexp (n,o) -> { return `Xfalse(); }
      Explus (n,m),Exz() -> { return `Xfalse(); }
      Explus (m,n),Exs (o) -> { return `Xfalse(); }
      Explus (n,m),Explus (o,l) -> { return `and (eqENat (n,o),eqENat (m,l)); }
      Explus (m,n),Exmult (o,l) -> { return `Xfalse(); }
      Explus (n,m),Exexp (o,l) -> { return `Xfalse(); }
      Exmult (m,n),Exz() -> { return `Xfalse(); }
      Exmult (n,m),Exs (o) -> { return `Xfalse(); }
      Exmult (m,n),Explus (o,l) -> { return `Xfalse(); }
      Exmult (n,m),Exmult (o,l) -> { return `and (eqENat (n,o),eqENat (m,l)); }
      Exmult (m,n),Exexp (o,l) -> { return `Xfalse(); }
      Exexp (n,m),Exz() -> { return `Xfalse(); }
      Exexp (m,n),Exs (o) -> { return `Xfalse(); }
      Exexp (n,m),Explus (o,l) -> { return `Xfalse(); }
      Exexp (m,n),Exmult (o,l) -> { return `Xfalse(); }
      Exexp (m,n),Exexp (o,l) -> { return `and (eqENat (m,o),eqENat (n,l)); }
    }
    throw new RuntimeException ("incomplete match in function eqENat()");
  }

  private static SNat succ17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      r -> { if (`eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == `Xtrue()) { return `Z(); } }
      r -> { if (`eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == `Xfalse()) { return `S (r); } }
    }
    throw new RuntimeException ("incomplete match in function succ17()");
  }

  private static SNat plus17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      r,Z() -> { return `r; }
      r,S (t) -> { return `succ17 (plus17 (r,t)); }
    }
    throw new RuntimeException ("incomplete match in function plus17()");
  }

  private static SNat mult17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      r,Z() -> { return `Z(); }
      r,S (t) -> { return `plus17 (r,mult17 (r,t)); }
    }
    throw new RuntimeException ("incomplete match in function mult17()");
  }

  private static SNat exp17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      r,Z() -> { return `succ17 (Z()); }
      r,S (t) -> { return `mult17 (r,exp17 (r,t)); }
    }
    throw new RuntimeException ("incomplete match in function exp17()");
  }

  private static SNat eval17 (ENat rec_x1) {
    %match (ENat rec_x1) {
      Exz() -> { return `Z(); }
      Exs (n) -> { return `succ17 (eval17 (n)); }
      Explus (n,m) -> { return `plus17 (eval17 (n),eval17 (m)); }
      Exmult (n,m) -> { return `mult17 (eval17 (n),eval17 (m)); }
      Exexp (n,m) -> { return `exp17 (eval17 (n),eval17 (m)); }
    }
    throw new RuntimeException ("incomplete match in function eval17()");
  }

  private static SNat evalexp17 (ENat rec_x1) {
    %match (ENat rec_x1) {
      n -> { return `eval17 (expand (n)); }
    }
    throw new RuntimeException ("incomplete match in function evalexp17()");
  }

  private static ENat expand (ENat rec_x1) {
    %match (ENat rec_x1) {
      Exz() -> { return `Exz(); }
      Exs (n) -> { return `Explus (Exs (Exz()),n); }
      Explus (n,m) -> { return `Explus (expand (n),expand (m)); }
      Exmult (n,Exz()) -> { return `Exz(); }
      Exmult (n,Exs (Exz())) -> { return `expand (n); }
      Exmult (n,Explus (m,o)) -> { return `expand (Explus (Exmult (n,m),Exmult (n,o))); }
      Exmult (n,Exmult (m,o)) -> { return `expand (Exmult (n,expand (Exmult (m,o)))); }
      Exmult (n,Exexp (m,o)) -> { return `expand (Exmult (n,expand (Exexp (m,o)))); }
      Exexp (n,Exz()) -> { return `Exs (Exz()); }
      Exexp (n,Exs (m)) -> { if (`eqENat (m,Exz()) == `Xtrue()) { return `expand (n); } }
      Exexp (n,Exs (m)) -> { if (`eqENat (m,Exz()) == `Xfalse()) { return `expand (Exexp (n,expand (Exs (m)))); } }
      Exexp (n,Explus (m,o)) -> { return `expand (Exmult (Exexp (n,m),Exexp (n,o))); }
      Exexp (n,Exmult (m,o)) -> { return `expand (Exexp (n,expand (Exmult (m,o)))); }
      Exexp (n,Exexp (m,o)) -> { return `expand (Exexp (n,expand (Exexp (m,o)))); }
    }
    throw new RuntimeException ("incomplete match in function expand()");
  }

  private static ENat two () {
    return `Exs (Exs (Exz()));
  }

  private static ENat seventeen () {
    return `Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz())))))))))))))))))));
  }

  private static Xbool f (ENat rec_x1) {
    %match (ENat rec_x1) {
      m -> { return `lambda0 (Exexp (two(),m)); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (seventeen()));
  }
}
