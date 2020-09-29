sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class NatList
  case class Nil() extends NatList
  case class Cons (rec_x1:Nat, rec_x2:NatList) extends NatList

object bubblesort100 {

def d10():Nat = S (S (S (S (S (S (S (S (S (S (D0()))))))))))

def lt (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(),D0()) => False()
    case (D0(), S (n)) => True()
    case (S (n), D0()) => False()
    case (S (n), S (m)) => lt (n, m)
  }

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

def rev (rec_x1:Nat):NatList =
  rec_x1 match {
    case S (n) => bubsort (S (n), rev (n))
    case D0() => Cons (D0(), Nil())
  }

def bubsort (rec_x1:Nat, rec_x2:NatList):NatList =
  (rec_x1, rec_x2) match {
    case (n, Nil()) => Cons (n, Nil())
    case (n, Cons (m, l)) if lt (m, n) == True() => Cons (m, bubsort (n, l))
    case (n, Cons (m, l)) if lt (m, n) == False() => Cons (n, bubsort (m, l))
  }

def main (args:Array[String]):Unit = {
  println (rev (times (d10(), d10())))
  }

}
