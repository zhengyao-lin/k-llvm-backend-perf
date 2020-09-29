module quicksort100

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

:: NatListPair =
     Pair !NatList !NatList

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

instance == NatListPair where
   (==) (Pair rec_x1 rec_x2) (Pair rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
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

instance <<< NatListPair where
   (<<<) rec_file (Pair rec_x1 rec_x2) = rec_file <<< "Pair" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

d10 :: Nat
d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))

xnot :: !Xbool -> Xbool
xnot Xtrue = Xfalse
xnot Xfalse = Xtrue

st :: !Nat !Nat -> Xbool
st D0 (S n) = Xtrue
st (S n) D0 = Xfalse
st D0 D0 = Xfalse
st (S n) (S m) = (st n m)

get :: !Nat !Nat -> Xbool
get n m = (xnot (st n m))

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

rev :: !Nat -> NatList
rev (S n) = (Cons (S n) (rev n))
rev D0 = (Cons D0 XNil)

split :: !Nat !NatList -> NatListPair
split n (Cons m l) 
| ((st n m) == Xtrue) = (Pair (p1 (split n l)) (Cons m (p2 (split n l))))
| ((get n m) == Xtrue) = (Pair (Cons m (p1 (split n l))) (p2 (split n l)))
split n XNil = (Pair XNil XNil)

append :: !NatList !NatList -> NatList
append (Cons n l) lT = (Cons n (append l lT))
append XNil l = l

qsort :: !NatList -> NatList
qsort XNil = XNil
qsort (Cons n l) = (append (qsort (p1 (split n l))) (Cons n (qsort (p2 (split n l)))))

p1 :: !NatListPair -> NatList
p1 (Pair l1 l2) = l1

p2 :: !NatListPair -> NatList
p2 (Pair l1 l2) = l2

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (qsort (rev (times d10 d10))) <<< "\n"
   = snd (fclose console world)
