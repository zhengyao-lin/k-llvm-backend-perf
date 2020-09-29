sealed abstract class Boolean
  case class True() extends Boolean
  case class False() extends Boolean

sealed abstract class Nat
  case class Zero() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class SNat
  case class Exz() extends SNat
  case class Exone() extends SNat
  case class Exs (rec_x1:SNat) extends SNat
  case class Explus (rec_x1:SNat, rec_x2:SNat) extends SNat
  case class Exmult (rec_x1:SNat, rec_x2:SNat) extends SNat
  case class Exexp (rec_x1:SNat, rec_x2:SNat) extends SNat

sealed abstract class Tree
  case class Leaf (rec_x1:Nat) extends Tree
  case class Node (rec_x1:Nat, rec_x2:Nat, rec_x3:Tree, rec_x4:Tree) extends Tree

object benchsym10 {

def or (rec_x1:Boolean, rec_x2:Boolean):Boolean =
  (rec_x1, rec_x2) match {
    case (True(), b) => True()
    case (False(), b) => b
  }

def and (rec_x1:Boolean, rec_x2:Boolean):Boolean =
  (rec_x1, rec_x2) match {
    case (True(), b) => b
    case (False(), b) => False()
  }

def neg (rec_x1:Boolean):Boolean =
  rec_x1 match {
    case False() => True()
    case True() => False()
  }

def d0():Nat = Zero()

def d1():Nat = S (d0())

def d2():Nat = S (d1())

def d3():Nat = S (d2())

def d4():Nat = S (d3())

def d5():Nat = S (d4())

def d6():Nat = S (d5())

def d7():Nat = S (d6())

def d8():Nat = S (d7())

def d9():Nat = S (d8())

def d10():Nat = S (d9())

def d11():Nat = S (d10())

def d12():Nat = S (d11())

def d13():Nat = S (d12())

def d14():Nat = S (d13())

def d15():Nat = S (d14())

def d16():Nat = S (d15())

def d17():Nat = S (d16())

def one():SNat = Exs (Exz())

def two():SNat = Exs (one())

def three():SNat = Exs (two())

def four():SNat = Exs (three())

def five():SNat = Exs (four())

def six():SNat = Exs (five())

def seven():SNat = Exs (six())

def eight():SNat = Exs (seven())

def nine():SNat = Exs (eight())

def ten():SNat = Exs (nine())

def eleven():SNat = Exs (ten())

def twelve():SNat = Exs (eleven())

def thirteen():SNat = Exs (twelve())

def fourteen():SNat = Exs (thirteen())

def fifteen():SNat = Exs (fourteen())

def sixteen():SNat = Exs (fifteen())

def seventeen():SNat = Exs (sixteen())

def eighteen():SNat = Exs (seventeen())

def nineteen():SNat = Exs (eighteen())

def twenty():SNat = Exs (nineteen())

def twentyone():SNat = Exs (twenty())

def twentytwo():SNat = Exs (twentyone())

def twentythree():SNat = Exs (twentytwo())

def twentyfour():SNat = Exs (twentythree())

def twentyfive():SNat = Exs (twentyfour())

def twentysix():SNat = Exs (twentyfive())

def twentyseven():SNat = Exs (twentysix())

def twentyeight():SNat = Exs (twentyseven())

def twentynine():SNat = Exs (twentyeight())

def thirty():SNat = Exs (twentynine())

def thirtyone():SNat = Exs (thirty())

def thirtytwo():SNat = Exs (thirtyone())

def thirtythree():SNat = Exs (thirtytwo())

def thirtyfour():SNat = Exs (thirtythree())

def thirtyfive():SNat = Exs (thirtyfour())

def dec (rec_x1:SNat):SNat =
  rec_x1 match {
    case Exexp (xs,Exz()) => Exs (Exz())
    case Exexp (xs,Exs (ys)) => Exmult (Exexp (xs,ys),xs)
    case Exexp (xs,Explus (ys,zs)) => Exmult (Exexp (xs,ys),Exexp (xs,zs))
    case Exexp (xs,Exmult (ys,zs)) => dec (Exexp (Exexp (xs,ys),zs))
    case Exexp (xs,Exexp (ys,zs)) => dec (Exexp (xs, dec (Exexp (ys,zs))))
  }

def benchevalsym17 (rec_x1:SNat):Boolean =
  rec_x1 match {
    case xs => equal (eval17 (Exexp (two(), xs)), evalsym17 (Exexp (two(), xs)))
  }

def benchevalexp17 (rec_x1:SNat):Boolean =
  rec_x1 match {
    case xs => equal (eval17 (Exexp (two(), xs)), evalexp17 (Exexp (two(), xs)))
  }

def benchevaltree17 (rec_x1:SNat):Boolean =
  rec_x1 match {
    case xs => equal (calctree17 (eval (xs)), getval (buildtree (eval (xs), Zero())))
  }

def equal (rec_x1:Nat, rec_x2:Nat):Boolean =
  (rec_x1, rec_x2) match {
    case (Zero(), Zero()) => True()
    case (Zero(), S (x)) => False()
    case (S (x), Zero()) => False()
    case (S (x), S (y)) => equal (x, y)
  }

def less (rec_x1:Nat, rec_x2:Nat):Boolean =
  (rec_x1, rec_x2) match {
    case (Zero(), y) => True()
    case (S (x), S (y)) => less (x, y)
    case (S (x), Zero()) => False()
  }

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => x
    case (x, S (y)) => S (plus (x, y))
  }

