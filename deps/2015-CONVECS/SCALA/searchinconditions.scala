sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

object searchinconditions {

def a():Bool = True()

def not (rec_x1:Bool):Bool =
  rec_x1 match {
    case x if x == False() => True()
    case x if x == True() => False()
  }

def main (args:Array[String]):Unit = {
  println (not (a()))
  }

}
