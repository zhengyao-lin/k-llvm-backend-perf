sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Nat
  case class S (rec_x1:Nat) extends Nat
  case class Z() extends Nat

sealed abstract class Digit
  case class D0() extends Digit
  case class D1() extends Digit
  case class D2() extends Digit
  case class D3() extends Digit
  case class D4() extends Digit
  case class D5() extends Digit
  case class D6() extends Digit
  case class D7() extends Digit
  case class D8() extends Digit
  case class D9() extends Digit

sealed abstract class List
  case class Nil() extends List
  case class D (rec_x1:Digit) extends List
  case class Dl (rec_x1:Digit, rec_x2:List) extends List
  case class L (rec_x1:Nat, rec_x2:List) extends List
  case class Ll (rec_x1:List, rec_x2:List) extends List

object sieve100 {

def two():Nat = S (S (Z()))

def ten():Nat = S (S (S (S (S (S (S (S (S (S (Z()))))))))))

def digitList():List = Dl (D0(), Dl (D1(), Dl (D2(), Dl (D3(), Dl (D4(), Dl (D5(), Dl (D6(), Dl (D7(), Dl (D8(), Dl (D9(), Nil()))))))))))

def ifNat (rec_x1:Bool, rec_x2:Nat, rec_x3:Nat):Nat =
  (rec_x1, rec_x2, rec_x3) match {
    case (True(), n, m) => n
    case (False(), n, m) => m
  }

def conv (rec_x1:Nat):List =
  rec_x1 match {
    case x if lt (x, ten()) == True() => Dl (digit (x), Nil())
    case x if lt (x, ten()) == False() => ap (conv (div (x, ten())), conv (rem (x, ten())))
  }

def rem (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, y) if y != Z() => ifNat (lt (x, y), x, rem (sub (x, y), y))
  }

def div (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, y) if y != Z() => ifNat (lt (x, y), Z(), S (div (sub (x, y), y)))
  }

def lt (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (Z(), S (x)) => True()
    case (x, Z()) => False()
    case (S (x), S (y)) => lt (x, y)
  }

def sub (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (Z(), S (y)) => Z()
    case (x, Z()) => x
    case (S (x), S (y)) => sub (x, y)
  }

def digit (rec_x1:Nat):Digit =
  rec_x1 match {
    case x => find (digitList(), x)
  }

def find (rec_x1:List, rec_x2:Nat):Digit =
  (rec_x1, rec_x2) match {
    case (Dl (dig, l1), Z()) => dig
    case (Dl (dig, l1), S (x)) => find (l1, x)
  }

def ap (rec_x1:List, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (Nil(), l1) => l1
    case (Dl (dig, l1), l2) => Dl (dig, ap (l1, l2))
  }

def add (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (Z(), y) => y
    case (S (x), y) => S (add (x, y))
  }

def mult (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (Z(), y) => Z()
    case (S (x), y) => add (y, mult (x, y))
  }

def fact (rec_x1:Nat):Nat =
  rec_x1 match {
    case Z() => S (Z())
    case S (x) => mult (S (x), fact (x))
  }

def divides (rec_x1:Nat, rec_x2:Nat):Bool =
  (rec_x1, rec_x2) match {
    case (n, m) if m != Z() => auxdiv (n, m, m)
  }

def auxdiv (rec_x1:Nat, rec_x2:Nat, rec_x3:Nat):Bool =
  (rec_x1, rec_x2, rec_x3) match {
    case (Z(), Z(), m) => True()
    case (Z(), S (x), m) => False()
    case (S (x), S (y), m) => auxdiv (x, y, m)
    case (S (x), Z(), m) => auxdiv (S (x), m, m)
  }

def intsBetween (rec_x1:Nat, rec_x2:Nat):List =
  (rec_x1, rec_x2) match {
    case (n, m) if n == m => Nil()
    case (n, m) if n != m => L (n, intsBetween (S (n), m))
  }

def sieve (rec_x1:List):List =
  rec_x1 match {
    case L (n, l1) => L (n, sieve (filter (l1, n)))
    case Nil() => Nil()
  }

def filter (rec_x1:List, rec_x2:Nat):List =
  (rec_x1, rec_x2) match {
    case (L (n, l1), m) if divides (n, m) == True() => filter (l1, m)
    case (L (n, l1), m) if divides (n, m) == False() => L (n, filter (l1, m))
    case (Nil(), m) => Nil()
  }

def e (rec_x1:Nat, rec_x2:List):List =
  (rec_x1, rec_x2) match {
    case (n, l1) => Ll (conv (n), l1)
  }

def main (args:Array[String]):Unit = {
  println (sieve (intsBetween (S (S (Z())), mult (ten(), ten()))))
  }

}
