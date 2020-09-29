// TOM-B
import factorial9.term.*;
import factorial9.term.types.*;
public class Factorial9 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
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

  public static void main (String[] args) {
    System.out.println (`fact (s (s (s (s (s (s (s (s (s (d0())))))))))));
  }
}
