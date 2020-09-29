module benchexpr20

import StdEnv;

:: Boolean =
     Xtrue
   | Xfalse

:: Nat =
     Zero
   | S !Nat

:: SNat =
     Exz
   | Exone
   | Exs !SNat
   | Explus !SNat !SNat
   | Exmult !SNat !SNat
   | Exexp !SNat !SNat

:: Tree =
     Leaf !Nat
   | Node !Nat !Nat !Tree !Tree

instance == Boolean where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Nat where
   (==) (Zero) (Zero) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == SNat where
   (==) (Exz) (Exz) = True
   (==) (Exone) (Exone) = True
   (==) (Exs rec_x1) (Exs rec_y1) = (rec_x1 == rec_y1)
   (==) (Explus rec_x1 rec_x2) (Explus rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (Exmult rec_x1 rec_x2) (Exmult rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (Exexp rec_x1 rec_x2) (Exexp rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == Tree where
   (==) (Leaf rec_x1) (Leaf rec_y1) = (rec_x1 == rec_y1)
   (==) (Node rec_x1 rec_x2 rec_x3 rec_x4) (Node rec_y1 rec_y2 rec_y3 rec_y4) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4)
   (==) rec_x rec_y = False

instance <<< Boolean where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Nat where
   (<<<) rec_file (Zero) = rec_file <<< "Zero"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

instance <<< SNat where
   (<<<) rec_file (Exz) = rec_file <<< "Exz"
   (<<<) rec_file (Exone) = rec_file <<< "Exone"
   (<<<) rec_file (Exs rec_x1) = rec_file <<< "Exs" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Explus rec_x1 rec_x2) = rec_file <<< "Explus" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (Exmult rec_x1 rec_x2) = rec_file <<< "Exmult" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (Exexp rec_x1 rec_x2) = rec_file <<< "Exexp" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< Tree where
   (<<<) rec_file (Leaf rec_x1) = rec_file <<< "Leaf" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Node rec_x1 rec_x2 rec_x3 rec_x4) = rec_file <<< "Node" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ")"

yor :: !Boolean !Boolean -> Boolean
yor Xtrue b = Xtrue
yor Xfalse b = b

xand :: !Boolean !Boolean -> Boolean
xand Xtrue b = b
xand Xfalse b = Xfalse

neg :: !Boolean -> Boolean
neg Xfalse = Xtrue
neg Xtrue = Xfalse

d0 :: Nat
d0 = Zero

d1 :: Nat
d1 = (S d0)

d2 :: Nat
d2 = (S d1)

d3 :: Nat
d3 = (S d2)

d4 :: Nat
d4 = (S d3)

d5 :: Nat
d5 = (S d4)

d6 :: Nat
d6 = (S d5)

d7 :: Nat
d7 = (S d6)

d8 :: Nat
d8 = (S d7)

d9 :: Nat
d9 = (S d8)

d10 :: Nat
d10 = (S d9)

d11 :: Nat
d11 = (S d10)

d12 :: Nat
d12 = (S d11)

d13 :: Nat
d13 = (S d12)

d14 :: Nat
d14 = (S d13)

d15 :: Nat
d15 = (S d14)

d16 :: Nat
d16 = (S d15)

d17 :: Nat
d17 = (S d16)

xone :: SNat
xone = (Exs Exz)

two :: SNat
two = (Exs xone)

three :: SNat
three = (Exs two)

four :: SNat
four = (Exs three)

five :: SNat
five = (Exs four)

six :: SNat
six = (Exs five)

seven :: SNat
seven = (Exs six)

eight :: SNat
eight = (Exs seven)

nine :: SNat
nine = (Exs eight)

ten :: SNat
ten = (Exs nine)

eleven :: SNat
eleven = (Exs ten)

twelve :: SNat
twelve = (Exs eleven)

thirteen :: SNat
thirteen = (Exs twelve)

fourteen :: SNat
fourteen = (Exs thirteen)

fifteen :: SNat
fifteen = (Exs fourteen)

sixteen :: SNat
sixteen = (Exs fifteen)

seventeen :: SNat
seventeen = (Exs sixteen)

eighteen :: SNat
eighteen = (Exs seventeen)

nineteen :: SNat
nineteen = (Exs eighteen)

twenty :: SNat
twenty = (Exs nineteen)

twentyone :: SNat
twentyone = (Exs twenty)

twentytwo :: SNat
twentytwo = (Exs twentyone)

twentythree :: SNat
twentythree = (Exs twentytwo)

twentyfour :: SNat
twentyfour = (Exs twentythree)

