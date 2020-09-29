module check1

import StdEnv;

:: USingleton =
     Ucons !Nat

:: Nat =
     D0
   | Succ !Nat

instance == USingleton where
   (==) (Ucons rec_x1) (Ucons rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (Succ rec_x1) (Succ rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< USingleton where
   (<<<) rec_file (Ucons rec_x1) = rec_file <<< "Ucons" <<< " (" <<< rec_x1 <<< ")"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (Succ rec_x1) = rec_file <<< "Succ" <<< " (" <<< rec_x1 <<< ")"

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< D0 <<< "\n"
   = snd (fclose console world)
