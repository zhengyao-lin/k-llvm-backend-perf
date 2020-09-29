sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class NatList
  case class Nil() extends NatList
  case class Cons (rec_x1:Nat, rec_x2:NatList) extends NatList

sealed abstract class ListPair
  case class Pair (rec_x1:NatList, rec_x2:NatList) extends ListPair

object mergesort100 {

def d10():Nat = S (S (S (S (S (S (S (S (S (S (D0()))))))))))

def lte (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(), S (n)) => True()
    case (S (n), D0()) => False()
    case (D0(), D0()) => True()
    case (S (n), S (m)) => lte (n, m)
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

def rev (rec_x1:Nat):NatList =
  rec_x1 match {
    case S (n) => Cons (S (n), rev (n))
    case D0() => Cons (D0(), Nil())
  }

def merge (rec_x1:NatList, rec_x2:NatList):NatList =
  (rec_x1, rec_x2) match {
    case (Nil(), l) => l
    case (l, Nil()) => l
    case (Cons (x, l1), Cons (y, l2)) if lte (x, y) == True() => Cons (x, merge (l1, Cons (y, l2)))
    case (Cons (x, l1), Cons (y, l2)) if lte (x, y) == False() => Cons (y, merge (Cons (x, l1), l2))
  }

def split (rec_x1:NatList):ListPair =
  rec_x1 match {
    case Cons (x, Cons (y, l)) => Pair (Cons (x, p1 (split (l))), Cons (y, p2 (split (l))))
    case Nil() => Pair (Nil(), Nil())
    case Cons (x, Nil()) => Pair (Cons (x, Nil()), Nil())
  }

def mergesort (rec_x1:NatList):NatList =
  rec_x1 match {
    case Nil() => Nil()
    case Cons (x, Nil()) => Cons (x, Nil())
    case Cons (x, Cons (y, l)) => merge (mergesort (Cons (x, p1 (split (l)))), mergesort (Cons (y, p2 (split (l)))))
  }

def p1 (rec_x1:ListPair):NatList =
  rec_x1 match {
    case Pair (l1, l2) => l1
  }

def p2 (rec_x1:ListPair):NatList =
  rec_x1 match {
    case Pair (l1, l2) => l2
  }

def main (args:Array[String]):Unit = {
  println (mergesort (rev (times (d10(), d10()))))
  }

}
