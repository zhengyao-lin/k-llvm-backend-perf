-- CAFEOBJ-B
mod! QuickSort1000 {
  [ Xbool Xnat NatList NatListPair ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op nil : -> NatList { constr }
  op cons : Xnat NatList -> NatList { constr }
  op pair : NatList NatList -> NatListPair { constr }
  op Xnot : Xbool -> Xbool
  op d10 : -> Xnat
  op st : Xnat Xnat -> Xbool
  op get : Xnat Xnat -> Xbool
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op rev : Xnat -> NatList
  op split : Xnat NatList -> NatListPair
  op qsort : NatList -> NatList
  op append : NatList NatList -> NatList
  op p1 : NatListPair -> NatList
  op p2 : NatListPair -> NatList
  trans d10 => s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  trans Xnot (Xtrue) => Xfalse .
  trans Xnot (Xfalse) => Xtrue .
  trans st (d0, s (N:Xnat)) => Xtrue .
  trans st (s (N:Xnat), d0) => Xfalse .
  trans st (d0, d0) => Xfalse .
  trans st (s (N:Xnat), s (M:Xnat)) => st (N, M) .
  trans get (N:Xnat, M:Xnat) => Xnot (st (N, M)) .
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans rev (s (N:Xnat)) => cons (s (N), rev (N)) .
  trans rev (d0) => cons (d0, nil) .
  ctrans split (N:Xnat, cons (M:Xnat, L:NatList)) => pair (p1 (split (N, L)), cons (M, p2 (split (N, L)))) if st (N, M) == Xtrue .
  ctrans split (N:Xnat, cons (M:Xnat, L:NatList)) => pair (cons (M, p1 (split (N, L))), p2 (split (N, L))) if get (N, M) == Xtrue .
  trans split (N:Xnat, nil) => pair (nil, nil) .
  trans append (cons (N:Xnat, L:NatList), LT:NatList) => cons (N, append (L, LT)) .
  trans append (nil, L:NatList) => L .
  trans qsort (nil) => nil .
  trans qsort (cons (N:Xnat, L:NatList)) => append (qsort (p1 (split (N, L))), cons (N, qsort (p2 (split (N, L))))) .
  trans p1 (pair (L1:NatList, L2:NatList)) => L1 .
  trans p2 (pair (L1:NatList, L2:NatList)) => L2 .
}
select QuickSort1000 .
exec qsort (rev (times (d10, times (d10, d10)))) .