twentyfive :: SNat
twentyfive = (Exs twentyfour)

twentysix :: SNat
twentysix = (Exs twentyfive)

twentyseven :: SNat
twentyseven = (Exs twentysix)

twentyeight :: SNat
twentyeight = (Exs twentyseven)

twentynine :: SNat
twentynine = (Exs twentyeight)

thirty :: SNat
thirty = (Exs twentynine)

thirtyone :: SNat
thirtyone = (Exs thirty)

thirtytwo :: SNat
thirtytwo = (Exs thirtyone)

thirtythree :: SNat
thirtythree = (Exs thirtytwo)

thirtyfour :: SNat
thirtyfour = (Exs thirtythree)

thirtyfive :: SNat
thirtyfive = (Exs thirtyfour)

xdec :: !SNat -> SNat
xdec (Exexp xs Exz) = (Exs Exz)
xdec (Exexp xs (Exs ys)) = (Exmult (Exexp xs ys) xs)
xdec (Exexp xs (Explus ys zs)) = (Exmult (Exexp xs ys) (Exexp xs zs))
xdec (Exexp xs (Exmult ys zs)) = (xdec (Exexp (Exexp xs ys) zs))
xdec (Exexp xs (Exexp ys zs)) = (xdec (Exexp xs (xdec (Exexp ys zs))))

benchevalsym17 :: !SNat -> Boolean
benchevalsym17 xs = (equal (eval17 (Exexp two xs)) (evalsym17 (Exexp two xs)))

benchevalexp17 :: !SNat -> Boolean
benchevalexp17 xs = (equal (eval17 (Exexp two xs)) (evalexp17 (Exexp two xs)))

benchevaltree17 :: !SNat -> Boolean
benchevaltree17 xs = (equal (calctree17 (eval xs)) (getval (buildtree (eval xs) Zero)))

equal :: !Nat !Nat -> Boolean
equal Zero Zero = Xtrue
equal Zero (S x) = Xfalse
equal (S x) Zero = Xfalse
equal (S x) (S y) = (equal x y)

less :: !Nat !Nat -> Boolean
less Zero y = Xtrue
less (S x) (S y) = (less x y)
less (S x) Zero = Xfalse

plus :: !Nat !Nat -> Nat
plus x Zero = x
plus x (S y) = (S (plus x y))

mult :: !Nat !Nat -> Nat
mult x Zero = Zero
mult x (S y) = (plus (mult x y) x)

xexp :: !Nat !Nat -> Nat
xexp x Zero = (S Zero)
xexp x (S y) = (mult x (xexp x y))

succ17 :: !Nat -> Nat
succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))))) = Zero
succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))) = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))))
succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))) = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))))
succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))) = (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))
succ17 (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))) = (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))
succ17 (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))) = (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))
succ17 (S (S (S (S (S (S (S (S (S (S Zero)))))))))) = (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))
succ17 (S (S (S (S (S (S (S (S (S Zero))))))))) = (S (S (S (S (S (S (S (S (S (S Zero))))))))))
succ17 (S (S (S (S (S (S (S (S Zero)))))))) = (S (S (S (S (S (S (S (S (S Zero)))))))))
succ17 (S (S (S (S (S (S (S Zero))))))) = (S (S (S (S (S (S (S (S Zero))))))))
succ17 (S (S (S (S (S (S Zero)))))) = (S (S (S (S (S (S (S Zero)))))))
succ17 (S (S (S (S (S Zero))))) = (S (S (S (S (S (S Zero))))))
succ17 (S (S (S (S Zero)))) = (S (S (S (S (S Zero)))))
succ17 (S (S (S Zero))) = (S (S (S (S Zero))))
succ17 (S (S Zero)) = (S (S (S Zero)))
succ17 (S Zero) = (S (S Zero))
succ17 Zero = (S Zero)

pred17 :: !Nat -> Nat
pred17 (S x) = x
pred17 Zero = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))))

plus17 :: !Nat !Nat -> Nat
plus17 x Zero = x
plus17 x (S y) = (succ17 (plus17 x y))

mult17 :: !Nat !Nat -> Nat
mult17 x Zero = Zero
mult17 x (S y) = (plus17 x (mult17 x y))

exp17 :: !Nat !Nat -> Nat
exp17 x Zero = (succ17 Zero)
exp17 x (S y) = (mult17 x (exp17 x y))

