module oddeven

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Nat =
     D0
   | S !Nat

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

odd :: !Nat -> Xbool
odd D0 = Xfalse
odd (S n) 
| ((even n) == Xtrue) = Xtrue
| ((even n) == Xfalse) = Xfalse

even :: !Nat -> Xbool
even D0 = Xtrue
even (S n) 
| ((odd n) == Xtrue) = Xtrue
| ((odd n) == Xfalse) = Xfalse

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))) <<< "\n"
   # console = console <<< (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))))))) <<< "\n"
   # console = console <<< (odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))))))))) <<< "\n"
   = snd (fclose console world)
