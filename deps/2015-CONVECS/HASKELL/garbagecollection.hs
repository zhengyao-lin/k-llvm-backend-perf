data Nat = D0 | S Nat  | P | N
  deriving (Show, Eq, Ord)

d1 :: Nat
f :: Nat -> Nat -> Nat -> Nat -> Nat -> Nat
c :: Nat -> Nat -> Nat

d1 = (S D0)
c D0 y = y
c (S x) y = (S (c x y))
f x y (S z) t u = (f x y z (c t t) u)
f x (S y) D0 t u = (f x y P t t)
f (S x) D0 D0 t u = (f x N P d1 D0)
f D0 D0 D0 t u = t
f x (S y) P t u = (f x y P t (S u))
f x D0 P t u = (f x N P (S t) u)
f (S x) N P t u = (f x N P t u)
f D0 N P t u = u

main = do
 print (f (S (S (S (S (S (S D0)))))) (S (S (S (S (S D0))))) (S (S D0)) D0 d1)
 print (f (S (S (S (S D0)))) (S (S (S D0))) (S (S (S (S (S D0))))) D0 d1)
