-- CAFEOBJ-B
mod! MergeSort1000 {
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
  trans d10 => s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  trans lte (d0, s (N:Xnat)) => Xtrue .
  trans lte (s (N:Xnat), d0) => Xfalse .
  trans lte (d0, d0) => Xtrue .
  trans lte (s (N:Xnat), s (M:Xnat)) => lte (N, M) .
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans rev (s (N:Xnat)) => cons (s (N), rev (N)) .
  trans rev (d0) => cons (d0, nil) .
  trans merge (nil, L:NatList) => L .
  trans merge (L:NatList, nil) => L .
  ctrans merge (cons (X:Xnat, L1:NatList), cons (Y:Xnat, L2:NatList)) => cons (X, merge (L1, cons (Y, L2))) if lte (X, Y) == Xtrue .
  ctrans merge (cons (X:Xnat, L1:NatList), cons (Y:Xnat, L2:NatList)) => cons (Y, merge (cons (X, L1), L2)) if lte (X, Y) == Xfalse .
  trans split (cons (X:Xnat, cons (Y:Xnat, L:NatList))) => pair (cons (X, p1 (split (L))), cons (Y, p2 (split (L)))) .
  trans split (nil) => pair (nil, nil) .
  trans split (cons (X:Xnat, nil)) => pair (cons (X, nil), nil) .
  trans mergesort (nil) => nil .
  trans mergesort (cons (X:Xnat, nil)) => cons (X, nil) .
  trans mergesort (cons (X:Xnat, cons (Y:Xnat, L:NatList))) => merge (mergesort (cons (X, p1 (split (L)))), mergesort (cons (Y, p2 (split (L))))) .
  trans p1 (pair (L1:NatList, L2:NatList)) => L1 .
  trans p2 (pair (L1:NatList, L2:NatList)) => L2 .
}
select MergeSort1000 .
exec mergesort (rev (times (d10, times (d10, d10)))) .
