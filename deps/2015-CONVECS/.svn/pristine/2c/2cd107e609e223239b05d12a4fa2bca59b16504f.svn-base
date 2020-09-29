// TOM-A
import factorial6.term.*;
import factorial6.term.types.*;
public class Factorial6 {
  %gom{
    module Term
    abstract syntax
    Xnat =
      | d0()
      | fact(rec_x1_1:Xnat)
      | plus(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | s(rec_x1_3:Xnat)
      | times(rec_x1_4:Xnat, rec_x2_4:Xnat)
    module Term:rules() {
      plus (d0(), N) -> N
      plus (s (N), M) -> s (plus (N, M))
      times (d0(), N) -> d0()
      times (s (N), M) -> plus (M, times (N, M))
      fact (d0()) -> s (d0())
      fact (s (N)) -> times (s (N), fact (N))
    }
  }
  public static void main (String[] args) {
    System.out.println (`fact (s (s (s (s (s (s (d0()))))))));
  }
}
