module mergesort100
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = D0() | S (Nat rec_x1_1);

data NatList = Nil() | Cons (Nat rec_x1_1, NatList rec_x2_1);

data ListPair = Pair (NatList rec_x1_1, NatList rec_x2_1);

Nat d10() = S (S (S (S (S (S (S (S (S (S (D0()))))))))));

Xbool lte (D0(), S (Nat n)) = Xtrue();
Xbool lte (S (Nat n), D0()) = Xfalse();
Xbool lte (D0(), D0()) = Xtrue();
Xbool lte (S (Nat n), S (Nat m)) = lte (n, m);

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

NatList rev (S (Nat n)) = Cons (S (n), rev (n));
NatList rev (D0()) = Cons (D0(), Nil());

NatList merge (Nil(), NatList l) = l;
NatList merge (NatList l, Nil()) = l;
NatList merge (Cons (Nat x, NatList l1), Cons (Nat y, NatList l2)) { if (lte (x, y) == Xtrue()) return Cons (x, merge (l1, Cons (y, l2))); else fail; }
NatList merge (Cons (Nat x, NatList l1), Cons (Nat y, NatList l2)) { if (lte (x, y) == Xfalse()) return Cons (y, merge (Cons (x, l1), l2)); else fail; }

ListPair split (Cons (Nat x, Cons (Nat y, NatList l))) = Pair (Cons (x, p1 (split (l))), Cons (y, p2 (split (l))));
ListPair split (Nil()) = Pair (Nil(), Nil());
ListPair split (Cons (Nat x, Nil())) = Pair (Cons (x, Nil()), Nil());

NatList mergesort (Nil()) = Nil();
NatList mergesort (Cons (Nat x, Nil())) = Cons (x, Nil());
NatList mergesort (Cons (Nat x, Cons (Nat y, NatList l))) = merge (mergesort (Cons (x, p1 (split (l)))), mergesort (Cons (y, p2 (split (l)))));

NatList p1 (Pair (NatList l1, NatList l2)) = l1;

NatList p2 (Pair (NatList l1, NatList l2)) = l2;

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (mergesort (rev (times (d10(), d10()))));
  return 0;
}
