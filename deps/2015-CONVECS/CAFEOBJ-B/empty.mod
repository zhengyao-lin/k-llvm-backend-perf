-- CAFEOBJ-B
mod! Empty {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op succ : Xnat -> Xnat { constr }
}
select Empty .
exec d0 .
