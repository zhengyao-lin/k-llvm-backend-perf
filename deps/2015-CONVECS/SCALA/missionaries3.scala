sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Int
  case class D0() extends Int
  case class S (rec_x1:Int) extends Int
  case class P (rec_x1:Int) extends Int

sealed abstract class Bank
  case class West() extends Bank
  case class East() extends Bank

sealed abstract class Text
  case class Missionary_rows_east() extends Text
  case class Two_missionaries_row_east() extends Text
  case class Missionary_and_cannibal_row_east() extends Text
  case class Cannibal_rows_east() extends Text
  case class Two_cannibals_row_east() extends Text
  case class Missionary_rows_west() extends Text
  case class Two_missionaries_row_west() extends Text
  case class Missionary_and_cannibal_row_west() extends Text
  case class Cannibal_rows_west() extends Text
  case class Two_cannibals_row_west() extends Text

sealed abstract class Position
  case class Pos (rec_x1:Bank, rec_x2:Int, rec_x3:Int, rec_x4:Int, rec_x5:Int) extends Position

sealed abstract class Move
  case class Mov (rec_x1:Text, rec_x2:Int, rec_x3:Int, rec_x4:Int, rec_x5:Int, rec_x6:Bank) extends Move

sealed abstract class MoveList
  case class Nil_ml() extends MoveList
  case class Cm (rec_x1:Move, rec_x2:MoveList) extends MoveList

sealed abstract class PosList
  case class Nil_pl() extends PosList
  case class Cp (rec_x1:Position, rec_x2:PosList) extends PosList

sealed abstract class TextList
  case class Nil_tl() extends TextList
  case class Fail() extends TextList
  case class Ct (rec_x1:Text, rec_x2:TextList) extends TextList

