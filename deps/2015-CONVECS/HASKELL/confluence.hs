data S = D0 | G S 
  deriving (Show, Eq, Ord)

f :: S -> S

f (G x) | x == D0 = x
f (G (G x)) = (f (G x))

main = do
 print (f (G (G D0)))