eval :: !SNat -> Nat
eval Exz = Zero
eval (Exs xs) = (S (eval xs))
eval (Explus xs ys) = (plus (eval xs) (eval ys))
eval (Exmult xs ys) = (mult (eval xs) (eval ys))
eval (Exexp xs ys) = (xexp (eval xs) (eval ys))

eval17 :: !SNat -> Nat
eval17 Exz = Zero
eval17 Exone = (S Zero)
eval17 (Exs xs) = (succ17 (eval17 xs))
eval17 (Explus xs ys) = (plus17 (eval17 xs) (eval17 ys))
eval17 (Exmult xs ys) = (mult17 (eval17 xs) (eval17 ys))
eval17 (Exexp xs ys) = (exp17 (eval17 xs) (eval ys))

evalsym17 :: !SNat -> Nat
evalsym17 Exz = Zero
evalsym17 (Exs xs) = (succ17 (evalsym17 xs))
evalsym17 (Explus xs ys) = (plus17 (evalsym17 xs) (evalsym17 ys))
evalsym17 (Exmult xs Exz) = Zero
evalsym17 (Exmult xs (Exs ys)) = (evalsym17 (Explus (Exmult xs ys) xs))
evalsym17 (Exmult xs (Explus ys zs)) = (evalsym17 (Explus (Exmult xs ys) (Exmult xs zs)))
evalsym17 (Exmult xs (Exmult ys zs)) = (evalsym17 (Exmult (Exmult xs ys) zs))
evalsym17 (Exmult xs (Exexp ys zs)) = (evalsym17 (Exmult xs (xdec (Exexp ys zs))))
evalsym17 (Exexp xs Exz) = (succ17 Zero)
evalsym17 (Exexp xs (Exs ys)) = (evalsym17 (Exmult (Exexp xs ys) xs))
evalsym17 (Exexp xs (Explus ys zs)) = (evalsym17 (Exmult (Exexp xs ys) (Exexp xs zs)))
evalsym17 (Exexp xs (Exmult ys zs)) = (evalsym17 (Exexp (Exexp xs ys) zs))
evalsym17 (Exexp xs (Exexp ys zs)) = (evalsym17 (Exexp xs (xdec (Exexp ys zs))))

evalexp17 :: !SNat -> Nat
evalexp17 xs = (eval17 (expand xs))

getval :: !Tree -> Nat
getval (Leaf val) = val
getval (Node val max left right) = val

getmax :: !Tree -> Nat
getmax (Leaf val) = val
getmax (Node val max left right) = max

calctree17 :: !Nat -> Nat
calctree17 x = (mult17 (exp17 (S (S Zero)) (pred17 x)) (pred17 (exp17 (S (S Zero)) x)))

nat2sym :: !Nat -> SNat
nat2sym Zero = Exz
nat2sym (S x) = (Exs (nat2sym x))

expand :: !SNat -> SNat
expand Exz = Exz
expand Exone = Exone
expand (Exs xs) = (Explus Exone (expand xs))
expand (Explus xs ys) = (Explus (expand xs) (expand ys))
expand (Exmult xs Exz) = Exz
expand (Exmult xs Exone) = (expand xs)
expand (Exmult xs (Explus ys zs)) = (expand (Explus (Exmult xs ys) (Exmult xs zs)))
expand (Exmult xs (Exs ys)) = (expand (Exmult xs (expand (Exs ys))))
expand (Exmult xs (Exmult ys zs)) = (expand (Exmult xs (expand (Exmult ys zs))))
expand (Exmult xs (Exexp ys zs)) = (expand (Exmult xs (expand (Exexp ys zs))))
expand (Exexp xs Exz) = Exone
expand (Exexp xs Exone) = (expand xs)
expand (Exexp xs (Explus ys zs)) = (expand (Exmult (Exexp xs ys) (Exexp xs zs)))
expand (Exexp xs (Exs ys)) = (expand (Exexp xs (expand (Exs ys))))
expand (Exexp xs (Exmult ys zs)) = (expand (Exexp xs (expand (Exmult ys zs))))
expand (Exexp xs (Exexp ys zs)) = (expand (Exexp xs (expand (Exexp ys zs))))

buildtree :: !Nat !Nat -> Tree
buildtree Zero val = (Leaf val)
buildtree (S x) y = (Node (plus17 (getval (buildtree x y)) (getval (buildtree x (succ17 (getmax (buildtree x y)))))) (getmax (buildtree x (succ17 (getmax (buildtree x y))))) (buildtree x y) (buildtree x (succ17 (getmax (buildtree x y)))))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (benchevalexp17 twenty) <<< "\n"
   = snd (fclose console world)
