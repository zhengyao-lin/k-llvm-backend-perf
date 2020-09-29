// TOM-A
import order.term.*;
import order.term.types.*;
public class Order {
  %gom{
    module Term
    abstract syntax
    Xnat =
      | d0()
      | f(rec_x1_1:Xnat)
      | g(rec_x1_2:Xnat)
      | s(rec_x1_3:Xnat)
    module Term:rules() {
      g (d0()) -> d0()
      g (s (x)) -> x
      f (s (x)) -> d0() if x == d0()
      f (s (x)) -> x if x != d0()
      f (d0()) -> s (d0())
    }
  }
  public static void main (String[] args) {
    System.out.println (`f (g (d0())));
  }
}
