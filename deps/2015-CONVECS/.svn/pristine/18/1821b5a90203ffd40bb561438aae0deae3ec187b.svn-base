module evalexpr

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
lambda0 m = (eq (eval17 m) (evalexp17 m))

eq :: !SNat !SNat -> Xbool
eq Z Z = Xtrue
eq Z (S r) = Xfalse
eq (S r) Z = Xfalse
eq (S r) (S t) = (eq r t)

eqENat :: !ENat !ENat -> Xbool
eqENat Exz Exz = Xtrue
eqENat Exz (Exs m) = Xfalse
eqENat Exz (Explus m n) = Xfalse
eqENat Exz (Exmult m n) = Xfalse
eqENat Exz (Exexp m n) = Xfalse
eqENat (Exs m) Exz = Xfalse
eqENat (Exs n) (Exs m) = (eqENat n m)
eqENat (Exs m) (Explus n o) = Xfalse
eqENat (Exs n) (Exmult m o) = Xfalse
eqENat (Exs m) (Exexp n o) = Xfalse
eqENat (Explus n m) Exz = Xfalse
eqENat (Explus m n) (Exs o) = Xfalse
eqENat (Explus n m) (Explus o l) = (xand (eqENat n o) (eqENat m l))
eqENat (Explus m n) (Exmult o l) = Xfalse
eqENat (Explus n m) (Exexp o l) = Xfalse
eqENat (Exmult m n) Exz = Xfalse
eqENat (Exmult n m) (Exs o) = Xfalse
eqENat (Exmult m n) (Explus o l) = Xfalse
eqENat (Exmult n m) (Exmult o l) = (xand (eqENat n o) (eqENat m l))
eqENat (Exmult m n) (Exexp o l) = Xfalse
eqENat (Exexp n m) Exz = Xfalse
eqENat (Exexp m n) (Exs o) = Xfalse
eqENat (Exexp n m) (Explus o l) = Xfalse
eqENat (Exexp m n) (Exmult o l) = Xfalse
eqENat (Exexp m n) (Exexp o l) = (xand (eqENat m o) (eqENat n l))

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

evalexp17 :: !ENat -> SNat
evalexp17 n = (eval17 (expand n))

expand :: !ENat -> ENat
expand Exz = Exz
expand (Exs n) = (Explus (Exs Exz) n)
expand (Explus n m) = (Explus (expand n) (expand m))
expand (Exmult n Exz) = Exz
expand (Exmult n (Exs Exz)) = (expand n)
expand (Exmult n (Explus m o)) = (expand (Explus (Exmult n m) (Exmult n o)))
expand (Exmult n (Exmult m o)) = (expand (Exmult n (expand (Exmult m o))))
expand (Exmult n (Exexp m o)) = (expand (Exmult n (expand (Exexp m o))))
expand (Exexp n Exz) = (Exs Exz)
expand (Exexp n (Exs m)) 
| ((eqENat m Exz) == Xtrue) = (expand n)
| ((eqENat m Exz) == Xfalse) = (expand (Exexp n (expand (Exs m))))
expand (Exexp n (Explus m o)) = (expand (Exmult (Exexp n m) (Exexp n o)))
expand (Exexp n (Exmult m o)) = (expand (Exexp n (expand (Exmult m o))))
expand (Exexp n (Exexp m o)) = (expand (Exexp n (expand (Exexp m o))))

two :: ENat
two = (Exs (Exs Exz))

seventeen :: ENat
seventeen = (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs Exz)))))))))))))))))))

f :: !ENat -> Xbool
f m = (lambda0 (Exexp two m))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (f seventeen) <<< "\n"
   = snd (fclose console world)
