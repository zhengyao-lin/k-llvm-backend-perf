data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Pos = D1 | CDub Xbool Pos 
  deriving (Show, Eq, Ord)

data ENat = Exz | Exs ENat  | Explus ENat ENat  | Exmult ENat ENat  | Exexp ENat ENat 
  deriving (Show, Eq, Ord)

data SNat = Z | S SNat 
  deriving (Show, Eq, Ord)

eqBool :: Xbool -> Xbool -> Xbool
xand :: Xbool -> Xbool -> Xbool
eqPos :: Pos -> Pos -> Xbool
lambda0 :: ENat -> Xbool
eq :: SNat -> SNat -> Xbool
succ17 :: SNat -> SNat
plus17 :: SNat -> SNat -> SNat
mult17 :: SNat -> SNat -> SNat
exp17 :: SNat -> SNat -> SNat
eval17 :: ENat -> SNat
evalsym17 :: ENat -> SNat
dec :: ENat -> ENat
two :: ENat
seventeen :: ENat
f :: ENat -> Xbool

eqBool Xtrue b = b
eqBool Xfalse Xtrue = Xfalse
eqBool Xfalse Xfalse = Xtrue
xand b Xtrue = b
xand b Xfalse = Xfalse
eqPos D1 D1 = Xtrue
eqPos D1 (CDub b p) = Xfalse
eqPos (CDub b p) D1 = Xfalse
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))
lambda0 m = (eq (eval17 m) (evalsym17 m))
eq Z Z = Xtrue
eq Z (S r) = Xfalse
eq (S r) Z = Xfalse
eq (S r) (S t) = (eq r t)
succ17 r | (eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xtrue = Z
succ17 r | (eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xfalse = (S r)
plus17 r Z = r
plus17 r (S t) = (succ17 (plus17 r t))
mult17 r Z = Z
mult17 r (S t) = (plus17 r (mult17 r t))
exp17 r Z = (succ17 Z)
exp17 r (S t) = (mult17 r (exp17 r t))
eval17 Exz = Z
eval17 (Exs n) = (succ17 (eval17 n))
eval17 (Explus n m) = (plus17 (eval17 n) (eval17 m))
eval17 (Exmult n m) = (mult17 (eval17 n) (eval17 m))
eval17 (Exexp n m) = (exp17 (eval17 n) (eval17 m))
evalsym17 Exz = Z
evalsym17 (Exs n) = (succ17 (evalsym17 n))
evalsym17 (Explus n m) = (plus17 (evalsym17 n) (evalsym17 m))
evalsym17 (Exmult n Exz) = Z
evalsym17 (Exmult n (Exs m)) = (evalsym17 (Explus (Exmult n m) n))
evalsym17 (Exmult n (Explus m o)) = (evalsym17 (Explus (Exmult n m) (Exmult n o)))
evalsym17 (Exmult n (Exmult m o)) = (evalsym17 (Exmult (Exmult n m) o))
evalsym17 (Exmult n (Exexp m o)) = (evalsym17 (Exmult n (dec (Exexp m o))))
evalsym17 (Exexp n Exz) = (succ17 Z)
evalsym17 (Exexp n (Exs m)) = (evalsym17 (Exmult (Exexp n m) n))
evalsym17 (Exexp n (Explus m o)) = (evalsym17 (Exmult (Exexp n m) (Exexp n o)))
evalsym17 (Exexp n (Exmult m o)) = (evalsym17 (Exexp (Exexp n m) o))
evalsym17 (Exexp n (Exexp m o)) = (evalsym17 (Exexp n (dec (Exexp m o))))
dec (Exexp n Exz) = (Exs Exz)
dec (Exexp n (Exs m)) = (Exmult (Exexp n m) n)
dec (Exexp n (Explus m o)) = (Exmult (Exexp n m) (Exexp n o))
dec (Exexp n (Exmult m o)) = (dec (Exexp (Exexp n m) o))
dec (Exexp n (Exexp m o)) = (dec (Exexp n (dec (Exexp m o))))
two = (Exs (Exs Exz))
seventeen = (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs Exz))))))))))))))))))))))))
f m = (lambda0 (Exexp two m))

main = do
 print (f seventeen)
