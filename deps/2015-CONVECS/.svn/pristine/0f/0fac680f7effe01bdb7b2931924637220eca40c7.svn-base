module fibfree

import StdEnv;

:: Nat =
     D
   | N0 !Nat
   | N1 !Nat
   | N2 !Nat
   | N3 !Nat
   | N4 !Nat
   | N5 !Nat
   | N6 !Nat
   | N7 !Nat
   | N8 !Nat
   | N9 !Nat

instance == Nat where
   (==) (D) (D) = True
   (==) (N0 rec_x1) (N0 rec_y1) = (rec_x1 == rec_y1)
   (==) (N1 rec_x1) (N1 rec_y1) = (rec_x1 == rec_y1)
   (==) (N2 rec_x1) (N2 rec_y1) = (rec_x1 == rec_y1)
   (==) (N3 rec_x1) (N3 rec_y1) = (rec_x1 == rec_y1)
   (==) (N4 rec_x1) (N4 rec_y1) = (rec_x1 == rec_y1)
   (==) (N5 rec_x1) (N5 rec_y1) = (rec_x1 == rec_y1)
   (==) (N6 rec_x1) (N6 rec_y1) = (rec_x1 == rec_y1)
   (==) (N7 rec_x1) (N7 rec_y1) = (rec_x1 == rec_y1)
   (==) (N8 rec_x1) (N8 rec_y1) = (rec_x1 == rec_y1)
   (==) (N9 rec_x1) (N9 rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D) = rec_file <<< "D"
   (<<<) rec_file (N0 rec_x1) = rec_file <<< "N0" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N1 rec_x1) = rec_file <<< "N1" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N2 rec_x1) = rec_file <<< "N2" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N3 rec_x1) = rec_file <<< "N3" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N4 rec_x1) = rec_file <<< "N4" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N5 rec_x1) = rec_file <<< "N5" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N6 rec_x1) = rec_file <<< "N6" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N7 rec_x1) = rec_file <<< "N7" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N8 rec_x1) = rec_file <<< "N8" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (N9 rec_x1) = rec_file <<< "N9" <<< " (" <<< rec_x1 <<< ")"

