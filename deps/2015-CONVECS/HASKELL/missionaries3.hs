data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Xint = D0 | S Xint  | P Xint 
  deriving (Show, Eq, Ord)

data Bank = West | East
  deriving (Show, Eq, Ord)

data Text = Missionary_rows_east | Two_missionaries_row_east | Missionary_and_cannibal_row_east | Cannibal_rows_east | Two_cannibals_row_east | Missionary_rows_west | Two_missionaries_row_west | Missionary_and_cannibal_row_west | Cannibal_rows_west | Two_cannibals_row_west
  deriving (Show, Eq, Ord)

data Position = Pos Bank Xint Xint Xint Xint 
  deriving (Show, Eq, Ord)

data Move = Mov Text Xint Xint Xint Xint Bank 
  deriving (Show, Eq, Ord)

data MoveList = Nil_ml | Cm Move MoveList 
  deriving (Show, Eq, Ord)

data PosList = Nil_pl | Cp Position PosList 
  deriving (Show, Eq, Ord)

data TextList = Nil_tl | Fail | Ct Text TextList 
  deriving (Show, Eq, Ord)

d1 :: Xint
d2 :: Xint
d3 :: Xint
m1 :: Xint
m2 :: Xint
xand :: Xbool -> Xbool -> Xbool
yor :: Xbool -> Xbool -> Xbool
plus :: Xint -> Xint -> Xint
gte :: Xint -> Xint -> Xbool
equal :: Xint -> Xint -> Xbool
moves :: MoveList
member :: Position -> PosList -> Xbool
gte_tl :: TextList -> TextList -> Xbool
solve :: Position -> Position -> PosList -> TextList
try :: MoveList -> Position -> Position -> PosList -> TextList
apply :: Move -> Position -> Position -> PosList -> TextList
check :: Text -> Position -> Position -> PosList -> TextList
valid :: Position -> Xbool
evalct :: Text -> TextList -> TextList
best :: TextList -> TextList -> TextList

xand l Xtrue = l
xand l Xfalse = Xfalse
yor l Xtrue = Xtrue
yor l Xfalse = l
plus x D0 = x
plus D0 y = y
plus (S x) (S y) = (S (S (plus x y)))
plus (P x) (P y) = (P (P (plus x y)))
plus (S x) (P y) = (plus x y)
plus (P x) (S y) = (plus x y)
gte D0 D0 = Xtrue
gte D0 (S y) = Xfalse
gte D0 (P y) = Xtrue
gte (S x) D0 = Xtrue
gte (S x) (S y) = (gte x y)
gte (S x) (P y) = Xtrue
gte (P x) D0 = Xfalse
gte (P x) (S y) = Xfalse
gte (P x) (P y) = (gte x y)
equal x y = (xand (gte x y) (gte y x))
d1 = (S D0)
d2 = (S (S D0))
d3 = (S (S (S D0)))
m1 = (P D0)
m2 = (P (P D0))
moves = (Cm (Mov Missionary_rows_east m1 D0 d1 D0 East) (Cm (Mov Two_missionaries_row_east m2 D0 d2 D0 East) (Cm (Mov Missionary_and_cannibal_row_east m1 m1 d1 d1 East) (Cm (Mov Cannibal_rows_east D0 m1 D0 d1 East) (Cm (Mov Two_cannibals_row_east D0 m2 D0 d2 East) (Cm (Mov Missionary_rows_west d1 D0 m1 D0 West) (Cm (Mov Two_missionaries_row_west d2 D0 m2 D0 West) (Cm (Mov Missionary_and_cannibal_row_west d1 d1 m1 m1 West) (Cm (Mov Cannibal_rows_west D0 d1 D0 m1 West) (Cm (Mov Two_cannibals_row_west D0 d2 D0 m2 West) Nil_ml))))))))))
member nP Nil_pl = Xfalse
member nP (Cp posi prev) | nP == posi = Xtrue
member nP (Cp posi prev) | nP /= posi = (member nP prev)
evalct t Fail = Fail
evalct t tL | tL /= Fail = (Ct t tL)
gte_tl tL Nil_tl = Xtrue
gte_tl Nil_tl (Ct t tL) = Xfalse
gte_tl (Ct t tL) (Ct t2 tL2) = (gte_tl tL tL2)
best Fail tL = tL
best tL Fail = tL
best tL tL2 | (gte_tl tL tL2) == Xtrue && tL /= Fail && tL2 /= Fail = tL2
best tL tL2 | (gte_tl tL tL2) == Xfalse && tL /= Fail && tL2 /= Fail = tL
solve posi final prev | posi == final = Nil_tl
solve posi final prev | posi /= final = (try moves posi final prev)
try Nil_ml posi final prev = Fail
try (Cm m mL) posi final prev = (best (apply m posi final prev) (try mL posi final prev))
apply (Mov t dMW dCW dME dCE d) (Pos b mW cW mE cE) final prev | d /= b = (check t (Pos d (plus mW dMW) (plus cW dCW) (plus mE dME) (plus cE dCE)) final prev)
apply (Mov t dMW dCW dME dCE d) (Pos b mW cW mE cE) final prev | d == b = Fail
check t nP final prev | (member nP prev) == Xfalse && (valid nP) == Xtrue = (evalct t (solve nP final (Cp nP prev)))
check t nP final prev | (member nP prev) == Xtrue = Fail
check t nP final prev | (valid nP) == Xfalse = Fail
valid (Pos b mW cW mE cE) = (xand (gte mW D0) (xand (gte cW D0) (xand (gte mE D0) (xand (gte cE D0) (xand (yor (equal mW D0) (gte mW cW)) (yor (equal mE D0) (gte mE cE)))))))

main = do
 print (solve (Pos West d3 d3 D0 D0) (Pos East D0 D0 d3 d3) Nil_pl)
