-- CAFEOBJ-B
mod! Tricky {
  [ NSingleton USingleton Xnat ]
  op Ncons : -> NSingleton { constr }
  op Ucons : Xnat -> USingleton { constr }
  op d0 : -> Xnat { constr }
  op succ : Xnat -> Xnat { constr }
  op d1 : -> Xnat
  op d2 : -> Xnat
  op d3 : -> Xnat
  op f : Xnat -> Xnat
  trans d1 => succ (d0) .
  ctrans d2 => d0 if d0 == d0 .
  ctrans d3 => d0 if d0 =/= d0 .
  ctrans d3 => d0 if succ (d0) == d0 .
  ctrans d3 => succ (d0) if succ (d0) =/= d0 .
  ctrans f (N:Xnat) => N if N =/= d0 and N =/= succ (d0) .
}
select Tricky .
exec Ncons .
exec Ucons (d0) .
exec d1 .
exec d2 .
exec d3 .