plus :: !Nat !Nat -> Nat
plus x D = x
plus D x = x
plus (N0 x) (N0 y) = (N0 (plus (plus x y) (N0 D)))
plus (N0 x) (N1 y) = (N1 (plus (plus x y) (N0 D)))
plus (N0 x) (N2 y) = (N2 (plus (plus x y) (N0 D)))
plus (N0 x) (N3 y) = (N3 (plus (plus x y) (N0 D)))
plus (N0 x) (N4 y) = (N4 (plus (plus x y) (N0 D)))
plus (N0 x) (N5 y) = (N5 (plus (plus x y) (N0 D)))
plus (N0 x) (N6 y) = (N6 (plus (plus x y) (N0 D)))
plus (N0 x) (N7 y) = (N7 (plus (plus x y) (N0 D)))
plus (N0 x) (N8 y) = (N8 (plus (plus x y) (N0 D)))
plus (N0 x) (N9 y) = (N9 (plus (plus x y) (N0 D)))
plus (N1 x) (N1 y) = (N2 (plus (plus x y) (N0 D)))
plus (N1 x) (N2 y) = (N3 (plus (plus x y) (N0 D)))
plus (N1 x) (N3 y) = (N4 (plus (plus x y) (N0 D)))
plus (N1 x) (N4 y) = (N5 (plus (plus x y) (N0 D)))
plus (N1 x) (N5 y) = (N6 (plus (plus x y) (N0 D)))
plus (N1 x) (N6 y) = (N7 (plus (plus x y) (N0 D)))
plus (N1 x) (N7 y) = (N8 (plus (plus x y) (N0 D)))
plus (N1 x) (N8 y) = (N9 (plus (plus x y) (N0 D)))
plus (N1 x) (N9 y) = (N0 (plus (plus x y) (N1 D)))
plus (N2 x) (N2 y) = (N4 (plus (plus x y) (N0 D)))
plus (N2 x) (N3 y) = (N5 (plus (plus x y) (N0 D)))
plus (N2 x) (N4 y) = (N6 (plus (plus x y) (N0 D)))
plus (N2 x) (N5 y) = (N7 (plus (plus x y) (N0 D)))
plus (N2 x) (N6 y) = (N8 (plus (plus x y) (N0 D)))
plus (N2 x) (N7 y) = (N9 (plus (plus x y) (N0 D)))
plus (N2 x) (N8 y) = (N0 (plus (plus x y) (N1 D)))
plus (N2 x) (N9 y) = (N1 (plus (plus x y) (N1 D)))
plus (N3 x) (N3 y) = (N6 (plus (plus x y) (N0 D)))
plus (N3 x) (N4 y) = (N7 (plus (plus x y) (N0 D)))
plus (N3 x) (N5 y) = (N8 (plus (plus x y) (N0 D)))
plus (N3 x) (N6 y) = (N9 (plus (plus x y) (N0 D)))
plus (N3 x) (N7 y) = (N0 (plus (plus x y) (N1 D)))
plus (N3 x) (N8 y) = (N1 (plus (plus x y) (N1 D)))
plus (N3 x) (N9 y) = (N2 (plus (plus x y) (N1 D)))
plus (N4 x) (N4 y) = (N8 (plus (plus x y) (N0 D)))
plus (N4 x) (N5 y) = (N9 (plus (plus x y) (N0 D)))
plus (N4 x) (N6 y) = (N0 (plus (plus x y) (N1 D)))
plus (N4 x) (N7 y) = (N1 (plus (plus x y) (N1 D)))
plus (N4 x) (N8 y) = (N2 (plus (plus x y) (N1 D)))
plus (N4 x) (N9 y) = (N3 (plus (plus x y) (N1 D)))
plus (N5 x) (N5 y) = (N0 (plus (plus x y) (N1 D)))
plus (N5 x) (N6 y) = (N1 (plus (plus x y) (N1 D)))
plus (N5 x) (N7 y) = (N2 (plus (plus x y) (N1 D)))
plus (N5 x) (N8 y) = (N3 (plus (plus x y) (N1 D)))
plus (N5 x) (N9 y) = (N4 (plus (plus x y) (N1 D)))
plus (N6 x) (N6 y) = (N2 (plus (plus x y) (N1 D)))
plus (N6 x) (N7 y) = (N3 (plus (plus x y) (N1 D)))
plus (N6 x) (N8 y) = (N4 (plus (plus x y) (N1 D)))
plus (N6 x) (N9 y) = (N5 (plus (plus x y) (N1 D)))
plus (N7 x) (N7 y) = (N4 (plus (plus x y) (N1 D)))
plus (N7 x) (N8 y) = (N5 (plus (plus x y) (N1 D)))
plus (N7 x) (N9 y) = (N6 (plus (plus x y) (N1 D)))
plus (N8 x) (N8 y) = (N6 (plus (plus x y) (N1 D)))
plus (N8 x) (N9 y) = (N7 (plus (plus x y) (N1 D)))
plus (N9 x) (N9 y) = (N8 (plus (plus x y) (N1 D)))
plus (N1 y) (N0 x)  = (N1 (plus (plus x y) (N0 D)))
plus (N2 y) (N0 x)  = (N2 (plus (plus x y) (N0 D)))
plus (N3 y) (N0 x)  = (N3 (plus (plus x y) (N0 D)))
plus (N4 y) (N0 x)  = (N4 (plus (plus x y) (N0 D)))
plus (N5 y) (N0 x)  = (N5 (plus (plus x y) (N0 D)))
plus (N6 y) (N0 x)  = (N6 (plus (plus x y) (N0 D)))
plus (N7 y) (N0 x)  = (N7 (plus (plus x y) (N0 D)))
plus (N8 y) (N0 x)  = (N8 (plus (plus x y) (N0 D)))
plus (N9 y) (N0 x)  = (N9 (plus (plus x y) (N0 D)))
plus (N2 y) (N1 x)  = (N3 (plus (plus x y) (N0 D)))
plus (N3 y) (N1 x)  = (N4 (plus (plus x y) (N0 D)))
plus (N4 y) (N1 x)  = (N5 (plus (plus x y) (N0 D)))
plus (N5 y) (N1 x)  = (N6 (plus (plus x y) (N0 D)))
plus (N6 y) (N1 x)  = (N7 (plus (plus x y) (N0 D)))
plus (N7 y) (N1 x)  = (N8 (plus (plus x y) (N0 D)))
plus (N8 y) (N1 x)  = (N9 (plus (plus x y) (N0 D)))
plus (N9 y) (N1 x)  = (N0 (plus (plus x y) (N1 D)))
plus (N3 y) (N2 x)  = (N5 (plus (plus x y) (N0 D)))
plus (N4 y) (N2 x)  = (N6 (plus (plus x y) (N0 D)))
plus (N5 y) (N2 x)  = (N7 (plus (plus x y) (N0 D)))
plus (N6 y) (N2 x)  = (N8 (plus (plus x y) (N0 D)))
plus (N7 y) (N2 x)  = (N9 (plus (plus x y) (N0 D)))
plus (N8 y) (N2 x)  = (N0 (plus (plus x y) (N1 D)))
plus (N9 y) (N2 x)  = (N1 (plus (plus x y) (N1 D)))
plus (N4 y) (N3 x)  = (N7 (plus (plus x y) (N0 D)))
plus (N5 y) (N3 x)  = (N8 (plus (plus x y) (N0 D)))
plus (N6 y) (N3 x)  = (N9 (plus (plus x y) (N0 D)))
plus (N7 y) (N3 x)  = (N0 (plus (plus x y) (N1 D)))
plus (N8 y) (N3 x)  = (N1 (plus (plus x y) (N1 D)))
plus (N9 y) (N3 x)  = (N2 (plus (plus x y) (N1 D)))
plus (N5 y) (N4 x)  = (N9 (plus (plus x y) (N0 D)))
plus (N6 y) (N4 x)  = (N0 (plus (plus x y) (N1 D)))
plus (N7 y) (N4 x)  = (N1 (plus (plus x y) (N1 D)))
plus (N8 y) (N4 x)  = (N2 (plus (plus x y) (N1 D)))
plus (N9 y) (N4 x)  = (N3 (plus (plus x y) (N1 D)))
plus (N6 y) (N5 x)  = (N1 (plus (plus x y) (N1 D)))
plus (N7 y) (N5 x)  = (N2 (plus (plus x y) (N1 D)))
plus (N8 y) (N5 x)  = (N3 (plus (plus x y) (N1 D)))
plus (N9 y) (N5 x)  = (N4 (plus (plus x y) (N1 D)))
plus (N7 y) (N6 x)  = (N3 (plus (plus x y) (N1 D)))
plus (N8 y) (N6 x)  = (N4 (plus (plus x y) (N1 D)))
plus (N9 y) (N6 x)  = (N5 (plus (plus x y) (N1 D)))
plus (N8 y) (N7 x)  = (N5 (plus (plus x y) (N1 D)))
plus (N9 y) (N7 x)  = (N6 (plus (plus x y) (N1 D)))
plus (N9 y) (N8 x)  = (N7 (plus (plus x y) (N1 D)))

