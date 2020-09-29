sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

object check2 {

def notBool (rec_x1:Bool):Bool =
  rec_x1 match {
    case True() => False()
    case False() => True()
  }

def andBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, True()) => p
    case (p, False()) => False()
  }

def orBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, True()) => True()
    case (p, False()) => p
  }

def xorBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, q) => orBool (andBool (p, notBool (q)), andBool (q, notBool (p)))
  }

def impliesBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, q) => orBool (q, notBool (p))
  }

def iffBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, q) => andBool (impliesBool (p, q), impliesBool (q, p))
  }

def eqBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, q) => iffBool (p, q)
  }

def neBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (p, q) => xorBool (p, q)
  }

def main (args:Array[String]):Unit = {
  println (neBool (False(), True()))
  }

}
