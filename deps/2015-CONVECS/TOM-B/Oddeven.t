// TOM-B
import oddeven.term.*;
import oddeven.term.types.*;
public class Oddeven {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
  }

  private static Xbool odd (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `Xfalse(); }
      s (N) -> { if (`even (N) == `Xtrue()) { return `Xtrue(); } }
      s (N) -> { if (`even (N) == `Xfalse()) { return `Xfalse(); } }
    }
    throw new RuntimeException ("incomplete match in function odd()");
  }

  private static Xbool even (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `Xtrue(); }
      s (N) -> { if (`odd (N) == `Xtrue()) { return `Xtrue(); } }
      s (N) -> { if (`odd (N) == `Xfalse()) { return `Xfalse(); } }
    }
    throw new RuntimeException ("incomplete match in function even()");
  }

  public static void main (String[] args) {
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0())))))))))))))))));
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))))))))))));
    System.out.println (`odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0())))))))))))))))))))))))))));
  }
}
