module order

import StdEnv;

:: Nat =
     D0
   | S !Nat

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

g :: !Nat -> Nat
g D0 = D0
g (S x) = x

f :: !Nat -> Nat
f (S x) 
| (x == D0) = D0
| (x <> D0) = x
f D0 = (S D0)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f (g D0)) <<< "\n"
   = snd (fclose console world)
