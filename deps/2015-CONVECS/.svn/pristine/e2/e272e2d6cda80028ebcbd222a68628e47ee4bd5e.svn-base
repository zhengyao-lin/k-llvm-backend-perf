// TOM-A
import quicksort1000.term.*;
import quicksort1000.term.types.*;
public class Quicksort1000 {
  %gom{
    module Term
    abstract syntax
    NatList =
      | append(rec_x1_1:NatList, rec_x2_1:NatList)
      | cons(rec_x1_2:Xnat, rec_x2_2:NatList)
      | nil()
      | p1(rec_x1_3:NatListPair)
      | p2(rec_x1_4:NatListPair)
      | qsort(rec_x1_5:NatList)
      | rev(rec_x1_6:Xnat)
    NatListPair =
      | pair(rec_x1_1:NatList, rec_x2_1:NatList)
      | split(rec_x1_2:Xnat, rec_x2_2:NatList)
    Xbool =
      | get(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | st(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | Xfalse()
      | Xnot(rec_x1_3:Xbool)
      | Xtrue()
    Xnat =
      | d0()
      | d10()
      | plus(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | s(rec_x1_2:Xnat)
      | times(rec_x1_3:Xnat, rec_x2_3:Xnat)
    module Term:rules() {
      d10() -> s (s (s (s (s (s (s (s (s (s (d0()))))))))))
      Xnot (Xtrue()) -> Xfalse()
      Xnot (Xfalse()) -> Xtrue()
      st (d0(), s (N)) -> Xtrue()
      st (s (N), d0()) -> Xfalse()
      st (d0(), d0()) -> Xfalse()
      st (s (N), s (M)) -> st (N, M)
      get (N, M) -> Xnot (st (N, M))
      plus (d0(), N) -> N
      plus (s (N), M) -> s (plus (N, M))
      times (d0(), N) -> d0()
      times (s (N), M) -> plus (M, times (N, M))
      rev (s (N)) -> cons (s (N), rev (N))
      rev (d0()) -> cons (d0(), nil())
      split (N, cons (M, L)) -> pair (p1 (split (N, L)), cons (M, p2 (split (N, L)))) if st (N, M) == Xtrue()
      split (N, cons (M, L)) -> pair (cons (M, p1 (split (N, L))), p2 (split (N, L))) if get (N, M) == Xtrue()
      split (N, nil()) -> pair (nil(), nil())
      append (cons (N, L), LT) -> cons (N, append (L, LT))
      append (nil(), L) -> L
      qsort (nil()) -> nil()
      qsort (cons (N, L)) -> append (qsort (p1 (split (N, L))), cons (N, qsort (p2 (split (N, L)))))
      p1 (pair (L1, L2)) -> L1
      p2 (pair (L1, L2)) -> L2
    }
  }
  public static void main (String[] args) {
    System.out.println (`qsort (rev (times (d10(), times (d10(), d10())))));
  }
}
