module factorial9

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

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

fact :: !Nat -> Nat
fact D0 = (S D0)
fact (S n) = (times (S n) (fact n))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (fact (S (S (S (S (S (S (S (S (S D0)))))))))) <<< "\n"
   = snd (fclose console world)
