// TOM-B
import mergesort1000.term.*;
import mergesort1000.term.types.*;
public class Mergesort1000 {
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
    ListPair =
      | pair(rec_x1_1:NatList, rec_x2_1:NatList)
  }

  private static Xnat d10 () {
    return `s (s (s (s (s (s (s (s (s (s (d0()))))))))));
  }

  private static Xbool lte (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), s (N) -> { return `Xtrue(); }
      s (N), d0() -> { return `Xfalse(); }
      d0(), d0() -> { return `Xtrue(); }
      s (N), s (M) -> { return `lte (N, M); }
    }
    throw new RuntimeException ("incomplete match in function lte()");
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

  private static NatList merge (NatList rec_x1, NatList rec_x2) {
    %match (NatList rec_x1, NatList rec_x2) {
      nil(), L -> { return `L; }
      L, nil() -> { return `L; }
      cons (X, L1), cons (Y, L2) -> { if (`lte (X, Y) == `Xtrue()) { return `cons (X, merge (L1, cons (Y, L2))); } }
      cons (X, L1), cons (Y, L2) -> { if (`lte (X, Y) == `Xfalse()) { return `cons (Y, merge (cons (X, L1), L2)); } }
    }
    throw new RuntimeException ("incomplete match in function merge()");
  }

  private static ListPair split (NatList rec_x1) {
    %match (NatList rec_x1) {
      cons (X, cons (Y, L)) -> { return `pair (cons (X, p1 (split (L))), cons (Y, p2 (split (L)))); }
      nil() -> { return `pair (nil(), nil()); }
      cons (X, nil()) -> { return `pair (cons (X, nil()), nil()); }
    }
    throw new RuntimeException ("incomplete match in function split()");
  }

  private static NatList mergesort (NatList rec_x1) {
    %match (NatList rec_x1) {
      nil() -> { return `nil(); }
      cons (X, nil()) -> { return `cons (X, nil()); }
      cons (X, cons (Y, L)) -> { return `merge (mergesort (cons (X, p1 (split (L)))), mergesort (cons (Y, p2 (split (L))))); }
    }
    throw new RuntimeException ("incomplete match in function mergesort()");
  }

  private static NatList p1 (ListPair rec_x1) {
    %match (ListPair rec_x1) {
      pair (L1, L2) -> { return `L1; }
    }
    throw new RuntimeException ("incomplete match in function p1()");
  }

  private static NatList p2 (ListPair rec_x1) {
    %match (ListPair rec_x1) {
      pair (L1, L2) -> { return `L2; }
    }
    throw new RuntimeException ("incomplete match in function p2()");
  }

  public static void main (String[] args) {
    System.out.println (`mergesort (rev (times (d10(), times (d10(), d10())))));
  }
}
