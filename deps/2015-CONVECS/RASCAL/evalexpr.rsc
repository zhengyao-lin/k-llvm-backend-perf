module evalexpr
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

Xbool lambda0 (ENat m) = xeq (eval17 (m),evalexp17 (m));

Xbool xeq (Z(),Z()) = Xtrue();
Xbool xeq (Z(),S (SNat r)) = Xfalse();
Xbool xeq (S (SNat r),Z()) = Xfalse();
Xbool xeq (S (SNat r),S (SNat t)) = xeq (r,t);

Xbool eqENat (Exz(),Exz()) = Xtrue();
Xbool eqENat (Exz(),Exs (ENat m)) = Xfalse();
Xbool eqENat (Exz(),Explus (ENat m,ENat n)) = Xfalse();
Xbool eqENat (Exz(),Exmult (ENat m,ENat n)) = Xfalse();
Xbool eqENat (Exz(),Exexp (ENat m,ENat n)) = Xfalse();
Xbool eqENat (Exs (ENat m),Exz()) = Xfalse();
Xbool eqENat (Exs (ENat n),Exs (ENat m)) = eqENat (n,m);
Xbool eqENat (Exs (ENat m),Explus (ENat n,ENat xo)) = Xfalse();
Xbool eqENat (Exs (ENat n),Exmult (ENat m,ENat xo)) = Xfalse();
Xbool eqENat (Exs (ENat m),Exexp (ENat n,ENat xo)) = Xfalse();
Xbool eqENat (Explus (ENat n,ENat m),Exz()) = Xfalse();
Xbool eqENat (Explus (ENat m,ENat n),Exs (ENat xo)) = Xfalse();
Xbool eqENat (Explus (ENat n,ENat m),Explus (ENat xo,ENat l)) = xand (eqENat (n,xo),eqENat (m,l));
Xbool eqENat (Explus (ENat m,ENat n),Exmult (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Explus (ENat n,ENat m),Exexp (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Exmult (ENat m,ENat n),Exz()) = Xfalse();
Xbool eqENat (Exmult (ENat n,ENat m),Exs (ENat xo)) = Xfalse();
Xbool eqENat (Exmult (ENat m,ENat n),Explus (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Exmult (ENat n,ENat m),Exmult (ENat xo,ENat l)) = xand (eqENat (n,xo),eqENat (m,l));
Xbool eqENat (Exmult (ENat m,ENat n),Exexp (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Exexp (ENat n,ENat m),Exz()) = Xfalse();
Xbool eqENat (Exexp (ENat m,ENat n),Exs (ENat xo)) = Xfalse();
Xbool eqENat (Exexp (ENat n,ENat m),Explus (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Exexp (ENat m,ENat n),Exmult (ENat xo,ENat l)) = Xfalse();
Xbool eqENat (Exexp (ENat m,ENat n),Exexp (ENat xo,ENat l)) = xand (eqENat (m,xo),eqENat (n,l));

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

SNat evalexp17 (ENat n) = eval17 (expand (n));

ENat expand (Exz()) = Exz();
ENat expand (Exs (ENat n)) = Explus (Exs (Exz()),n);
ENat expand (Explus (ENat n,ENat m)) = Explus (expand (n),expand (m));
ENat expand (Exmult (ENat n,Exz())) = Exz();
ENat expand (Exmult (ENat n,Exs (Exz()))) = expand (n);
ENat expand (Exmult (ENat n,Explus (ENat m,ENat xo))) = expand (Explus (Exmult (n,m),Exmult (n,xo)));
ENat expand (Exmult (ENat n,Exmult (ENat m,ENat xo))) = expand (Exmult (n,expand (Exmult (m,xo))));
ENat expand (Exmult (ENat n,Exexp (ENat m,ENat xo))) = expand (Exmult (n,expand (Exexp (m,xo))));
ENat expand (Exexp (ENat n,Exz())) = Exs (Exz());
ENat expand (Exexp (ENat n,Exs (ENat m))) { if (eqENat (m,Exz()) == Xtrue()) return expand (n); else fail; }
ENat expand (Exexp (ENat n,Exs (ENat m))) { if (eqENat (m,Exz()) == Xfalse()) return expand (Exexp (n,expand (Exs (m)))); else fail; }
ENat expand (Exexp (ENat n,Explus (ENat m,ENat xo))) = expand (Exmult (Exexp (n,m),Exexp (n,xo)));
ENat expand (Exexp (ENat n,Exmult (ENat m,ENat xo))) = expand (Exexp (n,expand (Exmult (m,xo))));
ENat expand (Exexp (ENat n,Exexp (ENat m,ENat xo))) = expand (Exexp (n,expand (Exexp (m,xo))));

ENat two() = Exs (Exs (Exz()));

ENat seventeen() = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz())))))))))))))))))));

Xbool f (ENat m) = lambda0 (Exexp (two(),m));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (seventeen()));
  return 0;
}
