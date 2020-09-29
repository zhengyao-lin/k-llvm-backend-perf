sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class Int
  case class Pos (rec_x1:Nat) extends Int
  case class Neg (rec_x1:Nat) extends Int

object tak36 {

def gte (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(), D0()) => True()
    case (S (x), D0()) => True()
    case (D0(), S (x)) => False()
    case (S (x), S (y)) => gte (x, y)
  }

def gte_Int (rec_x1:Int, rec_x2:Int):Bool =
  (rec_x1, rec_x2) match {
    case (Pos (x), Pos (y)) => gte (x,y)
    case (Neg (x), Neg (y)) => gte (y,x)
    case (Pos (x), Neg (y)) => True()
    case (Neg (x), Pos (y)) => False()
  }

def pred (rec_x1:Int):Int =
  rec_x1 match {
    case Pos (D0()) => Neg (D0())
    case Pos (S (x)) => Pos (x)
    case Neg (x) => Neg (S (x))
  }

def succ (rec_x1:Int):Int =
  rec_x1 match {
    case Neg (D0()) => Pos (D0())
    case Neg (S (x)) => Neg (x)
    case Pos (x) => Pos (S (x))
  }

def tak (rec_x1:Int, rec_x2:Int, rec_x3:Int):Int =
  (rec_x1, rec_x2, rec_x3) match {
    case (i, j, k) if gte_Int (j, i) == True() => k
    case (i, j, k) if gte_Int (j, i) == False() => tak (tak (pred (i), j, k), tak (pred (j), k, i), tak (pred (k), i, j))
  }

def main (args:Array[String]):Unit = {
  println (tak (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))))))))))))))))))))), Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))), Pos (S (S (S (S (S (S (S (S (S (S (S (S (D0())))))))))))))))
  }

}