mult0 :: !Nat -> Nat
mult0 x = D

mult1 :: !Nat -> Nat
mult1 x = x

mult2 :: !Nat -> Nat
mult2 D = D
mult2 (N0 x) = (N0 (plus (N0 D) (mult2 x)))
mult2 (N1 x) = (N2 (plus (N0 D) (mult2 x)))
mult2 (N2 x) = (N4 (plus (N0 D) (mult2 x)))
mult2 (N3 x) = (N6 (plus (N0 D) (mult2 x)))
mult2 (N4 x) = (N8 (plus (N0 D) (mult2 x)))
mult2 (N5 x) = (N0 (plus (N1 D) (mult2 x)))
mult2 (N6 x) = (N2 (plus (N1 D) (mult2 x)))
mult2 (N7 x) = (N4 (plus (N1 D) (mult2 x)))
mult2 (N8 x) = (N6 (plus (N1 D) (mult2 x)))
mult2 (N9 x) = (N8 (plus (N1 D) (mult2 x)))

mult3 :: !Nat -> Nat
mult3 D = D
mult3 (N0 x) = (N0 (plus (N0 D) (mult3 x)))
mult3 (N1 x) = (N3 (plus (N0 D) (mult3 x)))
mult3 (N2 x) = (N6 (plus (N0 D) (mult3 x)))
mult3 (N3 x) = (N9 (plus (N0 D) (mult3 x)))
mult3 (N4 x) = (N2 (plus (N1 D) (mult3 x)))
mult3 (N5 x) = (N5 (plus (N1 D) (mult3 x)))
mult3 (N6 x) = (N8 (plus (N1 D) (mult3 x)))
mult3 (N7 x) = (N1 (plus (N2 D) (mult3 x)))
mult3 (N8 x) = (N4 (plus (N2 D) (mult3 x)))
mult3 (N9 x) = (N7 (plus (N2 D) (mult3 x)))

