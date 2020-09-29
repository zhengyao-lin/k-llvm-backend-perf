// TOM-A
import tricky.term.*;
import tricky.term.types.*;
public class Tricky {
  %gom{
    module Term
    abstract syntax
    NSingleton =
      | Ncons()
    USingleton =
      | Ucons(rec_x1_1:Xnat)
    Xnat =
      | d0()
      | d1()
      | d2()
      | d3()
      | f(rec_x1_1:Xnat)
      | succ(rec_x1_2:Xnat)
    module Term:rules() {
      d1() -> succ (d0())
      d2() -> d0() if d0() == d0()
      d3() -> d0() if d0() != d0()
      d3() -> d0() if succ (d0()) == d0()
      d3() -> succ (d0()) if succ (d0()) != d0()
      f (N) -> N if N != d0() && N != succ (d0())
    }
  }
  public static void main (String[] args) {
    System.out.println (`Ncons());
    System.out.println (`Ucons (d0()));
    System.out.println (`d1());
    System.out.println (`d2());
    System.out.println (`d3());
  }
}
