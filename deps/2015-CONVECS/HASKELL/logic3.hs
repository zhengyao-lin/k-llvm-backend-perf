data Bool3 = D0 | D1 | D2
  deriving (Show, Eq, Ord)

a :: Bool3
b :: Bool3
c :: Bool3
d :: Bool3
e :: Bool3
f :: Bool3
g :: Bool3
h :: Bool3
plus :: Bool3 -> Bool3 -> Bool3
times :: Bool3 -> Bool3 -> Bool3
xand :: Bool3 -> Bool3 -> Bool3
yor :: Bool3 -> Bool3 -> Bool3
xnot :: Bool3 -> Bool3
xsucc :: Bool3 -> Bool3
eq :: Bool3 -> Bool3 -> Bool3

a = D0
b = D1
c = D2
d = D0
e = D1
f = D2
g = D0
h = D1
xsucc D0 = D1
xsucc D1 = D2
xsucc D2 = D0
plus D0 x = x
plus D1 x = (xsucc x)
plus D2 x = (xsucc (xsucc x))
times D0 x = D0
times D1 x = x
times D2 D0 = D0
times D2 D1 = D2
times D2 D2 = D1
xand x y = (plus  (times (times x x) (times y y)) (plus  (times D2 (times (times x x) y)) (plus  (times D2 (times (times y y) x)) (times D2 (times x y)) )))
yor x y = (plus  (times D2 (times (times x x) (times y y))) (plus  (times (times x x) y) (plus  (times (times y y) x) (plus  (times x y) (plus x y) ))))
xnot x = (plus (times D2 x) D1)
eq x y | x == y = D1
eq x y | x /= y = D0

main = do
 print (eq (xand (xand (xand a b) (xand c d)) (xand (xand e f) (xand g h))) (xnot (yor (yor (yor (xnot a) (xnot b)) (yor (xnot c) (xnot d))) (yor (yor (xnot e) (xnot f)) (yor (xnot g) (xnot h))))))
