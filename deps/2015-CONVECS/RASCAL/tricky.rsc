module tricky
import IO;

data NSingleton = Ncons();

data USingleton = Ucons (Nat rec_x1_1);

data Nat = D0() | Succ (Nat rec_x1_1);

Nat d1() = Succ (D0());

Nat d2() { if (D0() == D0()) return D0(); else fail; }

Nat d3() { if (D0() != D0()) return D0(); else fail; }
Nat d3() { if (Succ (D0()) == D0()) return D0(); else fail; }
Nat d3() { if (Succ (D0()) != D0()) return Succ (D0()); else fail; }

Nat f (Nat n) { if (n != D0() && n != Succ (D0())) return n; else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (Ncons());
  println (Ucons (D0()));
  println (d1());
  println (d2());
  println (d3());
  return 0;
}
