sealed abstract class Bool
  case class T() extends Bool
  case class F() extends Bool

sealed abstract class Pos
  case class D1() extends Pos
  case class CDub (rec_x1:Bool, rec_x2:Pos) extends Pos

sealed abstract class Int
  case class CInt (rec_x1:Nat) extends Int
  case class CNeg (rec_x1:Pos) extends Int

sealed abstract class Nat
  case class D0() extends Nat
  case class CNat (rec_x1:Pos) extends Nat

object fib32 {

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
    case (D1(),D1()) => T()
    case (D1(),CDub (b,p)) => F()
    case (CDub (b,p),D1()) => F()
    case (CDub (b,p),CDub (c,q)) => and (eqBool (b,c),eqPos (p,q))
  }

def lePos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (D1(),p) => T()
    case (CDub (b,p),D1()) => F()
    case (CDub (b,p),CDub (c,q)) if b == c => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == F() => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == T() => ltPos (p,q)
  }

def ltPos (rec_x1:Pos, rec_x2:Pos):Bool =
  (rec_x1, rec_x2) match {
    case (p,D1()) => F()
    case (D1(),CDub (b,p)) => T()
    case (CDub (b,p),CDub (c,q)) if b == c => ltPos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == F() => lePos (p,q)
    case (CDub (b,p),CDub (c,q)) if b != c && b == T() => ltPos (p,q)
  }

def s (rec_x1:Pos):Pos =
  rec_x1 match {
    case D1() => CDub (F(),D1())
    case CDub (F(),p) => CDub (T(),p)
    case CDub (T(),p) => CDub (F(),s (p))
  }

def addc (rec_x1:Bool, rec_x2:Pos, rec_x3:Pos):Pos =
  (rec_x1, rec_x2, rec_x3) match {
    case (F(),D1(),p) => s (p)
    case (T(),D1(),p) => s (s (p))
    case (F(),p,D1()) => s (p)
    case (T(),p,D1()) => s (s (p))
    case (b,CDub (c,p),CDub (d,q)) if c == d => CDub (b,addc (c,p,q))
    case (b,CDub (c,p),CDub (d,q)) if c != d => CDub (not (b),addc (c,p,q))
  }

def int2Nat (rec_x1:Int):Nat =
  rec_x1 match {
    case CInt (n) => n
  }

def minus (rec_x1:Nat):Int =
  rec_x1 match {
    case D0() => CInt (D0())
    case CNat (p) => CNeg (p)
  }

def minus2 (rec_x1:Nat, rec_x2:Nat):Int =
  (rec_x1, rec_x2) match {
    case (m,n) if ge (m,n) == T() => CInt (gtesubt (m,n))
    case (m,n) if ge (m,n) == F() => minus (gtesubt (n,m))
  }

def pos2Nat (rec_x1:Pos):Nat =
  rec_x1 match {
    case p => CNat (p)
  }

def nat2Pos (rec_x1:Nat):Pos =
  rec_x1 match {
    case CNat (p) => p
  }

def eq (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(),D0()) => T()
    case (D0(),CNat (p)) => F()
    case (CNat (p),D0()) => F()
    case (CNat (p),CNat (q)) => eqPos (p,q)
  }

def le (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (D0(),n) => T()
    case (CNat (p),D0()) => F()
    case (CNat (p),CNat (q)) => lePos (p,q)
  }

def lt (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (n,D0()) => F()
    case (D0(),CNat (p)) => T()
    case (CNat (p),CNat (q)) => ltPos (p,q)
  }

def ge (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (m,n) => le (n,m)
  }

def gt (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (m,n) => lt (n,m)
  }

def pre (rec_x1:Pos):Nat =
  rec_x1 match {
    case D1() => D0()
    case CDub (T(),p) => CNat (CDub (F(),p))
    case CDub (F(),p) => dub (T(),pre (p))
  }

def dub (rec_x1:Bool, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (F(),D0()) => D0()
    case (T(),D0()) => CNat (D1())
    case (b,CNat (p)) => CNat (CDub (b,p))
  }

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(),n) => n
    case (n,D0()) => n
    case (CNat (p),CNat (q)) => CNat (addc (F(),p,q))
  }

def gtesubtPos (rec_x1:Pos, rec_x2:Pos):Nat =
  (rec_x1, rec_x2) match {
    case (p,q) => gtesubtb (F(),p,q)
  }

def gtesubt (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (n,D0()) => n
    case (CNat (p),CNat (q)) => gtesubtPos (p,q)
  }

def gtesubtb (rec_x1:Bool, rec_x2:Pos, rec_x3:Pos):Nat =
  (rec_x1, rec_x2, rec_x3) match {
    case (F(),p,D1()) => pre (p)
    case (T(),p,D1()) => pre (nat2Pos (pre (p)))
    case (b,CDub (c,p),CDub (d,q)) if c == d => dub (b,gtesubtb (b,p,q))
    case (b,CDub (c,p),CDub (d,q)) if c != d && c == F() => dub (not (b),gtesubtb (T(),p,q))
    case (b,CDub (c,p),CDub (d,q)) if c != d && c == T() => dub (not (b),gtesubtb (d,p,q))
  }

def fib (rec_x1:Nat):Nat =
  rec_x1 match {
    case D0() => D0()
    case CNat (D1()) => CNat (D1())
    case CNat (CDub (b,p)) => plus (fib (int2Nat (minus2 (CNat (CDub (b,p)),pos2Nat (D1())))),fib (int2Nat (minus2 (CNat (CDub (b,p)),pos2Nat (CDub (F(),D1()))))))
  }

def main (args:Array[String]):Unit = {
  println (fib (pos2Nat (CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),D1()))))))))
  }

}
