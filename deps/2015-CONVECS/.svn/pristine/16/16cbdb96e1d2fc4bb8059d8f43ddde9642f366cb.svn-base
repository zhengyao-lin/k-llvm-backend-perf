sealed abstract class S
  case class Nullary_constructor() extends S
  case class Unary_constructor (rec_x1:S) extends S
  case class Nary_constructor (rec_x1:S, rec_x2:S, rec_x3:S) extends S

object calls {

def nullary_function():S = Nullary_constructor()

def unary_function (rec_x1:S):S =
  rec_x1 match {
    case x => Unary_constructor (x)
  }

def nary_function (rec_x1:S, rec_x2:S, rec_x3:S):S =
  (rec_x1, rec_x2, rec_x3) match {
    case (x, y, z) => Nary_constructor (x, y, z)
  }

def a():S = Nullary_constructor()

def b():S = Unary_constructor (Nullary_constructor())

def c():S = Nary_constructor (Nullary_constructor(), Nullary_constructor(), Nullary_constructor())

def d():S = nullary_function()

def e():S = unary_function (nullary_function())

def f():S = nary_function (nullary_function(), nullary_function(), nullary_function())

def main (args:Array[String]):Unit = {
  println (Nullary_constructor())
  println (Unary_constructor (Nullary_constructor()))
  println (Nary_constructor (Nullary_constructor(), Nullary_constructor(), Nullary_constructor()))
  println (nullary_function())
  println (unary_function (nullary_function()))
  println (nary_function (nullary_function(), nullary_function(), nullary_function()))
  }

}
