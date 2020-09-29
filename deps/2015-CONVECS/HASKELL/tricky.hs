data NSingleton = Ncons
  deriving (Show, Eq, Ord)

data USingleton = Ucons Nat 
  deriving (Show, Eq, Ord)

data Nat = D0 | Xsucc Nat 
  deriving (Show, Eq, Ord)

d1 :: Nat
d2 :: Nat
d3 :: Nat
f :: Nat -> Nat

d1 = (Xsucc D0)
d2 | D0 == D0 = D0
d3 | D0 /= D0 = D0
 | (Xsucc D0) == D0 = D0
 | (Xsucc D0) /= D0 = (Xsucc D0)
f n | n /= D0 && n /= (Xsucc D0) = n

main = do
 print Ncons
 print (Ucons D0)
 print d1
 print d2
 print d3
