module tak18
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = D0() | S (Nat rec_x1_1);

data Int = Pos (Nat rec_x1_1) | Neg (Nat rec_x1_2);

Xbool gte (D0(), D0()) = Xtrue();
Xbool gte (S (Nat x), D0()) = Xtrue();
Xbool gte (D0(), S (Nat x)) = Xfalse();
Xbool gte (S (Nat x), S (Nat y)) = gte (x, y);

Xbool gte_Int (Pos (Nat x), Pos (Nat y)) = gte (x,y);
Xbool gte_Int (Neg (Nat x), Neg (Nat y)) = gte (y,x);
Xbool gte_Int (Pos (Nat x), Neg (Nat y)) = Xtrue();
Xbool gte_Int (Neg (Nat x), Pos (Nat y)) = Xfalse();

Int pred (Pos (D0())) = Neg (D0());
Int pred (Pos (S (Nat x))) = Pos (x);
Int pred (Neg (Nat x)) = Neg (S (x));

Int succ (Neg (D0())) = Pos (D0());
Int succ (Neg (S (Nat x))) = Neg (x);
Int succ (Pos (Nat x)) = Pos (S (x));

Int tak (Int i, Int j, Int k) { if (gte_Int (j, i) == Xtrue()) return k; else fail; }
Int tak (Int i, Int j, Int k) { if (gte_Int (j, i) == Xfalse()) return tak (tak (pred (i), j, k), tak (pred (j), k, i), tak (pred (k), i, j)); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (tak (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))))))))), Pos (S (S (S (S (S (S (S (S (S (S (S (S (D0()))))))))))))), Pos (S (S (S (S (S (S (D0())))))))));
  return 0;
}
