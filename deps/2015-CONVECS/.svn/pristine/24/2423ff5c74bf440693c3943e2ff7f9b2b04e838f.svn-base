sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class NatList
  case class Nil() extends NatList
  case class Cons (rec_x1:Nat, rec_x2:NatList) extends NatList

sealed abstract class NatListPair
  case class Pair (rec_x1:NatList, rec_x2:NatList) extends NatListPair

object quicksort1000 {

def d10():Nat = S (S (S (S (S (S (S (S (S (S (D0()))))))))))

def not (rec_x1:Bool):Bool =
  rec_x1 match {
    case True() => False()
    case False() => True()
  }

def st (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(), S (n)) => True()
    case (S (n), D0()) => False()
    case (D0(), D0()) => False()
    case (S (n), S (m)) => st (n, m)
  }

def get (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (n, m) => not (st (n, m))
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

def split (rec_x1:Nat, rec_x2:NatList):NatListPair =
  (rec_x1, rec_x2) match {
    case (n, Cons (m, l)) if st (n, m) == True() => Pair (p1 (split (n, l)), Cons (m, p2 (split (n, l))))
    case (n, Cons (m, l)) if get (n, m) == True() => Pair (Cons (m, p1 (split (n, l))), p2 (split (n, l)))
    case (n, Nil()) => Pair (Nil(), Nil())
  }

def append (rec_x1:NatList, rec_x2:NatList):NatList =
  (rec_x1, rec_x2) match {
    case (Cons (n, l), lT) => Cons (n, append (l, lT))
    case (Nil(), l) => l
  }

def qsort (rec_x1:NatList):NatList =
  rec_x1 match {
    case Nil() => Nil()
    case Cons (n, l) => append (qsort (p1 (split (n, l))), Cons (n, qsort (p2 (split (n, l)))))
  }

def p1 (rec_x1:NatListPair):NatList =
  rec_x1 match {
    case Pair (l1, l2) => l1
  }

def p2 (rec_x1:NatListPair):NatList =
  rec_x1 match {
    case Pair (l1, l2) => l2
  }

def main (args:Array[String]):Unit = {
  println (qsort (rev (times (d10(), times (d10(), d10())))))
  }

}
