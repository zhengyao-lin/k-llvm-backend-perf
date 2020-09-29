-- CAFEOBJ-B
mod! RevNat100 {
  [ Xnat List ]
  op l : Xnat List -> List { constr }
  op nil : -> List { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op d10 : -> Xnat
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op gen : Xnat -> List
  op conc : List List -> List
  op rev : List -> List
  trans d10 => s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans gen (s (N:Xnat)) => l (s (N), gen (N)) .
  trans gen (d0) => l (d0, nil) .
  trans conc (l (E:Xnat, L1:List), L2:List) => l (E, conc (L1, L2)) .
  trans conc (nil, L2:List) => L2 .
  trans rev (l (E:Xnat, L1:List)) => conc (rev (L1), l (E, nil)) .
  trans rev (nil) => nil .
}
select RevNat100 .
exec rev (gen (times (d10, d10))) .
