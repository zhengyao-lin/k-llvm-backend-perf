// TOM-B
import check2.term.*;
import check2.term.types.*;
public class Check2 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
  }

  private static Xbool notBool (Xbool rec_x1) {
    %match (Xbool rec_x1) {
      Xtrue() -> { return `Xfalse(); }
      Xfalse() -> { return `Xtrue(); }
    }
    throw new RuntimeException ("incomplete match in function notBool()");
  }

  private static Xbool andBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Xtrue() -> { return `P; }
      P, Xfalse() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function andBool()");
  }

  private static Xbool orBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Xtrue() -> { return `Xtrue(); }
      P, Xfalse() -> { return `P; }
    }
    throw new RuntimeException ("incomplete match in function orBool()");
  }

  private static Xbool xorBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Q -> { return `orBool (andBool (P, notBool (Q)), andBool (Q, notBool (P))); }
    }
    throw new RuntimeException ("incomplete match in function xorBool()");
  }

  private static Xbool impliesBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Q -> { return `orBool (Q, notBool (P)); }
    }
    throw new RuntimeException ("incomplete match in function impliesBool()");
  }

  private static Xbool iffBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Q -> { return `andBool (impliesBool (P, Q), impliesBool (Q, P)); }
    }
    throw new RuntimeException ("incomplete match in function iffBool()");
  }

  private static Xbool eqBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Q -> { return `iffBool (P, Q); }
    }
    throw new RuntimeException ("incomplete match in function eqBool()");
  }

  private static Xbool neBool (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      P, Q -> { return `xorBool (P, Q); }
    }
    throw new RuntimeException ("incomplete match in function neBool()");
  }

  public static void main (String[] args) {
    System.out.println (`neBool (Xfalse(), Xtrue()));
  }
}
