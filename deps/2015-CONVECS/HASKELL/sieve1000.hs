data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = S Nat  | Z
  deriving (Show, Eq, Ord)

data Digit = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9
  deriving (Show, Eq, Ord)

data List = Nil | D Digit  | Dl Digit List  | L Nat List  | Ll List List 
  deriving (Show, Eq, Ord)

lt :: Nat -> Nat -> Xbool
sub :: Nat -> Nat -> Nat
xdiv :: Nat -> Nat -> Nat
xrem :: Nat -> Nat -> Nat
add :: Nat -> Nat -> Nat
divides :: Nat -> Nat -> Xbool
mult :: Nat -> Nat -> Nat
two :: Nat
ten :: Nat
find :: List -> Nat -> Digit
digitList :: List
ap :: List -> List -> List
conv :: Nat -> List
digit :: Nat -> Digit
fact :: Nat -> Nat
auxdiv :: Nat -> Nat -> Nat -> Xbool
ifNat :: Xbool -> Nat -> Nat -> Nat
intsBetween :: Nat -> Nat -> List
sieve :: List -> List
xfilter :: List -> Nat -> List
e :: Nat -> List -> List

two = (S (S Z))
ten = (S (S (S (S (S (S (S (S (S (S Z))))))))))
digitList = (Dl D0 (Dl D1 (Dl D2 (Dl D3 (Dl D4 (Dl D5 (Dl D6 (Dl D7 (Dl D8 (Dl D9 Nil))))))))))
ifNat Xtrue n m = n
ifNat Xfalse n m = m
conv x | (lt x ten) == Xtrue = (Dl (digit x) Nil)
conv x | (lt x ten) == Xfalse = (ap (conv (xdiv x ten)) (conv (xrem x ten)))
xrem x y | y /= Z = (ifNat (lt x y) x (xrem (sub x y) y))
xdiv x y | y /= Z = (ifNat (lt x y) Z (S (xdiv (sub x y) y)))
lt Z (S x) = Xtrue
lt x Z = Xfalse
lt (S x) (S y) = (lt x y)
sub Z (S y) = Z
sub x Z = x
sub (S x) (S y) = (sub x y)
digit x = (find digitList x)
find (Dl dig l1) Z = dig
find (Dl dig l1) (S x) = (find l1 x)
ap Nil l1 = l1
ap (Dl dig l1) l2 = (Dl dig (ap l1 l2))
add Z y = y
add (S x) y = (S (add x y))
mult Z y = Z
mult (S x) y = (add y (mult x y))
fact Z = (S Z)
fact (S x) = (mult (S x) (fact x))
divides n m | m /= Z = (auxdiv n m m)
auxdiv Z Z m = Xtrue
auxdiv Z (S x) m = Xfalse
auxdiv (S x) (S y) m = (auxdiv x y m)
auxdiv (S x) Z m = (auxdiv (S x) m m)
intsBetween n m | n == m = Nil
intsBetween n m | n /= m = (L n (intsBetween (S n) m))
sieve (L n l1) = (L n (sieve (xfilter l1 n)))
sieve Nil = Nil
xfilter (L n l1) m | (divides n m) == Xtrue = (xfilter l1 m)
xfilter (L n l1) m | (divides n m) == Xfalse = (L n (xfilter l1 m))
xfilter Nil m = Nil
e n l1 = (Ll (conv n) l1)

main = do
 print (sieve (intsBetween (S (S Z)) (mult ten (mult ten ten))))
