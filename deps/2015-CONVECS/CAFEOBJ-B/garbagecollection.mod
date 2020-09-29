-- CAFEOBJ-B
mod! GarbageCollection {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op p : -> Xnat { constr }
  op n : -> Xnat { constr }
  op d1 : -> Xnat
  op f : Xnat Xnat Xnat Xnat Xnat -> Xnat
  op c : Xnat Xnat -> Xnat
  trans d1 => s (d0) .
  trans c (d0, Y:Xnat) => Y .
  trans c (s (X:Xnat), Y:Xnat) => s (c (X,Y)) .
  trans f (X:Xnat, Y:Xnat, s (Z:Xnat), T:Xnat, U:Xnat) => f (X, Y, Z, c (T, T), U) .
  trans f (X:Xnat, s (Y:Xnat), d0, T:Xnat, U:Xnat) => f (X, Y, p, T, T) .
  trans f (s (X:Xnat), d0, d0, T:Xnat, U:Xnat) => f (X, n, p, d1, d0) .
  trans f (d0, d0, d0, T:Xnat, U:Xnat) => T .
  trans f (X:Xnat, s (Y:Xnat), p, T:Xnat, U:Xnat) => f (X, Y, p, T, s (U)) .
  trans f (X:Xnat, d0, p, T:Xnat, U:Xnat) => f (X, n, p, s (T), U) .
  trans f (s (X:Xnat), n, p, T:Xnat, U:Xnat) => f (X, n, p, T, U) .
  trans f (d0, n, p, T:Xnat, U:Xnat) => U .
}
select GarbageCollection .
exec f (s (s (s (s (s (s (d0)))))), s (s (s (s (s (d0))))), s (s (d0)), d0, d1) .
exec f (s (s (s (s (d0)))), s (s (s (d0))), s (s (s (s (s (d0))))), d0, d1) .
