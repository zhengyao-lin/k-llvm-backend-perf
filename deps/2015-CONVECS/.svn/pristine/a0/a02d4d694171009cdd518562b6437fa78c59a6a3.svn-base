// TOM-A
import confluence.term.*;
import confluence.term.types.*;
public class Confluence {
  %gom{
    module Term
    abstract syntax
    S =
      | d0()
      | f(rec_x1_1:S)
      | g(rec_x1_2:S)
    module Term:rules() {
      f (g (X)) -> X if X == d0()
      f (g (g (X))) -> f (g (X))
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (g (g (d0()))));
  }
}
