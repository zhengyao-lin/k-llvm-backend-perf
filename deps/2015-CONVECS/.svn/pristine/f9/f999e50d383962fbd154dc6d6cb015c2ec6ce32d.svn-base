// TOM-B
import revelt.term.*;
import revelt.term.types.*;
public class Revelt {
  %gom{
    module Term
    imports int
    abstract syntax
    List =
      | l(rec_x1_1:Elt, rec_x2_1:List)
      | nil()
    Elt =
      | a()
      | b()
      | c()
      | d()
      | e()
  }

  private static List conc (List rec_x1, List rec_x2) {
    %match (List rec_x1, List rec_x2) {
      l (E0, L1), L2 -> { return `l (E0, conc (L1, L2)); }
      nil(), L2 -> { return `L2; }
    }
    throw new RuntimeException ("incomplete match in function conc()");
  }

  private static List dup (List rec_x1) {
    %match (List rec_x1) {
      L1 -> { return `conc (L1, L1); }
    }
    throw new RuntimeException ("incomplete match in function dup()");
  }

  private static List rev (List rec_x1) {
    %match (List rec_x1) {
      l (E0, L1) -> { return `conc (rev (L1), l (E0, nil())); }
      nil() -> { return `nil(); }
    }
    throw new RuntimeException ("incomplete match in function rev()");
  }

  public static void main (String[] args) {
    System.out.println (`rev (dup (l (a(), l (b(), l (c(), l (d(), l (e(), nil()))))))));
  }
}
