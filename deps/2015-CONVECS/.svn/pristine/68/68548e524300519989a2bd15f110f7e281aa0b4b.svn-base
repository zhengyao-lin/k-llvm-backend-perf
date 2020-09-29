module sieve2000
import IO;

data Xbool = Xtrue() | Xfalse();

data Nat = S (Nat rec_x1_1) | Z();

data Digit = D0() | D1() | D2() | D3() | D4() | D5() | D6() | D7() | D8() | D9();

data List = Nil() | D (Digit rec_x1_1) | Dl (Digit rec_x1_2, List rec_x2_2) | L (Nat rec_x1_3, List rec_x2_3) | Ll (List rec_x1_4, List rec_x2_4);

Nat two() = S (S (Z()));

Nat ten() = S (S (S (S (S (S (S (S (S (S (Z()))))))))));

List digitList() = Dl (D0(), Dl (D1(), Dl (D2(), Dl (D3(), Dl (D4(), Dl (D5(), Dl (D6(), Dl (D7(), Dl (D8(), Dl (D9(), Nil()))))))))));

Nat ifNat (Xtrue(), Nat n, Nat m) = n;
Nat ifNat (Xfalse(), Nat n, Nat m) = m;

List conv (Nat x) { if (lt (x, ten()) == Xtrue()) return Dl (digit (x), Nil()); else fail; }
List conv (Nat x) { if (lt (x, ten()) == Xfalse()) return ap (conv (div (x, ten())), conv (rem (x, ten()))); else fail; }

Nat rem (Nat x, Nat y) { if (y != Z()) return ifNat (lt (x, y), x, rem (sub (x, y), y)); else fail; }

Nat div (Nat x, Nat y) { if (y != Z()) return ifNat (lt (x, y), Z(), S (div (sub (x, y), y))); else fail; }

Xbool lt (Z(), S (Nat x)) = Xtrue();
Xbool lt (Nat x, Z()) = Xfalse();
Xbool lt (S (Nat x), S (Nat y)) = lt (x, y);

Nat sub (Z(), S (Nat y)) = Z();
Nat sub (Nat x, Z()) = x;
Nat sub (S (Nat x), S (Nat y)) = sub (x, y);

Digit digit (Nat x) = find (digitList(), x);

Digit find (Dl (Digit dig, List l1), Z()) = dig;
Digit find (Dl (Digit dig, List l1), S (Nat x)) = find (l1, x);

List ap (Nil(), List l1) = l1;
List ap (Dl (Digit dig, List l1), List l2) = Dl (dig, ap (l1, l2));

Nat add (Z(), Nat y) = y;
Nat add (S (Nat x), Nat y) = S (add (x, y));

Nat mult (Z(), Nat y) = Z();
Nat mult (S (Nat x), Nat y) = add (y, mult (x, y));

Nat fact (Z()) = S (Z());
Nat fact (S (Nat x)) = mult (S (x), fact (x));

Xbool divides (Nat n, Nat m) { if (m != Z()) return auxdiv (n, m, m); else fail; }

Xbool auxdiv (Z(), Z(), Nat m) = Xtrue();
Xbool auxdiv (Z(), S (Nat x), Nat m) = Xfalse();
Xbool auxdiv (S (Nat x), S (Nat y), Nat m) = auxdiv (x, y, m);
Xbool auxdiv (S (Nat x), Z(), Nat m) = auxdiv (S (x), m, m);

List intsBetween (Nat n, Nat m) { if (n == m) return Nil(); else fail; }
List intsBetween (Nat n, Nat m) { if (n != m) return L (n, intsBetween (S (n), m)); else fail; }

List sieve (L (Nat n, List l1)) = L (n, sieve (xfilter (l1, n)));
List sieve (Nil()) = Nil();

List xfilter (L (Nat n, List l1), Nat m) { if (divides (n, m) == Xtrue()) return xfilter (l1, m); else fail; }
List xfilter (L (Nat n, List l1), Nat m) { if (divides (n, m) == Xfalse()) return L (n, xfilter (l1, m)); else fail; }
List xfilter (Nil(), Nat m) = Nil();

List e (Nat n, List l1) = Ll (conv (n), l1);

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (sieve (intsBetween (S (S (Z())), mult (two(), mult (ten(), mult (ten(), ten()))))));
  return 0;
}
