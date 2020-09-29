sealed abstract class Bool
  case class T() extends Bool
  case class F() extends Bool

sealed abstract class Pos
  case class One() extends Pos
  case class CDub (rec_x1:Bool, rec_x2:Pos) extends Pos

sealed abstract class Int
  case class CInt (rec_x1:Nat) extends Int
  case class CNeg (rec_x1:Pos) extends Int

sealed abstract class Nat
  case class Zero() extends Nat
  case class CNat (rec_x1:Pos) extends Nat

object binarysearch {

def eqBool (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (T(),b) => b
    case (F(),T()) => F()
    case (F(),F()) => T()
  }

def and (rec_x1:Bool, rec_x2:Bool):Bool =
  (rec_x1, rec_x2) match {
    case (T(),b) => b
    case (F(),b) => F()
  }

def not (rec_x1:Bool):Bool =
  rec_x1 match {
    case T() => F()
    case F() => T()
  }

def eqPos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (One(),One()) => T()
    case (One(),CDub (b,p)) => F()
    case (CDub (b,p),One()) => F()
    case (CDub (b,p),CDub (c,q)) => and (eqBool (b,c), eqPos (p,q))
  }

def lePos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (One(),p) => T()
    case (CDub (b,p),One()) => F()
    case (CDub (b,p),CDub (c,q)) if b == c => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == F() => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == T() => ltPos (p,q)
  }

def ltPos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (p,One()) => F()
    case (One(),CDub (b,p)) => T()
    case (CDub (b,p),CDub (c,q)) if b == c => ltPos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == F() => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == T() => ltPos (p,q)
  }

def gePos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (p,q) => lePos (q,p)
  }

def succ2Pos (rec_x1:Pos):Pos =
  rec_x1 match {
    case One() => CDub (F(),One())
    case CDub (F(),p) => CDub (T(),p)
    case CDub (T(),p) => CDub (F(),succ2Pos (p))
  }

def plusPos (rec_x1:Pos, rec_x2:Pos):Pos =
  (rec_x1, rec_x2) match {
    case (p,q) => addc (F(),p,q)
  }

def addc (rec_x1:Bool, rec_x2:Pos, rec_x3:Pos):Pos =
  (rec_x1, rec_x2, rec_x3) match {
    case (F(),One(),p) => succ2Pos (p)
    case (T(),One(),p) => succ2Pos (succ2Pos (p))
    case (F(),p,One()) => succ2Pos (p)
    case (T(),p,One()) => succ2Pos (succ2Pos (p))
    case (b,CDub (c,p),CDub (d,q)) if c == d => CDub (b,addc (c,p,q))
    case (b,CDub (c,p),CDub (d,q)) if c != d => CDub (not (b),addc (b,p,q))
  }

def lambda0 (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat, rec_x4:Nat):Nat =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (n,y,x,h) if lt (f (h),n) == T() => bs2 (n,h,y)
    case (n,y,x,h) if lt (f (h),n) == F() => bs2 (n,x,h)
  }

def max2Int (rec_x1:Int, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (CInt (m),n) => max2 (m,n)
    case (CNeg (p),n) => n
  }

def min2 (rec_x1:Nat):Int =
  rec_x1 match {
    case Zero() => CInt (Zero())
    case CNat (p) => CNeg (p)
  }

def minus (rec_x1:Nat, rec_x2:Nat):Int =
  (rec_x1, rec_x2) match {
    case (m,n) if ge (m,n) == T() => CInt (gtesubtn (m,n))
    case (m,n) if lt (m,n) == T() => min2 (gtesubtn (n,m))
  }

def eq (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (Zero(),Zero()) => T()
    case (Zero(),CNat (p)) => F()
    case (CNat (p),Zero()) => F()
    case (CNat (p),CNat (q)) => eqPos (p,q)
  }

def ite (rec_x1:Bool, rec_x2:Nat, rec_x3:Nat):Nat =
  (rec_x1, rec_x2, rec_x3) match {
    case (T(),m,n) => m
    case (F(),m,n) => n
  }

def pos2Nat (rec_x1:Pos):Nat =
  rec_x1 match {
    case p => CNat (p)
  }

