data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data NatList = Nil | Cons Nat NatList 
  deriving (Show, Eq, Ord)

data NatListPair = Pair NatList NatList 
  deriving (Show, Eq, Ord)

xnot :: Xbool -> Xbool
d10 :: Nat
st :: Nat -> Nat -> Xbool
get :: Nat -> Nat -> Xbool
plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
rev :: Nat -> NatList
split :: Nat -> NatList -> NatListPair
qsort :: NatList -> NatList
append :: NatList -> NatList -> NatList
p1 :: NatListPair -> NatList
p2 :: NatListPair -> NatList

d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))
xnot Xtrue = Xfalse
xnot Xfalse = Xtrue
st D0 (S n) = Xtrue
st (S n) D0 = Xfalse
st D0 D0 = Xfalse
st (S n) (S m) = (st n m)
get n m = (xnot (st n m))
plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
rev (S n) = (Cons (S n) (rev n))
rev D0 = (Cons D0 Nil)
split n (Cons m l) | (st n m) == Xtrue = (Pair (p1 (split n l)) (Cons m (p2 (split n l))))
split n (Cons m l) | (get n m) == Xtrue = (Pair (Cons m (p1 (split n l))) (p2 (split n l)))
split n Nil = (Pair Nil Nil)
append (Cons n l) lT = (Cons n (append l lT))
append Nil l = l
qsort Nil = Nil
qsort (Cons n l) = (append (qsort (p1 (split n l))) (Cons n (qsort (p2 (split n l)))))
p1 (Pair l1 l2) = l1
p2 (Pair l1 l2) = l2

main = do
 print (qsort (rev d10))
