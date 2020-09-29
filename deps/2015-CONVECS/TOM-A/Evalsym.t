// TOM-A
import evalsym.term.*;
import evalsym.term.types.*;
public class Evalsym {
  %gom{
    module Term
    abstract syntax
    ENat =
      | dec(rec_x1_1:ENat)
      | Exexp(rec_x1_2:ENat, rec_x2_2:ENat)
      | Exmult(rec_x1_3:ENat, rec_x2_3:ENat)
      | Explus(rec_x1_4:ENat, rec_x2_4:ENat)
      | Exs(rec_x1_5:ENat)
      | Exz()
      | seventeen()
      | two()
    Pos =
      | cDub(rec_x1_1:Xbool, rec_x2_1:Pos)
      | d1()
    SNat =
      | eval17(rec_x1_1:ENat)
      | evalsym17(rec_x1_2:ENat)
      | exp17(rec_x1_3:SNat, rec_x2_3:SNat)
      | mult17(rec_x1_4:SNat, rec_x2_4:SNat)
      | plus17(rec_x1_5:SNat, rec_x2_5:SNat)
      | S(rec_x1_6:SNat)
      | succ17(rec_x1_7:SNat)
      | Z()
    Xbool =
      | and(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | eqBool(rec_x1_2:Xbool, rec_x2_2:Xbool)
      | eqPos(rec_x1_3:Pos, rec_x2_3:Pos)
      | eq(rec_x1_4:SNat, rec_x2_4:SNat)
      | f(rec_x1_5:ENat)
      | lambda0(rec_x1_6:ENat)
      | Xfalse()
      | Xtrue()
    module Term:rules() {
      eqBool (Xtrue(),b) -> b
      eqBool (Xfalse(),Xtrue()) -> Xfalse()
      eqBool (Xfalse(),Xfalse()) -> Xtrue()
      and (b,Xtrue()) -> b
      and (b,Xfalse()) -> Xfalse()
      eqPos (d1(),d1()) -> Xtrue()
      eqPos (d1(),cDub (b,p)) -> Xfalse()
      eqPos (cDub (b,p),d1()) -> Xfalse()
      eqPos (cDub (b,p),cDub (c,q)) -> and (eqBool (b,c), eqPos (p,q))
      lambda0 (m) -> eq (eval17 (m),evalsym17 (m))
      eq (Z(),Z()) -> Xtrue()
      eq (Z(),S (r)) -> Xfalse()
      eq (S (r),Z()) -> Xfalse()
      eq (S (r),S (t)) -> eq (r,t)
      succ17 (r) -> Z() if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xtrue()
      succ17 (r) -> S (r) if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xfalse()
      plus17 (r,Z()) -> r
      plus17 (r,S (t)) -> succ17 (plus17 (r,t))
      mult17 (r,Z()) -> Z()
      mult17 (r,S (t)) -> plus17 (r,mult17 (r,t))
      exp17 (r,Z()) -> succ17 (Z())
      exp17 (r,S (t)) -> mult17 (r,exp17 (r,t))
      eval17 (Exz()) -> Z()
      eval17 (Exs (n)) -> succ17 (eval17 (n))
      eval17 (Explus (n,m)) -> plus17 (eval17 (n),eval17 (m))
      eval17 (Exmult (n,m)) -> mult17 (eval17 (n),eval17 (m))
      eval17 (Exexp (n,m)) -> exp17 (eval17 (n),eval17 (m))
      evalsym17 (Exz()) -> Z()
      evalsym17 (Exs (n)) -> succ17 (evalsym17 (n))
      evalsym17 (Explus (n,m)) -> plus17 (evalsym17 (n),evalsym17 (m))
      evalsym17 (Exmult (n,Exz())) -> Z()
      evalsym17 (Exmult (n,Exs (m))) -> evalsym17 (Explus (Exmult (n,m),n))
      evalsym17 (Exmult (n,Explus (m,o))) -> evalsym17 (Explus (Exmult (n,m),Exmult (n,o)))
      evalsym17 (Exmult (n,Exmult (m,o))) -> evalsym17 (Exmult (Exmult (n,m),o))
      evalsym17 (Exmult (n,Exexp (m,o))) -> evalsym17 (Exmult (n,dec (Exexp (m,o))))
      evalsym17 (Exexp (n,Exz())) -> succ17 (Z())
      evalsym17 (Exexp (n,Exs (m))) -> evalsym17 (Exmult (Exexp (n,m),n))
      evalsym17 (Exexp (n,Explus (m,o))) -> evalsym17 (Exmult (Exexp (n,m),Exexp (n,o)))
      evalsym17 (Exexp (n,Exmult (m,o))) -> evalsym17 (Exexp (Exexp (n,m),o))
      evalsym17 (Exexp (n,Exexp (m,o))) -> evalsym17 (Exexp (n,dec (Exexp (m,o))))
      dec (Exexp (n,Exz())) -> Exs (Exz())
      dec (Exexp (n,Exs (m))) -> Exmult (Exexp (n,m),n)
      dec (Exexp (n,Explus (m,o))) -> Exmult (Exexp (n,m),Exexp (n,o))
      dec (Exexp (n,Exmult (m,o))) -> dec (Exexp (Exexp (n,m),o))
      dec (Exexp (n,Exexp (m,o))) -> dec (Exexp (n,dec (Exexp (m,o))))
      two() -> Exs (Exs (Exz()))
      seventeen() -> Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz()))))))))))))))))))))))))
      f (m) -> lambda0 (Exexp (two(),m))
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (seventeen()));
  }
}
