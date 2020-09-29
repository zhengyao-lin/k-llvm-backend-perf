module searchinconditions

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

a :: Xbool
a = Xtrue

xnot :: !Xbool -> Xbool
xnot x 
| (x == Xfalse) = Xtrue
| (x == Xtrue) = Xfalse

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (xnot a) <<< "\n"
   = snd (fclose console world)
