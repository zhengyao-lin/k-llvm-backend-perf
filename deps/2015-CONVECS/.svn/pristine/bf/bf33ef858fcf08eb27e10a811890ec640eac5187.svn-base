data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Pos = D1 | CDub Xbool Pos 
  deriving (Show, Eq, Ord)

data Tree = Leaf SNat  | Node SNat SNat Tree Tree 
  deriving (Show, Eq, Ord)

data SNat = Z | S SNat 
  deriving (Show, Eq, Ord)

eqBool :: Xbool -> Xbool -> Xbool
xand :: Xbool -> Xbool -> Xbool
eqPos :: Pos -> Pos -> Xbool
eq :: SNat -> SNat -> Xbool
f :: SNat -> Xbool
lambda6 :: SNat -> Xbool
lambda5 :: SNat -> Tree -> Tree
lambda4 :: SNat -> Tree -> SNat -> SNat -> Tree
lambda3 :: SNat -> Tree -> Tree -> Tree
lambda2 :: SNat -> Tree -> Tree -> SNat -> SNat -> Tree
lambda1 :: SNat -> Tree -> Tree -> SNat -> Tree
buildtree :: SNat -> SNat -> Tree
lambda0 :: SNat -> SNat -> SNat
succ17 :: SNat -> SNat
pred17 :: SNat -> SNat
plus17 :: SNat -> SNat -> SNat
mult17 :: SNat -> SNat -> SNat
exp17 :: SNat -> SNat -> SNat
evaltree17 :: SNat -> SNat
getval :: Tree -> SNat
getmax :: Tree -> SNat
seventeen :: SNat

eqBool Xtrue b = b
eqBool Xfalse Xtrue = Xfalse
eqBool Xfalse Xfalse = Xtrue
xand b Xtrue = b
xand b Xfalse = Xfalse
eqPos D1 D1 = Xtrue
eqPos D1 (CDub b p) = Xfalse
eqPos (CDub b p) D1 = Xfalse
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))
lambda6 n = (eq (evaltree17 n) (getval (buildtree n Z)))
lambda5 n left = (lambda4 n left (getmax left) (getval left))
lambda4 n left max o = (lambda3 o left (buildtree n (succ17 max)))
lambda3 n left right = (lambda2 n left right (getval right) (getmax right))
lambda2 n left right o max = (lambda1 max left right (plus17 n o))
lambda1 max left right n = (Node n max left right)
lambda0 n o = (mult17 n o)
eq Z Z = Xtrue
eq Z (S n) = Xfalse
eq (S n) Z = Xfalse
eq (S n) (S o) = (eq n o)
succ17 n | (eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xtrue = Z
succ17 n | (eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xfalse = (S n)
pred17 Z = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))
pred17 (S n) = n
plus17 n Z = n
plus17 n (S o) = (succ17 (plus17 n o))
mult17 n Z = Z
mult17 n (S o) = (plus17 n (mult17 n o))
exp17 n Z = (succ17 Z)
exp17 n (S o) = (mult17 n (exp17 n o))
evaltree17 n = (lambda0 (exp17 (S (S Z)) (pred17 n)) (pred17 (exp17 (S (S Z)) n)))
getval (Leaf n) = n
getval (Node n max left right) = n
getmax (Leaf n) = n
getmax (Node n max left right) = max
buildtree Z n = (Leaf n)
buildtree (S n) o = (lambda5 n (buildtree n o))
seventeen = (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S  Z )))) ))))) ))))) )))))
f n = (lambda6 seventeen)

main = do
 print (f seventeen)
