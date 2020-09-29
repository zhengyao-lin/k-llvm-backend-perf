sealed abstract class S
  case class D0() extends S
  case class G (rec_x1:S) extends S

object confluence {

def f (rec_x1:S):S =
  rec_x1 match {
    case G (x) if x == D0() => x
    case G (G (x)) => f (G (x))
  }

def main (args:Array[String]):Unit = {
  println (f (G (G (D0()))))
  }

}
