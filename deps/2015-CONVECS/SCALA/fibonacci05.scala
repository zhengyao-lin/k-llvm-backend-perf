sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object fibonacci05 {

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), n) => n
    case (S (n), m) => S (plus (n, m))
  }

def fibb (rec_x1:Nat):Nat =
  rec_x1 match {
    case D0() => D0()
    case S (D0()) => S (D0())
    case S (S (n)) => plus (fibb (S (n)), fibb (n))
  }

def main (args:Array[String]):Unit = {
  println (fibb (S (S (S (S (S (D0())))))))
  println (fibb (fibb (S (S (S (S (S (D0()))))))))
  println (fibb (fibb (fibb (S (S (S (S (S (D0())))))))))
  println (fibb (fibb (fibb (fibb (S (S (S (S (S (D0()))))))))))
  println (fibb (fibb (fibb (fibb (fibb (S (S (S (S (S (D0())))))))))))
  }

}
