-- CAFEOBJ-B
mod! Factorial7 {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op fact : Xnat -> Xnat
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans fact (d0) => s (d0) .
  trans fact (s (N:Xnat)) => times (s (N), fact (N)) .
}
select Factorial7 .
exec fact (s (s (s (s (s (s (s (d0)))))))) .
