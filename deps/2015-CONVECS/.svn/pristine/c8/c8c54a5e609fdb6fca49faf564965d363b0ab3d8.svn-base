module logic3

import StdEnv;

:: Bool3 =
     D0
   | D1
   | D2

instance == Bool3 where
   (==) (D0) (D0) = True
   (==) (D1) (D1) = True
   (==) (D2) (D2) = True
   (==) rec_x rec_y = False

instance <<< Bool3 where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (D1) = rec_file <<< "D1"
   (<<<) rec_file (D2) = rec_file <<< "D2"

a :: Bool3
a = D0

b :: Bool3
b = D1

c :: Bool3
c = D2

d :: Bool3
d = D0

e :: Bool3
e = D1

f :: Bool3
f = D2

g :: Bool3
g = D0

h :: Bool3
h = D1

succ :: !Bool3 -> Bool3
succ D0 = D1
succ D1 = D2
succ D2 = D0

plus :: !Bool3 !Bool3 -> Bool3
plus D0 x = x
plus D1 x = (succ x)
plus D2 x = (succ (succ x))

times :: !Bool3 !Bool3 -> Bool3
times D0 x = D0
times D1 x = x
times D2 D0 = D0
times D2 D1 = D2
times D2 D2 = D1

xand :: !Bool3 !Bool3 -> Bool3
xand x y = (plus  (times (times x x) (times y y)) (plus  (times D2 (times (times x x) y)) (plus  (times D2 (times (times y y) x)) (times D2 (times x y)) )))

yor :: !Bool3 !Bool3 -> Bool3
yor x y = (plus  (times D2 (times (times x x) (times y y))) (plus  (times (times x x) y) (plus  (times (times y y) x) (plus  (times x y) (plus x y) ))))

xnot :: !Bool3 -> Bool3
xnot x = (plus (times D2 x) D1)

eq :: !Bool3 !Bool3 -> Bool3
eq x y 
| (x == y) = D1
| (x <> y) = D0

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (eq (xand (xand (xand a b) (xand c d)) (xand (xand e f) (xand g h))) (xnot (yor (yor (yor (xnot a) (xnot b)) (yor (xnot c) (xnot d))) (yor (yor (xnot e) (xnot f)) (yor (xnot g) (xnot h)))))) <<< "\n"
   = snd (fclose console world)
