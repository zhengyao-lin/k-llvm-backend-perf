// TOM-B
import order.term.*;
import order.term.types.*;
public class Order {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
  }

  private static Xnat g (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `d0(); }
      s (x) -> { return `x; }
    }
    throw new RuntimeException ("incomplete match in function g()");
  }

  private static Xnat f (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (x) -> { if (`x == `d0()) { return `d0(); } }
      s (x) -> { if (`x != `d0()) { return `x; } }
      d0() -> { return `s (d0()); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (g (d0())));
  }
}
