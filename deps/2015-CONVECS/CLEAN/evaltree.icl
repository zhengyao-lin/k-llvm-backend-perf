module evaltree

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Pos =
     D1
   | CDub !Xbool !Pos

:: Tree =
     Leaf !SNat
   | Node !SNat !SNat !Tree !Tree

:: SNat =
     Z
   | S !SNat

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Pos where
   (==) (D1) (D1) = True
   (==) (CDub rec_x1 rec_x2) (CDub rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Tree where
   (==) (Leaf rec_x1) (Leaf rec_y1) = (rec_x1 == rec_y1)
   (==) (Node rec_x1 rec_x2 rec_x3 rec_x4) (Node rec_y1 rec_y2 rec_y3 rec_y4) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4)
   (==) rec_x rec_y = False

instance == SNat where
   (==) (Z) (Z) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Pos where
   (<<<) rec_file (D1) = rec_file <<< "D1"
   (<<<) rec_file (CDub rec_x1 rec_x2) = rec_file <<< "CDub" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Tree where
   (<<<) rec_file (Leaf rec_x1) = rec_file <<< "Leaf" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Node rec_x1 rec_x2 rec_x3 rec_x4) = rec_file <<< "Node" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ")"

instance <<< SNat where
   (<<<) rec_file (Z) = rec_file <<< "Z"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

eqBool :: !Xbool !Xbool -> Xbool
eqBool Xtrue b = b
eqBool Xfalse Xtrue = Xfalse
eqBool Xfalse Xfalse = Xtrue

xand :: !Xbool !Xbool -> Xbool
xand b Xtrue = b
xand b Xfalse = Xfalse

eqPos :: !Pos !Pos -> Xbool
eqPos D1 D1 = Xtrue
eqPos D1 (CDub b p) = Xfalse
eqPos (CDub b p) D1 = Xfalse
eqPos (CDub b p) (CDub c q) = (xand (eqBool b c) (eqPos p q))

lambda6 :: !SNat -> Xbool
lambda6 n = (eq (evaltree17 n) (getval (buildtree n Z)))

lambda5 :: !SNat !Tree -> Tree
lambda5 n left = (lambda4 n left (getmax left) (getval left))

lambda4 :: !SNat !Tree !SNat !SNat -> Tree
lambda4 n left max o = (lambda3 o left (buildtree n (succ17 max)))

lambda3 :: !SNat !Tree !Tree -> Tree
lambda3 n left right = (lambda2 n left right (getval right) (getmax right))

lambda2 :: !SNat !Tree !Tree !SNat !SNat -> Tree
lambda2 n left right o max = (lambda1 max left right (plus17 n o))

lambda1 :: !SNat !Tree !Tree !SNat -> Tree
lambda1 max left right n = (Node n max left right)

lambda0 :: !SNat !SNat -> SNat
lambda0 n o = (mult17 n o)

eq :: !SNat !SNat -> Xbool
eq Z Z = Xtrue
eq Z (S n) = Xfalse
eq (S n) Z = Xfalse
eq (S n) (S o) = (eq n o)

succ17 :: !SNat -> SNat
succ17 n 
| ((eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xtrue) = Z
| ((eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xfalse) = (S n)

pred17 :: !SNat -> SNat
pred17 Z = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))
pred17 (S n) = n

plus17 :: !SNat !SNat -> SNat
plus17 n Z = n
plus17 n (S o) = (succ17 (plus17 n o))

mult17 :: !SNat !SNat -> SNat
mult17 n Z = Z
mult17 n (S o) = (plus17 n (mult17 n o))

exp17 :: !SNat !SNat -> SNat
exp17 n Z = (succ17 Z)
exp17 n (S o) = (mult17 n (exp17 n o))

evaltree17 :: !SNat -> SNat
evaltree17 n = (lambda0 (exp17 (S (S Z)) (pred17 n)) (pred17 (exp17 (S (S Z)) n)))

getval :: !Tree -> SNat
getval (Leaf n) = n
getval (Node n max left right) = n

getmax :: !Tree -> SNat
getmax (Leaf n) = n
getmax (Node n max left right) = max

buildtree :: !SNat !SNat -> Tree
buildtree Z n = (Leaf n)
buildtree (S n) o = (lambda5 n (buildtree n o))

seventeen :: SNat
seventeen = (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S  Z )))) ))))) ))))) )))))

f :: !SNat -> Xbool
f n = (lambda6 seventeen)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f seventeen) <<< "\n"
   = snd (fclose console world)
