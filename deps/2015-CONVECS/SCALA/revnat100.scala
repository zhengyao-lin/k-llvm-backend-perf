sealed abstract class List
  case class L (rec_x1:Nat, rec_x2:List) extends List
  case class Nil() extends List

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object revnat100 {

def d10():Nat = S (S (S (S (S (S (S (S (S (S (D0()))))))))))

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

def gen (rec_x1:Nat):List =
  rec_x1 match {
    case S (n) => L (S (n), gen (n))
    case D0() => L (D0(), Nil())
  }

def conc (rec_x1:List, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (L (e, l1), l2) => L (e, conc (l1, l2))
    case (Nil(), l2) => l2
  }

def rev (rec_x1:List):List =
  rec_x1 match {
    case L (e, l1) => conc (rev (l1), L (e, Nil()))
    case Nil() => Nil()
  }

def main (args:Array[String]):Unit = {
  println (rev (gen (times (d10(), d10()))))
  }

}
