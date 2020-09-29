-- CAFEOBJ-A
mod! Confluence {
  [ S ]
  op d0 : -> S { constr }
  op g : S -> S { constr }
  op f : S -> S
  ceq f (g (X:S)) = X if X == d0 .
  eq f (g (g (X:S))) = f (g (X)) .
}
select Confluence .
red f (g (g (d0))) .
