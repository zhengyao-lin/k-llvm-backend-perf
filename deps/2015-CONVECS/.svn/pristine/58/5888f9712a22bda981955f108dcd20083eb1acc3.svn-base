-- CAFEOBJ-A
mod! Order {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op f : Xnat -> Xnat
  op g : Xnat -> Xnat
  eq g (d0) = d0 .
  eq g (s (x:Xnat)) = x .
  ceq f (s (x:Xnat)) = d0 if x == d0 .
  ceq f (s (x:Xnat)) = x if x =/= d0 .
  eq f (d0) = s (d0) .
}
select Order .
red f (g (d0)) .
