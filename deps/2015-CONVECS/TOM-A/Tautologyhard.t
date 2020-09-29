// TOM-A
import tautologyhard.term.*;
import tautologyhard.term.types.*;
public class Tautologyhard {
  %gom{
    module Term
    abstract syntax
    Prop =
      | a10()
      | a11()
      | a12()
      | a13()
      | a14()
      | a15()
      | a16()
      | a17()
      | a18()
      | a1()
      | a2()
      | a3()
      | a4()
      | a5()
      | a6()
      | a7()
      | a8()
      | a9()
      | and(rec_x1_1:Prop, rec_x2_1:Prop)
      | a()
      | b()
      | c()
      | d()
      | e()
      | ff()
      | iff(rec_x1_2:Prop, rec_x2_2:Prop)
      | implies(rec_x1_3:Prop, rec_x2_3:Prop)
      | or(rec_x1_4:Prop, rec_x2_4:Prop)
      | tt()
      | Xnot(rec_x1_5:Prop)
      | xor(rec_x1_6:Prop, rec_x2_6:Prop)
    module Term:rules() {
      and (P, tt()) -> P
      and (P, ff()) -> ff()
      xor (P, ff()) -> P
      xor (ff(), tt()) -> tt()
      xor (tt(), tt()) -> ff()
      Xnot (P) -> xor (P, tt())
      or (P, Q) -> xor (and (P, Q), xor (P, Q))
      implies (P, Q) -> Xnot (xor (P, and (P, Q)))
      iff (P, Q) -> Xnot (xor (P, Q))
      a() -> ff()
      b() -> tt()
      c() -> ff()
      d() -> tt()
      e() -> ff()
      a1() -> tt()
      a2() -> ff()
      a3() -> tt()
      a4() -> ff()
      a5() -> tt()
      a6() -> ff()
      a7() -> tt()
      a8() -> ff()
      a9() -> tt()
      a10() -> ff()
      a11() -> tt()
      a12() -> ff()
      a13() -> tt()
      a14() -> ff()
      a15() -> tt()
      a16() -> ff()
      a17() -> tt()
      a18() -> ff()
    }
  }
  public static void main (String[] args) {
    System.out.println (`implies (and (iff (iff (or (a1(), a2()), or (Xnot (a3()), iff (xor (a4(), a5()),Xnot (Xnot (Xnot (a6())))))), Xnot (and (and (a7(), a8()), Xnot (xor (xor (or (a9(), and (a10(),a11())), a2()), and (and (a11(), xor (a2(), iff (a5(), a5()))), xor (xor (a7(), a7()),iff (a9(), a4())))))))), implies (iff (iff (or (a1(), a2()), or (Xnot (a3()),iff (xor (a4(), a5()), Xnot (Xnot (Xnot (a6())))))), Xnot (and (and (a7(), a8()),Xnot (xor (xor (or (a9(), and (a10(), a11())), a2()), and (and (a11(), xor (a2(), iff (a5(),a5()))), xor (xor (a7(), a7()), iff (a9(), a4())))))))), Xnot (and (implies (and (a1(),a2()), Xnot (xor (or (or (xor (implies (and (a3(), a4()), implies (a5(), a6())), or (a7(),a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(), a2()), a7())), iff (or (a4(), a9()),xor (Xnot (a6()), a6()))))), Xnot (iff (Xnot (a11()), Xnot (a9()))))))),Xnot (and (implies (and (a1(), a2()), Xnot (xor (or (or (xor (implies (and (a3(), a4()),implies (a5(), a6())), or (a7(), a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(),a2()), a7())), iff (or (a4(), a9()), xor (Xnot (a6()), a6()))))), Xnot (iff (Xnot (a11()),Xnot (a9())))))));
    System.out.println (`implies (and (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (Xnot (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))), iff (Xnot (Xnot (a2())),implies (or (a9(), a6()), or (a10(), a5())))), Xnot (or (a9(), implies (Xnot (a8()), or (a4(),a9()))))))), implies (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (Xnot (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))),iff (Xnot (Xnot (a2())), implies (or (a9(), a6()), or (a10(), a5())))), Xnot (or (a9(),implies (Xnot (a8()), or (a4(), a9()))))))), Xnot (implies (implies (and (or (a1(),xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(), and (a6(), a7())))),implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(), a1())), a2()))),or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())), Xnot (Xnot (Xnot (a6())))))))),Xnot (implies (implies (and (or (a1(), xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(),a1())), a2()))), or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())),Xnot (Xnot (Xnot (a6()))))))));
    System.out.println (`implies (and (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (Xnot (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a11()))), implies (or (a4(),and (a3(), iff (a1(), a2()))), Xnot (Xnot (a4())))), xor (implies (implies (a6(), a1()),Xnot (a1())), Xnot (a9()))))), implies (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (Xnot (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(),a11()))), implies (or (a4(), and (a3(), iff (a1(), a2()))), Xnot (Xnot (a4())))),xor (implies (implies (a6(), a1()), Xnot (a1())), Xnot (a9()))))),Xnot (implies (implies (and (or (a1(), xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a11(),implies (a2(), a8())), a8()))), Xnot (or (implies (or (a5(), or (a8(), and (a8(), a9()))),Xnot (a2())), Xnot (a7()))))))), Xnot (implies (implies (and (or (a1(), xor (xor (a2(),a3()), Xnot (a4()))), Xnot (xor (a5(), and (a6(), a7())))), implies (xor (implies (a8(),a9()), a10()), xor (and (a11(), implies (a2(), a8())), a8()))), Xnot (or (implies (or (a5(),or (a8(), and (a8(), a9()))), Xnot (a2())), Xnot (a7())))))));
  }
}
