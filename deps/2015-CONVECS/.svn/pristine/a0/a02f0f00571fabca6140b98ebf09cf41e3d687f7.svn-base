module searchinconditions
import IO;

data Xbool = Xtrue() | Xfalse();

Xbool a() = Xtrue();

Xbool xnot (Xbool x) { if (x == Xfalse()) return Xtrue(); else fail; }
Xbool xnot (Xbool x) { if (x == Xtrue()) return Xfalse(); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (xnot (a()));
  return 0;
}
