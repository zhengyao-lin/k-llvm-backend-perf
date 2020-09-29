data Boolean = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Nat = Zero | S Nat 
  deriving (Show, Eq, Ord)

data SNat = Exz | Exone | Exs SNat  | Explus SNat SNat  | Exmult SNat SNat  | Exexp SNat SNat 
  deriving (Show, Eq, Ord)

data Tree = Leaf Nat  | Node Nat Nat Tree Tree 
  deriving (Show, Eq, Ord)

yor :: Boolean -> Boolean -> Boolean
xand :: Boolean -> Boolean -> Boolean
neg :: Boolean -> Boolean
equal :: Nat -> Nat -> Boolean
less :: Nat -> Nat -> Boolean
plus :: Nat -> Nat -> Nat
mult :: Nat -> Nat -> Nat
xexp :: Nat -> Nat -> Nat
succ17 :: Nat -> Nat
pred17 :: Nat -> Nat
plus17 :: Nat -> Nat -> Nat
mult17 :: Nat -> Nat -> Nat
exp17 :: Nat -> Nat -> Nat
buildtree :: Nat -> Nat -> Tree
calctree17 :: Nat -> Nat
getmax :: Tree -> Nat
getval :: Tree -> Nat
eval :: SNat -> Nat
eval17 :: SNat -> Nat
evalsym17 :: SNat -> Nat
evalexp17 :: SNat -> Nat
benchevalsym17 :: SNat -> Boolean
benchevalexp17 :: SNat -> Boolean
benchevaltree17 :: SNat -> Boolean
one :: SNat
two :: SNat
three :: SNat
four :: SNat
five :: SNat
six :: SNat
seven :: SNat
eight :: SNat
nine :: SNat
ten :: SNat
eleven :: SNat
twelve :: SNat
thirteen :: SNat
fourteen :: SNat
fifteen :: SNat
sixteen :: SNat
seventeen :: SNat
eighteen :: SNat
nineteen :: SNat
twenty :: SNat
twentyone :: SNat
twentytwo :: SNat
twentythree :: SNat
twentyfour :: SNat
twentyfive :: SNat
twentysix :: SNat
twentyseven :: SNat
twentyeight :: SNat
twentynine :: SNat
thirty :: SNat
thirtyone :: SNat
thirtytwo :: SNat
thirtythree :: SNat
thirtyfour :: SNat
thirtyfive :: SNat
dec :: SNat -> SNat
d0 :: Nat
d1 :: Nat
d2 :: Nat
d3 :: Nat
d4 :: Nat
d5 :: Nat
d6 :: Nat
d7 :: Nat
d8 :: Nat
d9 :: Nat
d10 :: Nat
d11 :: Nat
d12 :: Nat
d13 :: Nat
d14 :: Nat
d15 :: Nat
d16 :: Nat
d17 :: Nat
expand :: SNat -> SNat
nat2sym :: Nat -> SNat

