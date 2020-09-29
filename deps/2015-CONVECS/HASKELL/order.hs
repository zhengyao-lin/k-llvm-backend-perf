data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

f :: Nat -> Nat
g :: Nat -> Nat

g D0 = D0
g (S x) = x
f (S x) | x == D0 = D0
f (S x) | x /= D0 = x
f D0 = (S D0)

main = do
 print (f (g D0))
