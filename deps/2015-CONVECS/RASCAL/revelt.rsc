module revelt
import IO;

data List = L (Elt rec_x1_1, List rec_x2_1) | Nil();

data Elt = A() | B() | C() | D() | E();

List conc (L (Elt e0, List l1), List l2) = L (e0, conc (l1, l2));
List conc (Nil(), List l2) = l2;

List dup (List l1) = conc (l1, l1);

List rev (L (Elt e0, List l1)) = conc (rev (l1), L (e0, Nil()));
List rev (Nil()) = Nil();

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (rev (dup (L (A(), L (B(), L (C(), L (D(), L (E(), Nil()))))))));
  return 0;
}
