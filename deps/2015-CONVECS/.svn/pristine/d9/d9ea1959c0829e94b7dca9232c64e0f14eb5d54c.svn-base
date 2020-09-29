module bubblesort1000

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Nat =
     D0
   | S !Nat

:: NatList =
     XNil
   | Cons !Nat !NatList

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == NatList where
   (==) (XNil) (XNil) = True
   (==) (Cons rec_x1 rec_x2) (Cons rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

instance <<< NatList where
   (<<<) rec_file (XNil) = rec_file <<< "XNil"
   (<<<) rec_file (Cons rec_x1 rec_x2) = rec_file <<< "Cons" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

d10 :: Nat
d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))

lt :: !Nat !Nat -> Xbool
lt D0 D0 = Xfalse
lt D0 (S n) = Xtrue
lt (S n) D0 = Xfalse
lt (S n) (S m) = (lt n m)

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

fact :: !Nat -> Nat
fact D0 = (S D0)
fact (S n) = (times (S n) (fact n))

rev :: !Nat -> NatList
rev (S n) = (bubsort (S n) (rev n))
rev D0 = (Cons D0 XNil)

bubsort :: !Nat !NatList -> NatList
bubsort n XNil = (Cons n XNil)
bubsort n (Cons m l) 
| ((lt m n) == Xtrue) = (Cons m (bubsort n l))
| ((lt m n) == Xfalse) = (Cons n (bubsort m l))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (rev (times d10 (times d10 d10))) <<< "\n"
   = snd (fclose console world)
