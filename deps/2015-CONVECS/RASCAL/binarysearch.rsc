module binarysearch
import IO;

data Xbool = T() | F();

data Pos = Xone() | CDub (Xbool rec_x1_1, Pos rec_x2_1);

data Int = CInt (Nat rec_x1_1) | CNeg (Pos rec_x1_2);

data Nat = Zero() | CNat (Pos rec_x1_1);

Xbool eqBool (T(),Xbool b) = b;
Xbool eqBool (F(),T()) = F();
Xbool eqBool (F(),F()) = T();

Xbool xand (T(),Xbool b) = b;
Xbool xand (F(),Xbool b) = F();

Xbool xnot (T()) = F();
Xbool xnot (F()) = T();

Xbool eqPos (Xone(),Xone()) = T();
Xbool eqPos (Xone(),CDub (Xbool b,Pos p)) = F();
Xbool eqPos (CDub (Xbool b,Pos p),Xone()) = F();
Xbool eqPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) = xand (eqBool (b,c), eqPos (p,q));

Xbool lePos (Xone(),Pos p) = T();
Xbool lePos (CDub (Xbool b,Pos p),Xone()) = F();
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b == c) return lePos (p,q); else fail; }
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == F()) return lePos (p,q); else fail; }
Xbool lePos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == T()) return ltPos (p,q); else fail; }

Xbool ltPos (Pos p,Xone()) = F();
Xbool ltPos (Xone(),CDub (Xbool b,Pos p)) = T();
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b == c) return ltPos (p,q); else fail; }
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == F()) return lePos (p,q); else fail; }
Xbool ltPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) { if (b != c && b == T()) return ltPos (p,q); else fail; }

Xbool gePos (Pos p,Pos q) = lePos (q,p);

Pos succ2Pos (Xone()) = CDub (F(),Xone());
Pos succ2Pos (CDub (F(),Pos p)) = CDub (T(),p);
Pos succ2Pos (CDub (T(),Pos p)) = CDub (F(),succ2Pos (p));

Pos plusPos (Pos p,Pos q) = addc (F(),p,q);

Pos addc (F(),Xone(),Pos p) = succ2Pos (p);
Pos addc (T(),Xone(),Pos p) = succ2Pos (succ2Pos (p));
Pos addc (F(),Pos p,Xone()) = succ2Pos (p);
Pos addc (T(),Pos p,Xone()) = succ2Pos (succ2Pos (p));
Pos addc (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c == d) return CDub (b,addc (c,p,q)); else fail; }
Pos addc (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c != d) return CDub (xnot (b),addc (b,p,q)); else fail; }

Nat lambda0 (Nat n,Nat y,Nat x,Nat h) { if (lt (f (h),n) == T()) return bs2 (n,h,y); else fail; }
Nat lambda0 (Nat n,Nat y,Nat x,Nat h) { if (lt (f (h),n) == F()) return bs2 (n,x,h); else fail; }

Nat max2Int (CInt (Nat m),Nat n) = max2 (m,n);
Nat max2Int (CNeg (Pos p),Nat n) = n;

Int min2 (Zero()) = CInt (Zero());
Int min2 (CNat (Pos p)) = CNeg (p);

Int minus (Nat m,Nat n) { if (ge (m,n) == T()) return CInt (gtesubtn (m,n)); else fail; }
Int minus (Nat m,Nat n) { if (lt (m,n) == T()) return min2 (gtesubtn (n,m)); else fail; }

Xbool xeq (Zero(),Zero()) = T();
Xbool xeq (Zero(),CNat (Pos p)) = F();
Xbool xeq (CNat (Pos p),Zero()) = F();
Xbool xeq (CNat (Pos p),CNat (Pos q)) = eqPos (p,q);

Nat ite (T(),Nat m,Nat n) = m;
Nat ite (F(),Nat m,Nat n) = n;

Nat pos2Nat (Pos p) = CNat (p);

