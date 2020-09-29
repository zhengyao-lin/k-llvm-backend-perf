data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data NatList = Nil | Cons Nat NatList 
  deriving (Show, Eq, Ord)

d10 :: Nat
lt :: Nat -> Nat -> Xbool
bubsort :: Nat -> NatList -> NatList
plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
rev :: Nat -> NatList
fact :: Nat -> Nat

d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))
lt D0 D0 = Xfalse
lt D0 (S n) = Xtrue
lt (S n) D0 = Xfalse
lt (S n) (S m) = (lt n m)
plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
fact D0 = (S D0)
fact (S n) = (times (S n) (fact n))
rev (S n) = (bubsort (S n) (rev n))
rev D0 = (Cons D0 Nil)
bubsort n Nil = (Cons n Nil)
bubsort n (Cons m l) | (lt m n) == Xtrue = (Cons m (bubsort n l))
bubsort n (Cons m l) | (lt m n) == Xfalse = (Cons n (bubsort m l))

main = do
 print (rev (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))))
