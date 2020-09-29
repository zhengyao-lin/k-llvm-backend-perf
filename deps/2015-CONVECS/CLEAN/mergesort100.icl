module mergesort100

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

:: ListPair =
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

instance == ListPair where
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

instance <<< ListPair where
   (<<<) rec_file (Pair rec_x1 rec_x2) = rec_file <<< "Pair" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

d10 :: Nat
d10 = (S (S (S (S (S (S (S (S (S (S D0))))))))))

lte :: !Nat !Nat -> Xbool
lte D0 (S n) = Xtrue
lte (S n) D0 = Xfalse
lte D0 D0 = Xtrue
lte (S n) (S m) = (lte n m)

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

rev :: !Nat -> NatList
rev (S n) = (Cons (S n) (rev n))
rev D0 = (Cons D0 XNil)

xmerge :: !NatList !NatList -> NatList
xmerge XNil l = l
xmerge l XNil = l
xmerge (Cons x l1) (Cons y l2) 
| ((lte x y) == Xtrue) = (Cons x (xmerge l1 (Cons y l2)))
| ((lte x y) == Xfalse) = (Cons y (xmerge (Cons x l1) l2))

split :: !NatList -> ListPair
split (Cons x (Cons y l)) = (Pair (Cons x (p1 (split l))) (Cons y (p2 (split l))))
split XNil = (Pair XNil XNil)
split (Cons x XNil) = (Pair (Cons x XNil) XNil)

mergesort :: !NatList -> NatList
mergesort XNil = XNil
mergesort (Cons x XNil) = (Cons x XNil)
mergesort (Cons x (Cons y l)) = (xmerge (mergesort (Cons x (p1 (split l)))) (mergesort (Cons y (p2 (split l)))))

p1 :: !ListPair -> NatList
p1 (Pair l1 l2) = l1

p2 :: !ListPair -> NatList
p2 (Pair l1 l2) = l2

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (mergesort (rev (times d10 d10))) <<< "\n"
   = snd (fclose console world)
