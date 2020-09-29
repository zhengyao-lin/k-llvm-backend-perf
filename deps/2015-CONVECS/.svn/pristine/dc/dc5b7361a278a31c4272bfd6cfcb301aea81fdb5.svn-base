// TOM-A
import oddeven.term.*;
import oddeven.term.types.*;
public class Oddeven {
  %gom{
    module Term
    abstract syntax
    Xbool =
      | even(rec_x1_1:Xnat)
      | odd(rec_x1_2:Xnat)
      | Xfalse()
      | Xtrue()
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    module Term:rules() {
      odd (d0()) -> Xfalse()
      odd (s (N)) -> Xtrue() if even (N) == Xtrue()
      odd (s (N)) -> Xfalse() if even (N) == Xfalse()
      even (d0()) -> Xtrue()
      even (s (N)) -> Xtrue() if odd (N) == Xtrue()
      even (s (N)) -> Xfalse() if odd (N) == Xfalse()
    }
  }
  public static void main (String[] args) {
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0())))))))))))))))));
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))))))))))));
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0())))))))))))))))))))))))))));
  }
}
