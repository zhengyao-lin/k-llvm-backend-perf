-- CAFEOBJ-A
mod! BubbleSort100 {
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
  eq d10 = s (s (s (s (s (s (s (s (s (s (d0)))))))))) .
  eq lt (d0,d0) = Xfalse .
  eq lt (d0, s (N:Xnat)) = Xtrue .
  eq lt (s (N:Xnat), d0) = Xfalse .
  eq lt (s (N:Xnat), s (M:Xnat)) = lt (N, M) .
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq fact (d0) = s (d0) .
  eq fact (s (N:Xnat)) = times (s (N), fact (N)) .
  eq rev (s (N:Xnat)) = bubsort (s (N), rev (N)) .
  eq rev (d0) = cons (d0, nil) .
  eq bubsort (N:Xnat, nil) = cons (N, nil) .
  ceq bubsort (N:Xnat, cons (M:Xnat, L:NatList)) = cons (M, bubsort (N, L)) if lt (M, N) == Xtrue .
  ceq bubsort (N:Xnat, cons (M:Xnat, L:NatList)) = cons (N, bubsort (M, L)) if lt (M, N) == Xfalse .
}
select BubbleSort100 .
red rev (times (d10, d10)) .
