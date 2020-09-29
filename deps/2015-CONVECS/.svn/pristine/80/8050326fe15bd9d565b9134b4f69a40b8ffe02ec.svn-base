// TOM-A
import bubblesort20.term.*;
import bubblesort20.term.types.*;
public class Bubblesort20 {
  %gom{
    module Term
    abstract syntax
    NatList =
      | bubsort(rec_x1_1:Xnat, rec_x2_1:NatList)
      | cons(rec_x1_2:Xnat, rec_x2_2:NatList)
      | nil()
      | rev(rec_x1_3:Xnat)
    Xbool =
      | lt(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | Xfalse()
      | Xtrue()
    Xnat =
      | d0()
      | d10()
      | fact(rec_x1_1:Xnat)
      | plus(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | s(rec_x1_3:Xnat)
      | times(rec_x1_4:Xnat, rec_x2_4:Xnat)
    module Term:rules() {
      d10() -> s (s (s (s (s (s (s (s (s (s (d0()))))))))))
      lt (d0(),d0()) -> Xfalse()
      lt (d0(), s (N)) -> Xtrue()
      lt (s (N), d0()) -> Xfalse()
      lt (s (N), s (M)) -> lt (N, M)
      plus (d0(), N) -> N
      plus (s (N), M) -> s (plus (N, M))
      times (d0(), N) -> d0()
      times (s (N), M) -> plus (M, times (N, M))
      fact (d0()) -> s (d0())
      fact (s (N)) -> times (s (N), fact (N))
      rev (s (N)) -> bubsort (s (N), rev (N))
      rev (d0()) -> cons (d0(), nil())
      bubsort (N, nil()) -> cons (N, nil())
      bubsort (N, cons (M, L)) -> cons (M, bubsort (N, L)) if lt (M, N) == Xtrue()
      bubsort (N, cons (M, L)) -> cons (N, bubsort (M, L)) if lt (M, N) == Xfalse()
    }
  }
  public static void main (String[] args) {
    System.out.println (`rev (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))))))))))));
  }
}
