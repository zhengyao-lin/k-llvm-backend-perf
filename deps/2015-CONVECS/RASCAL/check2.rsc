module check2
import IO;

data Xbool = Xtrue() | Xfalse();

Xbool notBool (Xtrue()) = Xfalse();
Xbool notBool (Xfalse()) = Xtrue();

Xbool andBool (Xbool p, Xtrue()) = p;
Xbool andBool (Xbool p, Xfalse()) = Xfalse();

Xbool orBool (Xbool p, Xtrue()) = Xtrue();
Xbool orBool (Xbool p, Xfalse()) = p;

Xbool xorBool (Xbool p, Xbool q) = orBool (andBool (p, notBool (q)), andBool (q, notBool (p)));

Xbool impliesBool (Xbool p, Xbool q) = orBool (q, notBool (p));

Xbool iffBool (Xbool p, Xbool q) = andBool (impliesBool (p, q), impliesBool (q, p));

Xbool eqBool (Xbool p, Xbool q) = iffBool (p, q);

Xbool neBool (Xbool p, Xbool q) = xorBool (p, q);

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (neBool (Xfalse(), Xtrue()));
  return 0;
}
