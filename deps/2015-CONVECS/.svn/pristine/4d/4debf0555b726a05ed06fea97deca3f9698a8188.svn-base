module garbagecollection
import IO;

data Nat = D0() | S (Nat rec_x1_1) | P() | N();

Nat d1() = S (D0());

Nat c (D0(), Nat y) = y;
Nat c (S (Nat x), Nat y) = S (c (x,y));

Nat f (Nat x, Nat y, S (Nat z), Nat t, Nat u) = f (x, y, z, c (t, t), u);
Nat f (Nat x, S (Nat y), D0(), Nat t, Nat u) = f (x, y, P(), t, t);
Nat f (S (Nat x), D0(), D0(), Nat t, Nat u) = f (x, N(), P(), d1(), D0());
Nat f (D0(), D0(), D0(), Nat t, Nat u) = t;
Nat f (Nat x, S (Nat y), P(), Nat t, Nat u) = f (x, y, P(), t, S (u));
Nat f (Nat x, D0(), P(), Nat t, Nat u) = f (x, N(), P(), S (t), u);
Nat f (S (Nat x), N(), P(), Nat t, Nat u) = f (x, N(), P(), t, u);
Nat f (D0(), N(), P(), Nat t, Nat u) = u;

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (S (S (S (S (S (S (D0())))))), S (S (S (S (S (D0()))))), S (S (D0())), D0(), d1()));
  println (f (S (S (S (S (D0())))), S (S (S (D0()))), S (S (S (S (S (D0()))))), D0(), d1()));
  return 0;
}
