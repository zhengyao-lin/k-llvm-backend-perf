data Xbool = T | F
  deriving (Show, Eq, Ord)

data Pos = One | CDub Xbool Pos 
  deriving (Show, Eq, Ord)

data Xint = CInt Nat  | CNeg Pos 
  deriving (Show, Eq, Ord)

data Nat = Zero | CNat Pos 
  deriving (Show, Eq, Ord)

eqBool :: Xbool -> Xbool -> Xbool
xnot :: Xbool -> Xbool
xand :: Xbool -> Xbool -> Xbool
eqPos :: Pos -> Pos -> Xbool
lePos :: Pos -> Pos -> Xbool
ltPos :: Pos -> Pos -> Xbool
gePos :: Pos -> Pos -> Xbool
succ2Pos :: Pos -> Pos
plusPos :: Pos -> Pos -> Pos
addc :: Xbool -> Pos -> Pos -> Pos
lambda0 :: Nat -> Nat -> Nat -> Nat -> Nat
max2Int :: Xint -> Nat -> Nat
min2 :: Nat -> Xint
minus :: Nat -> Nat -> Xint
eq :: Nat -> Nat -> Xbool
ite :: Xbool -> Nat -> Nat -> Nat
pos2Nat :: Pos -> Nat
nat2Pos :: Nat -> Pos
le :: Nat -> Nat -> Xbool
lt :: Nat -> Nat -> Xbool
ge :: Nat -> Nat -> Xbool
max2 :: Nat -> Nat -> Nat
succ2 :: Nat -> Pos
pred2 :: Pos -> Nat
dub :: Xbool -> Nat -> Nat
plusNatPos :: Nat -> Pos -> Pos
plus :: Nat -> Nat -> Nat
gtesubtp :: Pos -> Pos -> Nat
gtesubtn :: Nat -> Nat -> Nat
gtesubtb :: Xbool -> Pos -> Pos -> Nat
dividePos :: Pos -> Pos -> Nat
divide :: Nat -> Pos -> Nat
f :: Nat -> Nat
bs :: Nat -> Nat -> Nat
bs2 :: Nat -> Nat -> Nat -> Nat

eqBool T b = b
eqBool F T = F
eqBool F F = T
xand T b = b
xand F b = F
xnot T = F
xnot F = T
eqPos One One = T
eqPos One (CDub b p) = F
eqPos (CDub b p) One = F
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))
lePos One p = T
lePos (CDub b p) One = F
lePos (CDub b p) (CDub c q) | b == c = (lePos p q)
lePos (CDub b p) (CDub c q) | b /= c && b == F = (lePos p q)
lePos (CDub b p) (CDub c q) | b /= c && b == T = (ltPos p q)
ltPos p One = F
ltPos One (CDub b p) = T
ltPos (CDub b p) (CDub c q) | b == c = (ltPos p q)
ltPos (CDub b p) (CDub c q) | b /= c && b == F = (lePos p q)
ltPos (CDub b p) (CDub c q) | b /= c && b == T = (ltPos p q)
gePos p q = (lePos q p)
succ2Pos One = (CDub F One)
succ2Pos (CDub F p) = (CDub T p)
succ2Pos (CDub T p) = (CDub F (succ2Pos p))
plusPos p q = (addc F p q)
addc F One p = (succ2Pos p)
addc T One p = (succ2Pos (succ2Pos p))
addc F p One = (succ2Pos p)
addc T p One = (succ2Pos (succ2Pos p))
addc b (CDub c p) (CDub d q) | c == d = (CDub b (addc c p q))
addc b (CDub c p) (CDub d q) | c /= d = (CDub (xnot b) (addc b p q))
lambda0 n y x h | (lt (f h) n) == T = (bs2 n h y)
lambda0 n y x h | (lt (f h) n) == F = (bs2 n x h)
max2Int (CInt m) n = (max2 m n)
max2Int (CNeg p) n = n
min2 Zero = (CInt Zero)
min2 (CNat p) = (CNeg p)
minus m n | (ge m n) == T = (CInt (gtesubtn m n))
minus m n | (lt m n) == T = (min2 (gtesubtn n m))
eq Zero Zero = T
eq Zero (CNat p) = F
eq (CNat p) Zero = F
eq (CNat p) (CNat q) = (eqPos p q)
ite T m n = m
ite F m n = n
pos2Nat p = (CNat p)
nat2Pos (CNat p) = p
le Zero n = T
le (CNat p) Zero = F
le (CNat p) (CNat q) = (lePos p q)
lt n Zero = F
lt Zero (CNat p) = T
lt (CNat p) (CNat q) = (ltPos p q)
ge m n = (le n m)
max2 m n = (ite (le m n) n m)
succ2 Zero = One
succ2 (CNat p) = (succ2Pos p)
pred2 One = Zero
pred2 (CDub T p) = (CNat (CDub F p))
pred2 (CDub F p) = (dub T (pred2 p))
dub F Zero = Zero
dub T Zero = (CNat One)
dub b (CNat p) = (CNat (CDub b p))
plusNatPos Zero p = p
plusNatPos (CNat p) q = (plusPos p q)
plus Zero n = n
plus n Zero = n
plus (CNat p) (CNat q) = (CNat (addc F p q))
gtesubtp p q = (gtesubtb F p q)
gtesubtn n Zero = n
gtesubtn (CNat p) (CNat q) = (gtesubtp p q)
gtesubtb F p One = (pred2 p)
gtesubtb T p One = (pred2 (nat2Pos (pred2 p)))
gtesubtb b (CDub c p) (CDub d q) | c == d = (dub b (gtesubtb b p q))
gtesubtb b (CDub c p) (CDub d q) | c /= d = (dub (xnot b) (gtesubtb d p q))
dividePos p q | (gePos p q) == T = (CNat (succ2 (divide (gtesubtp p q) q)))
dividePos p q | (ltPos p q) == T = Zero
divide Zero p = Zero
divide (CNat p) q = (dividePos p q)
f Zero = Zero
f (CNat One) = (CNat One)
f (CNat (CDub b p)) = (plus (f (max2Int (minus (CNat (CDub b p)) (pos2Nat One)) Zero)) (f (max2Int (minus (CNat (CDub b p)) (pos2Nat (CDub F One))) Zero)))
bs n m = (bs2 n Zero m)
bs2 n x y | (eq (pos2Nat (plusNatPos x One)) y) == T = x
bs2 n x y | (eq (pos2Nat (plusNatPos x One)) y) == F = (lambda0 n y x (divide (plus x y) (CDub F One)))

main = do
 print (bs (pos2Nat (CDub T (CDub T (CDub F (CDub T (CDub F (CDub T (CDub T (CDub F (CDub T (CDub F (CDub T One)))))))))))) (pos2Nat (CDub F (CDub F (CDub F (CDub F (CDub F (CDub F One))))))))
