// TOM-B
import sieve2000.term.*;
import sieve2000.term.types.*;
public class Sieve2000 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Xnat =
      | s(rec_x1_1:Xnat)
      | z()
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
    List =
      | nil()
      | d(rec_x1_1:Digit)
      | dl(rec_x1_2:Digit, rec_x2_2:List)
      | l(rec_x1_3:Xnat, rec_x2_3:List)
      | ll(rec_x1_4:List, rec_x2_4:List)
  }

  private static Xnat two () {
    return `s (s (z()));
  }

  private static Xnat ten () {
    return `s (s (s (s (s (s (s (s (s (s (z()))))))))));
  }

  private static List digitList () {
    return `dl (d0(), dl (d1(), dl (d2(), dl (d3(), dl (d4(), dl (d5(), dl (d6(), dl (d7(), dl (d8(), dl (d9(), nil()))))))))));
  }

  private static Xnat ifNat (Xbool rec_x1, Xnat rec_x2, Xnat rec_x3) {
    %match (Xbool rec_x1, Xnat rec_x2, Xnat rec_x3) {
      Xtrue(), N, M -> { return `N; }
      Xfalse(), N, M -> { return `M; }
    }
    throw new RuntimeException ("incomplete match in function ifNat()");
  }

  private static List conv (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { if (`lt (X, ten()) == `Xtrue()) { return `dl (digit (X), nil()); } }
      X -> { if (`lt (X, ten()) == `Xfalse()) { return `ap (conv (div (X, ten())), conv (rem (X, ten()))); } }
    }
    throw new RuntimeException ("incomplete match in function conv()");
  }

  private static Xnat rem (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, Y -> { if (`Y != `z()) { return `ifNat (lt (X, Y), X, rem (sub (X, Y), Y)); } }
    }
    throw new RuntimeException ("incomplete match in function rem()");
  }

  private static Xnat div (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, Y -> { if (`Y != `z()) { return `ifNat (lt (X, Y), z(), s (div (sub (X, Y), Y))); } }
    }
    throw new RuntimeException ("incomplete match in function div()");
  }

  private static Xbool lt (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      z(), s (X) -> { return `Xtrue(); }
      X, z() -> { return `Xfalse(); }
      s (X), s (Y) -> { return `lt (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function lt()");
  }

  private static Xnat sub (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      z(), s (Y) -> { return `z(); }
      X, z() -> { return `X; }
      s (X), s (Y) -> { return `sub (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function sub()");
  }

  private static Digit digit (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { return `find (digitList(), X); }
    }
    throw new RuntimeException ("incomplete match in function digit()");
  }

  private static Digit find (List rec_x1, Xnat rec_x2) {
    %match (List rec_x1, Xnat rec_x2) {
      dl (Dig, L1), z() -> { return `Dig; }
      dl (Dig, L1), s (X) -> { return `find (L1, X); }
    }
    throw new RuntimeException ("incomplete match in function find()");
  }

  private static List ap (List rec_x1, List rec_x2) {
    %match (List rec_x1, List rec_x2) {
      nil(), L1 -> { return `L1; }
      dl (Dig, L1), L2 -> { return `dl (Dig, ap (L1, L2)); }
    }
    throw new RuntimeException ("incomplete match in function ap()");
  }

  private static Xnat add (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      z(), Y -> { return `Y; }
      s (X), Y -> { return `s (add (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function add()");
  }

  private static Xnat mult (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      z(), Y -> { return `z(); }
      s (X), Y -> { return `add (Y, mult (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function mult()");
  }

  private static Xnat fact (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      z() -> { return `s (z()); }
      s (X) -> { return `mult (s (X), fact (X)); }
    }
    throw new RuntimeException ("incomplete match in function fact()");
  }

  private static Xbool divides (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      N, M -> { if (`M != `z()) { return `auxdiv (N, M, M); } }
    }
    throw new RuntimeException ("incomplete match in function divides()");
  }

  private static Xbool auxdiv (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3) {
      z(), z(), M -> { return `Xtrue(); }
      z(), s (X), M -> { return `Xfalse(); }
      s (X), s (Y), M -> { return `auxdiv (X, Y, M); }
      s (X), z(), M -> { return `auxdiv (s (X), M, M); }
    }
    throw new RuntimeException ("incomplete match in function auxdiv()");
  }

  private static List intsBetween (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      N, M -> { if (`N == `M) { return `nil(); } }
      N, M -> { if (`N != `M) { return `l (N, intsBetween (s (N), M)); } }
    }
    throw new RuntimeException ("incomplete match in function intsBetween()");
  }

  private static List sieve (List rec_x1) {
    %match (List rec_x1) {
      l (N, L1) -> { return `l (N, sieve (filter (L1, N))); }
      nil() -> { return `nil(); }
    }
    throw new RuntimeException ("incomplete match in function sieve()");
  }

  private static List filter (List rec_x1, Xnat rec_x2) {
    %match (List rec_x1, Xnat rec_x2) {
      l (N, L1), M -> { if (`divides (N, M) == `Xtrue()) { return `filter (L1, M); } }
      l (N, L1), M -> { if (`divides (N, M) == `Xfalse()) { return `l (N, filter (L1, M)); } }
      nil(), M -> { return `nil(); }
    }
    throw new RuntimeException ("incomplete match in function filter()");
  }

  private static List e (Xnat rec_x1, List rec_x2) {
    %match (Xnat rec_x1, List rec_x2) {
      N, L1 -> { return `ll (conv (N), L1); }
    }
    throw new RuntimeException ("incomplete match in function e()");
  }

  public static void main (String[] args) {
    System.out.println (`sieve (intsBetween (s (s (z())), mult (two(), mult (ten(), mult (ten(), ten()))))));
  }
}
