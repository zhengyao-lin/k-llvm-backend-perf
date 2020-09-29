-- CAFEOBJ-A
mod! Missionaries3 {
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
  eq and (L:Xbool, Xtrue) = L .
  eq and (L:Xbool, Xfalse) = Xfalse .
  eq or (L:Xbool, Xtrue) = Xtrue .
  eq or (L:Xbool, Xfalse) = L .
  eq plus (X:Int, d0) = X .
  eq plus (d0, Y:Int) = Y .
  eq plus (s (X:Int), s (Y:Int)) = s (s (plus (X, Y))) .
  eq plus (p (X:Int), p (Y:Int)) = p (p (plus (X, Y))) .
  eq plus (s (X:Int), p (Y:Int)) = plus (X, Y) .
  eq plus (p (X:Int), s (Y:Int)) = plus (X, Y) .
  eq gte (d0, d0) = Xtrue .
  eq gte (d0, s (Y:Int)) = Xfalse .
  eq gte (d0, p (Y:Int)) = Xtrue .
  eq gte (s (X:Int), d0) = Xtrue .
  eq gte (s (X:Int), s (Y:Int)) = gte (X, Y) .
  eq gte (s (X:Int), p (Y:Int)) = Xtrue .
  eq gte (p (X:Int), d0) = Xfalse .
  eq gte (p (X:Int), s (Y:Int)) = Xfalse .
  eq gte (p (X:Int), p (Y:Int)) = gte (X, Y) .
  eq equal (X:Int, Y:Int) = and (gte (X, Y), gte (Y, X)) .
  eq d1 = s (d0) .
  eq d2 = s (s (d0)) .
  eq d3 = s (s (s (d0))) .
  eq m1 = p (d0) .
  eq m2 = p (p (d0)) .
  eq moves = cm (mov (missionary-rows-east, m1, d0, d1, d0, east),cm (mov (two-missionaries-row-east, m2, d0, d2, d0, east),cm (mov (missionary-and-cannibal-row-east, m1, m1, d1, d1, east),cm (mov (cannibal-rows-east, d0, m1, d0, d1, east),cm (mov (two-cannibals-row-east, d0, m2, d0, d2, east),cm (mov (missionary-rows-west, d1, d0, m1, d0, west),cm (mov (two-missionaries-row-west, d2, d0, m2, d0, west),cm (mov (missionary-and-cannibal-row-west, d1, d1, m1, m1, west),cm (mov (cannibal-rows-west, d0, d1, d0, m1, west),cm (mov (two-cannibals-row-west, d0, d2, d0, m2, west), nil-ml)))))))))) .
  eq member (NP:Position, nil-pl) = Xfalse .
  ceq member (NP:Position, cp (Posi:Position, Prev:PosList)) = Xtrue if NP == Posi .
  ceq member (NP:Position, cp (Posi:Position, Prev:PosList)) = member (NP, Prev) if NP =/= Posi .
  eq evalct (T:Text, fail) = fail .
  ceq evalct (T:Text, TL:TextList) = ct (T,TL) if TL =/= fail .
  eq gte-tl (TL:TextList, nil-tl) = Xtrue .
  eq gte-tl (nil-tl, ct (T:Text, TL:TextList)) = Xfalse .
  eq gte-tl (ct (T:Text, TL:TextList), ct (T2:Text, TL2:TextList)) = gte-tl (TL, TL2) .
  eq best (fail, TL:TextList) = TL .
  eq best (TL:TextList, fail) = TL .
  ceq best (TL:TextList, TL2:TextList) = TL2 if gte-tl (TL, TL2) == Xtrue and TL =/= fail and TL2 =/= fail .
  ceq best (TL:TextList, TL2:TextList) = TL if gte-tl (TL, TL2) == Xfalse and TL =/= fail and TL2 =/= fail .
  ceq solve (Posi:Position, Final:Position, Prev:PosList) = nil-tl if Posi == Final .
  ceq solve (Posi:Position, Final:Position, Prev:PosList) = try (moves, Posi, Final, Prev) if Posi =/= Final .
  eq try (nil-ml, Posi:Position, Final:Position, Prev:PosList) = fail .
  eq try (cm (M:Move, ML:MoveList), Posi:Position, Final:Position, Prev:PosList) = best (apply (M, Posi, Final, Prev), try (ML, Posi, Final, Prev)) .
  ceq apply (mov (T:Text, DMW:Int, DCW:Int, DME:Int, DCE:Int, D:Bank), pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int), Final:Position, Prev:PosList) = check (T, pos (D, plus (MW, DMW), plus (CW, DCW), plus (ME, DME), plus (CE, DCE)), Final, Prev) if D =/= B .
  ceq apply (mov (T:Text, DMW:Int, DCW:Int, DME:Int, DCE:Int, D:Bank), pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int), Final:Position, Prev:PosList) = fail if D == B .
  ceq check (T:Text, NP:Position, Final:Position, Prev:PosList) = evalct (T, solve (NP, Final, cp (NP, Prev))) if member (NP, Prev) == Xfalse and valid (NP) == Xtrue .
  ceq check (T:Text, NP:Position, Final:Position, Prev:PosList) = fail if member (NP, Prev) == Xtrue .
  ceq check (T:Text, NP:Position, Final:Position, Prev:PosList) = fail if valid (NP) == Xfalse .
  eq valid (pos (B:Bank, MW:Int, CW:Int, ME:Int, CE:Int)) = and (gte (MW, d0), and (gte (CW, d0), and (gte (ME, d0), and (gte (CE, d0), and (or (equal (MW, d0), gte (MW, CW)), or (equal (ME, d0), gte (ME, CE))))))) .
}
select Missionaries3 .
red solve (pos (west, d3, d3, d0, d0), pos (east, d0, d0, d3, d3), nil-pl) .
