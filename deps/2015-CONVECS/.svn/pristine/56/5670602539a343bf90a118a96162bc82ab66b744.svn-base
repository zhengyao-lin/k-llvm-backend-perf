sealed abstract class Bool
  case class True() extends Bool
  case class False() extends Bool

sealed abstract class Pos
  case class D1() extends Pos
  case class CDub (rec_x1:Bool, rec_x2:Pos) extends Pos

sealed abstract class Tree
  case class Leaf (rec_x1:SNat) extends Tree
  case class Node (rec_x1:SNat, rec_x2:SNat, rec_x3:Tree, rec_x4:Tree) extends Tree

sealed abstract class SNat
  case class Z() extends SNat
  case class S (rec_x1:SNat) extends SNat

object evaltree {

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

def lambda6 (rec_x1:SNat):Bool =
  rec_x1 match {
    case n => eq (evaltree17 (n),getval (buildtree (n,Z())))
  }

def lambda5 (rec_x1:SNat, rec_x2:Tree):Tree =
  (rec_x1, rec_x2) match {
    case (n,left) => lambda4 (n,left,getmax (left),getval (left))
  }

def lambda4 (rec_x1:SNat, rec_x2:Tree, rec_x3:SNat, rec_x4:SNat):Tree =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (n,left,max,o) => lambda3 (o,left,buildtree (n,succ17 (max)))
  }

def lambda3 (rec_x1:SNat, rec_x2:Tree, rec_x3:Tree):Tree =
  (rec_x1, rec_x2, rec_x3) match {
    case (n,left,right) => lambda2 (n,left,right,getval (right),getmax (right))
  }

def lambda2 (rec_x1:SNat, rec_x2:Tree, rec_x3:Tree, rec_x4:SNat, rec_x5:SNat):Tree =
  (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5) match {
    case (n,left,right,o,max) => lambda1 (max,left,right,plus17 (n,o))
  }

def lambda1 (rec_x1:SNat, rec_x2:Tree, rec_x3:Tree, rec_x4:SNat):Tree =
  (rec_x1, rec_x2, rec_x3, rec_x4) match {
    case (max,left,right,n) => Node (n,max,left,right)
  }

def lambda0 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (n,o) => mult17 (n,o)
  }

def eq (rec_x1:SNat, rec_x2:SNat):Bool =
  (rec_x1, rec_x2) match {
    case (Z(),Z()) => True()
    case (Z(),S (n)) => False()
    case (S (n),Z()) => False()
    case (S (n),S (o)) => eq (n,o)
  }

def succ17 (rec_x1:SNat):SNat =
  rec_x1 match {
    case n if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == True() => Z()
    case n if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == False() => S (n)
  }

def pred17 (rec_x1:SNat):SNat =
  rec_x1 match {
    case Z() => S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))
    case S (n) => n
  }

def plus17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (n,Z()) => n
    case (n,S (o)) => succ17 (plus17 (n,o))
  }

def mult17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (n,Z()) => Z()
    case (n,S (o)) => plus17 (n,mult17 (n,o))
  }

def exp17 (rec_x1:SNat, rec_x2:SNat):SNat =
  (rec_x1, rec_x2) match {
    case (n,Z()) => succ17 (Z())
    case (n,S (o)) => mult17 (n,exp17 (n,o))
  }

def evaltree17 (rec_x1:SNat):SNat =
  rec_x1 match {
    case n => lambda0 (exp17 (S (S (Z())),pred17 (n)),pred17 (exp17 (S (S (Z())),n)))
  }

def getval (rec_x1:Tree):SNat =
  rec_x1 match {
    case Leaf (n) => n
    case Node (n,max,left,right) => n
  }

def getmax (rec_x1:Tree):SNat =
  rec_x1 match {
    case Leaf (n) => n
    case Node (n,max,left,right) => max
  }

def buildtree (rec_x1:SNat, rec_x2:SNat):Tree =
  (rec_x1, rec_x2) match {
    case (Z(),n) => Leaf (n)
    case (S (n),o) => lambda5 (n,buildtree (n,o))
  }

def seventeen():SNat = S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z() )))) ))))) ))))) )))))

def f (rec_x1:SNat):Bool =
  rec_x1 match {
    case n => lambda6 (seventeen())
  }

def main (args:Array[String]):Unit = {
  println (f (seventeen()))
  }

}
