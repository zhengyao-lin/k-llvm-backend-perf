-- CAFEOBJ-B
mod! BubbleSort1000 {
  [ Xbool Xnat NatList ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op nil : -> NatList { constr }
  op cons : Xnat NatList -> NatList { constr }
  op d10 : -> Xnat
  op lt : Xnat Xnat -> Xbool
  op bubsort : Xnat NatList -> NatList
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op rev : Xnat -> NatList
  op fact : Xnat -> Xnat
  trans d10 => s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  trans lt (d0,d0) => Xfalse .
  trans lt (d0, s (N:Xnat)) => Xtrue .
  trans lt (s (N:Xnat), d0) => Xfalse .
  trans lt (s (N:Xnat), s (M:Xnat)) => lt (N, M) .
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans fact (d0) => s (d0) .
  trans fact (s (N:Xnat)) => times (s (N), fact (N)) .
  trans rev (s (N:Xnat)) => bubsort (s (N), rev (N)) .
  trans rev (d0) => cons (d0, nil) .
  trans bubsort (N:Xnat, nil) => cons (N, nil) .
  ctrans bubsort (N:Xnat, cons (M:Xnat, L:NatList)) => cons (M, bubsort (N, L)) if lt (M, N) == Xtrue .
  ctrans bubsort (N:Xnat, cons (M:Xnat, L:NatList)) => cons (N, bubsort (M, L)) if lt (M, N) == Xfalse .
}
select BubbleSort1000 .
exec rev (times (d10, times (d10, d10))) .
