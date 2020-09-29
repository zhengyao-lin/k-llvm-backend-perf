// TOM-B
import fibonacci19.term.*;
import fibonacci19.term.types.*;
public class Fibonacci19 {
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

  private static Xnat fibb (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `d0(); }
      s (d0()) -> { return `s (d0()); }
      s (s (N)) -> { return `plus (fibb (s (N)), fibb (N)); }
    }
    throw new RuntimeException ("incomplete match in function fibb()");
  }

  public static void main (String[] args) {
    System.out.println (`fibb (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0())))))))))))))))))))));
  }
}
