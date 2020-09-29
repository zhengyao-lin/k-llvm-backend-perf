sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Pos
  case class D1() extends Pos
  case class CDub (rec_x1:Bool, rec_x2:Pos) extends Pos

sealed abstract class ENat
  case class Exz() extends ENat
  case class Exs (rec_x1:ENat) extends ENat
  case class Explus (rec_x1:ENat, rec_x2:ENat) extends ENat
  case class Exmult (rec_x1:ENat, rec_x2:ENat) extends ENat
  case class Exexp (rec_x1:ENat, rec_x2:ENat) extends ENat

sealed abstract class SNat
  case class Z() extends SNat
  case class S (rec_x1:SNat) extends SNat

object evalsym {

def eqBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (True(),b) => b
    case (False(),True()) => False()
    case (False(),False()) => True()
  }

def and (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (b,True()) => b
    case (b,False()) => False()
  }

def eqPos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (D1(),D1()) => True()
    case (D1(),CDub (b,p)) => False()
    case (CDub (b,p),D1()) => False()
    case (CDub (b,p),CDub (c,q)) => and (eqBool (b,c), eqPos (p,q))
  }

def lambda0 (rec_x1:ENat):Bool =
  rec_x1 match {
    case m => eq (eval17 (m),evalsym17 (m))
  }

def eq (rec_x1:SNat, rec_x2:SNat):Bool =
  (rec_x1, rec_x2) match {
    case (Z(),Z()) => True()
    case (Z(),S (r)) => False()
    case (S (r),Z()) => False()
    case (S (r),S (t)) => eq (r,t)
  }

def succ17 (rec_x1:SNat):SNat =
  rec_x1 match {
    case r if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == True() => Z()
    case r if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == False() => S (r)
  }

def plus17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (r,Z()) => r
    case (r,S (t)) => succ17 (plus17 (r,t))
  }

def mult17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (r,Z()) => Z()
    case (r,S (t)) => plus17 (r,mult17 (r,t))
  }

def exp17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (r,Z()) => succ17 (Z())
    case (r,S (t)) => mult17 (r,exp17 (r,t))
  }

def eval17 (rec_x1:ENat):SNat =
  rec_x1 match {
    case Exz() => Z()
    case Exs (n) => succ17 (eval17 (n))
    case Explus (n,m) => plus17 (eval17 (n),eval17 (m))
    case Exmult (n,m) => mult17 (eval17 (n),eval17 (m))
    case Exexp (n,m) => exp17 (eval17 (n),eval17 (m))
  }

def evalsym17 (rec_x1:ENat):SNat =
  rec_x1 match {
    case Exz() => Z()
    case Exs (n) => succ17 (evalsym17 (n))
    case Explus (n,m) => plus17 (evalsym17 (n),evalsym17 (m))
    case Exmult (n,Exz()) => Z()
    case Exmult (n,Exs (m)) => evalsym17 (Explus (Exmult (n,m),n))
    case Exmult (n,Explus (m,o)) => evalsym17 (Explus (Exmult (n,m),Exmult (n,o)))
    case Exmult (n,Exmult (m,o)) => evalsym17 (Exmult (Exmult (n,m),o))
    case Exmult (n,Exexp (m,o)) => evalsym17 (Exmult (n,dec (Exexp (m,o))))
    case Exexp (n,Exz()) => succ17 (Z())
    case Exexp (n,Exs (m)) => evalsym17 (Exmult (Exexp (n,m),n))
    case Exexp (n,Explus (m,o)) => evalsym17 (Exmult (Exexp (n,m),Exexp (n,o)))
    case Exexp (n,Exmult (m,o)) => evalsym17 (Exexp (Exexp (n,m),o))
    case Exexp (n,Exexp (m,o)) => evalsym17 (Exexp (n,dec (Exexp (m,o))))
  }

def dec (rec_x1:ENat):ENat =
  rec_x1 match {
    case Exexp (n,Exz()) => Exs (Exz())
    case Exexp (n,Exs (m)) => Exmult (Exexp (n,m),n)
    case Exexp (n,Explus (m,o)) => Exmult (Exexp (n,m),Exexp (n,o))
    case Exexp (n,Exmult (m,o)) => dec (Exexp (Exexp (n,m),o))
    case Exexp (n,Exexp (m,o)) => dec (Exexp (n,dec (Exexp (m,o))))
  }

def two():ENat = Exs (Exs (Exz()))

def seventeen():ENat = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz()))))))))))))))))))))))))

def f (rec_x1:ENat):Bool =
  rec_x1 match {
    case m => lambda0 (Exexp (two(),m))
  }

def main (args:Array[String]):Unit = {
  println (f (seventeen()))
  }

}
