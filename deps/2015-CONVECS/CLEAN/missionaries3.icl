module missionaries3

import StdEnv;

:: Xbool =
     Xtrue
   | Xfalse

:: Xint =
     D0
   | S !Xint
   | P !Xint

:: Bank =
     West
   | East

:: Text =
     Missionary_rows_east
   | Two_missionaries_row_east
   | Missionary_and_cannibal_row_east
   | Cannibal_rows_east
   | Two_cannibals_row_east
   | Missionary_rows_west
   | Two_missionaries_row_west
   | Missionary_and_cannibal_row_west
   | Cannibal_rows_west
   | Two_cannibals_row_west

:: Position =
     Pos !Bank !Xint !Xint !Xint !Xint

:: Move =
     Mov !Text !Xint !Xint !Xint !Xint !Bank

:: MoveList =
     Nil_ml
   | Cm !Move !MoveList

:: PosList =
     Nil_pl
   | Cp !Position !PosList

:: TextList =
     Nil_tl
   | Fail
   | Ct !Text !TextList

instance == Xbool where
   (==) (Xtrue) (Xtrue) = True
   (==) (Xfalse) (Xfalse) = True
   (==) rec_x rec_y = False

instance == Xint where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) (P rec_x1) (P rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Bank where
   (==) (West) (West) = True
   (==) (East) (East) = True
   (==) rec_x rec_y = False

instance == Text where
   (==) (Missionary_rows_east) (Missionary_rows_east) = True
   (==) (Two_missionaries_row_east) (Two_missionaries_row_east) = True
   (==) (Missionary_and_cannibal_row_east) (Missionary_and_cannibal_row_east) = True
   (==) (Cannibal_rows_east) (Cannibal_rows_east) = True
   (==) (Two_cannibals_row_east) (Two_cannibals_row_east) = True
   (==) (Missionary_rows_west) (Missionary_rows_west) = True
   (==) (Two_missionaries_row_west) (Two_missionaries_row_west) = True
   (==) (Missionary_and_cannibal_row_west) (Missionary_and_cannibal_row_west) = True
   (==) (Cannibal_rows_west) (Cannibal_rows_west) = True
   (==) (Two_cannibals_row_west) (Two_cannibals_row_west) = True
   (==) rec_x rec_y = False

instance == Position where
   (==) (Pos rec_x1 rec_x2 rec_x3 rec_x4 rec_x5) (Pos rec_y1 rec_y2 rec_y3 rec_y4 rec_y5) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4) && (rec_x5 == rec_y5)
   (==) rec_x rec_y = False

instance == Move where
   (==) (Mov rec_x1 rec_x2 rec_x3 rec_x4 rec_x5 rec_x6) (Mov rec_y1 rec_y2 rec_y3 rec_y4 rec_y5 rec_y6) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3) && (rec_x4 == rec_y4) && (rec_x5 == rec_y5) && (rec_x6 == rec_y6)
   (==) rec_x rec_y = False

