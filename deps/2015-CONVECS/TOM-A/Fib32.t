// TOM-A
import fib32.term.*;
import fib32.term.types.*;
public class Fib32 {
  %gom{
    module Term
    abstract syntax
    Pos =
      | addc(rec_x1_1:Xbool, rec_x2_1:Pos, rec_x3_1:Pos)
      | cDub(rec_x1_2:Xbool, rec_x2_2:Pos)
      | d1()
      | Nat2Pos(rec_x1_3:Xnat)
      | s(rec_x1_4:Pos)
    Xbool =
      | and(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | eqBool(rec_x1_2:Xbool, rec_x2_2:Xbool)
      | eqPos(rec_x1_3:Pos, rec_x2_3:Pos)
      | eq(rec_x1_4:Xnat, rec_x2_4:Xnat)
      | F()
      | ge(rec_x1_5:Xnat, rec_x2_5:Xnat)
      | gt(rec_x1_6:Xnat, rec_x2_6:Xnat)
      | lePos(rec_x1_7:Pos, rec_x2_7:Pos)
      | le(rec_x1_8:Xnat, rec_x2_8:Xnat)
      | ltPos(rec_x1_9:Pos, rec_x2_9:Pos)
      | lt(rec_x1_10:Xnat, rec_x2_10:Xnat)
      | T()
      | Xnot(rec_x1_11:Xbool)
    Xint =
      | cInt(rec_x1_1:Xnat)
      | cNeg(rec_x1_2:Pos)
      | minus2(rec_x1_3:Xnat, rec_x2_3:Xnat)
      | minus(rec_x1_4:Xnat)
    Xnat =
      | cNat(rec_x1_1:Pos)
      | d0()
      | dub(rec_x1_2:Xbool, rec_x2_2:Xnat)
      | fib(rec_x1_3:Xnat)
      | gtesubtb(rec_x1_4:Xbool, rec_x2_4:Pos, rec_x3_4:Pos)
      | gtesubtPos(rec_x1_5:Pos, rec_x2_5:Pos)
      | gtesubt(rec_x1_6:Xnat, rec_x2_6:Xnat)
      | Int2Nat(rec_x1_7:Xint)
      | plus(rec_x1_8:Xnat, rec_x2_8:Xnat)
      | Pos2Nat(rec_x1_9:Pos)
      | pre(rec_x1_10:Pos)
    module Term:rules() {
      eqBool (T(),b) -> b
      eqBool (F(),T()) -> F()
      eqBool (F(),F()) -> T()
      and (T(),b) -> b
      and (F(),b) -> F()
      Xnot (T()) -> F()
      Xnot (F()) -> T()
      eqPos (d1(),d1()) -> T()
      eqPos (d1(),cDub (b,p)) -> F()
      eqPos (cDub (b,p),d1()) -> F()
      eqPos (cDub (b,p),cDub (c,q)) -> and (eqBool (b,c),eqPos (p,q))
      lePos (d1(),p) -> T()
      lePos (cDub (b,p),d1()) -> F()
      lePos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b == c
      lePos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b != c && b == F()
      lePos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b != c && b == T()
      ltPos (p,d1()) -> F()
      ltPos (d1(),cDub (b,p)) -> T()
      ltPos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b == c
      ltPos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b != c && b == F()
      ltPos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b != c && b == T()
      s (d1()) -> cDub (F(),d1())
      s (cDub (F(),p)) -> cDub (T(),p)
      s (cDub (T(),p)) -> cDub (F(),s (p))
      addc (F(),d1(),p) -> s (p)
      addc (T(),d1(),p) -> s (s (p))
      addc (F(),p,d1()) -> s (p)
      addc (T(),p,d1()) -> s (s (p))
      addc (b,cDub (c,p),cDub (d,q)) -> cDub (b,addc (c,p,q)) if c == d
      addc (b,cDub (c,p),cDub (d,q)) -> cDub (Xnot (b),addc (c,p,q)) if c != d
      Int2Nat (cInt (n)) -> n
      minus (d0()) -> cInt (d0())
      minus (cNat (p)) -> cNeg (p)
      minus2 (m,n) -> cInt (gtesubt (m,n)) if ge (m,n) == T()
      minus2 (m,n) -> minus (gtesubt (n,m)) if ge (m,n) == F()
      Pos2Nat (p) -> cNat (p)
      Nat2Pos (cNat (p)) -> p
      eq (d0(),d0()) -> T()
      eq (d0(),cNat (p)) -> F()
      eq (cNat (p),d0()) -> F()
      eq (cNat (p),cNat (q)) -> eqPos (p,q)
      le (d0(),n) -> T()
      le (cNat (p),d0()) -> F()
      le (cNat (p),cNat (q)) -> lePos (p,q)
      lt (n,d0()) -> F()
      lt (d0(),cNat (p)) -> T()
      lt (cNat (p),cNat (q)) -> ltPos (p,q)
      ge (m,n) -> le (n,m)
      gt (m,n) -> lt (n,m)
      pre (d1()) -> d0()
      pre (cDub (T(),p)) -> cNat (cDub (F(),p))
      pre (cDub (F(),p)) -> dub (T(),pre (p))
      dub (F(),d0()) -> d0()
      dub (T(),d0()) -> cNat (d1())
      dub (b,cNat (p)) -> cNat (cDub (b,p))
      plus (d0(),n) -> n
      plus (n,d0()) -> n
      plus (cNat (p),cNat (q)) -> cNat (addc (F(),p,q))
      gtesubtPos (p,q) -> gtesubtb (F(),p,q)
      gtesubt (n,d0()) -> n
      gtesubt (cNat (p),cNat (q)) -> gtesubtPos (p,q)
      gtesubtb (F(),p,d1()) -> pre (p)
      gtesubtb (T(),p,d1()) -> pre (Nat2Pos (pre (p)))
      gtesubtb (b,cDub (c,p),cDub (d,q)) -> dub (b,gtesubtb (b,p,q)) if c == d
      gtesubtb (b,cDub (c,p),cDub (d,q)) -> dub (Xnot (b),gtesubtb (T(),p,q)) if c != d && c == F()
      gtesubtb (b,cDub (c,p),cDub (d,q)) -> dub (Xnot (b),gtesubtb (d,p,q)) if c != d && c == T()
      fib (d0()) -> d0()
      fib (cNat (d1())) -> cNat (d1())
      fib (cNat (cDub (b,p))) -> plus (fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (d1())))),fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (cDub (F(),d1()))))))
    }
  }
  public static void main (String[] args) {
    System.out.println (`fib (Pos2Nat (cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),d1()))))))));
  }
}
