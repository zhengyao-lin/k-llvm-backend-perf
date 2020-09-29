module merge
import IO;

data Xbool = Xtrue() | Xfalse();

data Strg = A() | B() | C (Strg rec_x1_1, Strg rec_x2_1);

data List = Nil() | L (Strg rec_x1_1, List rec_x2_1);

Xbool gte (B(), A()) = Xtrue();
Xbool gte (A(), B()) = Xfalse();
Xbool gte (A(), A()) = Xtrue();
Xbool gte (B(), B()) = Xtrue();
Xbool gte (C (Strg e, Strg s), Strg e2) = gte (e, e2);
Xbool gte (Strg e, C (Strg e2, Strg s2)) { if (e == e2) return Xfalse(); else fail; }
Xbool gte (Strg e, C (Strg e2, Strg s2)) { if (e != e2) return gte (e, e2); else fail; }

List merge (Nil(), List l1) = l1;
List merge (List l1, Nil()) = l1;
List merge (L (Strg s, List l1), L (Strg s2, List l2)) { if (gte (s, s2) == Xtrue()) return L (s2, merge (L (s, l1), l2)); else fail; }
List merge (L (Strg s, List l1), L (Strg s2, List l2)) { if (gte (s, s2) == Xfalse()) return L (s, merge (l1, L (s2, l2))); else fail; }

List odd (Nil()) = Nil();
List odd (L (Strg s, Nil())) = L (s, Nil());
List odd (L (Strg s, L (Strg s2, List l1))) = L (s, odd (l1));

List even (Nil()) = Nil();
List even (L (Strg s, Nil())) = Nil();
List even (L (Strg s, L (Strg s2, List l1))) = L (s2, even (l1));

List sort (Nil()) = Nil();
List sort (L (Strg s, Nil())) = L (s, Nil());
List sort (L (Strg s, L (Strg s2, List l1))) = merge (sort (odd (L (s, L (s2, l1)))), sort (even (L (s, L (s2, l1)))));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (sort (L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))),L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))), L (C (A(), C (B(), C (A(), B()))), L (C (B(), C (A(), C (B(), B()))), L (C (A(), C (B(), C (A(), A()))), L (C (B(), C (B(), C (B(), B()))), L (C (B(), C (B(), C (B(), A()))), L (C (A(), C (A(), C (A(), B()))), L (C (B(), C (B(), C (A(), A()))), L (C (A(), C (A(), C (A(), A()))), L (C (A(), C (A(), C (B(), B()))), L (C (B(), C (A(), C (B(), A()))),Nil()))))))))))))))))))))))))))))))))))))))))))))))))))));
  return 0;
}
