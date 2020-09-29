module sieve100

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Nat =
     S !Nat
   | Z

:: Digit =
     D0
   | D1
   | D2
   | D3
   | D4
   | D5
   | D6
   | D7
   | D8
   | D9

:: List =
     XNil
   | D !Digit
   | Dl !Digit !List
   | L !Nat !List
   | Ll !List !List

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) (Z) (Z) = True
   (==) rec_x rec_y = False

instance == Digit where
   (==) (D0) (D0) = True
   (==) (D1) (D1) = True
   (==) (D2) (D2) = True
   (==) (D3) (D3) = True
   (==) (D4) (D4) = True
   (==) (D5) (D5) = True
   (==) (D6) (D6) = True
   (==) (D7) (D7) = True
   (==) (D8) (D8) = True
   (==) (D9) (D9) = True
   (==) rec_x rec_y = False

instance == List where
   (==) (XNil) (XNil) = True
   (==) (D rec_x1) (D rec_y1) = (rec_x1 == rec_y1)
   (==) (Dl rec_x1 rec_x2) (Dl rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (L rec_x1 rec_x2) (L rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (Ll rec_x1 rec_x2) (Ll rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Nat where
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Z) = rec_file <<< "Z"

instance <<< Digit where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (D1) = rec_file <<< "D1"
   (<<<) rec_file (D2) = rec_file <<< "D2"
   (<<<) rec_file (D3) = rec_file <<< "D3"
   (<<<) rec_file (D4) = rec_file <<< "D4"
   (<<<) rec_file (D5) = rec_file <<< "D5"
   (<<<) rec_file (D6) = rec_file <<< "D6"
   (<<<) rec_file (D7) = rec_file <<< "D7"
   (<<<) rec_file (D8) = rec_file <<< "D8"
   (<<<) rec_file (D9) = rec_file <<< "D9"

instance <<< List where
   (<<<) rec_file (XNil) = rec_file <<< "XNil"
   (<<<) rec_file (D rec_x1) = rec_file <<< "D" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Dl rec_x1 rec_x2) = rec_file <<< "Dl" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (L rec_x1 rec_x2) = rec_file <<< "L" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (Ll rec_x1 rec_x2) = rec_file <<< "Ll" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

two :: Nat
two = (S (S Z))

ten :: Nat
ten = (S (S (S (S (S (S (S (S (S (S Z))))))))))

digitList :: List
digitList = (Dl D0 (Dl D1 (Dl D2 (Dl D3 (Dl D4 (Dl D5 (Dl D6 (Dl D7 (Dl D8 (Dl D9 XNil))))))))))

ifNat :: !Xbool !Nat !Nat -> Nat
ifNat Xtrue n m = n
ifNat Xfalse n m = m

conv :: !Nat -> List
conv x 
| ((lt x ten) == Xtrue) = (Dl (digit x) XNil)
| ((lt x ten) == Xfalse) = (ap (conv (div x ten)) (conv (xrem x ten)))

xrem :: !Nat !Nat -> Nat
xrem x y 
| (y <> Z) = (ifNat (lt x y) x (xrem (sub x y) y))

div :: !Nat !Nat -> Nat
div x y 
| (y <> Z) = (ifNat (lt x y) Z (S (div (sub x y) y)))

lt :: !Nat !Nat -> Xbool
lt Z (S x) = Xtrue
lt x Z = Xfalse
lt (S x) (S y) = (lt x y)

sub :: !Nat !Nat -> Nat
sub Z (S y) = Z
sub x Z = x
sub (S x) (S y) = (sub x y)

digit :: !Nat -> Digit
digit x = (find digitList x)

find :: !List !Nat -> Digit
find (Dl dig l1) Z = dig
find (Dl dig l1) (S x) = (find l1 x)

ap :: !List !List -> List
ap XNil l1 = l1
ap (Dl dig l1) l2 = (Dl dig (ap l1 l2))

add :: !Nat !Nat -> Nat
add Z y = y
add (S x) y = (S (add x y))

mult :: !Nat !Nat -> Nat
mult Z y = Z
mult (S x) y = (add y (mult x y))

fact :: !Nat -> Nat
fact Z = (S Z)
fact (S x) = (mult (S x) (fact x))

divides :: !Nat !Nat -> Xbool
divides n m 
| (m <> Z) = (auxdiv n m m)

auxdiv :: !Nat !Nat !Nat -> Xbool
auxdiv Z Z m = Xtrue
auxdiv Z (S x) m = Xfalse
auxdiv (S x) (S y) m = (auxdiv x y m)
auxdiv (S x) Z m = (auxdiv (S x) m m)

intsBetween :: !Nat !Nat -> List
intsBetween n m 
| (n == m) = XNil
| (n <> m) = (L n (intsBetween (S n) m))

sieve :: !List -> List
sieve (L n l1) = (L n (sieve (xfilter l1 n)))
sieve XNil = XNil

xfilter :: !List !Nat -> List
xfilter (L n l1) m 
| ((divides n m) == Xtrue) = (xfilter l1 m)
| ((divides n m) == Xfalse) = (L n (xfilter l1 m))
xfilter XNil m = XNil

e :: !Nat !List -> List
e n l1 = (Ll (conv n) l1)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (sieve (intsBetween (S (S Z)) (mult ten ten))) <<< "\n"
   = snd (fclose console world)
