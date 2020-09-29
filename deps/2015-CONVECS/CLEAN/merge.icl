module merge

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Strg =
     A
   | B
   | C !Strg !Strg

:: List =
     XNil
   | L !Strg !List

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Strg where
   (==) (A) (A) = True
   (==) (B) (B) = True
   (==) (C rec_x1 rec_x2) (C rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == List where
   (==) (XNil) (XNil) = True
   (==) (L rec_x1 rec_x2) (L rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Strg where
   (<<<) rec_file (A) = rec_file <<< "A"
   (<<<) rec_file (B) = rec_file <<< "B"
   (<<<) rec_file (C rec_x1 rec_x2) = rec_file <<< "C" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< List where
   (<<<) rec_file (XNil) = rec_file <<< "XNil"
   (<<<) rec_file (L rec_x1 rec_x2) = rec_file <<< "L" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

gte :: !Strg !Strg -> Xbool
gte B A = Xtrue
gte A B = Xfalse
gte A A = Xtrue
gte B B = Xtrue
gte (C e s) e2 = (gte e e2)
gte e (C e2 s2) 
| (e == e2) = Xfalse
| (e <> e2) = (gte e e2)

xmerge :: !List !List -> List
xmerge XNil l1 = l1
xmerge l1 XNil = l1
xmerge (L s l1) (L s2 l2) 
| ((gte s s2) == Xtrue) = (L s2 (xmerge (L s l1) l2))
| ((gte s s2) == Xfalse) = (L s (xmerge l1 (L s2 l2)))

odd :: !List -> List
odd XNil = XNil
odd (L s XNil) = (L s XNil)
odd (L s (L s2 l1)) = (L s (odd l1))

even :: !List -> List
even XNil = XNil
even (L s XNil) = XNil
even (L s (L s2 l1)) = (L s2 (even l1))

xsort :: !List -> List
xsort XNil = XNil
xsort (L s XNil) = (L s XNil)
xsort (L s (L s2 l1)) = (xmerge (xsort (odd (L s (L s2 l1)))) (xsort (even (L s (L s2 l1)))))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (xsort (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) XNil))))))))))))))))))))))))))))))))))))))))))))))))))) <<< "\n"
   = snd (fclose console world)