def mult (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => Zero()
    case (x, S (y)) => plus (mult (x, y), x)
  }

def exp (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => S (Zero())
    case (x, S (y)) => mult (x, exp (x, y))
  }

def succ17 (rec_x1:Nat):Nat =
  rec_x1 match {
    case S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))))) => Zero()
    case S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))) => S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))))
    case S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))) => S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))))
    case S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))) => S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))
    case S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))) => S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))
    case S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))) => S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))
    case S (S (S (S (S (S (S (S (S (S (Zero())))))))))) => S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))
    case S (S (S (S (S (S (S (S (S (Zero()))))))))) => S (S (S (S (S (S (S (S (S (S (Zero()))))))))))
    case S (S (S (S (S (S (S (S (Zero())))))))) => S (S (S (S (S (S (S (S (S (Zero())))))))))
    case S (S (S (S (S (S (S (Zero()))))))) => S (S (S (S (S (S (S (S (Zero()))))))))
    case S (S (S (S (S (S (Zero())))))) => S (S (S (S (S (S (S (Zero())))))))
    case S (S (S (S (S (Zero()))))) => S (S (S (S (S (S (Zero()))))))
    case S (S (S (S (Zero())))) => S (S (S (S (S (Zero())))))
    case S (S (S (Zero()))) => S (S (S (S (Zero()))))
    case S (S (Zero())) => S (S (S (Zero())))
    case S (Zero()) => S (S (Zero()))
    case Zero() => S (Zero())
  }

def pred17 (rec_x1:Nat):Nat =
  rec_x1 match {
    case S (x) => x
    case Zero() => S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))))
  }

def plus17 (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => x
    case (x, S (y)) => succ17 (plus17 (x, y))
  }

def mult17 (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => Zero()
    case (x, S (y)) => plus17 (x, mult17 (x, y))
  }

def exp17 (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, Zero()) => succ17 (Zero())
    case (x, S (y)) => mult17 (x, exp17 (x, y))
  }

def eval (rec_x1:SNat):Nat =
  rec_x1 match {
    case Exz() => Zero()
    case Exs (xs) => S (eval (xs))
    case Explus (xs, ys) => plus (eval (xs), eval (ys))
    case Exmult (xs, ys) => mult (eval (xs), eval (ys))
    case Exexp (xs, ys) => exp (eval (xs), eval (ys))
  }

def eval17 (rec_x1:SNat):Nat =
  rec_x1 match {
    case Exz() => Zero()
    case Exone() => S (Zero())
    case Exs (xs) => succ17 (eval17 (xs))
    case Explus (xs, ys) => plus17 (eval17 (xs), eval17 (ys))
    case Exmult (xs, ys) => mult17 (eval17 (xs), eval17 (ys))
    case Exexp (xs, ys) => exp17 (eval17 (xs), eval (ys))
  }

