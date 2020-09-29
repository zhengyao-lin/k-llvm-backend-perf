module fib32

import StdEnv;

:: Xbool =
     T
   | F

:: Pos =
     D1
   | CDub !Xbool !Pos

:: Xint =
     CInt !Nat
   | CNeg !Pos

:: Nat =
     D0
   | CNat !Pos

instance == Xbool where
   (==) (T) (T) = True
   (==) (F) (F) = True
   (==) rec_x rec_y = False

instance == Pos where
   (==) (D1) (D1) = True
   (==) (CDub rec_x1 rec_x2) (CDub rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Xint where
   (==) (CInt rec_x1) (CInt rec_y1) = (rec_x1 == rec_y1)
   (==) (CNeg rec_x1) (CNeg rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (CNat rec_x1) (CNat rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (T) = rec_file <<< "T"
   (<<<) rec_file (F) = rec_file <<< "F"

instance <<< Pos where
   (<<<) rec_file (D1) = rec_file <<< "D1"
   (<<<) rec_file (CDub rec_x1 rec_x2) = rec_file <<< "CDub" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Xint where
   (<<<) rec_file (CInt rec_x1) = rec_file <<< "CInt" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (CNeg rec_x1) = rec_file <<< "CNeg" <<< " (" <<< rec_x1 <<< ")"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
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
eqPos D1 D1 = T
eqPos D1 (CDub b p) = F
eqPos (CDub b p) D1 = F
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))

lePos :: !Pos !Pos -> Xbool
lePos D1 p = T
lePos (CDub b p) D1 = F
lePos (CDub b p) (CDub c q) 
| (b == c) = (lePos p q)
| (b <> c) && (b == F) = (lePos p q)
| (b <> c) && (b == T) = (ltPos p q)

ltPos :: !Pos !Pos -> Xbool
ltPos p D1 = F
ltPos D1 (CDub b p) = T
ltPos (CDub b p) (CDub c q) 
| (b == c) = (ltPos p q)
| (b <> c) && (b == F) = (lePos p q)
| (b <> c) && (b == T) = (ltPos p q)

s :: !Pos -> Pos
s D1 = (CDub F D1)
s (CDub F p) = (CDub T p)
s (CDub T p) = (CDub F (s p))

addc :: !Xbool !Pos !Pos -> Pos
addc F D1 p = (s p)
addc T D1 p = (s (s p))
addc F p D1 = (s p)
addc T p D1 = (s (s p))
addc b (CDub c p) (CDub d q) 
| (c == d) = (CDub b (addc c p q))
| (c <> d) = (CDub (xnot b) (addc c p q))

int2Nat :: !Xint -> Nat
int2Nat (CInt n) = n

minus :: !Nat -> Xint
minus D0 = (CInt D0)
minus (CNat p) = (CNeg p)

minus2 :: !Nat !Nat -> Xint
minus2 m n 
| ((ge m n) == T) = (CInt (gtesubt m n))
| ((ge m n) == F) = (minus (gtesubt n m))

pos2Nat :: !Pos -> Nat
pos2Nat p = (CNat p)

nat2Pos :: !Nat -> Pos
nat2Pos (CNat p) = p

eq :: !Nat !Nat -> Xbool
eq D0 D0 = T
eq D0 (CNat p) = F
eq (CNat p) D0 = F
eq (CNat p) (CNat q) = (eqPos p q)

le :: !Nat !Nat -> Xbool
le D0 n = T
le (CNat p) D0 = F
le (CNat p) (CNat q) = (lePos p q)

lt :: !Nat !Nat -> Xbool
lt n D0 = F
lt D0 (CNat p) = T
lt (CNat p) (CNat q) = (ltPos p q)

ge :: !Nat !Nat -> Xbool
ge m n = (le n m)

gt :: !Nat !Nat -> Xbool
gt m n = (lt n m)

pre :: !Pos -> Nat
pre D1 = D0
pre (CDub T p) = (CNat (CDub F p))
pre (CDub F p) = (dub T (pre p))

dub :: !Xbool !Nat -> Nat
dub F D0 = D0
dub T D0 = (CNat D1)
dub b (CNat p) = (CNat (CDub b p))

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus n D0 = n
plus (CNat p) (CNat q) = (CNat (addc F p q))

gtesubtPos :: !Pos !Pos -> Nat
gtesubtPos p q = (gtesubtb F p q)

gtesubt :: !Nat !Nat -> Nat
gtesubt n D0 = n
gtesubt (CNat p) (CNat q) = (gtesubtPos p q)

gtesubtb :: !Xbool !Pos !Pos -> Nat
gtesubtb F p D1 = (pre p)
gtesubtb T p D1 = (pre (nat2Pos (pre p)))
gtesubtb b (CDub c p) (CDub d q) 
| (c == d) = (dub b (gtesubtb b p q))
| (c <> d) && (c == F) = (dub (xnot b) (gtesubtb T p q))
| (c <> d) && (c == T) = (dub (xnot b) (gtesubtb d p q))

fib :: !Nat -> Nat
fib D0 = D0
fib (CNat D1) = (CNat D1)
fib (CNat (CDub b p)) = (plus (fib (int2Nat (minus2 (CNat (CDub b p)) (pos2Nat D1)))) (fib (int2Nat (minus2 (CNat (CDub b p)) (pos2Nat (CDub F D1))))))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (fib (pos2Nat (CDub F (CDub F (CDub F (CDub F (CDub F D1))))))) <<< "\n"
   = snd (fclose console world)
