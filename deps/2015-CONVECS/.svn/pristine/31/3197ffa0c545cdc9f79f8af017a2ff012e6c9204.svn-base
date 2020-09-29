data Xbool = T | F
  deriving (Show, Eq, Ord)

data Pos = D1 | CDub Xbool Pos 
  deriving (Show, Eq, Ord)

data Xint = CInt Nat  | CNeg Pos 
  deriving (Show, Eq, Ord)

data Nat = D0 | CNat Pos 
  deriving (Show, Eq, Ord)

xnot :: Xbool -> Xbool
eqPos :: Pos -> Pos -> Xbool
lePos :: Pos -> Pos -> Xbool
ltPos :: Pos -> Pos -> Xbool
s :: Pos -> Pos
addc :: Xbool -> Pos -> Pos -> Pos
int2Nat :: Xint -> Nat
minus :: Nat -> Xint
minus2 :: Nat -> Nat -> Xint
eq :: Nat -> Nat -> Xbool
pos2Nat :: Pos -> Nat
nat2Pos :: Nat -> Pos
le :: Nat -> Nat -> Xbool
lt :: Nat -> Nat -> Xbool
ge :: Nat -> Nat -> Xbool
gt :: Nat -> Nat -> Xbool
pre :: Pos -> Nat
dub :: Xbool -> Nat -> Nat
plus :: Nat -> Nat -> Nat
gtesubtPos :: Pos -> Pos -> Nat
gtesubt :: Nat -> Nat -> Nat
gtesubtb :: Xbool -> Pos -> Pos -> Nat
fib :: Nat -> Nat
eqBool :: Xbool -> Xbool -> Xbool
xand :: Xbool -> Xbool -> Xbool

eqBool T b = b
eqBool F T = F
eqBool F F = T
xand T b = b
xand F b = F
xnot T = F
xnot F = T
eqPos D1 D1 = T
eqPos D1 (CDub b p) = F
eqPos (CDub b p) D1 = F
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))
lePos D1 p = T
lePos (CDub b p) D1 = F
lePos (CDub b p) (CDub c q) | b == c = (lePos p q)
lePos (CDub b p) (CDub c q) | b /= c && b == F = (lePos p q)
lePos (CDub b p) (CDub c q) | b /= c && b == T = (ltPos p q)
ltPos p D1 = F
ltPos D1 (CDub b p) = T
ltPos (CDub b p) (CDub c q) | b == c = (ltPos p q)
ltPos (CDub b p) (CDub c q) | b /= c && b == F = (lePos p q)
ltPos (CDub b p) (CDub c q) | b /= c && b == T = (ltPos p q)
s D1 = (CDub F D1)
s (CDub F p) = (CDub T p)
s (CDub T p) = (CDub F (s p))
addc F D1 p = (s p)
addc T D1 p = (s (s p))
addc F p D1 = (s p)
addc T p D1 = (s (s p))
addc b (CDub c p) (CDub d q) | c == d = (CDub b (addc c p q))
addc b (CDub c p) (CDub d q) | c /= d = (CDub (xnot b) (addc c p q))
int2Nat (CInt n) = n
minus D0 = (CInt D0)
minus (CNat p) = (CNeg p)
minus2 m n | (ge m n) == T = (CInt (gtesubt m n))
minus2 m n | (ge m n) == F = (minus (gtesubt n m))
pos2Nat p = (CNat p)
nat2Pos (CNat p) = p
eq D0 D0 = T
eq D0 (CNat p) = F
eq (CNat p) D0 = F
eq (CNat p) (CNat q) = (eqPos p q)
le D0 n = T
le (CNat p) D0 = F
le (CNat p) (CNat q) = (lePos p q)
lt n D0 = F
lt D0 (CNat p) = T
lt (CNat p) (CNat q) = (ltPos p q)
ge m n = (le n m)
gt m n = (lt n m)
pre D1 = D0
pre (CDub T p) = (CNat (CDub F p))
pre (CDub F p) = (dub T (pre p))
dub F D0 = D0
dub T D0 = (CNat D1)
dub b (CNat p) = (CNat (CDub b p))
plus D0 n = n
plus n D0 = n
plus (CNat p) (CNat q) = (CNat (addc F p q))
gtesubtPos p q = (gtesubtb F p q)
gtesubt n D0 = n
gtesubt (CNat p) (CNat q) = (gtesubtPos p q)
gtesubtb F p D1 = (pre p)
gtesubtb T p D1 = (pre (nat2Pos (pre p)))
gtesubtb b (CDub c p) (CDub d q) | c == d = (dub b (gtesubtb b p q))
gtesubtb b (CDub c p) (CDub d q) | c /= d && c == F = (dub (xnot b) (gtesubtb T p q))
gtesubtb b (CDub c p) (CDub d q) | c /= d && c == T = (dub (xnot b) (gtesubtb d p q))
fib D0 = D0
fib (CNat D1) = (CNat D1)
fib (CNat (CDub b p)) = (plus (fib (int2Nat (minus2 (CNat (CDub b p)) (pos2Nat D1)))) (fib (int2Nat (minus2 (CNat (CDub b p)) (pos2Nat (CDub F D1))))))

main = do
 print (fib (pos2Nat (CDub F (CDub F (CDub F (CDub F (CDub F D1)))))))
