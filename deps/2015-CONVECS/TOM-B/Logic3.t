// TOM-B
import logic3.term.*;
import logic3.term.types.*;
public class Logic3 {
  %gom{
    module Term
    imports int
    abstract syntax
    Bool3 =
      | d0()
      | d1()
      | d2()
  }

  private static Bool3 a () {
    return `d0();
  }

  private static Bool3 b () {
    return `d1();
  }

  private static Bool3 c () {
    return `d2();
  }

  private static Bool3 d () {
    return `d0();
  }

  private static Bool3 e () {
    return `d1();
  }

  private static Bool3 f () {
    return `d2();
  }

  private static Bool3 g () {
    return `d0();
  }

  private static Bool3 h () {
    return `d1();
  }

  private static Bool3 succ (Bool3 rec_x1) {
    %match (Bool3 rec_x1) {
      d0() -> { return `d1(); }
      d1() -> { return `d2(); }
      d2() -> { return `d0(); }
    }
    throw new RuntimeException ("incomplete match in function succ()");
  }

  private static Bool3 plus (Bool3 rec_x1, Bool3 rec_x2) {
    %match (Bool3 rec_x1, Bool3 rec_x2) {
      d0(), X -> { return `X; }
      d1(), X -> { return `succ (X); }
      d2(), X -> { return `succ (succ (X)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Bool3 times (Bool3 rec_x1, Bool3 rec_x2) {
    %match (Bool3 rec_x1, Bool3 rec_x2) {
      d0(), X -> { return `d0(); }
      d1(), X -> { return `X; }
      d2(), d0() -> { return `d0(); }
      d2(), d1() -> { return `d2(); }
      d2(), d2() -> { return `d1(); }
    }
    throw new RuntimeException ("incomplete match in function times()");
  }

  private static Bool3 and (Bool3 rec_x1, Bool3 rec_x2) {
    %match (Bool3 rec_x1, Bool3 rec_x2) {
      X,Y -> { return `plus ( times (times (X, X), times (Y, Y)),plus ( times (d2(), times (times (X, X), Y)),plus ( times (d2(), times (times (Y, Y), X)),times (d2(), times (X, Y)) ))); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Bool3 or (Bool3 rec_x1, Bool3 rec_x2) {
    %match (Bool3 rec_x1, Bool3 rec_x2) {
      X,Y -> { return `plus ( times (d2(), times (times (X, X), times (Y, Y))),plus ( times (times (X, X), Y),plus ( times (times (Y, Y), X),plus ( times (X, Y),plus (X, Y) )))); }
    }
    throw new RuntimeException ("incomplete match in function or()");
  }

  private static Bool3 Xnot (Bool3 rec_x1) {
    %match (Bool3 rec_x1) {
      X -> { return `plus (times (d2(), X), d1()); }
    }
    throw new RuntimeException ("incomplete match in function Xnot()");
  }

  private static Bool3 eq (Bool3 rec_x1, Bool3 rec_x2) {
    %match (Bool3 rec_x1, Bool3 rec_x2) {
      X,Y -> { if (`X == `Y) { return `d1(); } }
      X,Y -> { if (`X != `Y) { return `d0(); } }
    }
    throw new RuntimeException ("incomplete match in function eq()");
  }

  public static void main (String[] args) {
    System.out.println (`eq (and (and (and (a(), b()), and (c(), d())), and (and (e(), f()), and (g(), h()))), Xnot (or (or (or (Xnot (a()), Xnot (b())), or (Xnot (c()), Xnot (d()))),or (or (Xnot (e()), Xnot (f())), or (Xnot (g()), Xnot (h())))))));
  }
}
