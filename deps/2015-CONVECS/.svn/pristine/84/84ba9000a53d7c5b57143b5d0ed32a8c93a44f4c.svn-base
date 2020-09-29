module soundnessofparallelengines

import StdEnv;

:: N =
     D0
   | S !N
   | G !N

instance == N where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) (G rec_x1) (G rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< N where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (G rec_x1) = rec_file <<< "G" <<< " (" <<< rec_x1 <<< ")"

f :: !N -> N
f (G D0) = D0
f (G (S x)) = (f (G x))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f (G (S D0))) <<< "\n"
   = snd (fclose console world)
