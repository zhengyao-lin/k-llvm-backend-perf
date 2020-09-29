// TOM-B
import searchinconditions.term.*;
import searchinconditions.term.types.*;
public class Searchinconditions {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
  }

  private static Xbool a () {
    return `Xtrue();
  }

  private static Xbool Xnot (Xbool rec_x1) {
    %match (Xbool rec_x1) {
      X -> { if (`X == `Xfalse()) { return `Xtrue(); } }
      X -> { if (`X == `Xtrue()) { return `Xfalse(); } }
    }
    throw new RuntimeException ("incomplete match in function Xnot()");
  }

  public static void main (String[] args) {
    System.out.println (`Xnot (a()));
  }
}
