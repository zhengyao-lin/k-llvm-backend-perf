sealed abstract class Bool3
  case class D0() extends Bool3
  case class D1() extends Bool3
  case class D2() extends Bool3

object logic3 {

def a():Bool3 = D0()

def b():Bool3 = D1()

def c():Bool3 = D2()

def d():Bool3 = D0()

def e():Bool3 = D1()

def f():Bool3 = D2()

def g():Bool3 = D0()

def h():Bool3 = D1()

def succ (rec_x1:Bool3):Bool3 =
  rec_x1 match {
    case D0() => D1()
    case D1() => D2()
    case D2() => D0()
  }

def plus (rec_x1:Bool3, rec_x2:Bool3):Bool3 =
  (rec_x1, rec_x2) match {
    case (D0(), x) => x
    case (D1(), x) => succ (x)
    case (D2(), x) => succ (succ (x))
  }

def times (rec_x1:Bool3, rec_x2:Bool3):Bool3 =
  (rec_x1, rec_x2) match {
    case (D0(), x) => D0()
    case (D1(), x) => x
    case (D2(), D0()) => D0()
    case (D2(), D1()) => D2()
    case (D2(), D2()) => D1()
  }

def and (rec_x1:Bool3, rec_x2:Bool3):Bool3 =
  (rec_x1, rec_x2) match {
    case (x,y) => plus ( times (times (x, x), times (y, y)),plus ( times (D2(), times (times (x, x), y)),plus ( times (D2(), times (times (y, y), x)),times (D2(), times (x, y)) )))
  }

def or (rec_x1:Bool3, rec_x2:Bool3):Bool3 =
  (rec_x1, rec_x2) match {
    case (x,y) => plus ( times (D2(), times (times (x, x), times (y, y))),plus ( times (times (x, x), y),plus ( times (times (y, y), x),plus ( times (x, y),plus (x, y) ))))
  }

def not (rec_x1:Bool3):Bool3 =
  rec_x1 match {
    case x => plus (times (D2(), x), D1())
  }

def eq (rec_x1:Bool3, rec_x2:Bool3):Bool3 =
  (rec_x1, rec_x2) match {
    case (x,y) if x == y => D1()
    case (x,y) if x != y => D0()
  }

def main (args:Array[String]):Unit = {
  println (eq (and (and (and (a(), b()), and (c(), d())), and (and (e(), f()), and (g(), h()))), not (or (or (or (not (a()), not (b())), or (not (c()), not (d()))),or (or (not (e()), not (f())), or (not (g()), not (h())))))))
  }

}
