module hanoi4

import StdEnv;

:: Disk =
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
   | D10
   | D11
   | D12
   | D13
   | D14
   | D15
   | D16
   | D17
   | D18
   | D19
   | D20

:: Tower =
     A
   | B
   | C

:: Move =
     Movedisk !Disk !Tower !Tower

:: List =
     XNil
   | Cons !Move !List

instance == Disk where
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
   (==) (D10) (D10) = True
   (==) (D11) (D11) = True
   (==) (D12) (D12) = True
   (==) (D13) (D13) = True
   (==) (D14) (D14) = True
   (==) (D15) (D15) = True
   (==) (D16) (D16) = True
   (==) (D17) (D17) = True
   (==) (D18) (D18) = True
   (==) (D19) (D19) = True
   (==) (D20) (D20) = True
   (==) rec_x rec_y = False

instance == Tower where
   (==) (A) (A) = True
   (==) (B) (B) = True
   (==) (C) (C) = True
   (==) rec_x rec_y = False

instance == Move where
   (==) (Movedisk rec_x1 rec_x2 rec_x3) (Movedisk rec_y1 rec_y2 rec_y3) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3)
   (==) rec_x rec_y = False

instance == List where
   (==) (XNil) (XNil) = True
   (==) (Cons rec_x1 rec_x2) (Cons rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Disk where
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
   (<<<) rec_file (D10) = rec_file <<< "D10"
   (<<<) rec_file (D11) = rec_file <<< "D11"
   (<<<) rec_file (D12) = rec_file <<< "D12"
   (<<<) rec_file (D13) = rec_file <<< "D13"
   (<<<) rec_file (D14) = rec_file <<< "D14"
   (<<<) rec_file (D15) = rec_file <<< "D15"
   (<<<) rec_file (D16) = rec_file <<< "D16"
   (<<<) rec_file (D17) = rec_file <<< "D17"
   (<<<) rec_file (D18) = rec_file <<< "D18"
   (<<<) rec_file (D19) = rec_file <<< "D19"
   (<<<) rec_file (D20) = rec_file <<< "D20"

instance <<< Tower where
   (<<<) rec_file (A) = rec_file <<< "A"
   (<<<) rec_file (B) = rec_file <<< "B"
   (<<<) rec_file (C) = rec_file <<< "C"

instance <<< Move where
   (<<<) rec_file (Movedisk rec_x1 rec_x2 rec_x3) = rec_file <<< "Movedisk" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ")"

instance <<< List where
   (<<<) rec_file (XNil) = rec_file <<< "XNil"
   (<<<) rec_file (Cons rec_x1 rec_x2) = rec_file <<< "Cons" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

xdec :: !Disk -> Disk
xdec D20 = D19
xdec D19 = D18
xdec D18 = D17
xdec D17 = D16
xdec D16 = D15
xdec D15 = D14
xdec D14 = D13
xdec D13 = D12
xdec D12 = D11
xdec D11 = D10
xdec D10 = D9
xdec D9 = D8
xdec D8 = D7
xdec D7 = D6
xdec D6 = D5
xdec D5 = D4
xdec D4 = D3
xdec D3 = D2
xdec D2 = D1
xdec D1 = D0

other :: !Tower !Tower -> Tower
other A B = C
other B A = C
other A C = B
other C A = B
other B C = A
other C B = A

conc :: !List !List -> List
conc XNil l = l
conc l XNil = l
conc (Cons h t) l = (Cons h (conc t l))

solve :: !Tower !Tower !Disk -> List
solve oRG dEST D0 = XNil
solve oRG dEST d 
| (d <> D0) = (conc (solve oRG (other oRG dEST) (xdec d)) (Cons (Movedisk d oRG dEST) (solve (other oRG dEST) dEST (xdec d))))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (solve A B D4) <<< "\n"
   = snd (fclose console world)
