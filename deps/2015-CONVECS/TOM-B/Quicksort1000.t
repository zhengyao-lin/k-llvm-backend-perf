// TOM-B
import quicksort1000.term.*;
import quicksort1000.term.types.*;
public class Quicksort1000 {
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
    NatList =
      | nil()
      | cons(rec_x1_1:Xnat, rec_x2_1:NatList)
    NatListPair =
      | pair(rec_x1_1:NatList, rec_x2_1:NatList)
  }

  private static Xnat d10 () {
    return `s (s (s (s (s (s (s (s (s (s (d0()))))))))));
  }

  private static Xbool Xnot (Xbool rec_x1) {
    %match (Xbool rec_x1) {
      Xtrue() -> { return `Xfalse(); }
      Xfalse() -> { return `Xtrue(); }
    }
    throw new RuntimeException ("incomplete match in function Xnot()");
  }

  private static Xbool st (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), s (N) -> { return `Xtrue(); }
      s (N), d0() -> { return `Xfalse(); }
      d0(), d0() -> { return `Xfalse(); }
      s (N), s (M) -> { return `st (N, M); }
    }
    throw new RuntimeException ("incomplete match in function st()");
  }

  private static Xbool get (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      N, M -> { return `Xnot (st (N, M)); }
    }
    throw new RuntimeException ("incomplete match in function get()");
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), N -> { return `N; }
      s (N), M -> { return `s (plus (N, M)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat times (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), N -> { return `d0(); }
      s (N), M -> { return `plus (M, times (N, M)); }
    }
    throw new RuntimeException ("incomplete match in function times()");
  }

  private static NatList rev (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (N) -> { return `cons (s (N), rev (N)); }
      d0() -> { return `cons (d0(), nil()); }
    }
    throw new RuntimeException ("incomplete match in function rev()");
  }

  private static NatListPair split (Xnat rec_x1, NatList rec_x2) {
    %match (Xnat rec_x1, NatList rec_x2) {
      N, cons (M, L) -> { if (`st (N, M) == `Xtrue()) { return `pair (p1 (split (N, L)), cons (M, p2 (split (N, L)))); } }
      N, cons (M, L) -> { if (`get (N, M) == `Xtrue()) { return `pair (cons (M, p1 (split (N, L))), p2 (split (N, L))); } }
      N, nil() -> { return `pair (nil(), nil()); }
    }
    throw new RuntimeException ("incomplete match in function split()");
  }

  private static NatList append (NatList rec_x1, NatList rec_x2) {
    %match (NatList rec_x1, NatList rec_x2) {
      cons (N, L), LT -> { return `cons (N, append (L, LT)); }
      nil(), L -> { return `L; }
    }
    throw new RuntimeException ("incomplete match in function append()");
  }

  private static NatList qsort (NatList rec_x1) {
    %match (NatList rec_x1) {
      nil() -> { return `nil(); }
      cons (N, L) -> { return `append (qsort (p1 (split (N, L))), cons (N, qsort (p2 (split (N, L))))); }
    }
    throw new RuntimeException ("incomplete match in function qsort()");
  }

  private static NatList p1 (NatListPair rec_x1) {
    %match (NatListPair rec_x1) {
      pair (L1, L2) -> { return `L1; }
    }
    throw new RuntimeException ("incomplete match in function p1()");
  }

  private static NatList p2 (NatListPair rec_x1) {
    %match (NatListPair rec_x1) {
      pair (L1, L2) -> { return `L2; }
    }
    throw new RuntimeException ("incomplete match in function p2()");
  }

  public static void main (String[] args) {
    System.out.println (`qsort (rev (times (d10(), times (d10(), d10())))));
  }
}
