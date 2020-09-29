sealed abstract class Nat
  case class D0() extends Nat
  case class Succ (rec_x1:Nat) extends Nat

object empty {

def main (args:Array[String]):Unit = {
  println (D0())
  }

}
