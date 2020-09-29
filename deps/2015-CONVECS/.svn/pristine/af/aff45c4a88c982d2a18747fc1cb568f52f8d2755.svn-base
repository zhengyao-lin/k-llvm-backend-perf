data List = L Nat List  | Nil
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

d10 :: Nat
plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
gen :: Nat -> List
conc :: List -> List -> List
rev :: List -> List

d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))
plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
gen (S n) = (L (S n) (gen n))
gen D0 = (L D0 Nil)
conc (L e l1) l2 = (L e (conc l1 l2))
conc Nil l2 = l2
rev (L e l1) = (conc (rev l1) (L e Nil))
rev Nil = Nil

main = do
 print (rev (gen (times d10 (times d10 d10))))
