module tricky

import StdEnv;

:: NSingleton =
     Ncons

:: USingleton =
     Ucons !Nat

:: Nat =
     D0
   | Succ !Nat

instance == NSingleton where
   (==) (Ncons) (Ncons) = True
   (==) rec_x rec_y = False

instance == USingleton where
   (==) (Ucons rec_x1) (Ucons rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (Succ rec_x1) (Succ rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< NSingleton where
   (<<<) rec_file (Ncons) = rec_file <<< "Ncons"

instance <<< USingleton where
   (<<<) rec_file (Ucons rec_x1) = rec_file <<< "Ucons" <<< " (" <<< rec_x1 <<< ")"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (Succ rec_x1) = rec_file <<< "Succ" <<< " (" <<< rec_x1 <<< ")"

d1 :: Nat
d1 = (Succ D0)

d2 :: Nat
d2 | (D0 == D0) = D0

d3 :: Nat
d3 | (D0 <> D0) = D0
| ((Succ D0) == D0) = D0
| ((Succ D0) <> D0) = (Succ D0)

f :: !Nat -> Nat
f n 
| (n <> D0) && (n <> (Succ D0)) = n

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< Ncons <<< "\n"
   # console = console <<< (Ucons D0) <<< "\n"
   # console = console <<< d1 <<< "\n"
   # console = console <<< d2 <<< "\n"
   # console = console <<< d3 <<< "\n"
   = snd (fclose console world)
