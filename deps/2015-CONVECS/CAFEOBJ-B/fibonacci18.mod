-- CAFEOBJ-B
mod! Fibonacci18 {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op plus : Xnat Xnat -> Xnat
  op fibb : Xnat -> Xnat
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans fibb (d0) => d0 .
  trans fibb (s (d0)) => s (d0) .
  trans fibb (s (s (N:Xnat))) => plus (fibb (s (N)), fibb (N)) .
}
select Fibonacci18 .
exec fibb (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))) .
