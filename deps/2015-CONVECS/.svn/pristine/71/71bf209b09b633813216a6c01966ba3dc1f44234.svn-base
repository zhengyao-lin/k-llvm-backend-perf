sealed abstract class Nat
  case class D() extends Nat
  case class N0 (rec_x1:Nat) extends Nat
  case class N1 (rec_x1:Nat) extends Nat
  case class N2 (rec_x1:Nat) extends Nat
  case class N3 (rec_x1:Nat) extends Nat
  case class N4 (rec_x1:Nat) extends Nat
  case class N5 (rec_x1:Nat) extends Nat
  case class N6 (rec_x1:Nat) extends Nat
  case class N7 (rec_x1:Nat) extends Nat
  case class N8 (rec_x1:Nat) extends Nat
  case class N9 (rec_x1:Nat) extends Nat

object fibfree {

def plus (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, D()) => x
    case (D(), x) => x
    case (N0 (x), N0 (y)) => N0 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N1 (y)) => N1 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N2 (y)) => N2 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N3 (y)) => N3 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N4 (y)) => N4 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N5 (y)) => N5 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N6 (y)) => N6 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N7 (y)) => N7 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N8 (y)) => N8 (plus (plus (x, y), N0 (D())))
    case (N0 (x), N9 (y)) => N9 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N1 (y)) => N2 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N2 (y)) => N3 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N3 (y)) => N4 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N4 (y)) => N5 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N5 (y)) => N6 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N6 (y)) => N7 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N7 (y)) => N8 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N8 (y)) => N9 (plus (plus (x, y), N0 (D())))
    case (N1 (x), N9 (y)) => N0 (plus (plus (x, y), N1 (D())))
    case (N2 (x), N2 (y)) => N4 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N3 (y)) => N5 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N4 (y)) => N6 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N5 (y)) => N7 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N6 (y)) => N8 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N7 (y)) => N9 (plus (plus (x, y), N0 (D())))
    case (N2 (x), N8 (y)) => N0 (plus (plus (x, y), N1 (D())))
    case (N2 (x), N9 (y)) => N1 (plus (plus (x, y), N1 (D())))
    case (N3 (x), N3 (y)) => N6 (plus (plus (x, y), N0 (D())))
    case (N3 (x), N4 (y)) => N7 (plus (plus (x, y), N0 (D())))
    case (N3 (x), N5 (y)) => N8 (plus (plus (x, y), N0 (D())))
    case (N3 (x), N6 (y)) => N9 (plus (plus (x, y), N0 (D())))
    case (N3 (x), N7 (y)) => N0 (plus (plus (x, y), N1 (D())))
    case (N3 (x), N8 (y)) => N1 (plus (plus (x, y), N1 (D())))
    case (N3 (x), N9 (y)) => N2 (plus (plus (x, y), N1 (D())))
    case (N4 (x), N4 (y)) => N8 (plus (plus (x, y), N0 (D())))
    case (N4 (x), N5 (y)) => N9 (plus (plus (x, y), N0 (D())))
    case (N4 (x), N6 (y)) => N0 (plus (plus (x, y), N1 (D())))
    case (N4 (x), N7 (y)) => N1 (plus (plus (x, y), N1 (D())))
    case (N4 (x), N8 (y)) => N2 (plus (plus (x, y), N1 (D())))
    case (N4 (x), N9 (y)) => N3 (plus (plus (x, y), N1 (D())))
    case (N5 (x), N5 (y)) => N0 (plus (plus (x, y), N1 (D())))
    case (N5 (x), N6 (y)) => N1 (plus (plus (x, y), N1 (D())))
    case (N5 (x), N7 (y)) => N2 (plus (plus (x, y), N1 (D())))
    case (N5 (x), N8 (y)) => N3 (plus (plus (x, y), N1 (D())))
    case (N5 (x), N9 (y)) => N4 (plus (plus (x, y), N1 (D())))
    case (N6 (x), N6 (y)) => N2 (plus (plus (x, y), N1 (D())))
    case (N6 (x), N7 (y)) => N3 (plus (plus (x, y), N1 (D())))
    case (N6 (x), N8 (y)) => N4 (plus (plus (x, y), N1 (D())))
    case (N6 (x), N9 (y)) => N5 (plus (plus (x, y), N1 (D())))
    case (N7 (x), N7 (y)) => N4 (plus (plus (x, y), N1 (D())))
    case (N7 (x), N8 (y)) => N5 (plus (plus (x, y), N1 (D())))
    case (N7 (x), N9 (y)) => N6 (plus (plus (x, y), N1 (D())))
    case (N8 (x), N8 (y)) => N6 (plus (plus (x, y), N1 (D())))
    case (N8 (x), N9 (y)) => N7 (plus (plus (x, y), N1 (D())))
    case (N9 (x), N9 (y)) => N8 (plus (plus (x, y), N1 (D())))
    case (N1 (y), N0 (x) ) => N1 (plus (plus (x, y), N0 (D())))
    case (N2 (y), N0 (x) ) => N2 (plus (plus (x, y), N0 (D())))
    case (N3 (y), N0 (x) ) => N3 (plus (plus (x, y), N0 (D())))
    case (N4 (y), N0 (x) ) => N4 (plus (plus (x, y), N0 (D())))
    case (N5 (y), N0 (x) ) => N5 (plus (plus (x, y), N0 (D())))
    case (N6 (y), N0 (x) ) => N6 (plus (plus (x, y), N0 (D())))
    case (N7 (y), N0 (x) ) => N7 (plus (plus (x, y), N0 (D())))
    case (N8 (y), N0 (x) ) => N8 (plus (plus (x, y), N0 (D())))
    case (N9 (y), N0 (x) ) => N9 (plus (plus (x, y), N0 (D())))
    case (N2 (y), N1 (x) ) => N3 (plus (plus (x, y), N0 (D())))
    case (N3 (y), N1 (x) ) => N4 (plus (plus (x, y), N0 (D())))
    case (N4 (y), N1 (x) ) => N5 (plus (plus (x, y), N0 (D())))
    case (N5 (y), N1 (x) ) => N6 (plus (plus (x, y), N0 (D())))
    case (N6 (y), N1 (x) ) => N7 (plus (plus (x, y), N0 (D())))
    case (N7 (y), N1 (x) ) => N8 (plus (plus (x, y), N0 (D())))
    case (N8 (y), N1 (x) ) => N9 (plus (plus (x, y), N0 (D())))
    case (N9 (y), N1 (x) ) => N0 (plus (plus (x, y), N1 (D())))
    case (N3 (y), N2 (x) ) => N5 (plus (plus (x, y), N0 (D())))
    case (N4 (y), N2 (x) ) => N6 (plus (plus (x, y), N0 (D())))
    case (N5 (y), N2 (x) ) => N7 (plus (plus (x, y), N0 (D())))
    case (N6 (y), N2 (x) ) => N8 (plus (plus (x, y), N0 (D())))
    case (N7 (y), N2 (x) ) => N9 (plus (plus (x, y), N0 (D())))
    case (N8 (y), N2 (x) ) => N0 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N2 (x) ) => N1 (plus (plus (x, y), N1 (D())))
    case (N4 (y), N3 (x) ) => N7 (plus (plus (x, y), N0 (D())))
    case (N5 (y), N3 (x) ) => N8 (plus (plus (x, y), N0 (D())))
    case (N6 (y), N3 (x) ) => N9 (plus (plus (x, y), N0 (D())))
    case (N7 (y), N3 (x) ) => N0 (plus (plus (x, y), N1 (D())))
    case (N8 (y), N3 (x) ) => N1 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N3 (x) ) => N2 (plus (plus (x, y), N1 (D())))
    case (N5 (y), N4 (x) ) => N9 (plus (plus (x, y), N0 (D())))
    case (N6 (y), N4 (x) ) => N0 (plus (plus (x, y), N1 (D())))
    case (N7 (y), N4 (x) ) => N1 (plus (plus (x, y), N1 (D())))
    case (N8 (y), N4 (x) ) => N2 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N4 (x) ) => N3 (plus (plus (x, y), N1 (D())))
    case (N6 (y), N5 (x) ) => N1 (plus (plus (x, y), N1 (D())))
    case (N7 (y), N5 (x) ) => N2 (plus (plus (x, y), N1 (D())))
    case (N8 (y), N5 (x) ) => N3 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N5 (x) ) => N4 (plus (plus (x, y), N1 (D())))
    case (N7 (y), N6 (x) ) => N3 (plus (plus (x, y), N1 (D())))
    case (N8 (y), N6 (x) ) => N4 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N6 (x) ) => N5 (plus (plus (x, y), N1 (D())))
    case (N8 (y), N7 (x) ) => N5 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N7 (x) ) => N6 (plus (plus (x, y), N1 (D())))
    case (N9 (y), N8 (x) ) => N7 (plus (plus (x, y), N1 (D())))
  }

