-- CAFEOBJ-A
mod! RevNat10000 {
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
  eq d10 = s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq gen (s (N:Xnat)) = l (s (N), gen (N)) .
  eq gen (d0) = l (d0, nil) .
  eq conc (l (E:Xnat, L1:List), L2:List) = l (E, conc (L1, L2)) .
  eq conc (nil, L2:List) = L2 .
  eq rev (l (E:Xnat, L1:List)) = conc (rev (L1), l (E, nil)) .
  eq rev (nil) = nil .
}
select RevNat10000 .
red rev (gen (times (d10, times (d10, times (d10, d10))))) .
