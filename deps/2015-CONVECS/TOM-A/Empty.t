// TOM-A
import empty.term.*;
import empty.term.types.*;
public class Empty {
  %gom{
    module Term
    abstract syntax
    Xnat =
      | d0()
      | succ(rec_x1_1:Xnat)
    module Term:rules() {
    }
  }
  public static void main (String[] args) {
    System.out.println (`d0());
  }
}
