module revelt

import StdEnv;

:: List =
     L !Elt !List
   | XNil

:: Elt =
     A
   | B
   | C
   | D
   | E

instance == List where
   (==) (L rec_x1 rec_x2) (L rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) (XNil) (XNil) = True
   (==) rec_x rec_y = False

instance == Elt where
   (==) (A) (A) = True
   (==) (B) (B) = True
   (==) (C) (C) = True
   (==) (D) (D) = True
   (==) (E) (E) = True
   (==) rec_x rec_y = False

instance <<< List where
   (<<<) rec_file (L rec_x1 rec_x2) = rec_file <<< "L" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"
   (<<<) rec_file (XNil) = rec_file <<< "XNil"

instance <<< Elt where
   (<<<) rec_file (A) = rec_file <<< "A"
   (<<<) rec_file (B) = rec_file <<< "B"
   (<<<) rec_file (C) = rec_file <<< "C"
   (<<<) rec_file (D) = rec_file <<< "D"
   (<<<) rec_file (E) = rec_file <<< "E"

conc :: !List !List -> List
conc (L e0 l1) l2 = (L e0 (conc l1 l2))
conc XNil l2 = l2

dup :: !List -> List
dup l1 = (conc l1 l1)

rev :: !List -> List
rev (L e0 l1) = (conc (rev l1) (L e0 XNil))
rev XNil = XNil

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (rev (dup (L A (L B (L C (L D (L E XNil))))))) <<< "\n"
   = snd (fclose console world)
