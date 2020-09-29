// TOM-A
import merge.term.*;
import merge.term.types.*;
public class Merge {
  %gom{
    module Term
    abstract syntax
    List =
      | even(rec_x1_1:List)
      | l(rec_x1_2:Strg, rec_x2_2:List)
      | nil()
      | odd(rec_x1_3:List)
      | Xmerge(rec_x1_4:List, rec_x2_4:List)
      | Xsort(rec_x1_5:List)
    Strg =
      | a()
      | b()
      | c(rec_x1_1:Strg, rec_x2_1:Strg)
    Xbool =
      | gte(rec_x1_1:Strg, rec_x2_1:Strg)
      | Xfalse()
      | Xtrue()
    module Term:rules() {
      gte (b(), a()) -> Xtrue()
      gte (a(), b()) -> Xfalse()
      gte (a(), a()) -> Xtrue()
      gte (b(), b()) -> Xtrue()
      gte (c (E, S), E2) -> gte (E, E2)
      gte (E, c (E2, S2)) -> Xfalse() if E == E2
      gte (E, c (E2, S2)) -> gte (E, E2) if E != E2
      Xmerge (nil(), L1) -> L1
      Xmerge (L1, nil()) -> L1
      Xmerge (l (S, L1), l (S2, L2)) -> l (S2, Xmerge (l (S, L1), L2)) if gte (S, S2) == Xtrue()
      Xmerge (l (S, L1), l (S2, L2)) -> l (S, Xmerge (L1, l (S2, L2))) if gte (S, S2) == Xfalse()
      odd (nil()) -> nil()
      odd (l (S, nil())) -> l (S, nil())
      odd (l (S, l (S2, L1))) -> l (S, odd (L1))
      even (nil()) -> nil()
      even (l (S, nil())) -> nil()
      even (l (S, l (S2, L1))) -> l (S2, even (L1))
      Xsort (nil()) -> nil()
      Xsort (l (S, nil())) -> l (S, nil())
      Xsort (l (S, l (S2, L1))) -> Xmerge (Xsort (odd (l (S, l (S2, L1)))), Xsort (even (l (S, l (S2, L1)))))
    }
  }
  public static void main (String[] args) {
    System.out.println (`Xsort (l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))),l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))), l (c (a(), c (b(), c (a(), b()))), l (c (b(), c (a(), c (b(), b()))), l (c (a(), c (b(), c (a(), a()))), l (c (b(), c (b(), c (b(), b()))), l (c (b(), c (b(), c (b(), a()))), l (c (a(), c (a(), c (a(), b()))), l (c (b(), c (b(), c (a(), a()))), l (c (a(), c (a(), c (a(), a()))), l (c (a(), c (a(), c (b(), b()))), l (c (b(), c (a(), c (b(), a()))),nil()))))))))))))))))))))))))))))))))))))))))))))))))))));
  }
}