def nat2Pos (rec_x1:Nat):Pos =
  rec_x1 match {
    case CNat (p) => p
  }

def le (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (Zero(),n) => T()
    case (CNat (p),Zero()) => F()
    case (CNat (p),CNat (q)) => lePos (p,q)
  }

def lt (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (n,Zero()) => F()
    case (Zero(),CNat (p)) => T()
    case (CNat (p),CNat (q)) => ltPos (p,q)
  }

def ge (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (m,n) => le (n,m)
  }

def max2 (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (m,n) => ite (le (m,n),n,m)
  }

def succ2 (rec_x1:Nat):Pos =
  rec_x1 match {
    case Zero() => One()
    case CNat (p) => succ2Pos (p)
  }

def pred2 (rec_x1:Pos):Nat =
  rec_x1 match {
    case One() => Zero()
    case CDub (T(),p) => CNat (CDub (F(),p))
    case CDub (F(),p) => dub (T(),pred2 (p))
  }

def dub (rec_x1:Bool, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (F(),Zero()) => Zero()
    case (T(),Zero()) => CNat (One())
    case (b,CNat (p)) => CNat (CDub (b,p))
  }

def plusNatPos (rec_x1:Nat, rec_x2:Pos):Pos =
  (rec_x1, rec_x2) match {
    case (Zero(),p) => p
    case (CNat (p),q) => plusPos (p,q)
  }

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (Zero(),n) => n
    case (n,Zero()) => n
    case (CNat (p),CNat (q)) => CNat (addc (F(),p,q))
  }

def gtesubtp (rec_x1:Pos, rec_x2:Pos):Nat =
  (rec_x1, rec_x2) match {
    case (p,q) => gtesubtb (F(),p,q)
  }

def gtesubtn (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (n,Zero()) => n
    case (CNat (p),CNat (q)) => gtesubtp (p,q)
  }

def gtesubtb (rec_x1:Bool, rec_x2:Pos, rec_x3:Pos):Nat =
  (rec_x1, rec_x2, rec_x3) match {
    case (F(),p,One()) => pred2 (p)
    case (T(),p,One()) => pred2 (nat2Pos (pred2 (p)))
    case (b,CDub (c,p),CDub (d,q)) if c == d => dub (b,gtesubtb (b,p,q))
    case (b,CDub (c,p),CDub (d,q)) if c != d => dub (not (b),gtesubtb (d,p,q))
  }

def dividePos (rec_x1:Pos, rec_x2:Pos):Nat =
  (rec_x1, rec_x2) match {
    case (p,q) if gePos (p,q) == T() => CNat (succ2 (divide (gtesubtp (p,q),q)))
    case (p,q) if ltPos (p,q) == T() => Zero()
  }

def divide (rec_x1:Nat, rec_x2:Pos):Nat =
  (rec_x1, rec_x2) match {
    case (Zero(),p) => Zero()
    case (CNat (p),q) => dividePos (p,q)
  }

def f (rec_x1:Nat):Nat =
  rec_x1 match {
    case Zero() => Zero()
    case CNat (One()) => CNat (One())
    case CNat (CDub (b,p)) => plus (f (max2Int (minus (CNat (CDub (b,p)),pos2Nat (One())),Zero())),f (max2Int (minus (CNat (CDub (b,p)),pos2Nat (CDub (F(),One()))),Zero())))
  }

def bs (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (n,m) => bs2 (n,Zero(),m)
  }

def bs2 (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat):Nat =
  (rec_x1, rec_x2, rec_x3) match {
    case (n,x,y) if eq (pos2Nat (plusNatPos (x,One())),y) == T() => x
    case (n,x,y) if eq (pos2Nat (plusNatPos (x,One())),y) == F() => lambda0 (n,y,x,divide (plus (x,y),CDub (F(),One())))
  }

def main (args:Array[String]):Unit = {
  println (bs (pos2Nat (CDub (T(),CDub (T(),CDub (F(),CDub (T(),CDub (F(),CDub (T(),CDub (T(),CDub (F(),CDub (T(),CDub (F(),CDub (T(),One())))))))))))),pos2Nat (CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),One())))))))))
  }

}
