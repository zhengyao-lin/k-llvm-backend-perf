// TOM-B
import revnat100.term.*;
import revnat100.term.types.*;
public class Revnat100 {
  %gom{
    module Term
    imports int
    abstract syntax
    List =
      | l(rec_x1_1:Xnat, rec_x2_1:List)
      | nil()
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
  }

  private static Xnat d10 () {
    return `s (s (s (s (s (s (s (s (s (s (d0()))))))))));
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

  private static List gen (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (N) -> { return `l (s (N), gen (N)); }
      d0() -> { return `l (d0(), nil()); }
    }
    throw new RuntimeException ("incomplete match in function gen()");
  }

  private static List conc (List rec_x1, List rec_x2) {
    %match (List rec_x1, List rec_x2) {
      l (E, L1), L2 -> { return `l (E, conc (L1, L2)); }
      nil(), L2 -> { return `L2; }
    }
    throw new RuntimeException ("incomplete match in function conc()");
  }

  private static List rev (List rec_x1) {
    %match (List rec_x1) {
      l (E, L1) -> { return `conc (rev (L1), l (E, nil())); }
      nil() -> { return `nil(); }
    }
    throw new RuntimeException ("incomplete match in function rev()");
  }

  public static void main (String[] args) {
    System.out.println (`rev (gen (times (d10(), d10()))));
  }
}
