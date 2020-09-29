// TOM-A
import logic3.term.*;
import logic3.term.types.*;
public class Logic3 {
  %gom{
    module Term
    abstract syntax
    Bool3 =
      | a()
      | and(rec_x1_1:Bool3, rec_x2_1:Bool3)
      | b()
      | c()
      | d0()
      | d1()
      | d2()
      | d()
      | e()
      | eq(rec_x1_2:Bool3, rec_x2_2:Bool3)
      | f()
      | g()
      | h()
      | or(rec_x1_3:Bool3, rec_x2_3:Bool3)
      | plus(rec_x1_4:Bool3, rec_x2_4:Bool3)
      | succ(rec_x1_5:Bool3)
      | times(rec_x1_6:Bool3, rec_x2_6:Bool3)
      | Xnot(rec_x1_7:Bool3)
    module Term:rules() {
      a() -> d0()
      b() -> d1()
      c() -> d2()
      d() -> d0()
      e() -> d1()
      f() -> d2()
      g() -> d0()
      h() -> d1()
      succ (d0()) -> d1()
      succ (d1()) -> d2()
      succ (d2()) -> d0()
      plus (d0(), X) -> X
      plus (d1(), X) -> succ (X)
      plus (d2(), X) -> succ (succ (X))
      times (d0(), X) -> d0()
      times (d1(), X) -> X
      times (d2(), d0()) -> d0()
      times (d2(), d1()) -> d2()
      times (d2(), d2()) -> d1()
      and (X,Y) -> plus ( times (times (X, X), times (Y, Y)),plus ( times (d2(), times (times (X, X), Y)),plus ( times (d2(), times (times (Y, Y), X)),times (d2(), times (X, Y)) )))
      or (X,Y) -> plus ( times (d2(), times (times (X, X), times (Y, Y))),plus ( times (times (X, X), Y),plus ( times (times (Y, Y), X),plus ( times (X, Y),plus (X, Y) ))))
      Xnot (X) -> plus (times (d2(), X), d1())
      eq (X,Y) -> d1() if X == Y
      eq (X,Y) -> d0() if X != Y
    }
  }
  public static void main (String[] args) {
    System.out.println (`eq (and (and (and (a(), b()), and (c(), d())), and (and (e(), f()), and (g(), h()))), Xnot (or (or (or (Xnot (a()), Xnot (b())), or (Xnot (c()), Xnot (d()))),or (or (Xnot (e()), Xnot (f())), or (Xnot (g()), Xnot (h())))))));
  }
}
