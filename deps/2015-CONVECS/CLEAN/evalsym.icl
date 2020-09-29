module evalsym

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Pos =
     D1
   | CDub !Xbool !Pos

:: ENat =
     Exz
   | Exs !ENat
   | Explus !ENat !ENat
   | Exmult !ENat !ENat
   | Exexp !ENat !ENat

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

instance == ENat where
   (==) (Exz) (Exz) = True
   (==) (Exs rec_x1) (Exs rec_y1) = (rec_x1 == rec_y1)
   (==) (Explus rec_x1 rec_x2) (Explus rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (Exmult rec_x1 rec_x2) (Exmult rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (Exexp rec_x1 rec_x2) (Exexp rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
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

instance <<< ENat where
   (<<<) rec_file (Exz) = rec_file <<< "Exz"
   (<<<) rec_file (Exs rec_x1) = rec_file <<< "Exs" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Explus rec_x1 rec_x2) = rec_file <<< "Explus" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (Exmult rec_x1 rec_x2) = rec_file <<< "Exmult" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (Exexp rec_x1 rec_x2) = rec_file <<< "Exexp" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

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

lambda0 :: !ENat -> Xbool
lambda0 m = (eq (eval17 m) (evalsym17 m))

eq :: !SNat !SNat -> Xbool
eq Z Z = Xtrue
eq Z (S r) = Xfalse
eq (S r) Z = Xfalse
eq (S r) (S t) = (eq r t)

succ17 :: !SNat -> SNat
succ17 r 
| ((eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xtrue) = Z
| ((eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) == Xfalse) = (S r)

plus17 :: !SNat !SNat -> SNat
plus17 r Z = r
plus17 r (S t) = (succ17 (plus17 r t))

mult17 :: !SNat !SNat -> SNat
mult17 r Z = Z
mult17 r (S t) = (plus17 r (mult17 r t))

exp17 :: !SNat !SNat -> SNat
exp17 r Z = (succ17 Z)
exp17 r (S t) = (mult17 r (exp17 r t))

eval17 :: !ENat -> SNat
eval17 Exz = Z
eval17 (Exs n) = (succ17 (eval17 n))
eval17 (Explus n m) = (plus17 (eval17 n) (eval17 m))
eval17 (Exmult n m) = (mult17 (eval17 n) (eval17 m))
eval17 (Exexp n m) = (exp17 (eval17 n) (eval17 m))

evalsym17 :: !ENat -> SNat
evalsym17 Exz = Z
evalsym17 (Exs n) = (succ17 (evalsym17 n))
evalsym17 (Explus n m) = (plus17 (evalsym17 n) (evalsym17 m))
evalsym17 (Exmult n Exz) = Z
evalsym17 (Exmult n (Exs m)) = (evalsym17 (Explus (Exmult n m) n))
evalsym17 (Exmult n (Explus m o)) = (evalsym17 (Explus (Exmult n m) (Exmult n o)))
evalsym17 (Exmult n (Exmult m o)) = (evalsym17 (Exmult (Exmult n m) o))
evalsym17 (Exmult n (Exexp m o)) = (evalsym17 (Exmult n (xdec (Exexp m o))))
evalsym17 (Exexp n Exz) = (succ17 Z)
evalsym17 (Exexp n (Exs m)) = (evalsym17 (Exmult (Exexp n m) n))
evalsym17 (Exexp n (Explus m o)) = (evalsym17 (Exmult (Exexp n m) (Exexp n o)))
evalsym17 (Exexp n (Exmult m o)) = (evalsym17 (Exexp (Exexp n m) o))
evalsym17 (Exexp n (Exexp m o)) = (evalsym17 (Exexp n (xdec (Exexp m o))))

xdec :: !ENat -> ENat
xdec (Exexp n Exz) = (Exs Exz)
xdec (Exexp n (Exs m)) = (Exmult (Exexp n m) n)
xdec (Exexp n (Explus m o)) = (Exmult (Exexp n m) (Exexp n o))
xdec (Exexp n (Exmult m o)) = (xdec (Exexp (Exexp n m) o))
xdec (Exexp n (Exexp m o)) = (xdec (Exexp n (xdec (Exexp m o))))

two :: ENat
two = (Exs (Exs Exz))

seventeen :: ENat
seventeen = (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs Exz))))))))))))))))))))))))

f :: !ENat -> Xbool
f m = (lambda0 (Exexp two m))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f seventeen) <<< "\n"
   = snd (fclose console world)
