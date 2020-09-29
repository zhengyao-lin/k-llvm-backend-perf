// TOM-A
import searchinconditions.term.*;
import searchinconditions.term.types.*;
public class Searchinconditions {
  %gom{
    module Term
    abstract syntax
    Xbool =
      | a()
      | Xfalse()
      | Xnot(rec_x1_1:Xbool)
      | Xtrue()
    module Term:rules() {
      a() -> Xtrue()
      Xnot (X) -> Xtrue() if X == Xfalse()
      Xnot (X) -> Xfalse() if X == Xtrue()
    }
  }
  public static void main (String[] args) {
    System.out.println (`Xnot (a()));
  }
}
