// TOM-A
import revelt.term.*;
import revelt.term.types.*;
public class Revelt {
  %gom{
    module Term
    abstract syntax
    Elt =
      | a()
      | b()
      | c()
      | d()
      | e()
    List =
      | conc(rec_x1_1:List, rec_x2_1:List)
      | dup(rec_x1_2:List)
      | l(rec_x1_3:Elt, rec_x2_3:List)
      | nil()
      | rev(rec_x1_4:List)
    module Term:rules() {
      conc (l (E0, L1), L2) -> l (E0, conc (L1, L2))
      conc (nil(), L2) -> L2
      dup (L1) -> conc (L1, L1)
      rev (l (E0, L1)) -> conc (rev (L1), l (E0, nil()))
      rev (nil()) -> nil()
    }
  }
  public static void main (String[] args) {
    System.out.println (`rev (dup (l (a(), l (b(), l (c(), l (d(), l (e(), nil()))))))));
  }
}
