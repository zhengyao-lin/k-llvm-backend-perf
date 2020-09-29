sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Strg
  case class A() extends Strg
  case class B() extends Strg
  case class C (rec_x1:Strg, rec_x2:Strg) extends Strg

sealed abstract class List
  case class Nil() extends List
  case class L (rec_x1:Strg, rec_x2:List) extends List

object merge {

def gte (rec_x1:Strg, rec_x2:Strg):Bool =
  (rec_x1, rec_x2) match {
    case (B(), A()) => True()
    case (A(), B()) => False()
    case (A(), A()) => True()
    case (B(), B()) => True()
    case (C (e, s), e2) => gte (e, e2)
    case (e, C (e2, s2)) if e == e2 => False()
    case (e, C (e2, s2)) if e != e2 => gte (e, e2)
  }

def merge (rec_x1:List, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (Nil(), l1) => l1
    case (l1, Nil()) => l1
    case (L (s, l1), L (s2, l2)) if gte (s, s2) == True() => L (s2, merge (L (s, l1), l2))
    case (L (s, l1), L (s2, l2)) if gte (s, s2) == False() => L (s, merge (l1, L (s2, l2)))
  }

def odd (rec_x1:List):List =
  rec_x1 match {
    case Nil() => Nil()
    case L (s, Nil()) => L (s, Nil())
    case L (s, L (s2, l1)) => L (s, odd (l1))
  }

def even (rec_x1:List):List =
  rec_x1 match {
    case Nil() => Nil()
    case L (s, Nil()) => Nil()
    case L (s, L (s2, l1)) => L (s2, even (l1))
  }

def sort (rec_x1:List):List =
  rec_x1 match {
    case Nil() => Nil()
    case L (s, Nil()) => L (s, Nil())
    case L (s, L (s2, l1)) => merge (sort (odd (L (s, L (s2, l1)))), sort (even (L (s, L (s2, l1)))))
  }

def main (args:Array[String]):Unit = {
  println (sort (L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))), L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))), L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),Nil()))))))))))))))))))))))))))))))))))))))))))))))))))))
  }

}
