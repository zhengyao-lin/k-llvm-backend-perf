// TOM-B
import evaltree.term.*;
import evaltree.term.types.*;
public class Evaltree {
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
    Tree =
      | leaf(rec_x1_1:SNat)
      | node(rec_x1_2:SNat, rec_x2_2:SNat, rec_x3_2:Tree, rec_x4_2:Tree)
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

  private static Xbool lambda6 (SNat rec_x1) {
    %match (SNat rec_x1) {
      n -> { return `eq (evaltree17 (n),getval (buildtree (n,Z()))); }
    }
    throw new RuntimeException ("incomplete match in function lambda6()");
  }

  private static Tree lambda5 (SNat rec_x1, Tree rec_x2) {
    %match (SNat rec_x1, Tree rec_x2) {
      n,left -> { return `lambda4 (n,left,getmax (left),getval (left)); }
    }
    throw new RuntimeException ("incomplete match in function lambda5()");
  }

  private static Tree lambda4 (SNat rec_x1, Tree rec_x2, SNat rec_x3, SNat rec_x4) {
    %match (SNat rec_x1, Tree rec_x2, SNat rec_x3, SNat rec_x4) {
      n,left,max,o -> { return `lambda3 (o,left,buildtree (n,succ17 (max))); }
    }
    throw new RuntimeException ("incomplete match in function lambda4()");
  }

  private static Tree lambda3 (SNat rec_x1, Tree rec_x2, Tree rec_x3) {
    %match (SNat rec_x1, Tree rec_x2, Tree rec_x3) {
      n,left,right -> { return `lambda2 (n,left,right,getval (right),getmax (right)); }
    }
    throw new RuntimeException ("incomplete match in function lambda3()");
  }

  private static Tree lambda2 (SNat rec_x1, Tree rec_x2, Tree rec_x3, SNat rec_x4, SNat rec_x5) {
    %match (SNat rec_x1, Tree rec_x2, Tree rec_x3, SNat rec_x4, SNat rec_x5) {
      n,left,right,o,max -> { return `lambda1 (max,left,right,plus17 (n,o)); }
    }
    throw new RuntimeException ("incomplete match in function lambda2()");
  }

  private static Tree lambda1 (SNat rec_x1, Tree rec_x2, Tree rec_x3, SNat rec_x4) {
    %match (SNat rec_x1, Tree rec_x2, Tree rec_x3, SNat rec_x4) {
      max,left,right,n -> { return `node (n,max,left,right); }
    }
    throw new RuntimeException ("incomplete match in function lambda1()");
  }

  private static SNat lambda0 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      n,o -> { return `mult17 (n,o); }
    }
    throw new RuntimeException ("incomplete match in function lambda0()");
  }

  private static Xbool eq (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      Z(),Z() -> { return `Xtrue(); }
      Z(),S (n) -> { return `Xfalse(); }
      S (n),Z() -> { return `Xfalse(); }
      S (n),S (o) -> { return `eq (n,o); }
    }
    throw new RuntimeException ("incomplete match in function eq()");
  }

  private static SNat succ17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      n -> { if (`eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == `Xtrue()) { return `Z(); } }
      n -> { if (`eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == `Xfalse()) { return `S (n); } }
    }
    throw new RuntimeException ("incomplete match in function succ17()");
  }

  private static SNat pred17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      Z() -> { return `S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z())))))))))))))))); }
      S (n) -> { return `n; }
    }
    throw new RuntimeException ("incomplete match in function pred17()");
  }

  private static SNat plus17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      n,Z() -> { return `n; }
      n,S (o) -> { return `succ17 (plus17 (n,o)); }
    }
    throw new RuntimeException ("incomplete match in function plus17()");
  }

  private static SNat mult17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      n,Z() -> { return `Z(); }
      n,S (o) -> { return `plus17 (n,mult17 (n,o)); }
    }
    throw new RuntimeException ("incomplete match in function mult17()");
  }

  private static SNat exp17 (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      n,Z() -> { return `succ17 (Z()); }
      n,S (o) -> { return `mult17 (n,exp17 (n,o)); }
    }
    throw new RuntimeException ("incomplete match in function exp17()");
  }

  private static SNat evaltree17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      n -> { return `lambda0 (exp17 (S (S (Z())),pred17 (n)),pred17 (exp17 (S (S (Z())),n))); }
    }
    throw new RuntimeException ("incomplete match in function evaltree17()");
  }

  private static SNat getval (Tree rec_x1) {
    %match (Tree rec_x1) {
      leaf (n) -> { return `n; }
      node (n,max,left,right) -> { return `n; }
    }
    throw new RuntimeException ("incomplete match in function getval()");
  }

  private static SNat getmax (Tree rec_x1) {
    %match (Tree rec_x1) {
      leaf (n) -> { return `n; }
      node (n,max,left,right) -> { return `max; }
    }
    throw new RuntimeException ("incomplete match in function getmax()");
  }

  private static Tree buildtree (SNat rec_x1, SNat rec_x2) {
    %match (SNat rec_x1, SNat rec_x2) {
      Z(),n -> { return `leaf (n); }
      S (n),o -> { return `lambda5 (n,buildtree (n,o)); }
    }
    throw new RuntimeException ("incomplete match in function buildtree()");
  }

  private static SNat seventeen () {
    return `S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z() )))) ))))) ))))) )))));
  }

  private static Xbool f (SNat rec_x1) {
    %match (SNat rec_x1) {
      n -> { return `lambda6 (seventeen()); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (seventeen()));
  }
}