object missionaries3 {

def and (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (l, True()) => l
    case (l, False()) => False()
  }

def or (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (l, True()) => True()
    case (l, False()) => l
  }

def plus (rec_x1:Int, rec_x2:Int):Int =
  (rec_x1, rec_x2) match {
    case (x, D0()) => x
    case (D0(), y) => y
    case (S (x), S (y)) => S (S (plus (x, y)))
    case (P (x), P (y)) => P (P (plus (x, y)))
    case (S (x), P (y)) => plus (x, y)
    case (P (x), S (y)) => plus (x, y)
  }

def gte (rec_x1:Int, rec_x2:Int):Bool =
  (rec_x1, rec_x2) match {
    case (D0(), D0()) => True()
    case (D0(), S (y)) => False()
    case (D0(), P (y)) => True()
    case (S (x), D0()) => True()
    case (S (x), S (y)) => gte (x, y)
    case (S (x), P (y)) => True()
    case (P (x), D0()) => False()
    case (P (x), S (y)) => False()
    case (P (x), P (y)) => gte (x, y)
  }

def equal (rec_x1:Int, rec_x2:Int):Bool =
  (rec_x1, rec_x2) match {
    case (x, y) => and (gte (x, y), gte (y, x))
  }

def d1():Int = S (D0())

def d2():Int = S (S (D0()))

def d3():Int = S (S (S (D0())))

def m1():Int = P (D0())

def m2():Int = P (P (D0()))

def moves():MoveList = Cm (Mov (Missionary_rows_east(), m1(), D0(), d1(), D0(), East()),Cm (Mov (Two_missionaries_row_east(), m2(), D0(), d2(), D0(), East()),Cm (Mov (Missionary_and_cannibal_row_east(), m1(), m1(), d1(), d1(), East()),Cm (Mov (Cannibal_rows_east(), D0(), m1(), D0(), d1(), East()),Cm (Mov (Two_cannibals_row_east(), D0(), m2(), D0(), d2(), East()),Cm (Mov (Missionary_rows_west(), d1(), D0(), m1(), D0(), West()),Cm (Mov (Two_missionaries_row_west(), d2(), D0(), m2(), D0(), West()),Cm (Mov (Missionary_and_cannibal_row_west(), d1(), d1(), m1(), m1(), West()),Cm (Mov (Cannibal_rows_west(), D0(), d1(), D0(), m1(), West()),Cm (Mov (Two_cannibals_row_west(), D0(), d2(), D0(), m2(), West()), Nil_ml()))))))))))

def member (rec_x1:Position, rec_x2:PosList):Bool =
  (rec_x1, rec_x2) match {
    case (nP, Nil_pl()) => False()
    case (nP, Cp (posi, prev)) if nP == posi => True()
    case (nP, Cp (posi, prev)) if nP != posi => member (nP, prev)
  }

def evalct (rec_x1:Text, rec_x2:TextList):TextList =
  (rec_x1, rec_x2) match {
    case (t, Fail()) => Fail()
    case (t, tL) if tL != Fail() => Ct (t,tL)
  }

def gte_tl (rec_x1:TextList, rec_x2:TextList):Bool =
  (rec_x1, rec_x2) match {
    case (tL, Nil_tl()) => True()
    case (Nil_tl(), Ct (t, tL)) => False()
    case (Ct (t, tL), Ct (t2, tL2)) => gte_tl (tL, tL2)
  }

def best (rec_x1:TextList, rec_x2:TextList):TextList =
  (rec_x1, rec_x2) match {
    case (Fail(), tL) => tL
    case (tL, Fail()) => tL
    case (tL, tL2) if gte_tl (tL, tL2) == True() && tL != Fail() && tL2 != Fail() => tL2
    case (tL, tL2) if gte_tl (tL, tL2) == False() && tL != Fail() && tL2 != Fail() => tL
  }

def solve (rec_x1:Position, rec_x2:Position, rec_x3:PosList):TextList =
  (rec_x1, rec_x2, rec_x3) match {
    case (posi, xfinal, prev) if posi == xfinal => Nil_tl()
    case (posi, xfinal, prev) if posi != xfinal => xtry (moves(), posi, xfinal, prev)
  }

def xtry (rec_x1:MoveList, rec_x2:Position, rec_x3:Position, rec_x4:PosList):TextList =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (Nil_ml(), posi, xfinal, prev) => Fail()
    case (Cm (m, mL), posi, xfinal, prev) => best (apply (m, posi, xfinal, prev), xtry (mL, posi, xfinal, prev))
  }

def apply (rec_x1:Move, rec_x2:Position, rec_x3:Position, rec_x4:PosList):TextList =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (Mov (t, dMW, dCW, dME, dCE, d), Pos (b, mW, cW, mE, cE), xfinal, prev) if d != b => check (t, Pos (d, plus (mW, dMW), plus (cW, dCW), plus (mE, dME), plus (cE, dCE)), xfinal, prev)
    case (Mov (t, dMW, dCW, dME, dCE, d), Pos (b, mW, cW, mE, cE), xfinal, prev) if d == b => Fail()
  }

def check (rec_x1:Text, rec_x2:Position, rec_x3:Position, rec_x4:PosList):TextList =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (t, nP, xfinal, prev) if member (nP, prev) == False() && valid (nP) == True() => evalct (t, solve (nP, xfinal, Cp (nP, prev)))
    case (t, nP, xfinal, prev) if member (nP, prev) == True() => Fail()
    case (t, nP, xfinal, prev) if valid (nP) == False() => Fail()
  }

def valid (rec_x1:Position):Bool =
  rec_x1 match {
    case Pos (b, mW, cW, mE, cE) => and (gte (mW, D0()), and (gte (cW, D0()), and (gte (mE, D0()), and (gte (cE, D0()), and (or (equal (mW, D0()), gte (mW, cW)), or (equal (mE, D0()), gte (mE, cE)))))))
  }

def main (args:Array[String]):Unit = {
  println (solve (Pos (West(), d3(), d3(), D0(), D0()), Pos (East(), D0(), D0(), d3(), d3()), Nil_pl()))
  }

}
