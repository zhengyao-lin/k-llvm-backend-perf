// TOM-B
import tautologyhard.term.*;
import tautologyhard.term.types.*;
public class Tautologyhard {
  %gom{
    module Term
    imports int
    abstract syntax
    Prop =
      | tt()
      | ff()
  }

  private static Prop and (Prop rec_x1, Prop rec_x2) {
    %match (Prop rec_x1, Prop rec_x2) {
      P, tt() -> { return `P; }
      P, ff() -> { return `ff(); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Prop xor (Prop rec_x1, Prop rec_x2) {
    %match (Prop rec_x1, Prop rec_x2) {
      P, ff() -> { return `P; }
      ff(), tt() -> { return `tt(); }
      tt(), tt() -> { return `ff(); }
    }
    throw new RuntimeException ("incomplete match in function xor()");
  }

  private static Prop Xnot (Prop rec_x1) {
    %match (Prop rec_x1) {
      P -> { return `xor (P, tt()); }
    }
    throw new RuntimeException ("incomplete match in function Xnot()");
  }

  private static Prop or (Prop rec_x1, Prop rec_x2) {
    %match (Prop rec_x1, Prop rec_x2) {
      P, Q -> { return `xor (and (P, Q), xor (P, Q)); }
    }
    throw new RuntimeException ("incomplete match in function or()");
  }

  private static Prop implies (Prop rec_x1, Prop rec_x2) {
    %match (Prop rec_x1, Prop rec_x2) {
      P, Q -> { return `Xnot (xor (P, and (P, Q))); }
    }
    throw new RuntimeException ("incomplete match in function implies()");
  }

  private static Prop iff (Prop rec_x1, Prop rec_x2) {
    %match (Prop rec_x1, Prop rec_x2) {
      P, Q -> { return `Xnot (xor (P, Q)); }
    }
    throw new RuntimeException ("incomplete match in function iff()");
  }

  private static Prop a () {
    return `ff();
  }

  private static Prop b () {
    return `tt();
  }

  private static Prop c () {
    return `ff();
  }

  private static Prop d () {
    return `tt();
  }

  private static Prop e () {
    return `ff();
  }

  private static Prop a1 () {
    return `tt();
  }

  private static Prop a2 () {
    return `ff();
  }

  private static Prop a3 () {
    return `tt();
  }

  private static Prop a4 () {
    return `ff();
  }

  private static Prop a5 () {
    return `tt();
  }

  private static Prop a6 () {
    return `ff();
  }

  private static Prop a7 () {
    return `tt();
  }

  private static Prop a8 () {
    return `ff();
  }

  private static Prop a9 () {
    return `tt();
  }

  private static Prop a10 () {
    return `ff();
  }

  private static Prop a11 () {
    return `tt();
  }

  private static Prop a12 () {
    return `ff();
  }

  private static Prop a13 () {
    return `tt();
  }

  private static Prop a14 () {
    return `ff();
  }

  private static Prop a15 () {
    return `tt();
  }

  private static Prop a16 () {
    return `ff();
  }

  private static Prop a17 () {
    return `tt();
  }

  private static Prop a18 () {
    return `ff();
  }

  public static void main (String[] args) {
    System.out.println (`implies (and (iff (iff (or (a1(), a2()), or (Xnot (a3()), iff (xor (a4(), a5()),Xnot (Xnot (Xnot (a6())))))), Xnot (and (and (a7(), a8()), Xnot (xor (xor (or (a9(), and (a10(),a11())), a2()), and (and (a11(), xor (a2(), iff (a5(), a5()))), xor (xor (a7(), a7()),iff (a9(), a4())))))))), implies (iff (iff (or (a1(), a2()), or (Xnot (a3()),iff (xor (a4(), a5()), Xnot (Xnot (Xnot (a6())))))), Xnot (and (and (a7(), a8()),Xnot (xor (xor (or (a9(), and (a10(), a11())), a2()), and (and (a11(), xor (a2(), iff (a5(),a5()))), xor (xor (a7(), a7()), iff (a9(), a4())))))))), Xnot (and (implies (and (a1(),a2()), Xnot (xor (or (or (xor (implies (and (a3(), a4()), implies (a5(), a6())), or (a7(),a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(), a2()), a7())), iff (or (a4(), a9()),xor (Xnot (a6()), a6()))))), Xnot (iff (Xnot (a11()), Xnot (a9()))))))),Xnot (and (implies (and (a1(), a2()), Xnot (xor (or (or (xor (implies (and (a3(), a4()),implies (a5(), a6())), or (a7(), a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(),a2()), a7())), iff (or (a4(), a9()), xor (Xnot (a6()), a6()))))), Xnot (iff (Xnot (a11()),Xnot (a9())))))));
    System.out.println (`implies (and (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (Xnot (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))), iff (Xnot (Xnot (a2())),implies (or (a9(), a6()), or (a10(), a5())))), Xnot (or (a9(), implies (Xnot (a8()), or (a4(),a9()))))))), implies (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (Xnot (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))),iff (Xnot (Xnot (a2())), implies (or (a9(), a6()), or (a10(), a5())))), Xnot (or (a9(),implies (Xnot (a8()), or (a4(), a9()))))))), Xnot (implies (implies (and (or (a1(),xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(), and (a6(), a7())))),implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(), a1())), a2()))),or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())), Xnot (Xnot (Xnot (a6())))))))),Xnot (implies (implies (and (or (a1(), xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(),a1())), a2()))), or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())),Xnot (Xnot (Xnot (a6()))))))));
    System.out.println (`implies (and (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (Xnot (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a11()))), implies (or (a4(),and (a3(), iff (a1(), a2()))), Xnot (Xnot (a4())))), xor (implies (implies (a6(), a1()),Xnot (a1())), Xnot (a9()))))), implies (Xnot (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (Xnot (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(),a11()))), implies (or (a4(), and (a3(), iff (a1(), a2()))), Xnot (Xnot (a4())))),xor (implies (implies (a6(), a1()), Xnot (a1())), Xnot (a9()))))),Xnot (implies (implies (and (or (a1(), xor (xor (a2(), a3()), Xnot (a4()))), Xnot (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a11(),implies (a2(), a8())), a8()))), Xnot (or (implies (or (a5(), or (a8(), and (a8(), a9()))),Xnot (a2())), Xnot (a7()))))))), Xnot (implies (implies (and (or (a1(), xor (xor (a2(),a3()), Xnot (a4()))), Xnot (xor (a5(), and (a6(), a7())))), implies (xor (implies (a8(),a9()), a10()), xor (and (a11(), implies (a2(), a8())), a8()))), Xnot (or (implies (or (a5(),or (a8(), and (a8(), a9()))), Xnot (a2())), Xnot (a7())))))));
  }
}
