sealed abstract class List
  case class L (rec_x1:Elt, rec_x2:List) extends List
  case class Nil() extends List

sealed abstract class Elt
  case class A() extends Elt
  case class B() extends Elt
  case class C() extends Elt
  case class D() extends Elt
  case class E() extends Elt

object revelt {

def conc (rec_x1:List, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (L (e0, l1), l2) => L (e0, conc (l1, l2))
    case (Nil(), l2) => l2
  }

def dup (rec_x1:List):List =
  rec_x1 match {
    case l1 => conc (l1, l1)
  }

def rev (rec_x1:List):List =
  rec_x1 match {
    case L (e0, l1) => conc (rev (l1), L (e0, Nil()))
    case Nil() => Nil()
  }

def main (args:Array[String]):Unit = {
  println (rev (dup (L (A(), L (B(), L (C(), L (D(), L (E(), Nil()))))))))
  }

}
