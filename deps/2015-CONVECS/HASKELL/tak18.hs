data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data Xint = Pos Nat  | Neg Nat 
  deriving (Show, Eq, Ord)

gte :: Nat -> Nat -> Xbool
gte_Int :: Xint -> Xint -> Xbool
xpred :: Xint -> Xint
xsucc :: Xint -> Xint
tak :: Xint -> Xint -> Xint -> Xint

gte D0 D0 = Xtrue
gte (S x) D0 = Xtrue
gte D0 (S x) = Xfalse
gte (S x) (S y) = (gte x y)
gte_Int (Pos x) (Pos y) = (gte x y)
gte_Int (Neg x) (Neg y) = (gte y x)
gte_Int (Pos x) (Neg y) = Xtrue
gte_Int (Neg x) (Pos y) = Xfalse
xpred (Pos D0) = (Neg D0)
xpred (Pos (S x)) = (Pos x)
xpred (Neg x) = (Neg (S x))
xsucc (Neg D0) = (Pos D0)
xsucc (Neg (S x)) = (Neg x)
xsucc (Pos x) = (Pos (S x))
tak i j k | (gte_Int j i) == Xtrue = k
tak i j k | (gte_Int j i) == Xfalse = (tak (tak (xpred i) j k) (tak (xpred j) k i) (tak (xpred k) i j))

main = do
 print (tak (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))))) (Pos (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))) (Pos (S (S (S (S (S (S D0))))))))
