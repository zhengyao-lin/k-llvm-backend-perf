-- CAFEOBJ-B
mod! Confluence {
  [ S ]
  op d0 : -> S { constr }
  op g : S -> S { constr }
  op f : S -> S
  ctrans f (g (X:S)) => X if X == d0 .
  trans f (g (g (X:S))) => f (g (X)) .
}
select Confluence .
exec f (g (g (d0))) .
