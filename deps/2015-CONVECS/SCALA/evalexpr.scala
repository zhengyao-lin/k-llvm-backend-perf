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

object evalexpr {

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
    case m => eq (eval17 (m),evalexp17 (m))
  }

def eq (rec_x1:SNat, rec_x2:SNat):Bool =
  (rec_x1, rec_x2) match {
    case (Z(),Z()) => True()
    case (Z(),S (r)) => False()
    case (S (r),Z()) => False()
    case (S (r),S (t)) => eq (r,t)
  }

def eqENat (rec_x1:ENat, rec_x2:ENat):Bool =
  (rec_x1, rec_x2) match {
    case (Exz(),Exz()) => True()
    case (Exz(),Exs (m)) => False()
    case (Exz(),Explus (m,n)) => False()
    case (Exz(),Exmult (m,n)) => False()
    case (Exz(),Exexp (m,n)) => False()
    case (Exs (m),Exz()) => False()
    case (Exs (n),Exs (m)) => eqENat (n,m)
    case (Exs (m),Explus (n,o)) => False()
    case (Exs (n),Exmult (m,o)) => False()
    case (Exs (m),Exexp (n,o)) => False()
    case (Explus (n,m),Exz()) => False()
    case (Explus (m,n),Exs (o)) => False()
    case (Explus (n,m),Explus (o,l)) => and (eqENat (n,o),eqENat (m,l))
    case (Explus (m,n),Exmult (o,l)) => False()
    case (Explus (n,m),Exexp (o,l)) => False()
    case (Exmult (m,n),Exz()) => False()
    case (Exmult (n,m),Exs (o)) => False()
    case (Exmult (m,n),Explus (o,l)) => False()
    case (Exmult (n,m),Exmult (o,l)) => and (eqENat (n,o),eqENat (m,l))
    case (Exmult (m,n),Exexp (o,l)) => False()
    case (Exexp (n,m),Exz()) => False()
    case (Exexp (m,n),Exs (o)) => False()
    case (Exexp (n,m),Explus (o,l)) => False()
    case (Exexp (m,n),Exmult (o,l)) => False()
    case (Exexp (m,n),Exexp (o,l)) => and (eqENat (m,o),eqENat (n,l))
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

def evalexp17 (rec_x1:ENat):SNat =
  rec_x1 match {
    case n => eval17 (expand (n))
  }

def expand (rec_x1:ENat):ENat =
  rec_x1 match {
    case Exz() => Exz()
    case Exs (n) => Explus (Exs (Exz()),n)
    case Explus (n,m) => Explus (expand (n),expand (m))
    case Exmult (n,Exz()) => Exz()
    case Exmult (n,Exs (Exz())) => expand (n)
    case Exmult (n,Explus (m,o)) => expand (Explus (Exmult (n,m),Exmult (n,o)))
    case Exmult (n,Exmult (m,o)) => expand (Exmult (n,expand (Exmult (m,o))))
    case Exmult (n,Exexp (m,o)) => expand (Exmult (n,expand (Exexp (m,o))))
    case Exexp (n,Exz()) => Exs (Exz())
    case Exexp (n,Exs (m)) if eqENat (m,Exz()) == True() => expand (n)
    case Exexp (n,Exs (m)) if eqENat (m,Exz()) == False() => expand (Exexp (n,expand (Exs (m))))
    case Exexp (n,Explus (m,o)) => expand (Exmult (Exexp (n,m),Exexp (n,o)))
    case Exexp (n,Exmult (m,o)) => expand (Exexp (n,expand (Exmult (m,o))))
    case Exexp (n,Exexp (m,o)) => expand (Exexp (n,expand (Exexp (m,o))))
  }

def two():ENat = Exs (Exs (Exz()))

def seventeen():ENat = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz())))))))))))))))))))

def f (rec_x1:ENat):Bool =
  rec_x1 match {
    case m => lambda0 (Exexp (two(),m))
  }

def main (args:Array[String]):Unit = {
  println (f (seventeen()))
  }

}
