sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object oddeven {

def odd (rec_x1:Nat):Bool =
  rec_x1 match {
    case D0() => False()
    case S (n) if even (n) == True() => True()
    case S (n) if even (n) == False() => False()
  }

def even (rec_x1:Nat):Bool =
  rec_x1 match {
    case D0() => True()
    case S (n) if odd (n) == True() => True()
    case S (n) if odd (n) == False() => False()
  }

def main (args:Array[String]):Unit = {
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0())))))))))))))))))
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))))))
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0())))))))))))))))))))))))))))
  }

}
