// TOM-A
import hanoi16.term.*;
import hanoi16.term.types.*;
public class Hanoi16 {
  %gom{
    module Term
    abstract syntax
    Disk =
      | d0()
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
      | d1()
      | d20()
      | d2()
      | d3()
      | d4()
      | d5()
      | d6()
      | d7()
      | d8()
      | d9()
      | dec(rec_x1_1:Disk)
    List =
      | conc(rec_x1_1:List, rec_x2_1:List)
      | cons(rec_x1_2:Move, rec_x2_2:List)
      | nil()
      | solve(rec_x1_3:Tower, rec_x2_3:Tower, rec_x3_3:Disk)
    Move =
      | movedisk(rec_x1_1:Disk, rec_x2_1:Tower, rec_x3_1:Tower)
    Tower =
      | a()
      | b()
      | c()
      | other(rec_x1_1:Tower, rec_x2_1:Tower)
    module Term:rules() {
      dec (d20()) -> d19()
      dec (d19()) -> d18()
      dec (d18()) -> d17()
      dec (d17()) -> d16()
      dec (d16()) -> d15()
      dec (d15()) -> d14()
      dec (d14()) -> d13()
      dec (d13()) -> d12()
      dec (d12()) -> d11()
      dec (d11()) -> d10()
      dec (d10()) -> d9()
      dec (d9()) -> d8()
      dec (d8()) -> d7()
      dec (d7()) -> d6()
      dec (d6()) -> d5()
      dec (d5()) -> d4()
      dec (d4()) -> d3()
      dec (d3()) -> d2()
      dec (d2()) -> d1()
      dec (d1()) -> d0()
      other (a(), b()) -> c()
      other (b(), a()) -> c()
      other (a(), c()) -> b()
      other (c(), a()) -> b()
      other (b(), c()) -> a()
      other (c(), b()) -> a()
      conc (nil(), L) -> L
      conc (L, nil()) -> L
      conc (cons (H, T), L) -> cons (H, conc (T, L))
      solve (ORG, DEST, d0()) -> nil()
      solve (ORG, DEST, D) -> conc (solve (ORG, other (ORG, DEST), dec (D)), cons (movedisk (D, ORG, DEST), solve (other (ORG, DEST), DEST, dec (D)))) if D != d0()
    }
  }
  public static void main (String[] args) {
    System.out.println (`solve (a(), b(), d16()));
  }
}
