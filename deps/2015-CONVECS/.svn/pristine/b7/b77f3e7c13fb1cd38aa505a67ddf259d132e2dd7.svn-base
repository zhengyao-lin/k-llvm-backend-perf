sealed abstract class N
  case class D0() extends N
  case class S (rec_x1:N) extends N
  case class G (rec_x1:N) extends N

object soundnessofparallelengines {

def f (rec_x1:N):N =
  rec_x1 match {
    case G (D0()) => D0()
    case G (S (x)) => f (G (x))
  }

def main (args:Array[String]):Unit = {
  println (f (G (S (D0()))))
  }

}
