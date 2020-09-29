// TOM-A
import check2.term.*;
import check2.term.types.*;
public class Check2 {
  %gom{
    module Term
    abstract syntax
    Xbool =
      | andBool(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | eqBool(rec_x1_2:Xbool, rec_x2_2:Xbool)
      | iffBool(rec_x1_3:Xbool, rec_x2_3:Xbool)
      | impliesBool(rec_x1_4:Xbool, rec_x2_4:Xbool)
      | neBool(rec_x1_5:Xbool, rec_x2_5:Xbool)
      | notBool(rec_x1_6:Xbool)
      | orBool(rec_x1_7:Xbool, rec_x2_7:Xbool)
      | Xfalse()
      | xorBool(rec_x1_8:Xbool, rec_x2_8:Xbool)
      | Xtrue()
    module Term:rules() {
      notBool (Xtrue()) -> Xfalse()
      notBool (Xfalse()) -> Xtrue()
      andBool (P, Xtrue()) -> P
      andBool (P, Xfalse()) -> Xfalse()
      orBool (P, Xtrue()) -> Xtrue()
      orBool (P, Xfalse()) -> P
      xorBool (P, Q) -> orBool (andBool (P, notBool (Q)), andBool (Q, notBool (P)))
      impliesBool (P, Q) -> orBool (Q, notBool (P))
      iffBool (P, Q) -> andBool (impliesBool (P, Q), impliesBool (Q, P))
      eqBool (P, Q) -> iffBool (P, Q)
      neBool (P, Q) -> xorBool (P, Q)
    }
  }
  public static void main (String[] args) {
    System.out.println (`neBool (Xfalse(), Xtrue()));
  }
}
