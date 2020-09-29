module bubblesort20
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = D0() | S (Nat rec_x1_1);

data NatList = Nil() | Cons (Nat rec_x1_1, NatList rec_x2_1);

Nat d10() = S (S (S (S (S (S (S (S (S (S (D0()))))))))));

Xbool lt (D0(),D0()) = Xfalse();
Xbool lt (D0(), S (Nat n)) = Xtrue();
Xbool lt (S (Nat n), D0()) = Xfalse();
Xbool lt (S (Nat n), S (Nat m)) = lt (n, m);

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

Nat fact (D0()) = S (D0());
Nat fact (S (Nat n)) = times (S (n), fact (n));

NatList rev (S (Nat n)) = bubsort (S (n), rev (n));
NatList rev (D0()) = Cons (D0(), Nil());

NatList bubsort (Nat n, Nil()) = Cons (n, Nil());
NatList bubsort (Nat n, Cons (Nat m, NatList l)) { if (lt (m, n) == Xtrue()) return Cons (m, bubsort (n, l)); else fail; }
NatList bubsort (Nat n, Cons (Nat m, NatList l)) { if (lt (m, n) == Xfalse()) return Cons (n, bubsort (m, l)); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (rev (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))))));
  return 0;
}
