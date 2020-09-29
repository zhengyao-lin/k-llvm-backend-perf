module evalsym
import IO;

data Xbool = Xtrue() | Xfalse();

data Pos = D1() | CDub (Xbool rec_x1_1, Pos rec_x2_1);

data ENat = Exz() | Exs (ENat rec_x1_1) | Explus (ENat rec_x1_2, ENat rec_x2_2) | Exmult (ENat rec_x1_3, ENat rec_x2_3) | Exexp (ENat rec_x1_4, ENat rec_x2_4);

data SNat = Z() | S (SNat rec_x1_1);

Xbool eqBool (Xtrue(),Xbool b) = b;
Xbool eqBool (Xfalse(),Xtrue()) = Xfalse();
Xbool eqBool (Xfalse(),Xfalse()) = Xtrue();

Xbool xand (Xbool b,Xtrue()) = b;
Xbool xand (Xbool b,Xfalse()) = Xfalse();

Xbool eqPos (D1(),D1()) = Xtrue();
Xbool eqPos (D1(),CDub (Xbool b,Pos p)) = Xfalse();
Xbool eqPos (CDub (Xbool b,Pos p),D1()) = Xfalse();
Xbool eqPos (CDub (Xbool b,Pos p),CDub (Xbool c,Pos q)) = xand (eqBool (b,c), eqPos (p,q));

Xbool lambda0 (ENat m) = xeq (eval17 (m),evalsym17 (m));

Xbool xeq (Z(),Z()) = Xtrue();
Xbool xeq (Z(),S (SNat r)) = Xfalse();
Xbool xeq (S (SNat r),Z()) = Xfalse();
Xbool xeq (S (SNat r),S (SNat t)) = xeq (r,t);

SNat succ17 (SNat r) { if (xeq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xtrue()) return Z(); else fail; }
SNat succ17 (SNat r) { if (xeq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xfalse()) return S (r); else fail; }

SNat plus17 (SNat r,Z()) = r;
SNat plus17 (SNat r,S (SNat t)) = succ17 (plus17 (r,t));

SNat mult17 (SNat r,Z()) = Z();
SNat mult17 (SNat r,S (SNat t)) = plus17 (r,mult17 (r,t));

SNat exp17 (SNat r,Z()) = succ17 (Z());
SNat exp17 (SNat r,S (SNat t)) = mult17 (r,exp17 (r,t));

SNat eval17 (Exz()) = Z();
SNat eval17 (Exs (ENat n)) = succ17 (eval17 (n));
SNat eval17 (Explus (ENat n,ENat m)) = plus17 (eval17 (n),eval17 (m));
SNat eval17 (Exmult (ENat n,ENat m)) = mult17 (eval17 (n),eval17 (m));
SNat eval17 (Exexp (ENat n,ENat m)) = exp17 (eval17 (n),eval17 (m));

SNat evalsym17 (Exz()) = Z();
SNat evalsym17 (Exs (ENat n)) = succ17 (evalsym17 (n));
SNat evalsym17 (Explus (ENat n,ENat m)) = plus17 (evalsym17 (n),evalsym17 (m));
SNat evalsym17 (Exmult (ENat n,Exz())) = Z();
SNat evalsym17 (Exmult (ENat n,Exs (ENat m))) = evalsym17 (Explus (Exmult (n,m),n));
SNat evalsym17 (Exmult (ENat n,Explus (ENat m,ENat xo))) = evalsym17 (Explus (Exmult (n,m),Exmult (n,xo)));
SNat evalsym17 (Exmult (ENat n,Exmult (ENat m,ENat xo))) = evalsym17 (Exmult (Exmult (n,m),xo));
SNat evalsym17 (Exmult (ENat n,Exexp (ENat m,ENat xo))) = evalsym17 (Exmult (n,dec (Exexp (m,xo))));
SNat evalsym17 (Exexp (ENat n,Exz())) = succ17 (Z());
SNat evalsym17 (Exexp (ENat n,Exs (ENat m))) = evalsym17 (Exmult (Exexp (n,m),n));
SNat evalsym17 (Exexp (ENat n,Explus (ENat m,ENat xo))) = evalsym17 (Exmult (Exexp (n,m),Exexp (n,xo)));
SNat evalsym17 (Exexp (ENat n,Exmult (ENat m,ENat xo))) = evalsym17 (Exexp (Exexp (n,m),xo));
SNat evalsym17 (Exexp (ENat n,Exexp (ENat m,ENat xo))) = evalsym17 (Exexp (n,dec (Exexp (m,xo))));

ENat dec (Exexp (ENat n,Exz())) = Exs (Exz());
ENat dec (Exexp (ENat n,Exs (ENat m))) = Exmult (Exexp (n,m),n);
ENat dec (Exexp (ENat n,Explus (ENat m,ENat xo))) = Exmult (Exexp (n,m),Exexp (n,xo));
ENat dec (Exexp (ENat n,Exmult (ENat m,ENat xo))) = dec (Exexp (Exexp (n,m),xo));
ENat dec (Exexp (ENat n,Exexp (ENat m,ENat xo))) = dec (Exexp (n,dec (Exexp (m,xo))));

ENat two() = Exs (Exs (Exz()));

ENat seventeen() = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz()))))))))))))))))))))))));

Xbool f (ENat m) = lambda0 (Exexp (two(),m));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (seventeen()));
  return 0;
}
