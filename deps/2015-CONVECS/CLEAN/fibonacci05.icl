module fibonacci05

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

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

fibb :: !Nat -> Nat
fibb D0 = D0
fibb (S D0) = (S D0)
fibb (S (S n)) = (plus (fibb (S n)) (fibb n))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (fibb (S (S (S (S (S D0)))))) <<< "\n"
   # console = console <<< (fibb (fibb (S (S (S (S (S D0))))))) <<< "\n"
   # console = console <<< (fibb (fibb (fibb (S (S (S (S (S D0)))))))) <<< "\n"
   # console = console <<< (fibb (fibb (fibb (fibb (S (S (S (S (S D0))))))))) <<< "\n"
   # console = console <<< (fibb (fibb (fibb (fibb (fibb (S (S (S (S (S D0)))))))))) <<< "\n"
   = snd (fclose console world)
