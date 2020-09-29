// TOM-B
import garbagecollection.term.*;
import garbagecollection.term.types.*;
public class Garbagecollection {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
      | p()
      | n()
  }

  private static Xnat d1 () {
    return `s (d0());
  }

  private static Xnat c (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), Y -> { return `Y; }
      s (X), Y -> { return `s (c (X,Y)); }
    }
    throw new RuntimeException ("incomplete match in function c()");
  }

  private static Xnat f (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
      X, Y, s (Z), T, U -> { return `f (X, Y, Z, c (T, T), U); }
      X, s (Y), d0(), T, U -> { return `f (X, Y, p(), T, T); }
      s (X), d0(), d0(), T, U -> { return `f (X, n(), p(), d1(), d0()); }
      d0(), d0(), d0(), T, U -> { return `T; }
      X, s (Y), p(), T, U -> { return `f (X, Y, p(), T, s (U)); }
      X, d0(), p(), T, U -> { return `f (X, n(), p(), s (T), U); }
      s (X), n(), p(), T, U -> { return `f (X, n(), p(), T, U); }
      d0(), n(), p(), T, U -> { return `U; }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (s (s (s (s (s (s (d0())))))), s (s (s (s (s (d0()))))), s (s (d0())), d0(), d1()));
    System.out.println (`f (s (s (s (s (d0())))), s (s (s (d0()))), s (s (s (s (s (d0()))))), d0(), d1()));
  }
}
