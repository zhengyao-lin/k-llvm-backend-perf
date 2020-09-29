sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object factorial8 {

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), n) => n
    case (S (n), m) => S (plus (n, m))
  }

def times (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), n) => D0()
    case (S (n), m) => plus (m, times (n, m))
  }

def fact (rec_x1:Nat):Nat =
  rec_x1 match {
    case D0() => S (D0())
    case S (n) => times (S (n), fact (n))
  }

def main (args:Array[String]):Unit = {
  println (fact (S (S (S (S (S (S (S (S (D0()))))))))))
  }

}
