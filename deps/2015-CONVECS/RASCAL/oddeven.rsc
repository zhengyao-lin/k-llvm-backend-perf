module oddeven
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = D0() | S (Nat rec_x1_1);

Xbool odd (D0()) = Xfalse();
Xbool odd (S (Nat n)) { if (even (n) == Xtrue()) return Xtrue(); else fail; }
Xbool odd (S (Nat n)) { if (even (n) == Xfalse()) return Xfalse(); else fail; }

Xbool even (D0()) = Xtrue();
Xbool even (S (Nat n)) { if (odd (n) == Xtrue()) return Xtrue(); else fail; }
Xbool even (S (Nat n)) { if (odd (n) == Xfalse()) return Xfalse(); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0())))))))))))))))));
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))))));
  println (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0())))))))))))))))))))))))))));
  return 0;
}
