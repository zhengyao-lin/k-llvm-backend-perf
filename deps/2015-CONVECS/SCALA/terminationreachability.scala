sealed abstract class S
  case class C() extends S

object terminationreachability {

def a() :S =
0 match {
   case 0 if a() == b() => C()
   case 0 => b()
}

def b() :S =
0 match {
   case 0 => C()
}

def main (args:Array[String]):Unit = {
  println (a())
}

}
