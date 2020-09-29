-- CAFEOBJ-B
mod! SearchInConditions {
  [ Xbool ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op a : -> Xbool
  op Xnot : Xbool -> Xbool
  trans a => Xtrue .
  ctrans Xnot (X:Xbool) => Xtrue if X == Xfalse .
  ctrans Xnot (X:Xbool) => Xfalse if X == Xtrue .
}
select SearchInConditions .
exec Xnot (a) .