def mult0 (rec_x1:Nat):Nat =
  rec_x1 match {
    case x => D()
  }

def mult1 (rec_x1:Nat):Nat =
  rec_x1 match {
    case x => x
  }

def mult2 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult2 (x)))
    case N1 (x) => N2 (plus (N0 (D()), mult2 (x)))
    case N2 (x) => N4 (plus (N0 (D()), mult2 (x)))
    case N3 (x) => N6 (plus (N0 (D()), mult2 (x)))
    case N4 (x) => N8 (plus (N0 (D()), mult2 (x)))
    case N5 (x) => N0 (plus (N1 (D()), mult2 (x)))
    case N6 (x) => N2 (plus (N1 (D()), mult2 (x)))
    case N7 (x) => N4 (plus (N1 (D()), mult2 (x)))
    case N8 (x) => N6 (plus (N1 (D()), mult2 (x)))
    case N9 (x) => N8 (plus (N1 (D()), mult2 (x)))
  }

def mult3 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult3 (x)))
    case N1 (x) => N3 (plus (N0 (D()), mult3 (x)))
    case N2 (x) => N6 (plus (N0 (D()), mult3 (x)))
    case N3 (x) => N9 (plus (N0 (D()), mult3 (x)))
    case N4 (x) => N2 (plus (N1 (D()), mult3 (x)))
    case N5 (x) => N5 (plus (N1 (D()), mult3 (x)))
    case N6 (x) => N8 (plus (N1 (D()), mult3 (x)))
    case N7 (x) => N1 (plus (N2 (D()), mult3 (x)))
    case N8 (x) => N4 (plus (N2 (D()), mult3 (x)))
    case N9 (x) => N7 (plus (N2 (D()), mult3 (x)))
  }

