// TOM-B
import tak18.term.*;
import tak18.term.types.*;
public class Tak18 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    Xint =
      | Pos(rec_x1_1:Xnat)
      | Neg(rec_x1_2:Xnat)
  }

  private static Xbool gte (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), d0() -> { return `Xtrue(); }
      s (X), d0() -> { return `Xtrue(); }
      d0(), s (X) -> { return `Xfalse(); }
      s (X), s (Y) -> { return `gte (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function gte()");
  }

  private static Xbool gte_Int (Xint rec_x1, Xint rec_x2) {
    %match (Xint rec_x1, Xint rec_x2) {
      Pos (X), Pos (Y) -> { return `gte (X,Y); }
      Neg (X), Neg (Y) -> { return `gte (Y,X); }
      Pos (X), Neg (Y) -> { return `Xtrue(); }
      Neg (X), Pos (Y) -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function gte_Int()");
  }

  private static Xint pred (Xint rec_x1) {
    %match (Xint rec_x1) {
      Pos (d0()) -> { return `Neg (d0()); }
      Pos (s (X)) -> { return `Pos (X); }
      Neg (X) -> { return `Neg (s (X)); }
    }
    throw new RuntimeException ("incomplete match in function pred()");
  }

  private static Xint succ (Xint rec_x1) {
    %match (Xint rec_x1) {
      Neg (d0()) -> { return `Pos (d0()); }
      Neg (s (X)) -> { return `Neg (X); }
      Pos (X) -> { return `Pos (s (X)); }
    }
    throw new RuntimeException ("incomplete match in function succ()");
  }

  private static Xint tak (Xint rec_x1, Xint rec_x2, Xint rec_x3) {
    %match (Xint rec_x1, Xint rec_x2, Xint rec_x3) {
      I, J, K -> { if (`gte_Int (J, I) == `Xtrue()) { return `K; } }
      I, J, K -> { if (`gte_Int (J, I) == `Xfalse()) { return `tak (tak (pred (I), J, K), tak (pred (J), K, I), tak (pred (K), I, J)); } }
    }
    throw new RuntimeException ("incomplete match in function tak()");
  }

  public static void main (String[] args) {
    System.out.println (`tak (Pos (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))))))))), Pos (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))), Pos (s (s (s (s (s (s (d0())))))))));
  }
}
