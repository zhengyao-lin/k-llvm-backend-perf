sealed abstract class Prop
  case class Tt() extends Prop
  case class Ff() extends Prop

object tautologyhard {

def and (rec_x1:Prop, rec_x2:Prop):Prop =
  (rec_x1, rec_x2) match {
    case (p, Tt()) => p
    case (p, Ff()) => Ff()
  }

def xor (rec_x1:Prop, rec_x2:Prop):Prop =
  (rec_x1, rec_x2) match {
    case (p, Ff()) => p
    case (Ff(), Tt()) => Tt()
    case (Tt(), Tt()) => Ff()
  }

def not (rec_x1:Prop):Prop =
  rec_x1 match {
    case p => xor (p, Tt())
  }

def or (rec_x1:Prop, rec_x2:Prop):Prop =
  (rec_x1, rec_x2) match {
    case (p, q) => xor (and (p, q), xor (p, q))
  }

def implies (rec_x1:Prop, rec_x2:Prop):Prop =
  (rec_x1, rec_x2) match {
    case (p, q) => not (xor (p, and (p, q)))
  }

def iff (rec_x1:Prop, rec_x2:Prop):Prop =
  (rec_x1, rec_x2) match {
    case (p, q) => not (xor (p, q))
  }

def a():Prop = Ff()

def b():Prop = Tt()

def c():Prop = Ff()

def d():Prop = Tt()

def e():Prop = Ff()

def a1():Prop = Tt()

def a2():Prop = Ff()

def a3():Prop = Tt()

def a4():Prop = Ff()

def a5():Prop = Tt()

def a6():Prop = Ff()

def a7():Prop = Tt()

def a8():Prop = Ff()

def a9():Prop = Tt()

def a10():Prop = Ff()

def a11():Prop = Tt()

def a12():Prop = Ff()

def a13():Prop = Tt()

def a14():Prop = Ff()

def a15():Prop = Tt()

def a16():Prop = Ff()

def a17():Prop = Tt()

def a18():Prop = Ff()

def main (args:Array[String]):Unit = {
  println (implies (and (iff (iff (or (a1(), a2()), or (not (a3()), iff (xor (a4(), a5()),not (not (not (a6())))))), not (and (and (a7(), a8()), not (xor (xor (or (a9(), and (a10(),a11())), a2()), and (and (a11(), xor (a2(), iff (a5(), a5()))), xor (xor (a7(), a7()),iff (a9(), a4())))))))), implies (iff (iff (or (a1(), a2()), or (not (a3()),iff (xor (a4(), a5()), not (not (not (a6())))))), not (and (and (a7(), a8()),not (xor (xor (or (a9(), and (a10(), a11())), a2()), and (and (a11(), xor (a2(), iff (a5(),a5()))), xor (xor (a7(), a7()), iff (a9(), a4())))))))), not (and (implies (and (a1(),a2()), not (xor (or (or (xor (implies (and (a3(), a4()), implies (a5(), a6())), or (a7(),a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(), a2()), a7())), iff (or (a4(), a9()),xor (not (a6()), a6()))))), not (iff (not (a11()), not (a9()))))))),not (and (implies (and (a1(), a2()), not (xor (or (or (xor (implies (and (a3(), a4()),implies (a5(), a6())), or (a7(), a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(),a2()), a7())), iff (or (a4(), a9()), xor (not (a6()), a6()))))), not (iff (not (a11()),not (a9())))))))
  println (implies (and (not (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (not (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))), iff (not (not (a2())),implies (or (a9(), a6()), or (a10(), a5())))), not (or (a9(), implies (not (a8()), or (a4(),a9()))))))), implies (not (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (not (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a9()))),iff (not (not (a2())), implies (or (a9(), a6()), or (a10(), a5())))), not (or (a9(),implies (not (a8()), or (a4(), a9()))))))), not (implies (implies (and (or (a1(),xor (xor (a2(), a3()), not (a4()))), not (xor (a5(), and (a6(), a7())))),implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(), a1())), a2()))),or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())), not (not (not (a6())))))))),not (implies (implies (and (or (a1(), xor (xor (a2(), a3()), not (a4()))), not (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a4(), or (a4(),a1())), a2()))), or (or (xor (or (a4(), a7()), a2()), and (a8(), a1())),not (not (not (a6()))))))))
  println (implies (and (not (and (xor (a1(), xor (or (a2(), a3()), a4())), xor (iff (xor (not (a5()),or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(), a11()))), implies (or (a4(),and (a3(), iff (a1(), a2()))), not (not (a4())))), xor (implies (implies (a6(), a1()),not (a1())), not (a9()))))), implies (not (and (xor (a1(), xor (or (a2(), a3()), a4())),xor (iff (xor (not (a5()), or (xor (iff (a6(), a7()), iff (a8(), a9())), and (a10(),a11()))), implies (or (a4(), and (a3(), iff (a1(), a2()))), not (not (a4())))),xor (implies (implies (a6(), a1()), not (a1())), not (a9()))))),not (implies (implies (and (or (a1(), xor (xor (a2(), a3()), not (a4()))), not (xor (a5(),and (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (and (a11(),implies (a2(), a8())), a8()))), not (or (implies (or (a5(), or (a8(), and (a8(), a9()))),not (a2())), not (a7()))))))), not (implies (implies (and (or (a1(), xor (xor (a2(),a3()), not (a4()))), not (xor (a5(), and (a6(), a7())))), implies (xor (implies (a8(),a9()), a10()), xor (and (a11(), implies (a2(), a8())), a8()))), not (or (implies (or (a5(),or (a8(), and (a8(), a9()))), not (a2())), not (a7())))))))
  }

}