def mult4 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult4 (x)))
    case N1 (x) => N4 (plus (N0 (D()), mult4 (x)))
    case N2 (x) => N8 (plus (N0 (D()), mult4 (x)))
    case N3 (x) => N2 (plus (N1 (D()), mult4 (x)))
    case N4 (x) => N6 (plus (N1 (D()), mult4 (x)))
    case N5 (x) => N0 (plus (N2 (D()), mult4 (x)))
    case N6 (x) => N4 (plus (N2 (D()), mult4 (x)))
    case N7 (x) => N8 (plus (N2 (D()), mult4 (x)))
    case N8 (x) => N2 (plus (N3 (D()), mult4 (x)))
    case N9 (x) => N6 (plus (N3 (D()), mult4 (x)))
  }

def mult5 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult5 (x)))
    case N1 (x) => N5 (plus (N0 (D()), mult5 (x)))
    case N2 (x) => N0 (plus (N1 (D()), mult5 (x)))
    case N3 (x) => N5 (plus (N1 (D()), mult5 (x)))
    case N4 (x) => N0 (plus (N2 (D()), mult5 (x)))
    case N5 (x) => N5 (plus (N2 (D()), mult5 (x)))
    case N6 (x) => N0 (plus (N3 (D()), mult5 (x)))
    case N7 (x) => N5 (plus (N3 (D()), mult5 (x)))
    case N8 (x) => N0 (plus (N4 (D()), mult5 (x)))
    case N9 (x) => N5 (plus (N4 (D()), mult5 (x)))
  }

def mult6 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult6 (x)))
    case N1 (x) => N6 (plus (N0 (D()), mult6 (x)))
    case N2 (x) => N2 (plus (N1 (D()), mult6 (x)))
    case N3 (x) => N8 (plus (N1 (D()), mult6 (x)))
    case N4 (x) => N4 (plus (N2 (D()), mult6 (x)))
    case N5 (x) => N0 (plus (N3 (D()), mult6 (x)))
    case N6 (x) => N6 (plus (N3 (D()), mult6 (x)))
    case N7 (x) => N2 (plus (N4 (D()), mult6 (x)))
    case N8 (x) => N8 (plus (N4 (D()), mult6 (x)))
    case N9 (x) => N4 (plus (N5 (D()), mult6 (x)))
  }

def mult7 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult7 (x)))
    case N1 (x) => N7 (plus (N0 (D()), mult7 (x)))
    case N2 (x) => N4 (plus (N1 (D()), mult7 (x)))
    case N3 (x) => N1 (plus (N2 (D()), mult7 (x)))
    case N4 (x) => N8 (plus (N2 (D()), mult7 (x)))
    case N5 (x) => N5 (plus (N3 (D()), mult7 (x)))
    case N6 (x) => N2 (plus (N4 (D()), mult7 (x)))
    case N7 (x) => N9 (plus (N4 (D()), mult7 (x)))
    case N8 (x) => N6 (plus (N5 (D()), mult7 (x)))
    case N9 (x) => N3 (plus (N6 (D()), mult7 (x)))
  }

