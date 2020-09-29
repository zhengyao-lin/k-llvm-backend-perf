// TOM-B
import tricky.term.*;
import tricky.term.types.*;
public class Tricky {
  %gom{
    module Term
    imports int
    abstract syntax
    NSingleton =
      | Ncons()
    USingleton =
      | Ucons(rec_x1_1:Xnat)
    Xnat =
      | d0()
      | succ(rec_x1_1:Xnat)
  }

  private static Xnat d1 () {
    return `succ (d0());
  }

  private static Xnat d2 () {
    %match (int 0) {
      rec_zero -> { if (`d0() == `d0()) { return `d0(); } }
    }
    throw new RuntimeException ("incomplete match in function d2()");
  }

  private static Xnat d3 () {
    %match (int 0) {
      rec_zero -> { if (`d0() != `d0()) { return `d0(); } }
      rec_zero -> { if (`succ (d0()) == `d0()) { return `d0(); } }
      rec_zero -> { if (`succ (d0()) != `d0()) { return `succ (d0()); } }
    }
    throw new RuntimeException ("incomplete match in function d3()");
  }

  private static Xnat f (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      N -> { if (`N != `d0() && `N != `succ (d0())) { return `N; } }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`Ncons());
    System.out.println (`Ucons (d0()));
    System.out.println (`d1());
    System.out.println (`d2());
    System.out.println (`d3());
  }
}
