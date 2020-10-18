sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

object langton6 {

def d1():Nat = S (D0())

def d2():Nat = S (S (D0()))

def d3():Nat = S (S (S (D0())))

def d4():Nat = S (S (S (S (D0()))))

def d5():Nat = S (S (S (S (S (D0())))))

def d6():Nat = S (S (S (S (S (S (D0()))))))

def d7():Nat = S (S (S (S (S (S (S (D0())))))))

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, D0()) => x
    case (S (x), y) => S (plus (x,y))
    case (x, S (y)) => S (plus (x,y))
  }

def langton (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat, rec_x4:Nat, rec_x5:Nat):Nat =
  (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5) match {
    case (D0(),S (D0()),D0(),D0(),D0()) => d2()
    case (D0(),S (S (S (S (S (S (D0())))))),D0(),D0(),D0()) => d3()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),D0(),D0(),D0()) => d1()
    case (D0(),x,D0(),D0(),D0()) => D0()
    case (D0(),S (D0()),D0(),D0(),S (D0())) => d2()
    case (D0(),S (S (D0())),D0(),D0(),S (D0())) => d2()
    case (D0(),S (S (S (D0()))),D0(),D0(),S (D0())) => d2()
    case (D0(),S (D0()),D0(),D0(),S (S (D0()))) => d2()
    case (D0(),S (S (S (S (S (S (D0())))))),D0(),D0(),S (S (D0()))) => d2()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),D0(),D0(),S (S (D0()))) => d2()
    case (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (D0())))))) => d5()
    case (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (S (D0()))))))) => d2()
    case (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (S (S (D0())))))))) => d2()
    case (D0(),S (S (D0())),D0(),S (D0()),D0()) => d2()
    case (D0(),S (S (D0())),D0(),S (S (D0())),S (D0())) => d5()
    case (D0(),S (S (D0())),D0(),S (S (D0())),S (S (S (D0())))) => d2()
    case (D0(),S (S (D0())),D0(),S (S (S (S (S (D0()))))),S (S (D0()))) => d2()
    case (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (D0())))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (D0()))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (D0())))))) => d5()
    case (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (S (D0()))))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d1()
    case (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (D0()))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (D0())))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (S (D0()))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (S (S (S (S (D0())))))))) => d1()
    case (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (S (D0())))))),S (S (D0()))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0()))) => d1()
    case (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0()))) => d5()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (D0())))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (S (D0()))))))) => d1()
    case (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (S (S (D0())))))))) => d1()
    case (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),D0(),S (S (S (S (S (D0()))))),S (S (D0()))) => d1()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),D0(),D0()) => d7()
    case (D0(),S (S (S (S (D0())))),S (D0()),D0(),S (S (D0()))) => d4()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),D0(),S (S (D0()))) => d7()
    case (D0(),S (S (S (S (D0())))),S (D0()),S (D0()),S (S (D0()))) => d4()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0()),S (S (D0()))) => d7()
    case (D0(),S (S (D0())),S (D0()),S (S (D0())),D0()) => d6()
    case (D0(),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) => d4()
    case (D0(),S (S (S (S (S (S (D0())))))),S (D0()),S (S (D0())),S (S (D0()))) => d3()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) => d7()
    case (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (D0())))) => d7()
    case (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (D0()))))) => d4()
    case (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) => d6()
    case (D0(),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) => d4()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) => d7()
    case (D0(),S (D0()),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => D0()
    case (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d7()
    case (D0(),S (S (D0())),S (D0()),S (S (S (S (S (D0()))))),S (S (S (S (D0()))))) => d7()
    case (S (D0()),S (S (S (S (D0())))),S (D0()),S (D0()),S (S (D0()))) => d4()
    case (S (D0()),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0()),S (S (D0()))) => d7()
    case (S (D0()),S (S (D0())),S (D0()),S (D0()),S (S (S (S (S (D0())))))) => d2()
    case (S (D0()),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) => d4()
    case (S (D0()),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) => d7()
    case (S (D0()),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (D0()))))) => d4()
    case (S (D0()),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d7()
    case (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) => d4()
    case (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) => d7()
    case (S (S (D0())),S (S (S (D0()))),S (D0()),S (S (D0())),S (S (S (S (D0()))))) => d4()
    case (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (S (S (S (D0())))))) => d7()
    case (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (S (D0()))),S (S (D0()))) => d4()
    case (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (S (D0()))),S (S (D0()))) => d7()
    case (S (S (D0())),S (S (S (S (S (D0()))))),S (D0()),S (S (S (S (D0())))),S (S (D0()))) => d5()
    case (S (S (D0())),S (S (S (S (S (S (D0())))))),S (D0()),S (S (S (S (D0())))),S (S (D0()))) => d7()
    case (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (S (S (S (D0()))))),S (S (D0()))) => d5()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),D0(),D0()) => d1()
    case (D0(),S (S (S (S (S (D0()))))),S (S (D0())),D0(),S (S (D0()))) => D0()
    case (D0(),S (S (D0())),S (S (D0())),D0(),S (S (S (D0())))) => d6()
    case (D0(),S (S (D0())),S (S (D0())),D0(),S (S (S (S (D0()))))) => d3()
    case (D0(),S (D0()),S (S (D0())),D0(),S (S (S (S (S (D0())))))) => d7()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),D0(),S (S (S (S (S (D0())))))) => d5()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0())),D0()) => d3()
    case (D0(),S (S (D0())),S (S (D0())),S (S (D0())),S (S (S (D0())))) => d1()
    case (D0(),S (S (D0())),S (S (D0())),S (S (D0())),S (S (S (S (S (D0())))))) => D0()
    case (D0(),S (D0()),S (S (D0())),S (S (S (D0()))),S (S (D0()))) => d6()
    case (D0(),S (S (D0())),S (S (D0())),S (S (S (D0()))),S (S (D0()))) => d6()
    case (D0(),S (S (D0())),S (S (D0())),S (S (S (S (S (D0()))))),S (S (S (S (S (D0())))))) => d1()
    case (D0(),S (S (D0())),S (S (D0())),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0())))))))) => d5()
    case (S (D0()),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0()),S (S (D0()))) => d1()
    case (D0(),S (S (D0())),S (S (S (D0()))),D0(),D0()) => d2()
    case (D0(),S (S (S (S (D0())))),S (S (S (D0()))),D0(),D0()) => d1()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (D0()))),D0(),D0()) => d6()
    case (D0(),S (S (D0())),S (S (S (D0()))),D0(),S (S (S (S (D0()))))) => d1()
    case (D0(),S (S (D0())),S (S (S (D0()))),D0(),S (S (S (S (S (S (D0()))))))) => d2()
    case (D0(),S (S (D0())),S (S (S (D0()))),S (D0()),D0()) => d1()
    case (D0(),S (S (D0())),S (S (S (D0()))),S (D0()),S (S (D0()))) => D0()
    case (D0(),S (D0()),S (S (S (D0()))),S (S (D0())),S (S (S (S (S (D0())))))) => d1()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (D0()),S (D0())) => D0()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0()))) => D0()
    case (D0(),S (S (S (S (S (D0()))))),S (S (S (S (D0())))),S (D0()),S (S (D0()))) => D0()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (D0())) => D0()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (D0()))) => d1()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (S (D0())))) => d6()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (S (S (S (D0())))))) => D0()
    case (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (S (D0()))),S (S (D0()))) => d1()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),D0(),D0()) => d2()
    case (D0(),S (S (S (D0()))),S (S (S (S (S (D0()))))),D0(),S (S (D0()))) => d2()
    case (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (D0()))))),D0(),S (S (D0()))) => d2()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (D0())))))) => D0()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),D0()) => d2()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) => d2()
    case (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) => d2()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) => D0()
    case (D0(),S (S (S (S (D0())))),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) => d4()
    case (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d2()
    case (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) => d2()
    case (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) => D0()
    case (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (D0()))))) => d2()
    case (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => d2()
    case (D0(),S (D0()),S (S (S (S (S (S (D0())))))),D0(),D0()) => d1()
    case (D0(),S (S (D0())),S (S (S (S (S (S (D0())))))),D0(),D0()) => d1()
    case (D0(),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) => D0()
    case (S (D0()),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) => d5()
    case (S (D0()),S (S (S (D0()))),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) => d1()
    case (S (D0()),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (S (D0()))) => d5()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0())) => D0()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0()))) => D0()
    case (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0()))) => D0()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (D0())) => D0()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0()))) => d1()
    case (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0()))) => d1()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (D0())))) => d1()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (S (S (D0())))))) => d5()
    case (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) => D0()
    case (v, w, x, y, z) => x
  }

def next (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat, rec_x4:Nat, rec_x5:Nat):Nat =
  (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5) match {
    case (v,w,y,z,S (x)) => plus (langton (v,w,y,z,S (x)),next (v,w,y,z,x))
    case (v,w,y,S (x),D0()) => plus (langton (v,w,y,S (x),D0()),next (v,w,y,x,d7()))
    case (v,w,S (x),D0(),D0()) => plus (langton (v,w,S (x),D0(),D0()),next (v,w,x,d7(),d7()))
    case (y,S (x),D0(),D0(),D0()) => plus (langton (y,S (x),D0(),D0(),D0()),next (y,x,d7(),d7(),d7()))
    case (S (x),D0(),D0(),D0(),D0()) => plus (langton (S (x),D0(),D0(),D0(),D0()),next (x,d7(),d7(),d7(),d7()))
    case (D0(),D0(),D0(),D0(),D0()) => langton (D0(),D0(),D0(),D0(),D0())
  }

def main (args:Array[String]):Unit = {
  println (next (d6(),d6(),d6(),d6(),d6()))
  }

}