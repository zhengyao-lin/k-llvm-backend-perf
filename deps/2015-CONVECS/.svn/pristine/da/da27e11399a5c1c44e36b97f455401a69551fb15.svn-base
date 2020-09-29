// TOM-B
import merge.term.*;
import merge.term.types.*;
public class Merge {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Strg =
      | a()
      | b()
      | c(rec_x1_1:Strg, rec_x2_1:Strg)
    List =
      | nil()
      | l(rec_x1_1:Strg, rec_x2_1:List)
  }

  private static Xbool gte (Strg rec_x1, Strg rec_x2) {
    %match (Strg rec_x1, Strg rec_x2) {
      b(), a() -> { return `Xtrue(); }
      a(), b() -> { return `Xfalse(); }
      a(), a() -> { return `Xtrue(); }
      b(), b() -> { return `Xtrue(); }
      c (E, S), E2 -> { return `gte (E, E2); }
      E, c (E2, S2) -> { if (`E == `E2) { return `Xfalse(); } }
      E, c (E2, S2) -> { if (`E != `E2) { return `gte (E, E2); } }
    }
    throw new RuntimeException ("incomplete match in function gte()");
  }

  private static List Xmerge (List rec_x1, List rec_x2) {
    %match (List rec_x1, List rec_x2) {
      nil(), L1 -> { return `L1; }
      L1, nil() -> { return `L1; }
      l (S, L1), l (S2, L2) -> { if (`gte (S, S2) == `Xtrue()) { return `l (S2, Xmerge (l (S, L1), L2)); } }
      l (S, L1), l (S2, L2) -> { if (`gte (S, S2) == `Xfalse()) { return `l (S, Xmerge (L1, l (S2, L2))); } }
    }
    throw new RuntimeException ("incomplete match in function Xmerge()");
  }

  private static List odd (List rec_x1) {
    %match (List rec_x1) {
      nil() -> { return `nil(); }
      l (S, nil()) -> { return `l (S, nil()); }
      l (S, l (S2, L1)) -> { return `l (S, odd (L1)); }
    }
    throw new RuntimeException ("incomplete match in function odd()");
  }

  private static List even (List rec_x1) {
    %match (List rec_x1) {
      nil() -> { return `nil(); }
      l (S, nil()) -> { return `nil(); }
      l (S, l (S2, L1)) -> { return `l (S2, even (L1)); }
    }
    throw new RuntimeException ("incomplete match in function even()");
  }

  private static List Xsort (List rec_x1) {
    %match (List rec_x1) {
      nil() -> { return `nil(); }
      l (S, nil()) -> { return `l (S, nil()); }
      l (S, l (S2, L1)) -> { return `Xmerge (Xsort (odd (l (S, l (S2, L1)))), Xsort (even (l (S, l (S2, L1))))); }
    }
    throw new RuntimeException ("incomplete match in function Xsort()");
  }

  public static void main (String[] args) {
    System.out.println (`Xsort (l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))), l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))), l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),nil()))))))))))))))))))))))))))))))))))))))))))))))))))));
  }
}
