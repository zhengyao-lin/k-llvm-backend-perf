data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
fact :: Nat -> Nat

plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
fact D0 = (S D0)
fact (S n) = (times (S n) (fact n))

main = do
 print (fact (S (S (S (S (S (S (S (S (S D0))))))))))
