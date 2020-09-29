data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data NatList = Nil | Cons Nat NatList 
  deriving (Show, Eq, Ord)

data ListPair = Pair NatList NatList 
  deriving (Show, Eq, Ord)

d10 :: Nat
lte :: Nat -> Nat -> Xbool
plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
rev :: Nat -> NatList
split :: NatList -> ListPair
merge :: NatList -> NatList -> NatList
mergesort :: NatList -> NatList
p1 :: ListPair -> NatList
p2 :: ListPair -> NatList

d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))
lte D0 (S n) = Xtrue
lte (S n) D0 = Xfalse
lte D0 D0 = Xtrue
lte (S n) (S m) = (lte n m)
plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
rev (S n) = (Cons (S n) (rev n))
rev D0 = (Cons D0 Nil)
merge Nil l = l
merge l Nil = l
merge (Cons x l1) (Cons y l2) | (lte x y) == Xtrue = (Cons x (merge l1 (Cons y l2)))
merge (Cons x l1) (Cons y l2) | (lte x y) == Xfalse = (Cons y (merge (Cons x l1) l2))
split (Cons x (Cons y l)) = (Pair (Cons x (p1 (split l))) (Cons y (p2 (split l))))
split Nil = (Pair Nil Nil)
split (Cons x Nil) = (Pair (Cons x Nil) Nil)
mergesort Nil = Nil
mergesort (Cons x Nil) = (Cons x Nil)
mergesort (Cons x (Cons y l)) = (merge (mergesort (Cons x (p1 (split l)))) (mergesort (Cons y (p2 (split l)))))
p1 (Pair l1 l2) = l1
p2 (Pair l1 l2) = l2

main = do
 print (mergesort (rev (times d10 (times d10 d10))))
