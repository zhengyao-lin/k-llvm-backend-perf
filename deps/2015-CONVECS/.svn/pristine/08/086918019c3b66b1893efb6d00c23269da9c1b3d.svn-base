sealed abstract class NSingleton
  case class Ncons() extends NSingleton

sealed abstract class USingleton
  case class Ucons (rec_x1:Nat) extends USingleton

sealed abstract class Nat
  case class D0() extends Nat
  case class Succ (rec_x1:Nat) extends Nat

object tricky {

def d1():Nat = Succ (D0())

def d2():Nat =
  0 match {
    case 0 if D0() == D0() => D0()
  }

def d3():Nat =
  0 match {
    case 0 if D0() != D0() => D0()
    case 0 if Succ (D0()) == D0() => D0()
    case 0 if Succ (D0()) != D0() => Succ (D0())
  }

def f (rec_x1:Nat):Nat =
  rec_x1 match {
    case n if n != D0() && n != Succ (D0()) => n
  }

def main (args:Array[String]):Unit = {
  println (Ncons())
  println (Ucons (D0()))
  println (d1())
  println (d2())
  println (d3())
  }

}
