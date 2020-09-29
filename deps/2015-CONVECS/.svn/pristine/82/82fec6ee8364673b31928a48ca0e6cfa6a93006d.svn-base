module quicksort10
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = D0() | S (Nat rec_x1_1);

data NatList = Nil() | Cons (Nat rec_x1_1, NatList rec_x2_1);

data NatListPair = Pair (NatList rec_x1_1, NatList rec_x2_1);

Nat d10() = S (S (S (S (S (S (S (S (S (S (D0()))))))))));

Xbool xnot (Xtrue()) = Xfalse();
Xbool xnot (Xfalse()) = Xtrue();

Xbool st (D0(), S (Nat n)) = Xtrue();
Xbool st (S (Nat n), D0()) = Xfalse();
Xbool st (D0(), D0()) = Xfalse();
Xbool st (S (Nat n), S (Nat m)) = st (n, m);

Xbool get (Nat n, Nat m) = xnot (st (n, m));

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

NatList rev (S (Nat n)) = Cons (S (n), rev (n));
NatList rev (D0()) = Cons (D0(), Nil());

NatListPair split (Nat n, Cons (Nat m, NatList l)) { if (st (n, m) == Xtrue()) return Pair (p1 (split (n, l)), Cons (m, p2 (split (n, l)))); else fail; }
NatListPair split (Nat n, Cons (Nat m, NatList l)) { if (get (n, m) == Xtrue()) return Pair (Cons (m, p1 (split (n, l))), p2 (split (n, l))); else fail; }
NatListPair split (Nat n, Nil()) = Pair (Nil(), Nil());

NatList xappend (Cons (Nat n, NatList l), NatList lT) = Cons (n, xappend (l, lT));
NatList xappend (Nil(), NatList l) = l;

NatList qsort (Nil()) = Nil();
NatList qsort (Cons (Nat n, NatList l)) = xappend (qsort (p1 (split (n, l))), Cons (n, qsort (p2 (split (n, l)))));

NatList p1 (Pair (NatList l1, NatList l2)) = l1;

NatList p2 (Pair (NatList l1, NatList l2)) = l2;

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (qsort (rev (d10())));
  return 0;
}
