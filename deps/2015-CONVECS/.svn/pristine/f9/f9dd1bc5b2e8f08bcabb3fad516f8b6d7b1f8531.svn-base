data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

xodd :: Nat -> Xbool
xeven :: Nat -> Xbool

xodd D0 = Xfalse
xodd (S n) | (xeven n) == Xtrue = Xtrue
xodd (S n) | (xeven n) == Xfalse = Xfalse
xeven D0 = Xtrue
xeven (S n) | (xodd n) == Xtrue = Xtrue
xeven (S n) | (xodd n) == Xfalse = Xfalse

main = do
 print (xodd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))
 print (xodd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))))
 print (xodd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))))))))))))
