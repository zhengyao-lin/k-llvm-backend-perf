module empty

import StdEnv;

:: Nat =
     D0
   | Succ !Nat

instance == Nat where
   (==) (D0) (D0) = True
   (==) (Succ rec_x1) (Succ rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (Succ rec_x1) = rec_file <<< "Succ" <<< " (" <<< rec_x1 <<< ")"

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< D0 <<< "\n"
   = snd (fclose console world)
