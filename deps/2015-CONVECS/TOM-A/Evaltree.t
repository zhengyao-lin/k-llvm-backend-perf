// TOM-A
import evaltree.term.*;
import evaltree.term.types.*;
public class Evaltree {
  %gom{
    module Term
    abstract syntax
    Pos =
      | cDub(rec_x1_1:Xbool, rec_x2_1:Pos)
      | d1()
    SNat =
      | evaltree17(rec_x1_1:SNat)
      | exp17(rec_x1_2:SNat, rec_x2_2:SNat)
      | getmax(rec_x1_3:Tree)
      | getval(rec_x1_4:Tree)
      | lambda0(rec_x1_5:SNat, rec_x2_5:SNat)
      | mult17(rec_x1_6:SNat, rec_x2_6:SNat)
      | plus17(rec_x1_7:SNat, rec_x2_7:SNat)
      | pred17(rec_x1_8:SNat)
      | seventeen()
      | S(rec_x1_9:SNat)
      | succ17(rec_x1_10:SNat)
      | Z()
    Tree =
      | buildtree(rec_x1_1:SNat, rec_x2_1:SNat)
      | lambda1(rec_x1_2:SNat, rec_x2_2:Tree, rec_x3_2:Tree, rec_x4_2:SNat)
      | lambda2(rec_x1_3:SNat, rec_x2_3:Tree, rec_x3_3:Tree, rec_x4_3:SNat, rec_x5_3:SNat)
      | lambda3(rec_x1_4:SNat, rec_x2_4:Tree, rec_x3_4:Tree)
      | lambda4(rec_x1_5:SNat, rec_x2_5:Tree, rec_x3_5:SNat, rec_x4_5:SNat)
      | lambda5(rec_x1_6:SNat, rec_x2_6:Tree)
      | leaf(rec_x1_7:SNat)
      | node(rec_x1_8:SNat, rec_x2_8:SNat, rec_x3_8:Tree, rec_x4_8:Tree)
    Xbool =
      | and(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | eqBool(rec_x1_2:Xbool, rec_x2_2:Xbool)
      | eqPos(rec_x1_3:Pos, rec_x2_3:Pos)
      | eq(rec_x1_4:SNat, rec_x2_4:SNat)
      | f(rec_x1_5:SNat)
      | lambda6(rec_x1_6:SNat)
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
      lambda6 (n) -> eq (evaltree17 (n),getval (buildtree (n,Z())))
      lambda5 (n,left) -> lambda4 (n,left,getmax (left),getval (left))
      lambda4 (n,left,max,o) -> lambda3 (o,left,buildtree (n,succ17 (max)))
      lambda3 (n,left,right) -> lambda2 (n,left,right,getval (right),getmax (right))
      lambda2 (n,left,right,o,max) -> lambda1 (max,left,right,plus17 (n,o))
      lambda1 (max,left,right,n) -> node (n,max,left,right)
      lambda0 (n,o) -> mult17 (n,o)
      eq (Z(),Z()) -> Xtrue()
      eq (Z(),S (n)) -> Xfalse()
      eq (S (n),Z()) -> Xfalse()
      eq (S (n),S (o)) -> eq (n,o)
      succ17 (n) -> Z() if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xtrue()
      succ17 (n) -> S (n) if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xfalse()
      pred17 (Z()) -> S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))
      pred17 (S (n)) -> n
      plus17 (n,Z()) -> n
      plus17 (n,S (o)) -> succ17 (plus17 (n,o))
      mult17 (n,Z()) -> Z()
      mult17 (n,S (o)) -> plus17 (n,mult17 (n,o))
      exp17 (n,Z()) -> succ17 (Z())
      exp17 (n,S (o)) -> mult17 (n,exp17 (n,o))
      evaltree17 (n) -> lambda0 (exp17 (S (S (Z())),pred17 (n)),pred17 (exp17 (S (S (Z())),n)))
      getval (leaf (n)) -> n
      getval (node (n,max,left,right)) -> n
      getmax (leaf (n)) -> n
      getmax (node (n,max,left,right)) -> max
      buildtree (Z(),n) -> leaf (n)
      buildtree (S (n),o) -> lambda5 (n,buildtree (n,o))
      seventeen() -> S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z() )))) ))))) ))))) )))))
      f (n) -> lambda6 (seventeen())
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (seventeen()));
  }
}
