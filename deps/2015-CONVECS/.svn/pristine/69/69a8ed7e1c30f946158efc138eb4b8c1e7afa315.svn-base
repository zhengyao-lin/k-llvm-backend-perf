module binarysearch

import StdEnv;

:: Xbool =
     T
   | F

:: Pos =
     Xone
   | CDub !Xbool !Pos

:: Xint =
     CInt !Nat
   | CNeg !Pos

:: Nat =
     Zero
   | CNat !Pos

instance == Xbool where
   (==) (T) (T) = True
   (==) (F) (F) = True
   (==) rec_x rec_y = False

instance == Pos where
   (==) (Xone) (Xone) = True
   (==) (CDub rec_x1 rec_x2) (CDub rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Xint where
   (==) (CInt rec_x1) (CInt rec_y1) = (rec_x1 == rec_y1)
   (==) (CNeg rec_x1) (CNeg rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Nat where
   (==) (Zero) (Zero) = True
   (==) (CNat rec_x1) (CNat rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (T) = rec_file <<< "T"
   (<<<) rec_file (F) = rec_file <<< "F"

instance <<< Pos where
   (<<<) rec_file (Xone) = rec_file <<< "Xone"
   (<<<) rec_file (CDub rec_x1 rec_x2) = rec_file <<< "CDub" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Xint where
   (<<<) rec_file (CInt rec_x1) = rec_file <<< "CInt" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (CNeg rec_x1) = rec_file <<< "CNeg" <<< " (" <<< rec_x1 <<< ")"

instance <<< Nat where
   (<<<) rec_file (Zero) = rec_file <<< "Zero"
   (<<<) rec_file (CNat rec_x1) = rec_file <<< "CNat" <<< " (" <<< rec_x1 <<< ")"

eqBool :: !Xbool !Xbool -> Xbool
eqBool T b = b
eqBool F T = F
eqBool F F = T

xand :: !Xbool !Xbool -> Xbool
xand T b = b
xand F b = F

xnot :: !Xbool -> Xbool
xnot T = F
xnot F = T

eqPos :: !Pos !Pos -> Xbool
eqPos Xone Xone = T
eqPos Xone (CDub b p) = F
eqPos (CDub b p) Xone = F
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))

lePos :: !Pos !Pos -> Xbool
lePos Xone p = T
lePos (CDub b p) Xone = F
lePos (CDub b p) (CDub c q) 
| (b == c) = (lePos p q)
| (b <> c) && (b == F) = (lePos p q)
| (b <> c) && (b == T) = (ltPos p q)

ltPos :: !Pos !Pos -> Xbool
ltPos p Xone = F
ltPos Xone (CDub b p) = T
ltPos (CDub b p) (CDub c q) 
| (b == c) = (ltPos p q)
| (b <> c) && (b == F) = (lePos p q)
| (b <> c) && (b == T) = (ltPos p q)

gePos :: !Pos !Pos -> Xbool
gePos p q = (lePos q p)

succ2Pos :: !Pos -> Pos
succ2Pos Xone = (CDub F Xone)
succ2Pos (CDub F p) = (CDub T p)
succ2Pos (CDub T p) = (CDub F (succ2Pos p))

plusPos :: !Pos !Pos -> Pos
plusPos p q = (addc F p q)

addc :: !Xbool !Pos !Pos -> Pos
addc F Xone p = (succ2Pos p)
addc T Xone p = (succ2Pos (succ2Pos p))
addc F p Xone = (succ2Pos p)
addc T p Xone = (succ2Pos (succ2Pos p))
addc b (CDub c p) (CDub d q) 
| (c == d) = (CDub b (addc c p q))
| (c <> d) = (CDub (xnot b) (addc b p q))

lambda0 :: !Nat !Nat !Nat !Nat -> Nat
lambda0 n y x h 
| ((lt (f h) n) == T) = (bs2 n h y)
| ((lt (f h) n) == F) = (bs2 n x h)

max2Int :: !Xint !Nat -> Nat
max2Int (CInt m) n = (max2 m n)
max2Int (CNeg p) n = n

min2 :: !Nat -> Xint
min2 Zero = (CInt Zero)
min2 (CNat p) = (CNeg p)

minus :: !Nat !Nat -> Xint
minus m n 
| ((ge m n) == T) = (CInt (gtesubtn m n))
| ((lt m n) == T) = (min2 (gtesubtn n m))

eq :: !Nat !Nat -> Xbool
eq Zero Zero = T
eq Zero (CNat p) = F
eq (CNat p) Zero = F
eq (CNat p) (CNat q) = (eqPos p q)

ite :: !Xbool !Nat !Nat -> Nat
ite T m n = m
ite F m n = n

pos2Nat :: !Pos -> Nat
pos2Nat p = (CNat p)

nat2Pos :: !Nat -> Pos
nat2Pos (CNat p) = p

le :: !Nat !Nat -> Xbool
le Zero n = T
le (CNat p) Zero = F
le (CNat p) (CNat q) = (lePos p q)

lt :: !Nat !Nat -> Xbool
lt n Zero = F
lt Zero (CNat p) = T
lt (CNat p) (CNat q) = (ltPos p q)

ge :: !Nat !Nat -> Xbool
ge m n = (le n m)

max2 :: !Nat !Nat -> Nat
max2 m n = (ite (le m n) n m)

succ2 :: !Nat -> Pos
succ2 Zero = Xone
succ2 (CNat p) = (succ2Pos p)

pred2 :: !Pos -> Nat
pred2 Xone = Zero
pred2 (CDub T p) = (CNat (CDub F p))
pred2 (CDub F p) = (dub T (pred2 p))

dub :: !Xbool !Nat -> Nat
dub F Zero = Zero
dub T Zero = (CNat Xone)
dub b (CNat p) = (CNat (CDub b p))

plusNatPos :: !Nat !Pos -> Pos
plusNatPos Zero p = p
plusNatPos (CNat p) q = (plusPos p q)

plus :: !Nat !Nat -> Nat
plus Zero n = n
plus n Zero = n
plus (CNat p) (CNat q) = (CNat (addc F p q))

gtesubtp :: !Pos !Pos -> Nat
gtesubtp p q = (gtesubtb F p q)

gtesubtn :: !Nat !Nat -> Nat
gtesubtn n Zero = n
gtesubtn (CNat p) (CNat q) = (gtesubtp p q)

gtesubtb :: !Xbool !Pos !Pos -> Nat
gtesubtb F p Xone = (pred2 p)
gtesubtb T p Xone = (pred2 (nat2Pos (pred2 p)))
gtesubtb b (CDub c p) (CDub d q) 
| (c == d) = (dub b (gtesubtb b p q))
| (c <> d) = (dub (xnot b) (gtesubtb d p q))

dividePos :: !Pos !Pos -> Nat
dividePos p q 
| ((gePos p q) == T) = (CNat (succ2 (divide (gtesubtp p q) q)))
| ((ltPos p q) == T) = Zero

divide :: !Nat !Pos -> Nat
divide Zero p = Zero
divide (CNat p) q = (dividePos p q)

f :: !Nat -> Nat
f Zero = Zero
f (CNat Xone) = (CNat Xone)
f (CNat (CDub b p)) = (plus (f (max2Int (minus (CNat (CDub b p)) (pos2Nat Xone)) Zero)) (f (max2Int (minus (CNat (CDub b p)) (pos2Nat (CDub F Xone))) Zero)))

bs :: !Nat !Nat -> Nat
bs n m = (bs2 n Zero m)

bs2 :: !Nat !Nat !Nat -> Nat
bs2 n x y 
| ((eq (pos2Nat (plusNatPos x Xone)) y) == T) = x
| ((eq (pos2Nat (plusNatPos x Xone)) y) == F) = (lambda0 n y x (divide (plus x y) (CDub F Xone)))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (bs (pos2Nat (CDub T (CDub T (CDub F (CDub T (CDub F (CDub T (CDub T (CDub F (CDub T (CDub F (CDub T Xone)))))))))))) (pos2Nat (CDub F (CDub F (CDub F (CDub F (CDub F (CDub F Xone)))))))) <<< "\n"
   = snd (fclose console world)
