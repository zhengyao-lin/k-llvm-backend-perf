module fibonacci20
import IO;

data Nat = D0() | S (Nat rec_x1_1);

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat fibb (D0()) = D0();
Nat fibb (S (D0())) = S (D0());
Nat fibb (S (S (Nat n))) = plus (fibb (S (n)), fibb (n));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (fibb (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))))));
  return 0;
}
