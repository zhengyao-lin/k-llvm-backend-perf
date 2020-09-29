// TOM-B
import confluence.term.*;
import confluence.term.types.*;
public class Confluence {
  %gom{
    module Term
    imports int
    abstract syntax
    S =
      | d0()
      | g(rec_x1_1:S)
  }

  private static S f (S rec_x1) {
    %match (S rec_x1) {
      g (X) -> { if (`X == `d0()) { return `X; } }
      g (g (X)) -> { return `f (g (X)); }
    }
    throw new RuntimeException ("incomplete match in function f()");
  }

  public static void main (String[] args) {
    System.out.println (`f (g (g (d0()))));
  }
}
