-- CAFEOBJ-B
mod! Hanoi20 {
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
  trans dec (d20) => d19 .
  trans dec (d19) => d18 .
  trans dec (d18) => d17 .
  trans dec (d17) => d16 .
  trans dec (d16) => d15 .
  trans dec (d15) => d14 .
  trans dec (d14) => d13 .
  trans dec (d13) => d12 .
  trans dec (d12) => d11 .
  trans dec (d11) => d10 .
  trans dec (d10) => d9 .
  trans dec (d9) => d8 .
  trans dec (d8) => d7 .
  trans dec (d7) => d6 .
  trans dec (d6) => d5 .
  trans dec (d5) => d4 .
  trans dec (d4) => d3 .
  trans dec (d3) => d2 .
  trans dec (d2) => d1 .
  trans dec (d1) => d0 .
  trans other (a, b) => c .
  trans other (b, a) => c .
  trans other (a, c) => b .
  trans other (c, a) => b .
  trans other (b, c) => a .
  trans other (c, b) => a .
  trans conc (nil, L:List) => L .
  trans conc (L:List, nil) => L .
  trans conc (cons (H:Move, T:List), L:List) => cons (H, conc (T, L)) .
  trans solve (ORG:Tower, DEST:Tower, d0) => nil .
  ctrans solve (ORG:Tower, DEST:Tower, D:Disk) => conc (solve (ORG, other (ORG, DEST), dec (D)), cons (movedisk (D, ORG, DEST), solve (other (ORG, DEST), DEST, dec (D)))) if D =/= d0 .
}
select Hanoi20 .
exec solve (a, b, d20) .