def evalsym17 (rec_x1:SNat):Nat =
  rec_x1 match {
    case Exz() => Zero()
    case Exs (xs) => succ17 (evalsym17 (xs))
    case Explus (xs, ys) => plus17 (evalsym17 (xs), evalsym17 (ys))
    case Exmult (xs, Exz()) => Zero()
    case Exmult (xs, Exs (ys)) => evalsym17 (Explus (Exmult (xs, ys), xs))
    case Exmult (xs, Explus (ys, zs)) => evalsym17 (Explus (Exmult (xs, ys), Exmult (xs, zs)))
    case Exmult (xs, Exmult (ys, zs)) => evalsym17 (Exmult (Exmult (xs, ys), zs))
    case Exmult (xs, Exexp (ys, zs)) => evalsym17 (Exmult (xs, dec (Exexp (ys, zs))))
    case Exexp (xs, Exz()) => succ17 (Zero())
    case Exexp (xs, Exs (ys)) => evalsym17 (Exmult (Exexp (xs, ys), xs))
    case Exexp (xs, Explus (ys, zs)) => evalsym17 (Exmult (Exexp (xs, ys), Exexp (xs, zs)))
    case Exexp (xs, Exmult (ys, zs)) => evalsym17 (Exexp (Exexp (xs, ys), zs))
    case Exexp (xs, Exexp (ys, zs)) => evalsym17 (Exexp (xs, dec (Exexp (ys, zs))))
  }

def evalexp17 (rec_x1:SNat):Nat =
  rec_x1 match {
    case xs => eval17 (expand (xs))
  }

def getval (rec_x1:Tree):Nat =
  rec_x1 match {
    case Leaf (xval) => xval
    case Node (xval, max, left, right) => xval
  }

def getmax (rec_x1:Tree):Nat =
  rec_x1 match {
    case Leaf (xval) => xval
    case Node (xval, max, left, right) => max
  }

def calctree17 (rec_x1:Nat):Nat =
  rec_x1 match {
    case x => mult17 (exp17 (S (S (Zero())), pred17 (x)), pred17 (exp17 (S (S (Zero())), x)))
  }

def nat2sym (rec_x1:Nat):SNat =
  rec_x1 match {
    case Zero() => Exz()
    case S (x) => Exs (nat2sym (x))
  }

def expand (rec_x1:SNat):SNat =
  rec_x1 match {
    case Exz() => Exz()
    case Exone() => Exone()
    case Exs (xs) => Explus (Exone(), expand (xs))
    case Explus (xs, ys) => Explus (expand (xs), expand (ys))
    case Exmult (xs, Exz()) => Exz()
    case Exmult (xs, Exone()) => expand (xs)
    case Exmult (xs, Explus (ys, zs)) => expand (Explus (Exmult (xs, ys), Exmult (xs, zs)))
    case Exmult (xs, Exs (ys)) => expand (Exmult (xs, expand (Exs (ys))))
    case Exmult (xs, Exmult (ys,zs)) => expand (Exmult (xs, expand (Exmult (ys,zs))))
    case Exmult (xs, Exexp (ys,zs)) => expand (Exmult (xs, expand (Exexp (ys,zs))))
    case Exexp (xs, Exz()) => Exone()
    case Exexp (xs, Exone()) => expand (xs)
    case Exexp (xs, Explus (ys, zs)) => expand (Exmult (Exexp (xs, ys), Exexp (xs, zs)))
    case Exexp (xs, Exs (ys)) => expand (Exexp (xs, expand (Exs (ys))))
    case Exexp (xs, Exmult (ys,zs)) => expand (Exexp (xs, expand (Exmult (ys,zs))))
    case Exexp (xs, Exexp (ys,zs)) => expand (Exexp (xs, expand (Exexp (ys,zs))))
  }

def buildtree (rec_x1:Nat, rec_x2:Nat):Tree =
  (rec_x1, rec_x2) match {
    case (Zero(), xval) => Leaf (xval)
    case (S (x), y) => Node (plus17 (getval (buildtree (x, y)),getval (buildtree (x, succ17 (getmax (buildtree (x, y)))))), getmax (buildtree (x, succ17 (getmax (buildtree (x, y))))), buildtree (x, y),buildtree (x, succ17 (getmax (buildtree (x, y)))))
  }

def main (args:Array[String]):Unit = {
  println (benchevalsym17 (ten()))
  }

}
