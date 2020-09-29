data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

a :: Xbool
xnot :: Xbool -> Xbool

a = Xtrue
xnot x | x == Xfalse = Xtrue
xnot x | x == Xtrue = Xfalse

main = do
 print (xnot a)
