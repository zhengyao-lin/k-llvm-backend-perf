-- CAFEOBJ-B
mod! Order {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op f : Xnat -> Xnat
  op g : Xnat -> Xnat
  trans g (d0) => d0 .
  trans g (s (x:Xnat)) => x .
  ctrans f (s (x:Xnat)) => d0 if x == d0 .
  ctrans f (s (x:Xnat)) => x if x =/= d0 .
  trans f (d0) => s (d0) .
}
select Order .
exec f (g (d0)) .
