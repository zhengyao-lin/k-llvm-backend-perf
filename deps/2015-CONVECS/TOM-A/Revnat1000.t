// TOM-A
import revnat1000.term.*;
import revnat1000.term.types.*;
public class Revnat1000 {
  %gom{
    module Term
    abstract syntax
    List =
      | conc(rec_x1_1:List, rec_x2_1:List)
      | gen(rec_x1_2:Xnat)
      | l(rec_x1_3:Xnat, rec_x2_3:List)
      | nil()
      | rev(rec_x1_4:List)
    Xnat =
      | d0()
      | d10()
      | plus(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | s(rec_x1_2:Xnat)
      | times(rec_x1_3:Xnat, rec_x2_3:Xnat)
    module Term:rules() {
      d10() -> s (s (s (s (s (s (s (s (s (s (d0()))))))))))
      plus (d0(), N) -> N
      plus (s (N), M) -> s (plus (N, M))
      times (d0(), N) -> d0()
      times (s (N), M) -> plus (M, times (N, M))
      gen (s (N)) -> l (s (N), gen (N))
      gen (d0()) -> l (d0(), nil())
      conc (l (E, L1), L2) -> l (E, conc (L1, L2))
      conc (nil(), L2) -> L2
      rev (l (E, L1)) -> conc (rev (L1), l (E, nil()))
      rev (nil()) -> nil()
    }
  }
  public static void main (String[] args) {
    System.out.println (`rev (gen (times (d10(), times (d10(), d10())))));
  }
}
