sealed abstract class Disk
  case class D0() extends Disk
  case class D1() extends Disk
  case class D2() extends Disk
  case class D3() extends Disk
  case class D4() extends Disk
  case class D5() extends Disk
  case class D6() extends Disk
  case class D7() extends Disk
  case class D8() extends Disk
  case class D9() extends Disk
  case class D10() extends Disk
  case class D11() extends Disk
  case class D12() extends Disk
  case class D13() extends Disk
  case class D14() extends Disk
  case class D15() extends Disk
  case class D16() extends Disk
  case class D17() extends Disk
  case class D18() extends Disk
  case class D19() extends Disk
  case class D20() extends Disk

sealed abstract class Tower
  case class A() extends Tower
  case class B() extends Tower
  case class C() extends Tower

sealed abstract class Move
  case class Movedisk (rec_x1:Disk, rec_x2:Tower, rec_x3:Tower) extends Move

sealed abstract class List
  case class Nil() extends List
  case class Cons (rec_x1:Move, rec_x2:List) extends List

object hanoi12 {

def dec (rec_x1:Disk):Disk =
  rec_x1 match {
    case D20() => D19()
    case D19() => D18()
    case D18() => D17()
    case D17() => D16()
    case D16() => D15()
    case D15() => D14()
    case D14() => D13()
    case D13() => D12()
    case D12() => D11()
    case D11() => D10()
    case D10() => D9()
    case D9() => D8()
    case D8() => D7()
    case D7() => D6()
    case D6() => D5()
    case D5() => D4()
    case D4() => D3()
    case D3() => D2()
    case D2() => D1()
    case D1() => D0()
  }

def other (rec_x1:Tower, rec_x2:Tower):Tower =
  (rec_x1, rec_x2) match {
    case (A(), B()) => C()
    case (B(), A()) => C()
    case (A(), C()) => B()
    case (C(), A()) => B()
    case (B(), C()) => A()
    case (C(), B()) => A()
  }

def conc (rec_x1:List, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (Nil(), l) => l
    case (l, Nil()) => l
    case (Cons (h, t), l) => Cons (h, conc (t, l))
  }

def solve (rec_x1:Tower, rec_x2:Tower, rec_x3:Disk):List =
  (rec_x1, rec_x2, rec_x3) match {
    case (oRG, dEST, D0()) => Nil()
    case (oRG, dEST, d) if d != D0() => conc (solve (oRG, other (oRG, dEST), dec (d)), Cons (Movedisk (d, oRG, dEST), solve (other (oRG, dEST), dEST, dec (d))))
  }

def main (args:Array[String]):Unit = {
  println (solve (A(), B(), D12()))
  }

}
