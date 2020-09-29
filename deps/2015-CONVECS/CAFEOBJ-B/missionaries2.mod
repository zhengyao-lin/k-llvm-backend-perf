-- CAFEOBJ-B
mod! Missionaries2 {
  [ Xbool Int Bank Text Position Move MoveList TextList PosList ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Int { constr }
  op s : Int -> Int { constr }
  op p : Int -> Int { constr }
  op west : -> Bank { constr }
  op east : -> Bank { constr }
  op missionary-rows-east : -> Text { constr }
  op two-missionaries-row-east : -> Text { constr }
  op missionary-and-cannibal-row-east : -> Text { constr }
  op cannibal-rows-east : -> Text { constr }
  op two-cannibals-row-east : -> Text { constr }
  op missionary-rows-west : -> Text { constr }
  op two-missionaries-row-west : -> Text { constr }
  op missionary-and-cannibal-row-west : -> Text { constr }
  op cannibal-rows-west : -> Text { constr }
  op two-cannibals-row-west : -> Text { constr }
  op pos : Bank Int Int Int Int -> Position { constr }
  op mov : Text Int Int Int Int Bank -> Move { constr }
  op nil-ml : -> MoveList { constr }
  op cm : Move MoveList -> MoveList { constr }
  op nil-pl : -> PosList { constr }
  op cp : Position PosList -> PosList { constr }
  op nil-tl : -> TextList { constr }
  op fail : -> TextList { constr }
  op ct : Text TextList -> TextList { constr }
  op d1 : -> Int
  op d2 : -> Int
  op d3 : -> Int
  op m1 : -> Int
  op m2 : -> Int
  op and : Xbool Xbool -> Xbool
  op or : Xbool Xbool -> Xbool
  op plus : Int Int -> Int
  op gte : Int Int -> Xbool
  op equal : Int Int -> Xbool
  op moves : -> MoveList
  op member : Position PosList -> Xbool
  op gte-tl : TextList TextList -> Xbool
  op solve : Position Position PosList -> TextList
  op try : MoveList Position Position PosList -> TextList
  op apply : Move Position Position PosList -> TextList
  op check : Text Position Position PosList -> TextList
  op valid : Position -> Xbool
  op evalct : Text TextList -> TextList
  op best : TextList TextList -> TextList
  trans and (L:Xbool, Xtrue) => L .
  trans and (L:Xbool, Xfalse) => Xfalse .
  trans or (L:Xbool, Xtrue) => Xtrue .
  trans or (L:Xbool, Xfalse) => L .
  trans plus (X:Int, d0) => X .
  trans plus (d0, Y:Int) => Y .
  trans plus (s (X:Int), s (Y:Int)) => s (s (plus (X, Y))) .
  trans plus (p (X:Int), p (Y:Int)) => p (p (plus (X, Y))) .
  trans plus (s (X:Int), p (Y:Int)) => plus (X, Y) .
  trans plus (p (X:Int), s (Y:Int)) => plus (X, Y) .
  trans gte (d0, d0) => Xtrue .
  trans gte (d0, s (Y:Int)) => Xfalse .
  trans gte (d0, p (Y:Int)) => Xtrue .
  trans gte (s (X:Int), d0) => Xtrue .
  trans gte (s (X:Int), s (Y:Int)) => gte (X, Y) .
  trans gte (s (X:Int), p (Y:Int)) => Xtrue .
  trans gte (p (X:Int), d0) => Xfalse .
  trans gte (p (X:Int), s (Y:Int)) => Xfalse .
  trans gte (p (X:Int), p (Y:Int)) => gte (X, Y) .
  trans equal (X:Int, Y:Int) => and (gte (X, Y), gte (Y, X)) .
  trans d1 => s (d0) .
  trans d2 => s (s (d0)) .
  trans d3 => s (s (s (d0))) .
  trans m1 => p (d0) .
  trans m2 => p (p (d0)) .
  trans moves => cm (mov (missionary-rows-east, m1, d0, d1, d0, east),cm (mov (two-missionaries-row-east, m2, d0, d2, d0, east),cm (mov (missionary-and-cannibal-row-east, m1, m1, d1, d1, east),cm (mov (cannibal-rows-east, d0, m1, d0, d1, east),cm (mov (two-cannibals-row-east, d0, m2, d0, d2, east),cm (mov (missionary-rows-west, d1, d0, m1, d0, west),cm (mov (two-missionaries-row-west, d2, d0, m2, d0, west),cm (mov (missionary-and-cannibal-row-west, d1, d1, m1, m1, west),cm (mov (cannibal-rows-west, d0, d1, d0, m1, west),cm (mov (two-cannibals-row-west, d0, d2, d0, m2, west), nil-ml)))))))))) .
  trans member (NP:Position, nil-pl) => Xfalse .
  ctrans member (NP:Position, cp (Posi:Position, Prev:PosList)) => Xtrue if NP == Posi .
  ctrans member (NP:Position, cp (Posi:Position, Prev:PosList)) => member (NP, Prev) if NP =/= Posi .
  trans evalct (T:Text, fail) => fail .
  ctrans evalct (T:Text, TL:TextList) => ct (T,TL) if TL =/= fail .
  trans gte-tl (TL:TextList, nil-tl) => Xtrue .
  trans gte-tl (nil-tl, ct (T:Text, TL:TextList)) => Xfalse .
  trans gte-tl (ct (T:Text, TL:TextList), ct (T2:Text, TL2:TextList)) => gte-tl (TL, TL2) .
  trans best (fail, TL:TextList) => TL .
  trans best (TL:TextList, fail) => TL .
  ctrans best (TL:TextList, TL2:TextList) => TL2 if gte-tl (TL, TL2) == Xtrue and TL =/= fail and TL2 =/= fail .
  ctrans best (TL:TextList, TL2:TextList) => TL if gte-tl (TL, TL2) == Xfalse and TL =/= fail and TL2 =/= fail .
  ctrans solve (Posi:Position, Final:Position, Prev:PosList) => nil-tl if Posi == Final .
  ctrans solve (Posi:Position, Final:Position, Prev:PosList) => try (moves, Posi, Final, Prev) if Posi =/= Final .
  trans try (nil-ml, Posi:Position, Final:Position, Prev:PosList) => fail .
  trans try (cm (M:Move, ML:MoveList), Posi:Position, Final:Position, Prev:PosList) => best (apply (M, Posi, Final, Prev), try (ML, Posi, Final, Prev)) .
  ctrans apply (mov (T:Text, DMW:Int, DCW:Int, DME:Int, DCE:Int, D:Bank), pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int), Final:Position, Prev:PosList) => check (T, pos (D, plus (MW, DMW), plus (CW, DCW), plus (ME, DME), plus (CE, DCE)), Final, Prev) if D =/= B .
  ctrans apply (mov (T:Text, DMW:Int, DCW:Int, DME:Int, DCE:Int, D:Bank), pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int), Final:Position, Prev:PosList) => fail if D == B .
  ctrans check (T:Text, NP:Position, Final:Position, Prev:PosList) => evalct (T, solve (NP, Final, cp (NP, Prev))) if member (NP, Prev) == Xfalse and valid (NP) == Xtrue .
  ctrans check (T:Text, NP:Position, Final:Position, Prev:PosList) => fail if member (NP, Prev) == Xtrue .
  ctrans check (T:Text, NP:Position, Final:Position, Prev:PosList) => fail if valid (NP) == Xfalse .
  trans valid (pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int)) => and (gte (MW, d0), and (gte (CW, d0), and (gte (ME, d0), and (gte (CE, d0), and (or (equal (MW, d0), gte (MW, CW)), or (equal (ME, d0), gte (ME, CE))))))) .
}
select Missionaries2 .
exec solve (pos (west, d2, d2, d0, d0), pos (east, d0, d0, d2, d2), nil-pl) .
