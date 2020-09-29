// TOM-B
import soundnessofparallelengines.term.*;
import soundnessofparallelengines.term.types.*;
public class Soundnessofparallelengines {
  %gom{
    module Term
    imports int
    abstract syntax
    N =
      | d0()
      | s(rec_x1_1:N)
      | g(rec_x1_2:N)
  }

  private static N f (N rec_x1) {
    %match (N rec_x1) {
      g (d0()) -> { return `d0(); }
      g (s (X)) -> { return `f (g (X)); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (g (s (d0()))));
  }
}
