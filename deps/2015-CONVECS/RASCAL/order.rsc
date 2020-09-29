module order
import IO;

data Nat = D0() | S (Nat rec_x1_1);

Nat g (D0()) = D0();
Nat g (S (Nat x)) = x;

Nat f (S (Nat x)) { if (x == D0()) return D0(); else fail; }
Nat f (S (Nat x)) { if (x != D0()) return x; else fail; }
Nat f (D0()) = S (D0());

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (g (D0())));
  return 0;
}
