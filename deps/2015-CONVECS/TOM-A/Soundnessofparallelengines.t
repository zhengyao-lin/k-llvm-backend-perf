// TOM-A
import soundnessofparallelengines.term.*;
import soundnessofparallelengines.term.types.*;
public class Soundnessofparallelengines {
  %gom{
    module Term
    abstract syntax
    N =
      | d0()
      | f(rec_x1_1:N)
      | g(rec_x1_2:N)
      | s(rec_x1_3:N)
    module Term:rules() {
      f (g (d0())) -> d0()
      f (g (s (X))) -> f (g (X))
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (g (s (d0()))));
  }
}
