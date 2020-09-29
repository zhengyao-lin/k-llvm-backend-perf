module check2

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

notBool :: !Xbool -> Xbool
notBool Xtrue = Xfalse
notBool Xfalse = Xtrue

andBool :: !Xbool !Xbool -> Xbool
andBool p Xtrue = p
andBool p Xfalse = Xfalse

orBool :: !Xbool !Xbool -> Xbool
orBool p Xtrue = Xtrue
orBool p Xfalse = p

xorBool :: !Xbool !Xbool -> Xbool
xorBool p q = (orBool (andBool p (notBool q)) (andBool q (notBool p)))

impliesBool :: !Xbool !Xbool -> Xbool
impliesBool p q = (orBool q (notBool p))

iffBool :: !Xbool !Xbool -> Xbool
iffBool p q = (andBool (impliesBool p q) (impliesBool q p))

eqBool :: !Xbool !Xbool -> Xbool
eqBool p q = (iffBool p q)

neBool :: !Xbool !Xbool -> Xbool
neBool p q = (xorBool p q)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (neBool Xfalse Xtrue) <<< "\n"
   = snd (fclose console world)
