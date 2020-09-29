module fib32
import IO;

data Xbool = T() | F();

data Pos = D1() | CDub (Xbool rec_x1_1, Pos rec_x2_1);

data Int = CInt (Nat rec_x1_1) | CNeg (Pos rec_x1_2);

data Nat = D0() | CNat (Pos rec_x1_1);

Xbool eqBool (T(),Xbool b) = b;
Xbool eqBool (F(),T()) = F();
Xbool eqBool (F(),F()) = T();

Xbool xand (T(),Xbool b) = b;
Xbool xand (F(),Xbool b) = F();

Xbool xnot (T()) = F();
Xbool xnot (F()) = T();

Xbool eqPos (D1(),D1()) = T();
Xbool eqPos (D1(),CDub (Xbool b,Pos p)) = F();
Xbool eqPos (CDub (Xbool b,Pos p),D1()) = F();
Xbool eqPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) = xand (eqBool (b,c),eqPos (p,q));

Xbool lePos (D1(),Pos p) = T();
Xbool lePos (CDub (Xbool b,Pos p),D1()) = F();
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b == c) return lePos (p,q); else fail; }
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == F()) return lePos (p,q); else fail; }
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == T()) return ltPos (p,q); else fail; }

Xbool ltPos (Pos p,D1()) = F();
Xbool ltPos (D1(),CDub (Xbool b,Pos p)) = T();
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b == c) return ltPos (p,q); else fail; }
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == F()) return lePos (p,q); else fail; }
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == T()) return ltPos (p,q); else fail; }

Pos s (D1()) = CDub (F(),D1());
Pos s (CDub (F(),Pos p)) = CDub (T(),p);
Pos s (CDub (T(),Pos p)) = CDub (F(),s (p));

Pos addc (F(),D1(),Pos p) = s (p);
Pos addc (T(),D1(),Pos p) = s (s (p));
Pos addc (F(),Pos p,D1()) = s (p);
Pos addc (T(),Pos p,D1()) = s (s (p));
Pos addc (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c == d) return CDub (b,addc (c,p,q)); else fail; }
Pos addc (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c != d) return CDub (xnot (b),addc (c,p,q)); else fail; }

Nat int2Nat (CInt (Nat n)) = n;

Int minus (D0()) = CInt (D0());
Int minus (CNat (Pos p)) = CNeg (p);

Int minus2 (Nat m,Nat n) { if (ge (m,n) == T()) return CInt (gtesubt (m,n)); else fail; }
Int minus2 (Nat m,Nat n) { if (ge (m,n) == F()) return minus (gtesubt (n,m)); else fail; }

Nat pos2Nat (Pos p) = CNat (p);

Pos nat2Pos (CNat (Pos p)) = p;

Xbool xeq (D0(),D0()) = T();
Xbool xeq (D0(),CNat (Pos p)) = F();
Xbool xeq (CNat (Pos p),D0()) = F();
Xbool xeq (CNat (Pos p),CNat (Pos q)) = eqPos (p,q);

Xbool le (D0(),Nat n) = T();
Xbool le (CNat (Pos p),D0()) = F();
Xbool le (CNat (Pos p),CNat (Pos q)) = lePos (p,q);

Xbool lt (Nat n,D0()) = F();
Xbool lt (D0(),CNat (Pos p)) = T();
Xbool lt (CNat (Pos p),CNat (Pos q)) = ltPos (p,q);

Xbool ge (Nat m,Nat n) = le (n,m);

Xbool gt (Nat m,Nat n) = lt (n,m);

Nat pre (D1()) = D0();
Nat pre (CDub (T(),Pos p)) = CNat (CDub (F(),p));
Nat pre (CDub (F(),Pos p)) = dub (T(),pre (p));

Nat dub (F(),D0()) = D0();
Nat dub (T(),D0()) = CNat (D1());
Nat dub (Xbool b,CNat (Pos p)) = CNat (CDub (b,p));

Nat plus (D0(),Nat n) = n;
Nat plus (Nat n,D0()) = n;
Nat plus (CNat (Pos p),CNat (Pos q)) = CNat (addc (F(),p,q));

Nat gtesubtPos (Pos p,Pos q) = gtesubtb (F(),p,q);

Nat gtesubt (Nat n,D0()) = n;
Nat gtesubt (CNat (Pos p),CNat (Pos q)) = gtesubtPos (p,q);

Nat gtesubtb (F(),Pos p,D1()) = pre (p);
Nat gtesubtb (T(),Pos p,D1()) = pre (nat2Pos (pre (p)));
Nat gtesubtb (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c == d) return dub (b,gtesubtb (b,p,q)); else fail; }
Nat gtesubtb (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c != d && c == F()) return dub (xnot (b),gtesubtb (T(),p,q)); else fail; }
Nat gtesubtb (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c != d && c == T()) return dub (xnot (b),gtesubtb (d,p,q)); else fail; }

Nat fib (D0()) = D0();
Nat fib (CNat (D1())) = CNat (D1());
Nat fib (CNat (CDub (Xbool b,Pos p))) = plus (fib (int2Nat (minus2 (CNat (CDub (b,p)),pos2Nat (D1())))),fib (int2Nat (minus2 (CNat (CDub (b,p)),pos2Nat (CDub (F(),D1()))))));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (fib (pos2Nat (CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),D1()))))))));
  return 0;
}
