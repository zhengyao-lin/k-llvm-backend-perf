module revnat10000
import IO;

data List = L (Nat rec_x1_1, List rec_x2_1) | Nil();

data Nat = D0() | S (Nat rec_x1_1);

Nat d10() = S (S (S (S (S (S (S (S (S (S (D0()))))))))));

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

List gen (S (Nat n)) = L (S (n), gen (n));
List gen (D0()) = L (D0(), Nil());

List conc (L (Nat e, List l1), List l2) = L (e, conc (l1, l2));
List conc (Nil(), List l2) = l2;

List rev (L (Nat e, List l1)) = conc (rev (l1), L (e, Nil()));
List rev (Nil()) = Nil();

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (rev (gen (times (d10(), times (d10(), times (d10(), d10()))))));
  return 0;
}
