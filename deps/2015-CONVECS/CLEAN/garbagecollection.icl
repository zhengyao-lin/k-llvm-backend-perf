module garbagecollection

import StdEnv;

:: Nat =
     D0
   | S !Nat
   | P
   | N

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) (P) (P) = True
   (==) (N) (N) = True
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (P) = rec_file <<< "P"
   (<<<) rec_file (N) = rec_file <<< "N"

d1 :: Nat
d1 = (S D0)

c :: !Nat !Nat -> Nat
c D0 y = y
c (S x) y = (S (c x y))

f :: !Nat !Nat !Nat !Nat !Nat -> Nat
f x y (S z) t u = (f x y z (c t t) u)
f x (S y) D0 t u = (f x y P t t)
f (S x) D0 D0 t u = (f x N P d1 D0)
f D0 D0 D0 t u = t
f x (S y) P t u = (f x y P t (S u))
f x D0 P t u = (f x N P (S t) u)
f (S x) N P t u = (f x N P t u)
f D0 N P t u = u

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f (S (S (S (S (S (S D0)))))) (S (S (S (S (S D0))))) (S (S D0)) D0 d1) <<< "\n"
   # console = console <<< (f (S (S (S (S D0)))) (S (S (S D0))) (S (S (S (S (S D0))))) D0 d1) <<< "\n"
   = snd (fclose console world)