Pos nat2Pos (CNat (Pos p)) = p;

Xbool le (Zero(),Nat n) = T();
Xbool le (CNat (Pos p),Zero()) = F();
Xbool le (CNat (Pos p),CNat (Pos q)) = lePos (p,q);

Xbool lt (Nat n,Zero()) = F();
Xbool lt (Zero(),CNat (Pos p)) = T();
Xbool lt (CNat (Pos p),CNat (Pos q)) = ltPos (p,q);

Xbool ge (Nat m,Nat n) = le (n,m);

Nat max2 (Nat m,Nat n) = ite (le (m,n),n,m);

Pos succ2 (Zero()) = Xone();
Pos succ2 (CNat (Pos p)) = succ2Pos (p);

Nat pred2 (Xone()) = Zero();
Nat pred2 (CDub (T(),Pos p)) = CNat (CDub (F(),p));
Nat pred2 (CDub (F(),Pos p)) = dub (T(),pred2 (p));

Nat dub (F(),Zero()) = Zero();
Nat dub (T(),Zero()) = CNat (Xone());
Nat dub (Xbool b,CNat (Pos p)) = CNat (CDub (b,p));

Pos plusNatPos (Zero(),Pos p) = p;
Pos plusNatPos (CNat (Pos p),Pos q) = plusPos (p,q);

Nat plus (Zero(),Nat n) = n;
Nat plus (Nat n,Zero()) = n;
Nat plus (CNat (Pos p),CNat (Pos q)) = CNat (addc (F(),p,q));

Nat gtesubtp (Pos p,Pos q) = gtesubtb (F(),p,q);

Nat gtesubtn (Nat n,Zero()) = n;
Nat gtesubtn (CNat (Pos p),CNat (Pos q)) = gtesubtp (p,q);

Nat gtesubtb (F(),Pos p,Xone()) = pred2 (p);
Nat gtesubtb (T(),Pos p,Xone()) = pred2 (nat2Pos (pred2 (p)));
Nat gtesubtb (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c == d) return dub (b,gtesubtb (b,p,q)); else fail; }
Nat gtesubtb (Xbool b,CDub (Xbool c,Pos p),CDub (Xbool d,Pos q)) { if (c != d) return dub (xnot (b),gtesubtb (d,p,q)); else fail; }

Nat dividePos (Pos p,Pos q) { if (gePos (p,q) == T()) return CNat (succ2 (divide (gtesubtp (p,q),q))); else fail; }
Nat dividePos (Pos p,Pos q) { if (ltPos (p,q) == T()) return Zero(); else fail; }

Nat divide (Zero(),Pos p) = Zero();
Nat divide (CNat (Pos p),Pos q) = dividePos (p,q);

Nat f (Zero()) = Zero();
Nat f (CNat (Xone())) = CNat (Xone());
Nat f (CNat (CDub (Xbool b,Pos p))) = plus (f (max2Int (minus (CNat (CDub (b,p)),pos2Nat (Xone())),Zero())),f (max2Int (minus (CNat (CDub (b,p)),pos2Nat (CDub (F(),Xone()))),Zero())));

Nat bs (Nat n,Nat m) = bs2 (n,Zero(),m);

Nat bs2 (Nat n,Nat x,Nat y) { if (xeq (pos2Nat (plusNatPos (x,Xone())),y) == T()) return x; else fail; }
Nat bs2 (Nat n,Nat x,Nat y) { if (xeq (pos2Nat (plusNatPos (x,Xone())),y) == F()) return lambda0 (n,y,x,divide (plus (x,y),CDub (F(),Xone()))); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (bs (pos2Nat (CDub (T(),CDub (T(),CDub (F(),CDub (T(),CDub (F(),CDub (T(),CDub (T(),CDub (F(),CDub (T(),CDub (F(),CDub (T(),Xone())))))))))))),pos2Nat (CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),CDub (F(),Xone())))))))));
  return 0;
}
