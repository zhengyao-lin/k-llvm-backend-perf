// TOM-A
import tak18.term.*;
import tak18.term.types.*;
public class Tak18 {
  %gom{
    module Term
    abstract syntax
    Xbool =
      | gte_Int(rec_x1_1:Xint, rec_x2_1:Xint)
      | gte(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | Xfalse()
      | Xtrue()
    Xint =
      | Neg(rec_x1_1:Xnat)
      | Pos(rec_x1_2:Xnat)
      | pred(rec_x1_3:Xint)
      | succ(rec_x1_4:Xint)
      | tak(rec_x1_5:Xint, rec_x2_5:Xint, rec_x3_5:Xint)
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    module Term:rules() {
      gte (d0(), d0()) -> Xtrue()
      gte (s (X), d0()) -> Xtrue()
      gte (d0(), s (X)) -> Xfalse()
      gte (s (X), s (Y)) -> gte (X, Y)
      gte_Int (Pos (X), Pos (Y)) -> gte (X,Y)
      gte_Int (Neg (X), Neg (Y)) -> gte (Y,X)
      gte_Int (Pos (X), Neg (Y)) -> Xtrue()
      gte_Int (Neg (X), Pos (Y)) -> Xfalse()
      pred (Pos (d0())) -> Neg (d0())
      pred (Pos (s (X))) -> Pos (X)
      pred (Neg (X)) -> Neg (s (X))
      succ (Neg (d0())) -> Pos (d0())
      succ (Neg (s (X))) -> Neg (X)
      succ (Pos (X)) -> Pos (s (X))
      tak (I, J, K) -> K if gte_Int (J, I) == Xtrue()
      tak (I, J, K) -> tak (tak (pred (I), J, K), tak (pred (J), K, I), tak (pred (K), I, J)) if gte_Int (J, I) == Xfalse()
    }
  }
  public static void main (String[] args) {
    System.out.println (`tak (Pos (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))))))))), Pos (s (s (s (s (s (s (s (s (s (s (s (s (d0()))))))))))))), Pos (s (s (s (s (s (s (d0())))))))));
  }
}
