sealed abstract class Nat
  case class D0() extends Nat
  case class S (rec_x1:Nat) extends Nat

sealed abstract class NatList
  case class Nil() extends NatList
  case class L (rec_x1:Nat) extends NatList
  case class Ll (rec_x1:NatList, rec_x2:NatList) extends NatList

sealed abstract class NatListList
  case class NilP() extends NatListList
  case class P (rec_x1:NatList) extends NatListList
  case class Pp (rec_x1:NatListList, rec_x2:NatListList) extends NatListList

object permutations6 {

def perm (rec_x1:Nat):NatListList =
  rec_x1 match {
    case D0() => ppreduce (P (Nil()), NilP())
    case S (D0()) => ppreduce (P (Ll (L (S (D0())), Nil())), NilP())
    case S (n) => insert1 (S (n), perm (n))
  }

def insert1 (rec_x1:Nat, rec_x2:NatListList):NatListList =
  (rec_x1, rec_x2) match {
    case (n, Pp (P (p1), ps)) => ppreduce (insert0 (n, p1), insert1 (n, ps))
    case (n, P (p1)) => insert0 (n,p1)
    case (n, NilP()) => NilP()
  }

def insert0 (rec_x1:Nat, rec_x2:NatList):NatListList =
  (rec_x1, rec_x2) match {
    case (n, Ll (L (m), p2)) => ppreduce (P (Ll (L (n), Ll (L (m), p2))), map_cons (m, insert0 (n, p2)))
    case (n, Nil()) => ppreduce (P (Ll (L (n), Nil())), NilP())
  }

def map_cons (rec_x1:Nat, rec_x2:NatListList):NatListList =
  (rec_x1, rec_x2) match {
    case (m, Pp (P (p1), ps)) => ppreduce (P (Ll (L (m), p1)), map_cons (m, ps))
    case (m, P (p1)) => P (Ll (L (m), p1))
    case (m, NilP()) => NilP()
  }

def ppreduce (rec_x1:NatListList, rec_x2:NatListList):NatListList =
  (rec_x1, rec_x2) match {
    case (NilP(), ps2) => ps2
    case (ps1, NilP()) => ps1
    case (ps1, ps2) => ppflat (ps1, ppflat (ps2, NilP()))
  }

def ppflat (rec_x1:NatListList, rec_x2:NatListList):NatListList =
  (rec_x1, rec_x2) match {
    case (NilP(), accumulator) => accumulator
    case (P (p1), accumulator) => Pp (P (p1), accumulator)
    case (Pp (ps1, ps2), accumulator) => ppflat (ps1, ppflat (ps2, accumulator))
  }

def main (args:Array[String]):Unit = {
  println (perm (S (S (S (S (S (S (D0()))))))))
  }

}
