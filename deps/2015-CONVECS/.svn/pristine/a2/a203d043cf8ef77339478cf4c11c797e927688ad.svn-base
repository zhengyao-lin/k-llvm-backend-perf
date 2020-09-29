data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

notBool :: Xbool -> Xbool
andBool :: Xbool -> Xbool -> Xbool
orBool :: Xbool -> Xbool -> Xbool
xorBool :: Xbool -> Xbool -> Xbool
impliesBool :: Xbool -> Xbool -> Xbool
iffBool :: Xbool -> Xbool -> Xbool
eqBool :: Xbool -> Xbool -> Xbool
neBool :: Xbool -> Xbool -> Xbool

notBool Xtrue = Xfalse
notBool Xfalse = Xtrue
andBool p Xtrue = p
andBool p Xfalse = Xfalse
orBool p Xtrue = Xtrue
orBool p Xfalse = p
xorBool p q = (orBool (andBool p (notBool q)) (andBool q (notBool p)))
impliesBool p q = (orBool q (notBool p))
iffBool p q = (andBool (impliesBool p q) (impliesBool q p))
eqBool p q = (iffBool p q)
neBool p q = (xorBool p q)

main = do
 print (neBool Xfalse Xtrue)
