module tautologyhard

import StdEnv;

:: Prop =
     Tt
   | Ff

instance == Prop where
   (==) (Tt) (Tt) = True
   (==) (Ff) (Ff) = True
   (==) rec_x rec_y = False

instance <<< Prop where
   (<<<) rec_file (Tt) = rec_file <<< "Tt"
   (<<<) rec_file (Ff) = rec_file <<< "Ff"

xand :: !Prop !Prop -> Prop
xand p Tt = p
xand p Ff = Ff

xor :: !Prop !Prop -> Prop
xor p Ff = p
xor Ff Tt = Tt
xor Tt Tt = Ff

xnot :: !Prop -> Prop
xnot p = (xor p Tt)

yor :: !Prop !Prop -> Prop
yor p q = (xor (xand p q) (xor p q))

implies :: !Prop !Prop -> Prop
implies p q = (xnot (xor p (xand p q)))

iff :: !Prop !Prop -> Prop
iff p q = (xnot (xor p q))

a :: Prop
a = Ff

b :: Prop
b = Tt

c :: Prop
c = Ff

d :: Prop
d = Tt

e :: Prop
e = Ff

a1 :: Prop
a1 = Tt

a2 :: Prop
a2 = Ff

a3 :: Prop
a3 = Tt

a4 :: Prop
a4 = Ff

a5 :: Prop
a5 = Tt

a6 :: Prop
a6 = Ff

a7 :: Prop
a7 = Tt

a8 :: Prop
a8 = Ff

a9 :: Prop
a9 = Tt

a10 :: Prop
a10 = Ff

a11 :: Prop
a11 = Tt

a12 :: Prop
a12 = Ff

a13 :: Prop
a13 = Tt

a14 :: Prop
a14 = Ff

a15 :: Prop
a15 = Tt

a16 :: Prop
a16 = Ff

a17 :: Prop
a17 = Tt

a18 :: Prop
a18 = Ff

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (implies (xand (iff (iff (yor a1 a2) (yor (xnot a3) (iff (xor a4 a5) (xnot (xnot (xnot a6)))))) (xnot (xand (xand a7 a8) (xnot (xor (xor (yor a9 (xand a10 a11)) a2) (xand (xand a11 (xor a2 (iff a5 a5))) (xor (xor a7 a7) (iff a9 a4)))))))) (implies (iff (iff (yor a1 a2) (yor (xnot a3) (iff (xor a4 a5) (xnot (xnot (xnot a6)))))) (xnot (xand (xand a7 a8) (xnot (xor (xor (yor a9 (xand a10 a11)) a2) (xand (xand a11 (xor a2 (iff a5 a5))) (xor (xor a7 a7) (iff a9 a4)))))))) (xnot (xand (implies (xand a1 a2) (xnot (xor (yor (yor (xor (implies (xand a3 a4) (implies a5 a6)) (yor a7 a8)) (xor (iff a9 a10) a11)) (xor (xor a2 a2) a7)) (iff (yor a4 a9) (xor (xnot a6) a6))))) (xnot (iff (xnot a11) (xnot a9))))))) (xnot (xand (implies (xand a1 a2) (xnot (xor (yor (yor (xor (implies (xand a3 a4) (implies a5 a6)) (yor a7 a8)) (xor (iff a9 a10) a11)) (xor (xor a2 a2) a7)) (iff (yor a4 a9) (xor (xnot a6) a6))))) (xnot (iff (xnot a11) (xnot a9)))))) <<< "\n"
   # console = console <<< (implies (xand (xnot (xand (xor a1 (xor (yor a2 a3) a4)) (xor (iff (xor (xnot a5) (yor (xor (iff a6 a7) (iff a8 a9)) (xand a10 a9))) (iff (xnot (xnot a2)) (implies (yor a9 a6) (yor a10 a5)))) (xnot (yor a9 (implies (xnot a8) (yor a4 a9))))))) (implies (xnot (xand (xor a1 (xor (yor a2 a3) a4)) (xor (iff (xor (xnot a5) (yor (xor (iff a6 a7) (iff a8 a9)) (xand a10 a9))) (iff (xnot (xnot a2)) (implies (yor a9 a6) (yor a10 a5)))) (xnot (yor a9 (implies (xnot a8) (yor a4 a9))))))) (xnot (implies (implies (xand (yor a1 (xor (xor a2 a3) (xnot a4))) (xnot (xor a5 (xand a6 a7)))) (implies (xor (implies a8 a9) a10) (xor (xand a4 (yor a4 a1)) a2))) (yor (yor (xor (yor a4 a7) a2) (xand a8 a1)) (xnot (xnot (xnot a6)))))))) (xnot (implies (implies (xand (yor a1 (xor (xor a2 a3) (xnot a4))) (xnot (xor a5 (xand a6 a7)))) (implies (xor (implies a8 a9) a10) (xor (xand a4 (yor a4 a1)) a2))) (yor (yor (xor (yor a4 a7) a2) (xand a8 a1)) (xnot (xnot (xnot a6))))))) <<< "\n"
   # console = console <<< (implies (xand (xnot (xand (xor a1 (xor (yor a2 a3) a4)) (xor (iff (xor (xnot a5) (yor (xor (iff a6 a7) (iff a8 a9)) (xand a10 a11))) (implies (yor a4 (xand a3 (iff a1 a2))) (xnot (xnot a4)))) (xor (implies (implies a6 a1) (xnot a1)) (xnot a9))))) (implies (xnot (xand (xor a1 (xor (yor a2 a3) a4)) (xor (iff (xor (xnot a5) (yor (xor (iff a6 a7) (iff a8 a9)) (xand a10 a11))) (implies (yor a4 (xand a3 (iff a1 a2))) (xnot (xnot a4)))) (xor (implies (implies a6 a1) (xnot a1)) (xnot a9))))) (xnot (implies (implies (xand (yor a1 (xor (xor a2 a3) (xnot a4))) (xnot (xor a5 (xand a6 a7)))) (implies (xor (implies a8 a9) a10) (xor (xand a11 (implies a2 a8)) a8))) (xnot (yor (implies (yor a5 (yor a8 (xand a8 a9))) (xnot a2)) (xnot a7))))))) (xnot (implies (implies (xand (yor a1 (xor (xor a2 a3) (xnot a4))) (xnot (xor a5 (xand a6 a7)))) (implies (xor (implies a8 a9) a10) (xor (xand a11 (implies a2 a8)) a8))) (xnot (yor (implies (yor a5 (yor a8 (xand a8 a9))) (xnot a2)) (xnot a7)))))) <<< "\n"
   = snd (fclose console world)
