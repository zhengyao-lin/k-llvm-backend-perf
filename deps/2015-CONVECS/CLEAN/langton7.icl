module langton7

import StdEnv;

:: Nat =
     D0
   | S !Nat

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

d1 :: Nat
d1 = (S D0)

d2 :: Nat
d2 = (S (S D0))

d3 :: Nat
d3 = (S (S (S D0)))

d4 :: Nat
d4 = (S (S (S (S D0))))

d5 :: Nat
d5 = (S (S (S (S (S D0)))))

d6 :: Nat
d6 = (S (S (S (S (S (S D0))))))

d7 :: Nat
d7 = (S (S (S (S (S (S (S D0)))))))

plus :: !Nat !Nat -> Nat
plus x D0 = x
plus (S x) y = (S (plus x y))
plus x (S y) = (S (plus x y))

langton :: !Nat !Nat !Nat !Nat !Nat -> Nat
langton D0 (S D0) D0 D0 D0 = d2
langton D0 (S (S (S (S (S (S D0)))))) D0 D0 D0 = d3
langton D0 (S (S (S (S (S (S (S D0))))))) D0 D0 D0 = d1
langton D0 x D0 D0 D0 = D0
langton D0 (S D0) D0 D0 (S D0) = d2
langton D0 (S (S D0)) D0 D0 (S D0) = d2
langton D0 (S (S (S D0))) D0 D0 (S D0) = d2
langton D0 (S D0) D0 D0 (S (S D0)) = d2
langton D0 (S (S (S (S (S (S D0)))))) D0 D0 (S (S D0)) = d2
langton D0 (S (S (S (S (S (S (S D0))))))) D0 D0 (S (S D0)) = d2
langton D0 (S (S D0)) D0 D0 (S (S (S (S (S D0))))) = d5
langton D0 (S (S D0)) D0 D0 (S (S (S (S (S (S D0)))))) = d2
langton D0 (S (S D0)) D0 D0 (S (S (S (S (S (S (S D0))))))) = d2
langton D0 (S (S D0)) D0 (S D0) D0 = d2
langton D0 (S (S D0)) D0 (S (S D0)) (S D0) = d5
langton D0 (S (S D0)) D0 (S (S D0)) (S (S (S D0))) = d2
langton D0 (S (S D0)) D0 (S (S (S (S (S D0))))) (S (S D0)) = d2
langton (S D0) (S (S D0)) D0 (S (S D0)) (S (S (S D0))) = d1
langton (S D0) (S (S D0)) D0 (S (S D0)) (S (S (S (S D0)))) = d1
langton (S D0) (S (S D0)) D0 (S (S D0)) (S (S (S (S (S D0))))) = d5
langton (S D0) (S (S D0)) D0 (S (S D0)) (S (S (S (S (S (S D0)))))) = d1
langton (S D0) (S (S D0)) D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d1
langton (S D0) (S (S (S (S (S D0))))) D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S D0)))) (S (S D0)) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S D0)))) (S (S (S D0))) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S D0)))) (S (S (S (S D0)))) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S D0)))) (S (S (S (S (S (S (S D0))))))) = d1
langton (S D0) (S (S (S (S (S D0))))) D0 (S (S (S (S (S (S D0)))))) (S (S D0)) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S (S (S (S D0))))))) (S (S D0)) = d1
langton (S D0) (S (S (S (S (S D0))))) D0 (S (S (S (S (S (S (S D0))))))) (S (S D0)) = d5
langton (S D0) (S (S D0)) D0 (S (S (S (S (S (S (S D0))))))) (S (S (S (S (S D0))))) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S (S (S (S D0))))))) (S (S (S (S (S (S D0)))))) = d1
langton (S D0) (S (S D0)) D0 (S (S (S (S (S (S (S D0))))))) (S (S (S (S (S (S (S D0))))))) = d1
langton (S (S D0)) (S (S (S (S (S (S (S D0))))))) D0 (S (S (S (S (S D0))))) (S (S D0)) = d1
langton D0 (S (S (S (S (S (S (S D0))))))) (S D0) D0 D0 = d7
langton D0 (S (S (S (S D0)))) (S D0) D0 (S (S D0)) = d4
langton D0 (S (S (S (S (S (S (S D0))))))) (S D0) D0 (S (S D0)) = d7
langton D0 (S (S (S (S D0)))) (S D0) (S D0) (S (S D0)) = d4
langton D0 (S (S (S (S (S (S (S D0))))))) (S D0) (S D0) (S (S D0)) = d7
langton D0 (S (S D0)) (S D0) (S (S D0)) D0 = d6
langton D0 (S (S (S (S D0)))) (S D0) (S (S D0)) (S (S D0)) = d4
langton D0 (S (S (S (S (S (S D0)))))) (S D0) (S (S D0)) (S (S D0)) = d3
langton D0 (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) (S (S D0)) = d7
langton D0 (S (S D0)) (S D0) (S (S D0)) (S (S (S D0))) = d7
langton D0 (S (S D0)) (S D0) (S (S D0)) (S (S (S (S D0)))) = d4
langton D0 (S (S D0)) (S D0) (S (S D0)) (S (S (S (S (S (S D0)))))) = d6
langton D0 (S (S (S (S D0)))) (S D0) (S (S D0)) (S (S (S (S (S (S D0)))))) = d4
langton D0 (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) (S (S (S (S (S (S D0)))))) = d7
langton D0 (S D0) (S D0) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = D0
langton D0 (S (S D0)) (S D0) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d7
langton D0 (S (S D0)) (S D0) (S (S (S (S (S D0))))) (S (S (S (S D0)))) = d7
langton (S D0) (S (S (S (S D0)))) (S D0) (S D0) (S (S D0)) = d4
langton (S D0) (S (S (S (S (S (S (S D0))))))) (S D0) (S D0) (S (S D0)) = d7
langton (S D0) (S (S D0)) (S D0) (S D0) (S (S (S (S (S D0))))) = d2
langton (S D0) (S (S (S (S D0)))) (S D0) (S (S D0)) (S (S D0)) = d4
langton (S D0) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) (S (S D0)) = d7
langton (S D0) (S (S D0)) (S D0) (S (S D0)) (S (S (S (S D0)))) = d4
langton (S D0) (S (S D0)) (S D0) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d7
langton (S (S D0)) (S (S (S (S D0)))) (S D0) (S (S D0)) (S (S D0)) = d4
langton (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) (S (S D0)) = d7
langton (S (S D0)) (S (S (S D0))) (S D0) (S (S D0)) (S (S (S (S D0)))) = d4
langton (S (S D0)) (S (S (S (S D0)))) (S D0) (S (S D0)) (S (S (S (S (S D0))))) = d7
langton (S (S D0)) (S (S (S (S D0)))) (S D0) (S (S (S D0))) (S (S D0)) = d4
langton (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S (S D0))) (S (S D0)) = d7
langton (S (S D0)) (S (S (S (S (S D0))))) (S D0) (S (S (S (S D0)))) (S (S D0)) = d5
langton (S (S D0)) (S (S (S (S (S (S D0)))))) (S D0) (S (S (S (S D0)))) (S (S D0)) = d7
langton (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S (S (S (S D0))))) (S (S D0)) = d5
langton D0 (S (S (S (S (S (S (S D0))))))) (S (S D0)) D0 D0 = d1
langton D0 (S (S (S (S (S D0))))) (S (S D0)) D0 (S (S D0)) = D0
langton D0 (S (S D0)) (S (S D0)) D0 (S (S (S D0))) = d6
langton D0 (S (S D0)) (S (S D0)) D0 (S (S (S (S D0)))) = d3
langton D0 (S D0) (S (S D0)) D0 (S (S (S (S (S D0))))) = d7
langton D0 (S (S (S (S (S (S (S D0))))))) (S (S D0)) D0 (S (S (S (S (S D0))))) = d5
langton D0 (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S D0)) D0 = d3
langton D0 (S (S D0)) (S (S D0)) (S (S D0)) (S (S (S D0))) = d1
langton D0 (S (S D0)) (S (S D0)) (S (S D0)) (S (S (S (S (S D0))))) = D0
langton D0 (S D0) (S (S D0)) (S (S (S D0))) (S (S D0)) = d6
langton D0 (S (S D0)) (S (S D0)) (S (S (S D0))) (S (S D0)) = d6
langton D0 (S (S D0)) (S (S D0)) (S (S (S (S (S D0))))) (S (S (S (S (S D0))))) = d1
langton D0 (S (S D0)) (S (S D0)) (S (S (S (S (S D0))))) (S (S (S (S (S (S (S D0))))))) = d5
langton (S D0) (S (S (S (S (S (S D0)))))) (S (S D0)) (S D0) (S (S D0)) = d1
langton D0 (S (S D0)) (S (S (S D0))) D0 D0 = d2
langton D0 (S (S (S (S D0)))) (S (S (S D0))) D0 D0 = d1
langton D0 (S (S (S (S (S (S (S D0))))))) (S (S (S D0))) D0 D0 = d6
langton D0 (S (S D0)) (S (S (S D0))) D0 (S (S (S (S D0)))) = d1
langton D0 (S (S D0)) (S (S (S D0))) D0 (S (S (S (S (S (S D0)))))) = d2
langton D0 (S (S D0)) (S (S (S D0))) (S D0) D0 = d1
langton D0 (S (S D0)) (S (S (S D0))) (S D0) (S (S D0)) = D0
langton D0 (S D0) (S (S (S D0))) (S (S D0)) (S (S (S (S (S D0))))) = d1
langton D0 (S (S D0)) (S (S (S (S D0)))) (S D0) (S D0) = D0
langton D0 (S (S D0)) (S (S (S (S D0)))) (S D0) (S (S D0)) = D0
langton D0 (S (S (S (S (S D0))))) (S (S (S (S D0)))) (S D0) (S (S D0)) = D0
langton D0 (S (S D0)) (S (S (S (S D0)))) (S (S D0)) (S D0) = D0
langton D0 (S (S D0)) (S (S (S (S D0)))) (S (S D0)) (S (S D0)) = d1
langton D0 (S (S D0)) (S (S (S (S D0)))) (S (S D0)) (S (S (S D0))) = d6
langton D0 (S (S D0)) (S (S (S (S D0)))) (S (S D0)) (S (S (S (S (S D0))))) = D0
langton D0 (S (S D0)) (S (S (S (S D0)))) (S (S (S D0))) (S (S D0)) = d1
langton D0 (S (S D0)) (S (S (S (S (S D0))))) D0 D0 = d2
langton D0 (S (S (S D0))) (S (S (S (S (S D0))))) D0 (S (S D0)) = d2
langton D0 (S (S (S (S (S (S (S D0))))))) (S (S (S (S (S D0))))) D0 (S (S D0)) = d2
langton D0 (S (S D0)) (S (S (S (S (S D0))))) D0 (S (S (S (S (S D0))))) = D0
langton D0 (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) D0 = d2
langton D0 (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S D0) = d2
langton D0 (S (S (S (S (S D0))))) (S (S (S (S (S D0))))) (S (S D0)) (S D0) = d2
langton D0 (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S (S D0)) = D0
langton D0 (S (S (S (S D0)))) (S (S (S (S (S D0))))) (S (S D0)) (S (S D0)) = d4
langton D0 (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d2
langton (S D0) (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S D0) = d2
langton (S D0) (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S (S D0)) = D0
langton (S D0) (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S (S (S (S D0)))) = d2
langton (S D0) (S (S D0)) (S (S (S (S (S D0))))) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = d2
langton D0 (S D0) (S (S (S (S (S (S D0)))))) D0 D0 = d1
langton D0 (S (S D0)) (S (S (S (S (S (S D0)))))) D0 D0 = d1
langton D0 (S (S D0)) (S (S (S (S (S (S D0)))))) (S (S D0)) (S D0) = D0
langton (S D0) (S (S D0)) (S (S (S (S (S (S D0)))))) (S (S D0)) (S D0) = d5
langton (S D0) (S (S (S D0))) (S (S (S (S (S (S D0)))))) (S (S D0)) (S D0) = d1
langton (S D0) (S (S D0)) (S (S (S (S (S (S D0)))))) (S (S D0)) (S (S D0)) = d5
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S D0) (S D0) = D0
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) = D0
langton D0 (S (S (S (S (S D0))))) (S (S (S (S (S (S (S D0))))))) (S D0) (S (S D0)) = D0
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S D0) = D0
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S D0)) = d1
langton D0 (S (S (S (S (S D0))))) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S D0)) = d1
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S (S D0))) = d1
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S (S (S (S D0))))) = d5
langton D0 (S (S D0)) (S (S (S (S (S (S (S D0))))))) (S (S D0)) (S (S (S (S (S (S (S D0))))))) = D0
langton v w x y z = x

next :: !Nat !Nat !Nat !Nat !Nat -> Nat
next v w y z (S x) = (plus (langton v w y z (S x)) (next v w y z x))
next v w y (S x) D0 = (plus (langton v w y (S x) D0) (next v w y x d7))
next v w (S x) D0 D0 = (plus (langton v w (S x) D0 D0) (next v w x d7 d7))
next y (S x) D0 D0 D0 = (plus (langton y (S x) D0 D0 D0) (next y x d7 d7 d7))
next (S x) D0 D0 D0 D0 = (plus (langton (S x) D0 D0 D0 D0) (next x d7 d7 d7 d7))
next D0 D0 D0 D0 D0 = (langton D0 D0 D0 D0 D0)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (next d7 d7 d7 d7 d7) <<< "\n"
   = snd (fclose console world)
