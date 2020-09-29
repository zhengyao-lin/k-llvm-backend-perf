-- CAFEOBJ-A
mod! GarbageCollection {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op p : -> Xnat { constr }
  op n : -> Xnat { constr }
  op d1 : -> Xnat
  op f : Xnat Xnat Xnat Xnat Xnat -> Xnat
  op c : Xnat Xnat -> Xnat
  eq d1 = s (d0) .
  eq c (d0, Y:Xnat) = Y .
  eq c (s (X:Xnat), Y:Xnat) = s (c (X,Y)) .
  eq f (X:Xnat, Y:Xnat, s (Z:Xnat), T:Xnat, U:Xnat) = f (X, Y, Z, c (T, T), U) .
  eq f (X:Xnat, s (Y:Xnat), d0, T:Xnat, U:Xnat) = f (X, Y, p, T, T) .
  eq f (s (X:Xnat), d0, d0, T:Xnat, U:Xnat) = f (X, n, p, d1, d0) .
  eq f (d0, d0, d0, T:Xnat, U:Xnat) = T .
  eq f (X:Xnat, s (Y:Xnat), p, T:Xnat, U:Xnat) = f (X, Y, p, T, s (U)) .
  eq f (X:Xnat, d0, p, T:Xnat, U:Xnat) = f (X, n, p, s (T), U) .
  eq f (s (X:Xnat), n, p, T:Xnat, U:Xnat) = f (X, n, p, T, U) .
  eq f (d0, n, p, T:Xnat, U:Xnat) = U .
}
select GarbageCollection .
red f (s (s (s (s (s (s (d0)))))), s (s (s (s (s (d0))))), s (s (d0)), d0, d1) .
red f (s (s (s (s (d0)))), s (s (s (d0))), s (s (s (s (s (d0))))), d0, d1) .
