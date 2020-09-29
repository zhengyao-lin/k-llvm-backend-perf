module tak18

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Nat =
     D0
   | S !Nat

:: Xint =
     Pos !Nat
   | Neg !Nat

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Xint where
   (==) (Pos rec_x1) (Pos rec_y1) = (rec_x1 == rec_y1)
   (==) (Neg rec_x1) (Neg rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

instance <<< Xint where
   (<<<) rec_file (Pos rec_x1) = rec_file <<< "Pos" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Neg rec_x1) = rec_file <<< "Neg" <<< " (" <<< rec_x1 <<< ")"

gte :: !Nat !Nat -> Xbool
gte D0 D0 = Xtrue
gte (S x) D0 = Xtrue
gte D0 (S x) = Xfalse
gte (S x) (S y) = (gte x y)

gte_Int :: !Xint !Xint -> Xbool
gte_Int (Pos x) (Pos y) = (gte x y)
gte_Int (Neg x) (Neg y) = (gte y x)
gte_Int (Pos x) (Neg y) = Xtrue
gte_Int (Neg x) (Pos y) = Xfalse

pred :: !Xint -> Xint
pred (Pos D0) = (Neg D0)
pred (Pos (S x)) = (Pos x)
pred (Neg x) = (Neg (S x))

succ :: !Xint -> Xint
succ (Neg D0) = (Pos D0)
succ (Neg (S x)) = (Neg x)
succ (Pos x) = (Pos (S x))

tak :: !Xint !Xint !Xint -> Xint
tak i j k 
| ((gte_Int j i) == Xtrue) = k
| ((gte_Int j i) == Xfalse) = (tak (tak (pred i) j k) (tak (pred j) k i) (tak (pred k) i j))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (tak (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))))) (Pos (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))) (Pos (S (S (S (S (S (S D0)))))))) <<< "\n"
   = snd (fclose console world)
