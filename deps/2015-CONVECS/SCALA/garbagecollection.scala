sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat
  case class P() extends Nat
  case class N() extends Nat

object garbagecollection {

def d1():Nat = S (D0())

def c (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), y) => y
    case (S (x), y) => S (c (x,y))
  }

def f (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat, rec_x4:Nat, rec_x5:Nat):Nat =
  (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5) match {
    case (x, y, S (z), t, u) => f (x, y, z, c (t, t), u)
    case (x, S (y), D0(), t, u) => f (x, y, P(), t, t)
    case (S (x), D0(), D0(), t, u) => f (x, N(), P(), d1(), D0())
    case (D0(), D0(), D0(), t, u) => t
    case (x, S (y), P(), t, u) => f (x, y, P(), t, S (u))
    case (x, D0(), P(), t, u) => f (x, N(), P(), S (t), u)
    case (S (x), N(), P(), t, u) => f (x, N(), P(), t, u)
    case (D0(), N(), P(), t, u) => u
  }

def main (args:Array[String]):Unit = {
  println (f (S (S (S (S (S (S (D0())))))), S (S (S (S (S (D0()))))), S (S (D0())), D0(), d1()))
  println (f (S (S (S (S (D0())))), S (S (S (D0()))), S (S (S (S (S (D0()))))), D0(), d1()))
  }

}
