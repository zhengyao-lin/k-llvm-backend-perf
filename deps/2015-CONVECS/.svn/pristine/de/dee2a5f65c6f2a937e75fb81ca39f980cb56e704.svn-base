-- CAFEOBJ-A
mod! SearchInConditions {
  [ Xbool ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op a : -> Xbool
  op Xnot : Xbool -> Xbool
  eq a = Xtrue .
  ceq Xnot (X:Xbool) = Xtrue if X == Xfalse .
  ceq Xnot (X:Xbool) = Xfalse if X == Xtrue .
}
select SearchInConditions .
red Xnot (a) .
