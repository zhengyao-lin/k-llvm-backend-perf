// TOM-A
import garbagecollection.term.*;
import garbagecollection.term.types.*;
public class Garbagecollection {
  %gom{
    module Term
    abstract syntax
    Xnat =
      | c(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | d0()
      | d1()
      | f(rec_x1_2:Xnat, rec_x2_2:Xnat, rec_x3_2:Xnat, rec_x4_2:Xnat, rec_x5_2:Xnat)
      | n()
      | p()
      | s(rec_x1_3:Xnat)
    module Term:rules() {
      d1() -> s (d0())
      c (d0(), Y) -> Y
      c (s (X), Y) -> s (c (X,Y))
      f (X, Y, s (Z), T, U) -> f (X, Y, Z, c (T, T), U)
      f (X, s (Y), d0(), T, U) -> f (X, Y, p(), T, T)
      f (s (X), d0(), d0(), T, U) -> f (X, n(), p(), d1(), d0())
      f (d0(), d0(), d0(), T, U) -> T
      f (X, s (Y), p(), T, U) -> f (X, Y, p(), T, s (U))
      f (X, d0(), p(), T, U) -> f (X, n(), p(), s (T), U)
      f (s (X), n(), p(), T, U) -> f (X, n(), p(), T, U)
      f (d0(), n(), p(), T, U) -> U
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (s (s (s (s (s (s (d0())))))), s (s (s (s (s (d0()))))), s (s (d0())), d0(), d1()));
    System.out.println (`f (s (s (s (s (d0())))), s (s (s (d0()))), s (s (s (s (s (d0()))))), d0(), d1()));
  }
}
