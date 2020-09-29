module confluence

import StdEnv;

:: S =
     D0
   | G !S

instance == S where
   (==) (D0) (D0) = True
   (==) (G rec_x1) (G rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< S where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (G rec_x1) = rec_file <<< "G" <<< " (" <<< rec_x1 <<< ")"

f :: !S -> S
f (G x) 
| (x == D0) = x
f (G (G x)) = (f (G x))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f (G (G D0))) <<< "\n"
   = snd (fclose console world)
