sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class Set
  case class Empty() extends Set
  case class Singleton (rec_x1:Nat) extends Set
  case class Union (rec_x1:Set, rec_x2:Set) extends Set

object dart {

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), n) => n
    case (S (n), m) => S (plus (n, m))
  }

def times (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (D0(), n) => D0()
    case (S (n), m) => plus (m, times (n, m))
  }

def u (rec_x1:Set, rec_x2:Set):Set =
  (rec_x1, rec_x2) match {
    case (Empty(), s0) => s0
    case (s0, Empty()) => s0
    case (s0, s1) if s0 == s1 => s0
    case (s0, s1) if s0 != s1 => flat (s0, flat (s1, Empty()))
  }

def flat (rec_x1:Set, rec_x2:Set):Set =
  (rec_x1, rec_x2) match {
    case (Empty(), s0) => s0
    case (Singleton (i), s0) => Union (Singleton (i), s0)
    case (Union (s1, s2), s0) => flat (s1, flat (s2, s0))
  }

def add (rec_x1:Set, rec_x2:Set):Set =
  (rec_x1, rec_x2) match {
    case (Empty(), s0) => s0
    case (s0, Empty()) => s0
    case (Singleton (i), Singleton (j)) => Singleton (plus (i, j))
    case (Singleton (i), Union (Singleton (j), s0)) => add (Singleton (plus (i, j)), s0)
    case (Union (Singleton (i), s1), s2) => u (add (Singleton (i), s2), add (s1, s2))
  }

def mult (rec_x1:Set, rec_x2:Set):Set =
  (rec_x1, rec_x2) match {
    case (Empty(), s0) => s0
    case (s0, Empty()) => s0
    case (Singleton (i), Singleton (j)) => Singleton (times (i, j))
    case (Union (Singleton (i), s1), s2) => u (mult (Singleton (i), s2), mult (s1, s2))
  }

def five():Nat = S (S (S (S (S (D0())))))

def ten():Nat = S (S (S (S (S (five())))))

def fifteen():Nat = S (S (S (S (S (ten())))))

def twentyfive():Nat = S (S (S (S (S (S (S (S (S (S (fifteen()))))))))))

def fifty():Nat = plus (twentyfive(), twentyfive())

def singles():Set = add (Singleton (S (D0())), add (Singleton (S (S (D0()))), add (Singleton (S (S (S (D0())))),add (Singleton (S (S (S (S (D0()))))), add (Singleton (five()),add (Singleton (S (five())), add (Singleton (S (S (five()))),add (Singleton (S (S (S (five())))), add (Singleton (S (S (S (S (five()))))), add (Singleton (ten()), add (Singleton (S (ten())), add (Singleton (S (S (ten()))),add (Singleton (S (S (S (ten())))), add (Singleton (S (S (S (S (ten()))))), add (Singleton (fifteen()),add (Singleton (S (fifteen())), add (Singleton (S (S (fifteen()))), add (Singleton (S (S (S (fifteen())))), add (Singleton (S (S (S (S (fifteen()))))), Singleton (plus (five(), fifteen())))))))))))))))))))))

def doubles():Set = mult (singles(), Singleton (S (S (D0()))))

def triples():Set = mult (singles(), Singleton (S (S (S (D0())))))

def allops():Set = u (u (u (u (u (singles(), doubles()), triples()), Singleton (twentyfive())), Singleton (fifty())), Singleton (D0()))

def finish():Set = add (u (doubles(), Singleton (fifty())), add (allops(), allops()))

def main (args:Array[String]):Unit = {
  println (finish())
  }

}
