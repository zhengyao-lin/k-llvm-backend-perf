// TOM-B
import bubblesort1000.term.*;
import bubblesort1000.term.types.*;
public class Bubblesort1000 {
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
  }

  private static Xnat d10 () {
    return `s (s (s (s (s (s (s (s (s (s (d0()))))))))));
  }

  private static Xbool lt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(),d0() -> { return `Xfalse(); }
      d0(), s (N) -> { return `Xtrue(); }
      s (N), d0() -> { return `Xfalse(); }
      s (N), s (M) -> { return `lt (N, M); }
    }
    throw new RuntimeException ("incomplete match in function lt()");
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

  private static Xnat fact (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `s (d0()); }
      s (N) -> { return `times (s (N), fact (N)); }
    }
    throw new RuntimeException ("incomplete match in function fact()");
  }

  private static NatList rev (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (N) -> { return `bubsort (s (N), rev (N)); }
      d0() -> { return `cons (d0(), nil()); }
    }
    throw new RuntimeException ("incomplete match in function rev()");
  }

  private static NatList bubsort (Xnat rec_x1, NatList rec_x2) {
    %match (Xnat rec_x1, NatList rec_x2) {
      N, nil() -> { return `cons (N, nil()); }
      N, cons (M, L) -> { if (`lt (M, N) == `Xtrue()) { return `cons (M, bubsort (N, L)); } }
      N, cons (M, L) -> { if (`lt (M, N) == `Xfalse()) { return `cons (N, bubsort (M, L)); } }
    }
    throw new RuntimeException ("incomplete match in function bubsort()");
  }

  public static void main (String[] args) {
    System.out.println (`rev (times (d10(), times (d10(), d10()))));
  }
}
