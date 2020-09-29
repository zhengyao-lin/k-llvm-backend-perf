-- CAFEOBJ-A
mod! Hanoi16 {
  [ Disk Tower Move List ]
  op d0 : -> Disk { constr }
  op d1 : -> Disk { constr }
  op d2 : -> Disk { constr }
  op d3 : -> Disk { constr }
  op d4 : -> Disk { constr }
  op d5 : -> Disk { constr }
  op d6 : -> Disk { constr }
  op d7 : -> Disk { constr }
  op d8 : -> Disk { constr }
  op d9 : -> Disk { constr }
  op d10 : -> Disk { constr }
  op d11 : -> Disk { constr }
  op d12 : -> Disk { constr }
  op d13 : -> Disk { constr }
  op d14 : -> Disk { constr }
  op d15 : -> Disk { constr }
  op d16 : -> Disk { constr }
  op d17 : -> Disk { constr }
  op d18 : -> Disk { constr }
  op d19 : -> Disk { constr }
  op d20 : -> Disk { constr }
  op a : -> Tower { constr }
  op b : -> Tower { constr }
  op c : -> Tower { constr }
  op movedisk : Disk Tower Tower -> Move { constr }
  op nil : -> List { constr }
  op cons : Move List -> List { constr }
  op dec : Disk -> Disk
  op other : Tower Tower -> Tower
  op conc : List List -> List
  op solve : Tower Tower Disk -> List
  eq dec (d20) = d19 .
  eq dec (d19) = d18 .
  eq dec (d18) = d17 .
  eq dec (d17) = d16 .
  eq dec (d16) = d15 .
  eq dec (d15) = d14 .
  eq dec (d14) = d13 .
  eq dec (d13) = d12 .
  eq dec (d12) = d11 .
  eq dec (d11) = d10 .
  eq dec (d10) = d9 .
  eq dec (d9) = d8 .
  eq dec (d8) = d7 .
  eq dec (d7) = d6 .
  eq dec (d6) = d5 .
  eq dec (d5) = d4 .
  eq dec (d4) = d3 .
  eq dec (d3) = d2 .
  eq dec (d2) = d1 .
  eq dec (d1) = d0 .
  eq other (a, b) = c .
  eq other (b, a) = c .
  eq other (a, c) = b .
  eq other (c, a) = b .
  eq other (b, c) = a .
  eq other (c, b) = a .
  eq conc (nil, L:List) = L .
  eq conc (L:List, nil) = L .
  eq conc (cons (H:Move, T:List), L:List) = cons (H, conc (T, L)) .
  eq solve (ORG:Tower, DEST:Tower, d0) = nil .
  ceq solve (ORG:Tower, DEST:Tower, D:Disk) = conc (solve (ORG, other (ORG, DEST), dec (D)), cons (movedisk (D, ORG, DEST), solve (other (ORG, DEST), DEST, dec (D)))) if D =/= d0 .
}
select Hanoi16 .
red solve (a, b, d16) .
