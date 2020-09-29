// TOM-B
import hanoi4.term.*;
import hanoi4.term.types.*;
public class Hanoi4 {
  %gom{
    module Term
    imports int
    abstract syntax
    Disk =
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
      | d10()
      | d11()
      | d12()
      | d13()
      | d14()
      | d15()
      | d16()
      | d17()
      | d18()
      | d19()
      | d20()
    Tower =
      | a()
      | b()
      | c()
    Move =
      | movedisk(rec_x1_1:Disk, rec_x2_1:Tower, rec_x3_1:Tower)
    List =
      | nil()
      | cons(rec_x1_1:Move, rec_x2_1:List)
  }

  private static Disk dec (Disk rec_x1) {
    %match (Disk rec_x1) {
      d20() -> { return `d19(); }
      d19() -> { return `d18(); }
      d18() -> { return `d17(); }
      d17() -> { return `d16(); }
      d16() -> { return `d15(); }
      d15() -> { return `d14(); }
      d14() -> { return `d13(); }
      d13() -> { return `d12(); }
      d12() -> { return `d11(); }
      d11() -> { return `d10(); }
      d10() -> { return `d9(); }
      d9() -> { return `d8(); }
      d8() -> { return `d7(); }
      d7() -> { return `d6(); }
      d6() -> { return `d5(); }
      d5() -> { return `d4(); }
      d4() -> { return `d3(); }
      d3() -> { return `d2(); }
      d2() -> { return `d1(); }
      d1() -> { return `d0(); }
    }
    throw new RuntimeException ("incomplete match in function dec()");
  }

  private static Tower other (Tower rec_x1, Tower rec_x2) {
    %match (Tower rec_x1, Tower rec_x2) {
      a(), b() -> { return `c(); }
      b(), a() -> { return `c(); }
      a(), c() -> { return `b(); }
      c(), a() -> { return `b(); }
      b(), c() -> { return `a(); }
      c(), b() -> { return `a(); }
    }
    throw new RuntimeException ("incomplete match in function other()");
  }

  private static List conc (List rec_x1, List rec_x2) {
    %match (List rec_x1, List rec_x2) {
      nil(), L -> { return `L; }
      L, nil() -> { return `L; }
      cons (H, T), L -> { return `cons (H, conc (T, L)); }
    }
    throw new RuntimeException ("incomplete match in function conc()");
  }

  private static List solve (Tower rec_x1, Tower rec_x2, Disk rec_x3) {
    %match (Tower rec_x1, Tower rec_x2, Disk rec_x3) {
      ORG, DEST, d0() -> { return `nil(); }
      ORG, DEST, D -> { if (`D != `d0()) { return `conc (solve (ORG, other (ORG, DEST), dec (D)), cons (movedisk (D, ORG, DEST), solve (other (ORG, DEST), DEST, dec (D)))); } }
    }
    throw new RuntimeException ("incomplete match in function solve()");
  }

  public static void main (String[] args) {
    System.out.println (`solve (a(), b(), d4()));
  }
}
