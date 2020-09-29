// TOM-A
import sieve20.term.*;
import sieve20.term.types.*;
public class Sieve20 {
  %gom{
    module Term
    abstract syntax
    Digit =
      | d0()
      | d1()
      | d2()
      | d3()
      | d4()
      | d5()
      | d6()
      | d7()
      | d8()
      | d9()
      | digit(rec_x1_1:Xnat)
      | find(rec_x1_2:List, rec_x2_2:Xnat)
    List =
      | ap(rec_x1_1:List, rec_x2_1:List)
      | conv(rec_x1_2:Xnat)
      | d(rec_x1_3:Digit)
      | digitList()
      | dl(rec_x1_4:Digit, rec_x2_4:List)
      | e(rec_x1_5:Xnat, rec_x2_5:List)
      | filter(rec_x1_6:List, rec_x2_6:Xnat)
      | intsBetween(rec_x1_7:Xnat, rec_x2_7:Xnat)
      | ll(rec_x1_8:List, rec_x2_8:List)
      | l(rec_x1_9:Xnat, rec_x2_9:List)
      | nil()
      | sieve(rec_x1_10:List)
    Xbool =
      | auxdiv(rec_x1_1:Xnat, rec_x2_1:Xnat, rec_x3_1:Xnat)
      | divides(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | lt(rec_x1_3:Xnat, rec_x2_3:Xnat)
      | Xfalse()
      | Xtrue()
    Xnat =
      | add(rec_x1_1:Xnat, rec_x2_1:Xnat)
      | div(rec_x1_2:Xnat, rec_x2_2:Xnat)
      | fact(rec_x1_3:Xnat)
      | ifNat(rec_x1_4:Xbool, rec_x2_4:Xnat, rec_x3_4:Xnat)
      | mult(rec_x1_5:Xnat, rec_x2_5:Xnat)
      | rem(rec_x1_6:Xnat, rec_x2_6:Xnat)
      | sub(rec_x1_7:Xnat, rec_x2_7:Xnat)
      | s(rec_x1_8:Xnat)
      | ten()
      | two()
      | z()
    module Term:rules() {
      two() -> s (s (z()))
      ten() -> s (s (s (s (s (s (s (s (s (s (z()))))))))))
      digitList() -> dl (d0(), dl (d1(), dl (d2(), dl (d3(), dl (d4(), dl (d5(), dl (d6(), dl (d7(), dl (d8(), dl (d9(), nil()))))))))))
      ifNat (Xtrue(), N, M) -> N
      ifNat (Xfalse(), N, M) -> M
      conv (X) -> dl (digit (X), nil()) if lt (X, ten()) == Xtrue()
      conv (X) -> ap (conv (div (X, ten())), conv (rem (X, ten()))) if lt (X, ten()) == Xfalse()
      rem (X, Y) -> ifNat (lt (X, Y), X, rem (sub (X, Y), Y)) if Y != z()
      div (X, Y) -> ifNat (lt (X, Y), z(), s (div (sub (X, Y), Y))) if Y != z()
      lt (z(), s (X)) -> Xtrue()
      lt (X, z()) -> Xfalse()
      lt (s (X), s (Y)) -> lt (X, Y)
      sub (z(), s (Y)) -> z()
      sub (X, z()) -> X
      sub (s (X), s (Y)) -> sub (X, Y)
      digit (X) -> find (digitList(), X)
      find (dl (Dig, L1), z()) -> Dig
      find (dl (Dig, L1), s (X)) -> find (L1, X)
      ap (nil(), L1) -> L1
      ap (dl (Dig, L1), L2) -> dl (Dig, ap (L1, L2))
      add (z(), Y) -> Y
      add (s (X), Y) -> s (add (X, Y))
      mult (z(), Y) -> z()
      mult (s (X), Y) -> add (Y, mult (X, Y))
      fact (z()) -> s (z())
      fact (s (X)) -> mult (s (X), fact (X))
      divides (N, M) -> auxdiv (N, M, M) if M != z()
      auxdiv (z(), z(), M) -> Xtrue()
      auxdiv (z(), s (X), M) -> Xfalse()
      auxdiv (s (X), s (Y), M) -> auxdiv (X, Y, M)
      auxdiv (s (X), z(), M) -> auxdiv (s (X), M, M)
      intsBetween (N, M) -> nil() if N == M
      intsBetween (N, M) -> l (N, intsBetween (s (N), M)) if N != M
      sieve (l (N, L1)) -> l (N, sieve (filter (L1, N)))
      sieve (nil()) -> nil()
      filter (l (N, L1), M) -> filter (L1, M) if divides (N, M) == Xtrue()
      filter (l (N, L1), M) -> l (N, filter (L1, M)) if divides (N, M) == Xfalse()
      filter (nil(), M) -> nil()
      e (N, L1) -> ll (conv (N), L1)
    }
  }
  public static void main (String[] args) {
    System.out.println (`sieve (intsBetween (s (s (z())), s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (z())))))))))))))))))))))));
  }
}