def mult8 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult8 (x)))
    case N1 (x) => N8 (plus (N0 (D()), mult8 (x)))
    case N2 (x) => N6 (plus (N1 (D()), mult8 (x)))
    case N3 (x) => N4 (plus (N2 (D()), mult8 (x)))
    case N4 (x) => N2 (plus (N3 (D()), mult8 (x)))
    case N5 (x) => N0 (plus (N4 (D()), mult8 (x)))
    case N6 (x) => N8 (plus (N4 (D()), mult8 (x)))
    case N7 (x) => N6 (plus (N5 (D()), mult8 (x)))
    case N8 (x) => N4 (plus (N6 (D()), mult8 (x)))
    case N9 (x) => N2 (plus (N7 (D()), mult8 (x)))
  }

def mult9 (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => N0 (plus (N0 (D()), mult9 (x)))
    case N1 (x) => N9 (plus (N0 (D()), mult9 (x)))
    case N2 (x) => N8 (plus (N1 (D()), mult9 (x)))
    case N3 (x) => N7 (plus (N2 (D()), mult9 (x)))
    case N4 (x) => N6 (plus (N3 (D()), mult9 (x)))
    case N5 (x) => N5 (plus (N4 (D()), mult9 (x)))
    case N6 (x) => N4 (plus (N5 (D()), mult9 (x)))
    case N7 (x) => N3 (plus (N6 (D()), mult9 (x)))
    case N8 (x) => N2 (plus (N7 (D()), mult9 (x)))
    case N9 (x) => N1 (plus (N8 (D()), mult9 (x)))
  }

def times (rec_x1:Nat, rec_x2:Nat):Nat =
  (rec_x1, rec_x2) match {
    case (x, D()) => D()
    case (N0 (x), y) => plus (N0 (times (x, y)), mult0 (y))
    case (N1 (x), y) => plus (N0 (times (x, y)), mult1 (y))
    case (N2 (x), y) => plus (N0 (times (x, y)), mult2 (y))
    case (N3 (x), y) => plus (N0 (times (x, y)), mult3 (y))
    case (N4 (x), y) => plus (N0 (times (x, y)), mult4 (y))
    case (N5 (x), y) => plus (N0 (times (x, y)), mult5 (y))
    case (N6 (x), y) => plus (N0 (times (x, y)), mult6 (y))
    case (N7 (x), y) => plus (N0 (times (x, y)), mult7 (y))
    case (N8 (x), y) => plus (N0 (times (x, y)), mult8 (y))
    case (N9 (x), y) => plus (N0 (times (x, y)), mult9 (y))
    case (D(), x) => D()
  }

def prec (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) => D()
    case N1 (x) => N0 (x)
    case N2 (x) => N1 (x)
    case N3 (x) => N2 (x)
    case N4 (x) => N3 (x)
    case N5 (x) => N4 (x)
    case N6 (x) => N5 (x)
    case N7 (x) => N6 (x)
    case N8 (x) => N7 (x)
    case N9 (x) => N8 (x)
  }

def fact (rec_x1:Nat):Nat =
  rec_x1 match {
    case x if x == D() => N1 (D())
    case x if x != D() => times (x, fact (prec (x)))
  }

def fib (rec_x1:Nat):Nat =
  rec_x1 match {
    case x if x == D() => N1 (D())
    case x if x != D() && x == N1 (D()) => N1 (D())
    case x if x != D() && x != N1 (D()) => plus (fib (prec (x)), fib (prec (prec (x))))
  }

def reduce (rec_x1:Nat):Nat =
  rec_x1 match {
    case D() => D()
    case N0 (x) if reduce (x) == D() => D()
    case N0 (x) if reduce (x) != D() => N0 (reduce (x))
    case N1 (x) => N1 (reduce (x))
    case N2 (x) => N2 (reduce (x))
    case N3 (x) => N3 (reduce (x))
    case N4 (x) => N4 (reduce (x))
    case N5 (x) => N5 (reduce (x))
    case N6 (x) => N6 (reduce (x))
    case N7 (x) => N7 (reduce (x))
    case N8 (x) => N8 (reduce (x))
    case N9 (x) => N9 (reduce (x))
  }

def main (args:Array[String]):Unit = {
  println (reduce (fib (N6 (N1 (D())))))
  println (reduce (fib (N7 (N5 (D())))))
  }

}
