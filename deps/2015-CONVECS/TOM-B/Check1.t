// TOM-B
import check1.term.*;
import check1.term.types.*;
public class Check1 {
  %gom{
    module Term
    imports int
    abstract syntax
    USingleton =
      | Ucons(rec_x1_1:Xnat)
    Xnat =
      | d0()
      | succ(rec_x1_1:Xnat)
  }

  public static void main (String[] args) {
    System.out.println (`d0());
  }
}
