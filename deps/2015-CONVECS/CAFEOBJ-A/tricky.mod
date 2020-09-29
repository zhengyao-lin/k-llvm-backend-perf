-- CAFEOBJ-A
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
  eq d1 = succ (d0) .
  ceq d2 = d0 if d0 == d0 .
  ceq d3 = d0 if d0 =/= d0 .
  ceq d3 = d0 if succ (d0) == d0 .
  ceq d3 = succ (d0) if succ (d0) =/= d0 .
  ceq f (N:Xnat) = N if N =/= d0 and N =/= succ (d0) .
}
select Tricky .
red Ncons .
red Ucons (d0) .
red d1 .
red d2 .
red d3 .
