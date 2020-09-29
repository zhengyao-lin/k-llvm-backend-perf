module factorial6
import IO;

data Nat = D0() | S (Nat rec_x1_1);

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

Nat fact (D0()) = S (D0());
Nat fact (S (Nat n)) = times (S (n), fact (n));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (fact (S (S (S (S (S (S (D0()))))))));
  return 0;
}