mult4 :: !Nat -> Nat
mult4 D = D
mult4 (N0 x) = (N0 (plus (N0 D) (mult4 x)))
mult4 (N1 x) = (N4 (plus (N0 D) (mult4 x)))
mult4 (N2 x) = (N8 (plus (N0 D) (mult4 x)))
mult4 (N3 x) = (N2 (plus (N1 D) (mult4 x)))
mult4 (N4 x) = (N6 (plus (N1 D) (mult4 x)))
mult4 (N5 x) = (N0 (plus (N2 D) (mult4 x)))
mult4 (N6 x) = (N4 (plus (N2 D) (mult4 x)))
mult4 (N7 x) = (N8 (plus (N2 D) (mult4 x)))
mult4 (N8 x) = (N2 (plus (N3 D) (mult4 x)))
mult4 (N9 x) = (N6 (plus (N3 D) (mult4 x)))

mult5 :: !Nat -> Nat
mult5 D = D
mult5 (N0 x) = (N0 (plus (N0 D) (mult5 x)))
mult5 (N1 x) = (N5 (plus (N0 D) (mult5 x)))
mult5 (N2 x) = (N0 (plus (N1 D) (mult5 x)))
mult5 (N3 x) = (N5 (plus (N1 D) (mult5 x)))
mult5 (N4 x) = (N0 (plus (N2 D) (mult5 x)))
mult5 (N5 x) = (N5 (plus (N2 D) (mult5 x)))
mult5 (N6 x) = (N0 (plus (N3 D) (mult5 x)))
mult5 (N7 x) = (N5 (plus (N3 D) (mult5 x)))
mult5 (N8 x) = (N0 (plus (N4 D) (mult5 x)))
mult5 (N9 x) = (N5 (plus (N4 D) (mult5 x)))

mult6 :: !Nat -> Nat
mult6 D = D
mult6 (N0 x) = (N0 (plus (N0 D) (mult6 x)))
mult6 (N1 x) = (N6 (plus (N0 D) (mult6 x)))
mult6 (N2 x) = (N2 (plus (N1 D) (mult6 x)))
mult6 (N3 x) = (N8 (plus (N1 D) (mult6 x)))
mult6 (N4 x) = (N4 (plus (N2 D) (mult6 x)))
mult6 (N5 x) = (N0 (plus (N3 D) (mult6 x)))
mult6 (N6 x) = (N6 (plus (N3 D) (mult6 x)))
mult6 (N7 x) = (N2 (plus (N4 D) (mult6 x)))
mult6 (N8 x) = (N8 (plus (N4 D) (mult6 x)))
mult6 (N9 x) = (N4 (plus (N5 D) (mult6 x)))

mult7 :: !Nat -> Nat
mult7 D = D
mult7 (N0 x) = (N0 (plus (N0 D) (mult7 x)))
mult7 (N1 x) = (N7 (plus (N0 D) (mult7 x)))
mult7 (N2 x) = (N4 (plus (N1 D) (mult7 x)))
mult7 (N3 x) = (N1 (plus (N2 D) (mult7 x)))
mult7 (N4 x) = (N8 (plus (N2 D) (mult7 x)))
mult7 (N5 x) = (N5 (plus (N3 D) (mult7 x)))
mult7 (N6 x) = (N2 (plus (N4 D) (mult7 x)))
mult7 (N7 x) = (N9 (plus (N4 D) (mult7 x)))
mult7 (N8 x) = (N6 (plus (N5 D) (mult7 x)))
mult7 (N9 x) = (N3 (plus (N6 D) (mult7 x)))

