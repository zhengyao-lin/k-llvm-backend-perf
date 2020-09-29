module dart
import IO;

data Nat = D0() | S (Nat rec_x1_1);

data Set = Empty() | Singleton (Nat rec_x1_1) | Union (Set rec_x1_2, Set rec_x2_2);

Nat plus (D0(), Nat n) = n;
Nat plus (S (Nat n), Nat m) = S (plus (n, m));

Nat times (D0(), Nat n) = D0();
Nat times (S (Nat n), Nat m) = plus (m, times (n, m));

Set u (Empty(), Set s0) = s0;
Set u (Set s0, Empty()) = s0;
Set u (Set s0, Set s1) { if (s0 == s1) return s0; else fail; }
Set u (Set s0, Set s1) { if (s0 != s1) return flat (s0, flat (s1, Empty())); else fail; }

Set flat (Empty(), Set s0) = s0;
Set flat (Singleton (Nat i), Set s0) = Union (Singleton (i), s0);
Set flat (Union (Set s1, Set s2), Set s0) = flat (s1, flat (s2, s0));

Set add (Empty(), Set s0) = s0;
Set add (Set s0, Empty()) = s0;
Set add (Singleton (Nat i), Singleton (Nat j)) = Singleton (plus (i, j));
Set add (Singleton (Nat i), Union (Singleton (Nat j), Set s0)) = add (Singleton (plus (i, j)), s0);
Set add (Union (Singleton (Nat i), Set s1), Set s2) = u (add (Singleton (i), s2), add (s1, s2));

Set mult (Empty(), Set s0) = s0;
Set mult (Set s0, Empty()) = s0;
Set mult (Singleton (Nat i), Singleton (Nat j)) = Singleton (times (i, j));
Set mult (Union (Singleton (Nat i), Set s1), Set s2) = u (mult (Singleton (i), s2), mult (s1, s2));

Nat five() = S (S (S (S (S (D0())))));

Nat ten() = S (S (S (S (S (five())))));

Nat fifteen() = S (S (S (S (S (ten())))));

Nat twentyfive() = S (S (S (S (S (S (S (S (S (S (fifteen()))))))))));

Nat fifty() = plus (twentyfive(), twentyfive());

Set singles() = add (Singleton (S (D0())), add (Singleton (S (S (D0()))), add (Singleton (S (S (S (D0())))),add (Singleton (S (S (S (S (D0()))))), add (Singleton (five()),add (Singleton (S (five())), add (Singleton (S (S (five()))),add (Singleton (S (S (S (five())))), add (Singleton (S (S (S (S (five()))))), add (Singleton (ten()), add (Singleton (S (ten())), add (Singleton (S (S (ten()))),add (Singleton (S (S (S (ten())))), add (Singleton (S (S (S (S (ten()))))), add (Singleton (fifteen()),add (Singleton (S (fifteen())), add (Singleton (S (S (fifteen()))), add (Singleton (S (S (S (fifteen())))), add (Singleton (S (S (S (S (fifteen()))))), Singleton (plus (five(), fifteen())))))))))))))))))))));

Set doubles() = mult (singles(), Singleton (S (S (D0()))));

Set triples() = mult (singles(), Singleton (S (S (S (D0())))));

Set allops() = u (u (u (u (u (singles(), doubles()), triples()), Singleton (twentyfive())), Singleton (fifty())), Singleton (D0()));

Set finish() = add (u (doubles(), Singleton (fifty())), add (allops(), allops()));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (finish());
  return 0;
}
