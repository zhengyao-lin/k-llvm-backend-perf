-- CAFEOBJ-A
mod! QuickSort10 {
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
  eq d10 = s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  eq Xnot (Xtrue) = Xfalse .
  eq Xnot (Xfalse) = Xtrue .
  eq st (d0, s (N:Xnat)) = Xtrue .
  eq st (s (N:Xnat), d0) = Xfalse .
  eq st (d0, d0) = Xfalse .
  eq st (s (N:Xnat), s (M:Xnat)) = st (N, M) .
  eq get (N:Xnat, M:Xnat) = Xnot (st (N, M)) .
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq rev (s (N:Xnat)) = cons (s (N), rev (N)) .
  eq rev (d0) = cons (d0, nil) .
  ceq split (N:Xnat, cons (M:Xnat, L:NatList)) = pair (p1 (split (N, L)), cons (M, p2 (split (N, L)))) if st (N, M) == Xtrue .
  ceq split (N:Xnat, cons (M:Xnat, L:NatList)) = pair (cons (M, p1 (split (N, L))), p2 (split (N, L))) if get (N, M) == Xtrue .
  eq split (N:Xnat, nil) = pair (nil, nil) .
  eq append (cons (N:Xnat, L:NatList), LT:NatList) = cons (N, append (L, LT)) .
  eq append (nil, L:NatList) = L .
  eq qsort (nil) = nil .
  eq qsort (cons (N:Xnat, L:NatList)) = append (qsort (p1 (split (N, L))), cons (N, qsort (p2 (split (N, L))))) .
  eq p1 (pair (L1:NatList, L2:NatList)) = L1 .
  eq p2 (pair (L1:NatList, L2:NatList)) = L2 .
}
select QuickSort10 .
red qsort (rev (d10)) .
