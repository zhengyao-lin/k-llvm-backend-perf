-- CAFEOBJ-A
mod! Factorial5 {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op fact : Xnat -> Xnat
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq fact (d0) = s (d0) .
  eq fact (s (N:Xnat)) = times (s (N), fact (N)) .
}
select Factorial5 .
red fact (s (s (s (s (s (d0)))))) .