mult8 :: !Nat -> Nat
mult8 D = D
mult8 (N0 x) = (N0 (plus (N0 D) (mult8 x)))
mult8 (N1 x) = (N8 (plus (N0 D) (mult8 x)))
mult8 (N2 x) = (N6 (plus (N1 D) (mult8 x)))
mult8 (N3 x) = (N4 (plus (N2 D) (mult8 x)))
mult8 (N4 x) = (N2 (plus (N3 D) (mult8 x)))
mult8 (N5 x) = (N0 (plus (N4 D) (mult8 x)))
mult8 (N6 x) = (N8 (plus (N4 D) (mult8 x)))
mult8 (N7 x) = (N6 (plus (N5 D) (mult8 x)))
mult8 (N8 x) = (N4 (plus (N6 D) (mult8 x)))
mult8 (N9 x) = (N2 (plus (N7 D) (mult8 x)))

mult9 :: !Nat -> Nat
mult9 D = D
mult9 (N0 x) = (N0 (plus (N0 D) (mult9 x)))
mult9 (N1 x) = (N9 (plus (N0 D) (mult9 x)))
mult9 (N2 x) = (N8 (plus (N1 D) (mult9 x)))
mult9 (N3 x) = (N7 (plus (N2 D) (mult9 x)))
mult9 (N4 x) = (N6 (plus (N3 D) (mult9 x)))
mult9 (N5 x) = (N5 (plus (N4 D) (mult9 x)))
mult9 (N6 x) = (N4 (plus (N5 D) (mult9 x)))
mult9 (N7 x) = (N3 (plus (N6 D) (mult9 x)))
mult9 (N8 x) = (N2 (plus (N7 D) (mult9 x)))
mult9 (N9 x) = (N1 (plus (N8 D) (mult9 x)))

times :: !Nat !Nat -> Nat
times x D = D
times (N0 x) y = (plus (N0 (times x y)) (mult0 y))
times (N1 x) y = (plus (N0 (times x y)) (mult1 y))
times (N2 x) y = (plus (N0 (times x y)) (mult2 y))
times (N3 x) y = (plus (N0 (times x y)) (mult3 y))
times (N4 x) y = (plus (N0 (times x y)) (mult4 y))
times (N5 x) y = (plus (N0 (times x y)) (mult5 y))
times (N6 x) y = (plus (N0 (times x y)) (mult6 y))
times (N7 x) y = (plus (N0 (times x y)) (mult7 y))
times (N8 x) y = (plus (N0 (times x y)) (mult8 y))
times (N9 x) y = (plus (N0 (times x y)) (mult9 y))
times D x = D

prec :: !Nat -> Nat
prec D = D
prec (N0 x) = D
prec (N1 x) = (N0 x)
prec (N2 x) = (N1 x)
prec (N3 x) = (N2 x)
prec (N4 x) = (N3 x)
prec (N5 x) = (N4 x)
prec (N6 x) = (N5 x)
prec (N7 x) = (N6 x)
prec (N8 x) = (N7 x)
prec (N9 x) = (N8 x)

fact :: !Nat -> Nat
fact x 
| (x == D) = (N1 D)
| (x <> D) = (times x (fact (prec x)))

fib :: !Nat -> Nat
fib x 
| (x == D) = (N1 D)
| (x <> D) && (x == (N1 D)) = (N1 D)
| (x <> D) && (x <> (N1 D)) = (plus (fib (prec x)) (fib (prec (prec x))))

reduce :: !Nat -> Nat
reduce D = D
reduce (N0 x) 
| ((reduce x) == D) = D
| ((reduce x) <> D) = (N0 (reduce x))
reduce (N1 x) = (N1 (reduce x))
reduce (N2 x) = (N2 (reduce x))
reduce (N3 x) = (N3 (reduce x))
reduce (N4 x) = (N4 (reduce x))
reduce (N5 x) = (N5 (reduce x))
reduce (N6 x) = (N6 (reduce x))
reduce (N7 x) = (N7 (reduce x))
reduce (N8 x) = (N8 (reduce x))
reduce (N9 x) = (N9 (reduce x))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (reduce (fib (N6 (N1 D)))) <<< "\n"
   # console = console <<< (reduce (fib (N7 (N5 D)))) <<< "\n"
   = snd (fclose console world)