instance == MoveList where
   (==) (Nil_ml) (Nil_ml) = True
   (==) (Cm rec_x1 rec_x2) (Cm rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == PosList where
   (==) (Nil_pl) (Nil_pl) = True
   (==) (Cp rec_x1 rec_x2) (Cp rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == TextList where
   (==) (Nil_tl) (Nil_tl) = True
   (==) (Fail) (Fail) = True
   (==) (Ct rec_x1 rec_x2) (Ct rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Xbool where
   (<<<) rec_file (Xtrue) = rec_file <<< "Xtrue"
   (<<<) rec_file (Xfalse) = rec_file <<< "Xfalse"

instance <<< Xint where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (P rec_x1) = rec_file <<< "P" <<< " (" <<< rec_x1 <<< ")"

instance <<< Bank where
   (<<<) rec_file (West) = rec_file <<< "West"
   (<<<) rec_file (East) = rec_file <<< "East"

instance <<< Text where
   (<<<) rec_file (Missionary_rows_east) = rec_file <<< "Missionary_rows_east"
   (<<<) rec_file (Two_missionaries_row_east) = rec_file <<< "Two_missionaries_row_east"
   (<<<) rec_file (Missionary_and_cannibal_row_east) = rec_file <<< "Missionary_and_cannibal_row_east"
   (<<<) rec_file (Cannibal_rows_east) = rec_file <<< "Cannibal_rows_east"
   (<<<) rec_file (Two_cannibals_row_east) = rec_file <<< "Two_cannibals_row_east"
   (<<<) rec_file (Missionary_rows_west) = rec_file <<< "Missionary_rows_west"
   (<<<) rec_file (Two_missionaries_row_west) = rec_file <<< "Two_missionaries_row_west"
   (<<<) rec_file (Missionary_and_cannibal_row_west) = rec_file <<< "Missionary_and_cannibal_row_west"
   (<<<) rec_file (Cannibal_rows_west) = rec_file <<< "Cannibal_rows_west"
   (<<<) rec_file (Two_cannibals_row_west) = rec_file <<< "Two_cannibals_row_west"

instance <<< Position where
   (<<<) rec_file (Pos rec_x1 rec_x2 rec_x3 rec_x4 rec_x5) = rec_file <<< "Pos" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ", " <<< rec_x5 <<< ")"

instance <<< Move where
   (<<<) rec_file (Mov rec_x1 rec_x2 rec_x3 rec_x4 rec_x5 rec_x6) = rec_file <<< "Mov" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ", " <<< rec_x4 <<< ", " <<< rec_x5 <<< ", " <<< rec_x6 <<< ")"

instance <<< MoveList where
   (<<<) rec_file (Nil_ml) = rec_file <<< "Nil_ml"
   (<<<) rec_file (Cm rec_x1 rec_x2) = rec_file <<< "Cm" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< PosList where
   (<<<) rec_file (Nil_pl) = rec_file <<< "Nil_pl"
   (<<<) rec_file (Cp rec_x1 rec_x2) = rec_file <<< "Cp" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< TextList where
   (<<<) rec_file (Nil_tl) = rec_file <<< "Nil_tl"
   (<<<) rec_file (Fail) = rec_file <<< "Fail"
   (<<<) rec_file (Ct rec_x1 rec_x2) = rec_file <<< "Ct" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

xand :: !Xbool !Xbool -> Xbool
xand l Xtrue = l
xand l Xfalse = Xfalse

yor :: !Xbool !Xbool -> Xbool
yor l Xtrue = Xtrue
yor l Xfalse = l

plus :: !Xint !Xint -> Xint
plus x D0 = x
plus D0 y = y
plus (S x) (S y) = (S (S (plus x y)))
plus (P x) (P y) = (P (P (plus x y)))
plus (S x) (P y) = (plus x y)
plus (P x) (S y) = (plus x y)

gte :: !Xint !Xint -> Xbool
gte D0 D0 = Xtrue
gte D0 (S y) = Xfalse
gte D0 (P y) = Xtrue
gte (S x) D0 = Xtrue
gte (S x) (S y) = (gte x y)
gte (S x) (P y) = Xtrue
gte (P x) D0 = Xfalse
gte (P x) (S y) = Xfalse
gte (P x) (P y) = (gte x y)

equal :: !Xint !Xint -> Xbool
equal x y = (xand (gte x y) (gte y x))

d1 :: Xint
d1 = (S D0)

d2 :: Xint
d2 = (S (S D0))

d3 :: Xint
d3 = (S (S (S D0)))

m1 :: Xint
m1 = (P D0)

m2 :: Xint
m2 = (P (P D0))

moves :: MoveList
moves = (Cm (Mov Missionary_rows_east m1 D0 d1 D0 East) (Cm (Mov Two_missionaries_row_east m2 D0 d2 D0 East) (Cm (Mov Missionary_and_cannibal_row_east m1 m1 d1 d1 East) (Cm (Mov Cannibal_rows_east D0 m1 D0 d1 East) (Cm (Mov Two_cannibals_row_east D0 m2 D0 d2 East) (Cm (Mov Missionary_rows_west d1 D0 m1 D0 West) (Cm (Mov Two_missionaries_row_west d2 D0 m2 D0 West) (Cm (Mov Missionary_and_cannibal_row_west d1 d1 m1 m1 West) (Cm (Mov Cannibal_rows_west D0 d1 D0 m1 West) (Cm (Mov Two_cannibals_row_west D0 d2 D0 m2 West) Nil_ml))))))))))

member :: !Position !PosList -> Xbool
member nP Nil_pl = Xfalse
member nP (Cp posi prev) 
| (nP == posi) = Xtrue
| (nP <> posi) = (member nP prev)

evalct :: !Text !TextList -> TextList
evalct t Fail = Fail
evalct t tL 
| (tL <> Fail) = (Ct t tL)

gte_tl :: !TextList !TextList -> Xbool
gte_tl tL Nil_tl = Xtrue
gte_tl Nil_tl (Ct t tL) = Xfalse
gte_tl (Ct t tL) (Ct t2 tL2) = (gte_tl tL tL2)

best :: !TextList !TextList -> TextList
best Fail tL = tL
best tL Fail = tL
best tL tL2 
| ((gte_tl tL tL2) == Xtrue) && (tL <> Fail) && (tL2 <> Fail) = tL2
| ((gte_tl tL tL2) == Xfalse) && (tL <> Fail) && (tL2 <> Fail) = tL

solve :: !Position !Position !PosList -> TextList
solve posi final prev 
| (posi == final) = Nil_tl
| (posi <> final) = (try moves posi final prev)

try :: !MoveList !Position !Position !PosList -> TextList
try Nil_ml posi final prev = Fail
try (Cm m mL) posi final prev = (best (apply m posi final prev) (try mL posi final prev))

apply :: !Move !Position !Position !PosList -> TextList
apply (Mov t dMW dCW dME dCE d) (Pos b mW cW mE cE) final prev 
| (d <> b) = (check t (Pos d (plus mW dMW) (plus cW dCW) (plus mE dME) (plus cE dCE)) final prev)
| (d == b) = Fail

check :: !Text !Position !Position !PosList -> TextList
check t nP final prev 
| ((member nP prev) == Xfalse) && ((valid nP) == Xtrue) = (evalct t (solve nP final (Cp nP prev)))
| ((member nP prev) == Xtrue) = Fail
| ((valid nP) == Xfalse) = Fail

valid :: !Position -> Xbool
valid (Pos b mW cW mE cE) = (xand (gte mW D0) (xand (gte cW D0) (xand (gte mE D0) (xand (gte cE D0) (xand (yor (equal mW D0) (gte mW cW)) (yor (equal mE D0) (gte mE cE)))))))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (solve (Pos West d3 d3 D0 D0) (Pos East D0 D0 d3 d3) Nil_pl) <<< "\n"
   = snd (fclose console world)
