// TOM-A
import mergesort100.term.*;
import mergesort100.term.types.*;
public class Mergesort100 {
  %gom{
    module Term
    abstract syntax
    ListPair =
      | pair(rec_x1_1:NatList, rec_x2_1:NatList)
      | split(rec_x1_2:NatList)
    NatList =
      | cons(rec_x1_1:Xnat, rec_x2_1:NatList)
      | merge(rec_x1_2:NatList, rec_x2_2:NatList)
      | mergesort(rec_x1_3:NatList)
      | nil()
      | p1(rec_x1_4:ListPair)
      | p2(rec_x1_5:ListPair)
      | rev(rec_x1_6:Xnat)
    Xbool =
      | lte(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | Xfalse()
      | Xtrue()
    Xnat =
      | d0()
      | d10()
      | plus(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | s(rec_x1_2:Xnat)
      | times(rec_x1_3:Xnat, rec_x2_3:Xnat)
    module Term:rules() {
      d10() -> s (s (s (s (s (s (s (s (s (s (d0()))))))))))
      lte (d0(), s (N)) -> Xtrue()
      lte (s (N), d0()) -> Xfalse()
      lte (d0(), d0()) -> Xtrue()
      lte (s (N), s (M)) -> lte (N, M)
      plus (d0(), N) -> N
      plus (s (N), M) -> s (plus (N, M))
      times (d0(), N) -> d0()
      times (s (N), M) -> plus (M, times (N, M))
      rev (s (N)) -> cons (s (N), rev (N))
      rev (d0()) -> cons (d0(), nil())
      merge (nil(), L) -> L
      merge (L, nil()) -> L
      merge (cons (X, L1), cons (Y, L2)) -> cons (X, merge (L1, cons (Y, L2))) if lte (X, Y) == Xtrue()
      merge (cons (X, L1), cons (Y, L2)) -> cons (Y, merge (cons (X, L1), L2)) if lte (X, Y) == Xfalse()
      split (cons (X, cons (Y, L))) -> pair (cons (X, p1 (split (L))), cons (Y, p2 (split (L))))
      split (nil()) -> pair (nil(), nil())
      split (cons (X, nil())) -> pair (cons (X, nil()), nil())
      mergesort (nil()) -> nil()
      mergesort (cons (X, nil())) -> cons (X, nil())
      mergesort (cons (X, cons (Y, L))) -> merge (mergesort (cons (X, p1 (split (L)))), mergesort (cons (Y, p2 (split (L)))))
      p1 (pair (L1, L2)) -> L1
      p2 (pair (L1, L2)) -> L2
    }
  }
  public static void main (String[] args) {
    System.out.println (`mergesort (rev (times (d10(), d10()))));
  }
}
