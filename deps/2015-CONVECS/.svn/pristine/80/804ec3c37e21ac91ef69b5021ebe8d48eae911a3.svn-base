module revnat10000

import StdEnv;

:: List =
     L !Nat !List
   | XNil

:: Nat =
     D0
   | S !Nat

instance == List where
   (==) (L rec_x1 rec_x2) (L rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (XNil) (XNil) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< List where
   (<<<) rec_file (L rec_x1 rec_x2) = rec_file <<< "L" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (XNil) = rec_file <<< "XNil"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

d10 :: Nat
d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

gen :: !Nat -> List
gen (S n) = (L (S n) (gen n))
gen D0 = (L D0 XNil)

conc :: !List !List -> List
conc (L e l1) l2 = (L e (conc l1 l2))
conc XNil l2 = l2

rev :: !List -> List
rev (L e l1) = (conc (rev l1) (L e XNil))
rev XNil = XNil

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (rev (gen (times d10 (times d10 (times d10 d10))))) <<< "\n"
   = snd (fclose console world)
