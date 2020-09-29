module evaltree
import IO;

data Xbool = Xtrue() | Xfalse();

data Pos = D1() | CDub (Xbool rec_x1_1, Pos rec_x2_1);

data Xtree = Leaf (SNat rec_x1_1) | Xnode (SNat rec_x1_2, SNat rec_x2_2, Xtree rec_x3_2, Xtree rec_x4_2);

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

Xbool lambda6 (SNat n) = xeq (evaltree17 (n),getval (buildtree (n,Z())));

Xtree lambda5 (SNat n,Xtree xleft) = lambda4 (n,xleft,getmax (xleft),getval (xleft));

Xtree lambda4 (SNat n,Xtree xleft,SNat xmax,SNat xo) = lambda3 (xo,xleft,buildtree (n,succ17 (xmax)));

Xtree lambda3 (SNat n,Xtree xleft,Xtree xright) = lambda2 (n,xleft,xright,getval (xright),getmax (xright));

Xtree lambda2 (SNat n,Xtree xleft,Xtree xright,SNat xo,SNat xmax) = lambda1 (xmax,xleft,xright,plus17 (n,xo));

Xtree lambda1 (SNat xmax,Xtree xleft,Xtree xright,SNat n) = Xnode (n,xmax,xleft,xright);

SNat lambda0 (SNat n,SNat xo) = mult17 (n,xo);

Xbool xeq (Z(),Z()) = Xtrue();
Xbool xeq (Z(),S (SNat n)) = Xfalse();
Xbool xeq (S (SNat n),Z()) = Xfalse();
Xbool xeq (S (SNat n),S (SNat xo)) = xeq (n,xo);

SNat succ17 (SNat n) { if (xeq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xtrue()) return Z(); else fail; }
SNat succ17 (SNat n) { if (xeq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))))) == Xfalse()) return S (n); else fail; }

SNat pred17 (Z()) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z()))))))))))))))));
SNat pred17 (S (SNat n)) = n;

SNat plus17 (SNat n,Z()) = n;
SNat plus17 (SNat n,S (SNat xo)) = succ17 (plus17 (n,xo));

SNat mult17 (SNat n,Z()) = Z();
SNat mult17 (SNat n,S (SNat xo)) = plus17 (n,mult17 (n,xo));

SNat exp17 (SNat n,Z()) = succ17 (Z());
SNat exp17 (SNat n,S (SNat xo)) = mult17 (n,exp17 (n,xo));

SNat evaltree17 (SNat n) = lambda0 (exp17 (S (S (Z())),pred17 (n)),pred17 (exp17 (S (S (Z())),n)));

SNat getval (Leaf (SNat n)) = n;
SNat getval (Xnode (SNat n,SNat xmax,Xtree xleft,Xtree xright)) = n;

SNat getmax (Leaf (SNat n)) = n;
SNat getmax (Xnode (SNat n,SNat xmax,Xtree xleft,Xtree xright)) = xmax;

Xtree buildtree (Z(),SNat n) = Leaf (n);
Xtree buildtree (S (SNat n),SNat xo) = lambda5 (n,buildtree (n,xo));

SNat seventeen() = S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z() )))) ))))) ))))) )))));

Xbool f (SNat n) = lambda6 (seventeen());

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (seventeen()));
  return 0;
}
