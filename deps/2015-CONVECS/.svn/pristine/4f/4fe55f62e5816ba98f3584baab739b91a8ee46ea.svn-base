data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

plus :: Nat -> Nat -> Nat
fibb :: Nat -> Nat

plus D0 n = n
plus (S n) m = (S (plus n m))
fibb D0 = D0
fibb (S D0) = (S D0)
fibb (S (S n)) = (plus (fibb (S n)) (fibb n))

main = do
 print (fibb (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))
