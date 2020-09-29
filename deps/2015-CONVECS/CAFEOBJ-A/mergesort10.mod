-- CAFEOBJ-A
mod! MergeSort10 {
  [ Xbool Xnat NatList ListPair ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op nil : -> NatList { constr }
  op cons : Xnat NatList -> NatList { constr }
  op pair : NatList NatList -> ListPair { constr }
  op d10 : -> Xnat
  op lte : Xnat Xnat -> Xbool
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op rev : Xnat -> NatList
  op split : NatList -> ListPair
  op merge : NatList NatList -> NatList
  op mergesort : NatList -> NatList
  op p1 : ListPair -> NatList
  op p2 : ListPair -> NatList
  eq d10 = s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  eq lte (d0, s (N:Xnat)) = Xtrue .
  eq lte (s (N:Xnat), d0) = Xfalse .
  eq lte (d0, d0) = Xtrue .
  eq lte (s (N:Xnat), s (M:Xnat)) = lte (N, M) .
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq rev (s (N:Xnat)) = cons (s (N), rev (N)) .
  eq rev (d0) = cons (d0, nil) .
  eq merge (nil, L:NatList) = L .
  eq merge (L:NatList, nil) = L .
  ceq merge (cons (X:Xnat, L1:NatList), cons (Y:Xnat, L2:NatList)) = cons (X, merge (L1, cons (Y, L2))) if lte (X, Y) == Xtrue .
  ceq merge (cons (X:Xnat, L1:NatList), cons (Y:Xnat, L2:NatList)) = cons (Y, merge (cons (X, L1), L2)) if lte (X, Y) == Xfalse .
  eq split (cons (X:Xnat, cons (Y:Xnat, L:NatList))) = pair (cons (X, p1 (split (L))), cons (Y, p2 (split (L)))) .
  eq split (nil) = pair (nil, nil) .
  eq split (cons (X:Xnat, nil)) = pair (cons (X, nil), nil) .
  eq mergesort (nil) = nil .
  eq mergesort (cons (X:Xnat, nil)) = cons (X, nil) .
  eq mergesort (cons (X:Xnat, cons (Y:Xnat, L:NatList))) = merge (mergesort (cons (X, p1 (split (L)))), mergesort (cons (Y, p2 (split (L))))) .
  eq p1 (pair (L1:NatList, L2:NatList)) = L1 .
  eq p2 (pair (L1:NatList, L2:NatList)) = L2 .
}
select MergeSort10 .
red mergesort (rev (d10)) .
