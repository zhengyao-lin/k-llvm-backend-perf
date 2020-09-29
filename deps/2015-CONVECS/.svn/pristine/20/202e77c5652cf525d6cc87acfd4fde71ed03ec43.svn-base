// TOM-A
import binarysearch.term.*;
import binarysearch.term.types.*;
public class Binarysearch {
  %gom{
    module Term
    abstract syntax
    Pos =
      | addc(rec_x1_1:Xbool, rec_x2_1:Pos, rec_x3_1:Pos)
      | cDub(rec_x1_2:Xbool, rec_x2_2:Pos)
      | Nat2Pos(rec_x1_3:Xnat)
      | One()
      | plusNatPos(rec_x1_4:Xnat, rec_x2_4:Pos)
      | plusPos(rec_x1_5:Pos, rec_x2_5:Pos)
      | succ2Pos(rec_x1_6:Pos)
      | succ2(rec_x1_7:Xnat)
    Xbool =
      | and(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | eqBool(rec_x1_2:Xbool, rec_x2_2:Xbool)
      | eqPos(rec_x1_3:Pos, rec_x2_3:Pos)
      | eq(rec_x1_4:Xnat, rec_x2_4:Xnat)
      | F()
      | gePos(rec_x1_5:Pos, rec_x2_5:Pos)
      | ge(rec_x1_6:Xnat, rec_x2_6:Xnat)
      | lePos(rec_x1_7:Pos, rec_x2_7:Pos)
      | le(rec_x1_8:Xnat, rec_x2_8:Xnat)
      | ltPos(rec_x1_9:Pos, rec_x2_9:Pos)
      | lt(rec_x1_10:Xnat, rec_x2_10:Xnat)
      | T()
      | Xnot(rec_x1_11:Xbool)
    Xint =
      | cInt(rec_x1_1:Xnat)
      | cNeg(rec_x1_2:Pos)
      | min2(rec_x1_3:Xnat)
      | minus(rec_x1_4:Xnat, rec_x2_4:Xnat)
    Xnat =
      | bs2(rec_x1_1:Xnat, rec_x2_1:Xnat, rec_x3_1:Xnat)
      | bs(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | cNat(rec_x1_3:Pos)
      | dividePos(rec_x1_4:Pos, rec_x2_4:Pos)
      | divide(rec_x1_5:Xnat, rec_x2_5:Pos)
      | dub(rec_x1_6:Xbool, rec_x2_6:Xnat)
      | f(rec_x1_7:Xnat)
      | gtesubtb(rec_x1_8:Xbool, rec_x2_8:Pos, rec_x3_8:Pos)
      | gtesubtn(rec_x1_9:Xnat, rec_x2_9:Xnat)
      | gtesubtp(rec_x1_10:Pos, rec_x2_10:Pos)
      | ite(rec_x1_11:Xbool, rec_x2_11:Xnat, rec_x3_11:Xnat)
      | lambda0(rec_x1_12:Xnat, rec_x2_12:Xnat, rec_x3_12:Xnat, rec_x4_12:Xnat)
      | max2Int(rec_x1_13:Xint, rec_x2_13:Xnat)
      | max2(rec_x1_14:Xnat, rec_x2_14:Xnat)
      | plus(rec_x1_15:Xnat, rec_x2_15:Xnat)
      | Pos2Nat(rec_x1_16:Pos)
      | pred2(rec_x1_17:Pos)
      | Zero()
    module Term:rules() {
      eqBool (T(),b) -> b
      eqBool (F(),T()) -> F()
      eqBool (F(),F()) -> T()
      and (T(),b) -> b
      and (F(),b) -> F()
      Xnot (T()) -> F()
      Xnot (F()) -> T()
      eqPos (One(),One()) -> T()
      eqPos (One(),cDub (b,p)) -> F()
      eqPos (cDub (b,p),One()) -> F()
      eqPos (cDub (b,p),cDub (c,q)) -> and (eqBool (b,c), eqPos (p,q))
      lePos (One(),p) -> T()
      lePos (cDub (b,p),One()) -> F()
      lePos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b == c
      lePos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b != c && b == F()
      lePos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b != c && b == T()
      ltPos (p,One()) -> F()
      ltPos (One(),cDub (b,p)) -> T()
      ltPos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b == c
      ltPos (cDub (b,p),cDub (c,q)) -> lePos (p,q) if b != c && b == F()
      ltPos (cDub (b,p),cDub (c,q)) -> ltPos (p,q) if b != c && b == T()
      gePos (p,q) -> lePos (q,p)
      succ2Pos (One()) -> cDub (F(),One())
      succ2Pos (cDub (F(),p)) -> cDub (T(),p)
      succ2Pos (cDub (T(),p)) -> cDub (F(),succ2Pos (p))
      plusPos (p,q) -> addc (F(),p,q)
      addc (F(),One(),p) -> succ2Pos (p)
      addc (T(),One(),p) -> succ2Pos (succ2Pos (p))
      addc (F(),p,One()) -> succ2Pos (p)
      addc (T(),p,One()) -> succ2Pos (succ2Pos (p))
      addc (b,cDub (c,p),cDub (d,q)) -> cDub (b,addc (c,p,q)) if c == d
      addc (b,cDub (c,p),cDub (d,q)) -> cDub (Xnot (b),addc (b,p,q)) if c != d
      lambda0 (n,y,x,h) -> bs2 (n,h,y) if lt (f (h),n) == T()
      lambda0 (n,y,x,h) -> bs2 (n,x,h) if lt (f (h),n) == F()
      max2Int (cInt (m),n) -> max2 (m,n)
      max2Int (cNeg (p),n) -> n
      min2 (Zero()) -> cInt (Zero())
      min2 (cNat (p)) -> cNeg (p)
      minus (m,n) -> cInt (gtesubtn (m,n)) if ge (m,n) == T()
      minus (m,n) -> min2 (gtesubtn (n,m)) if lt (m,n) == T()
      eq (Zero(),Zero()) -> T()
      eq (Zero(),cNat (p)) -> F()
      eq (cNat (p),Zero()) -> F()
      eq (cNat (p),cNat (q)) -> eqPos (p,q)
      ite (T(),m,n) -> m
      ite (F(),m,n) -> n
      Pos2Nat (p) -> cNat (p)
      Nat2Pos (cNat (p)) -> p
      le (Zero(),n) -> T()
      le (cNat (p),Zero()) -> F()
      le (cNat (p),cNat (q)) -> lePos (p,q)
      lt (n,Zero()) -> F()
      lt (Zero(),cNat (p)) -> T()
      lt (cNat (p),cNat (q)) -> ltPos (p,q)
      ge (m,n) -> le (n,m)
      max2 (m,n) -> ite (le (m,n),n,m)
      succ2 (Zero()) -> One()
      succ2 (cNat (p)) -> succ2Pos (p)
      pred2 (One()) -> Zero()
      pred2 (cDub (T(),p)) -> cNat (cDub (F(),p))
      pred2 (cDub (F(),p)) -> dub (T(),pred2 (p))
      dub (F(),Zero()) -> Zero()
      dub (T(),Zero()) -> cNat (One())
      dub (b,cNat (p)) -> cNat (cDub (b,p))
      plusNatPos (Zero(),p) -> p
      plusNatPos (cNat (p),q) -> plusPos (p,q)
      plus (Zero(),n) -> n
      plus (n,Zero()) -> n
      plus (cNat (p),cNat (q)) -> cNat (addc (F(),p,q))
      gtesubtp (p,q) -> gtesubtb (F(),p,q)
      gtesubtn (n,Zero()) -> n
      gtesubtn (cNat (p),cNat (q)) -> gtesubtp (p,q)
      gtesubtb (F(),p,One()) -> pred2 (p)
      gtesubtb (T(),p,One()) -> pred2 (Nat2Pos (pred2 (p)))
      gtesubtb (b,cDub (c,p),cDub (d,q)) -> dub (b,gtesubtb (b,p,q)) if c == d
      gtesubtb (b,cDub (c,p),cDub (d,q)) -> dub (Xnot (b),gtesubtb (d,p,q)) if c != d
      dividePos (p,q) -> cNat (succ2 (divide (gtesubtp (p,q),q))) if gePos (p,q) == T()
      dividePos (p,q) -> Zero() if ltPos (p,q) == T()
      divide (Zero(),p) -> Zero()
      divide (cNat (p),q) -> dividePos (p,q)
      f (Zero()) -> Zero()
      f (cNat (One())) -> cNat (One())
      f (cNat (cDub (b,p))) -> plus (f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (One())),Zero())),f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (cDub (F(),One()))),Zero())))
      bs (n,m) -> bs2 (n,Zero(),m)
      bs2 (n,x,y) -> x if eq (Pos2Nat (plusNatPos (x,One())),y) == T()
      bs2 (n,x,y) -> lambda0 (n,y,x,divide (plus (x,y),cDub (F(),One()))) if eq (Pos2Nat (plusNatPos (x,One())),y) == F()
    }
  }
  public static void main (String[] args) {
    System.out.println (`bs (Pos2Nat (cDub (T(),cDub (T(),cDub (F(),cDub (T(),cDub (F(),cDub (T(),cDub (T(),cDub (F(),cDub (T(),cDub (F(),cDub (T(),One())))))))))))),Pos2Nat (cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),cDub (F(),One())))))))));
  }
}
