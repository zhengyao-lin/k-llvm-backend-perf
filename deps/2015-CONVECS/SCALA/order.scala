sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object order {

def g (rec_x1:Nat):Nat =
  rec_x1 match {
    case D0() => D0()
    case S (x) => x
  }

def f (rec_x1:Nat):Nat =
  rec_x1 match {
    case S (x) if x == D0() => D0()
    case S (x) if x != D0() => x
    case D0() => S (D0())
  }

def main (args:Array[String]):Unit = {
  println (f (g (D0())))
  }

}