yor Xtrue b = Xtrue
yor Xfalse b = b
xand Xtrue b = b
xand Xfalse b = Xfalse
neg Xfalse = Xtrue
neg Xtrue = Xfalse
d0 = Zero
d1 = (S d0)
d2 = (S d1)
d3 = (S d2)
d4 = (S d3)
d5 = (S d4)
d6 = (S d5)
d7 = (S d6)
d8 = (S d7)
d9 = (S d8)
d10 = (S d9)
d11 = (S d10)
d12 = (S d11)
d13 = (S d12)
d14 = (S d13)
d15 = (S d14)
d16 = (S d15)
d17 = (S d16)
one = (Exs Exz)
two = (Exs one)
three = (Exs two)
four = (Exs three)
five = (Exs four)
six = (Exs five)
seven = (Exs six)
eight = (Exs seven)
nine = (Exs eight)
ten = (Exs nine)
eleven = (Exs ten)
twelve = (Exs eleven)
thirteen = (Exs twelve)
fourteen = (Exs thirteen)
fifteen = (Exs fourteen)
sixteen = (Exs fifteen)
seventeen = (Exs sixteen)
eighteen = (Exs seventeen)
nineteen = (Exs eighteen)
twenty = (Exs nineteen)
twentyone = (Exs twenty)
twentytwo = (Exs twentyone)
twentythree = (Exs twentytwo)
twentyfour = (Exs twentythree)
twentyfive = (Exs twentyfour)
twentysix = (Exs twentyfive)
twentyseven = (Exs twentysix)
twentyeight = (Exs twentyseven)
twentynine = (Exs twentyeight)
thirty = (Exs twentynine)
thirtyone = (Exs thirty)
thirtytwo = (Exs thirtyone)
thirtythree = (Exs thirtytwo)
thirtyfour = (Exs thirtythree)
thirtyfive = (Exs thirtyfour)
dec (Exexp xs Exz) = (Exs Exz)
dec (Exexp xs (Exs ys)) = (Exmult (Exexp xs ys) xs)
dec (Exexp xs (Explus ys zs)) = (Exmult (Exexp xs ys) (Exexp xs zs))
dec (Exexp xs (Exmult ys zs)) = (dec (Exexp (Exexp xs ys) zs))
dec (Exexp xs (Exexp ys zs)) = (dec (Exexp xs (dec (Exexp ys zs))))
benchevalsym17 xs = (equal (eval17 (Exexp two xs)) (evalsym17 (Exexp two xs)))
benchevalexp17 xs = (equal (eval17 (Exexp two xs)) (evalexp17 (Exexp two xs)))
benchevaltree17 xs = (equal (calctree17 (eval xs)) (getval (buildtree (eval xs) Zero)))
equal Zero Zero = Xtrue
equal Zero (S x) = Xfalse
equal (S x) Zero = Xfalse
equal (S x) (S y) = (equal x y)
less Zero y = Xtrue
less (S x) (S y) = (less x y)
less (S x) Zero = Xfalse
plus x Zero = x
plus x (S y) = (S (plus x y))
mult x Zero = Zero
mult x (S y) = (plus (mult x y) x)
xexp x Zero = (S Zero)
xexp x (S y) = (mult x (xexp x y))
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
pred17 (S x) = x
pred17 Zero = (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))))
plus17 x Zero = x
plus17 x (S y) = (succ17 (plus17 x y))
mult17 x Zero = Zero
mult17 x (S y) = (plus17 x (mult17 x y))
exp17 x Zero = (succ17 Zero)
exp17 x (S y) = (mult17 x (exp17 x y))
eval Exz = Zero
eval (Exs xs) = (S (eval xs))
eval (Explus xs ys) = (plus (eval xs) (eval ys))
eval (Exmult xs ys) = (mult (eval xs) (eval ys))
eval (Exexp xs ys) = (xexp (eval xs) (eval ys))
eval17 Exz = Zero
eval17 Exone = (S Zero)
eval17 (Exs xs) = (succ17 (eval17 xs))
eval17 (Explus xs ys) = (plus17 (eval17 xs) (eval17 ys))
eval17 (Exmult xs ys) = (mult17 (eval17 xs) (eval17 ys))
eval17 (Exexp xs ys) = (exp17 (eval17 xs) (eval ys))
evalsym17 Exz = Zero
evalsym17 (Exs xs) = (succ17 (evalsym17 xs))
evalsym17 (Explus xs ys) = (plus17 (evalsym17 xs) (evalsym17 ys))
evalsym17 (Exmult xs Exz) = Zero
evalsym17 (Exmult xs (Exs ys)) = (evalsym17 (Explus (Exmult xs ys) xs))
evalsym17 (Exmult xs (Explus ys zs)) = (evalsym17 (Explus (Exmult xs ys) (Exmult xs zs)))
evalsym17 (Exmult xs (Exmult ys zs)) = (evalsym17 (Exmult (Exmult xs ys) zs))
evalsym17 (Exmult xs (Exexp ys zs)) = (evalsym17 (Exmult xs (dec (Exexp ys zs))))
evalsym17 (Exexp xs Exz) = (succ17 Zero)
evalsym17 (Exexp xs (Exs ys)) = (evalsym17 (Exmult (Exexp xs ys) xs))
evalsym17 (Exexp xs (Explus ys zs)) = (evalsym17 (Exmult (Exexp xs ys) (Exexp xs zs)))
evalsym17 (Exexp xs (Exmult ys zs)) = (evalsym17 (Exexp (Exexp xs ys) zs))
evalsym17 (Exexp xs (Exexp ys zs)) = (evalsym17 (Exexp xs (dec (Exexp ys zs))))
evalexp17 xs = (eval17 (expand xs))
getval (Leaf xval) = xval
getval (Node xval max left right) = xval
getmax (Leaf xval) = xval
getmax (Node xval max left right) = max
calctree17 x = (mult17 (exp17 (S (S Zero)) (pred17 x)) (pred17 (exp17 (S (S Zero)) x)))
nat2sym Zero = Exz
nat2sym (S x) = (Exs (nat2sym x))
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
buildtree Zero xval = (Leaf xval)
buildtree (S x) y = (Node (plus17 (getval (buildtree x y)) (getval (buildtree x (succ17 (getmax (buildtree x y)))))) (getmax (buildtree x (succ17 (getmax (buildtree x y))))) (buildtree x y) (buildtree x (succ17 (getmax (buildtree x y)))))

main = do
 print (benchevaltree17 twenty)
