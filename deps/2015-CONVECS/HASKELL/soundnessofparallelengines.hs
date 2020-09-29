data N = D0 | S N  | G N 
  deriving (Show, Eq, Ord)

f :: N -> N

f (G D0) = D0
f (G (S x)) = (f (G x))

main = do
 print (f (G (S D0)))
