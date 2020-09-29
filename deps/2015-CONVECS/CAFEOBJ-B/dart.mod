-- CAFEOBJ-B
mod! Dart {
  [ Xnat Set ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op empty : -> Set { constr }
  op singleton : Xnat -> Set { constr }
  op union : Set Set -> Set { constr }
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op five : -> Xnat
  op ten : -> Xnat
  op fifteen : -> Xnat
  op twentyfive : -> Xnat
  op fifty : -> Xnat
  op u : Set Set -> Set
  op flat : Set Set -> Set
  op add : Set Set -> Set
  op mult : Set Set -> Set
  op singles : -> Set
  op doubles : -> Set
  op triples : -> Set
  op allops : -> Set
  op finish : -> Set
  trans plus (d0, N:Xnat) => N .
  trans plus (s (N:Xnat), M:Xnat) => s (plus (N, M)) .
  trans times (d0, N:Xnat) => d0 .
  trans times (s (N:Xnat), M:Xnat) => plus (M, times (N, M)) .
  trans u (empty, S0:Set) => S0 .
  trans u (S0:Set, empty) => S0 .
  ctrans u (S0:Set, S1:Set) => S0 if S0 == S1 .
  ctrans u (S0:Set, S1:Set) => flat (S0, flat (S1, empty)) if S0 =/= S1 .
  trans flat (empty, S0:Set) => S0 .
  trans flat (singleton (I:Xnat), S0:Set) => union (singleton (I), S0) .
  trans flat (union (S1:Set, S2:Set), S0:Set) => flat (S1, flat (S2, S0)) .
  trans add (empty, S0:Set) => S0 .
  trans add (S0:Set, empty) => S0 .
  trans add (singleton (I:Xnat), singleton (J:Xnat)) => singleton (plus (I, J)) .
  trans add (singleton (I:Xnat), union (singleton (J:Xnat), S0:Set)) => add (singleton (plus (I, J)), S0) .
  trans add (union (singleton (I:Xnat), S1:Set), S2:Set) => u (add (singleton (I), S2), add (S1, S2)) .
  trans mult (empty, S0:Set) => S0 .
  trans mult (S0:Set, empty) => S0 .
  trans mult (singleton (I:Xnat), singleton (J:Xnat)) => singleton (times (I, J)) .
  trans mult (union (singleton (I:Xnat), S1:Set), S2:Set) => u (mult (singleton (I), S2), mult (S1, S2)) .
  trans five => s (s (s (s (s (d0))))) .
  trans ten => s (s (s (s (s (five))))) .
  trans fifteen => s (s (s (s (s (ten))))) .
  trans twentyfive => s (s (s (s (s (s (s (s (s (s (fifteen)))))))))) .
  trans fifty => plus (twentyfive, twentyfive) .
  trans singles => add (singleton (s (d0)), add (singleton (s (s (d0))), add (singleton (s (s (s (d0)))),add (singleton (s (s (s (s (d0))))), add (singleton (five),add (singleton (s (five)), add (singleton (s (s (five))),add (singleton (s (s (s (five)))), add (singleton (s (s (s (s (five))))), add (singleton (ten), add (singleton (s (ten)), add (singleton (s (s (ten))),add (singleton (s (s (s (ten)))), add (singleton (s (s (s (s (ten))))), add (singleton (fifteen),add (singleton (s (fifteen)), add (singleton (s (s (fifteen))), add (singleton (s (s (s (fifteen)))), add (singleton (s (s (s (s (fifteen))))), singleton (plus (five, fifteen))))))))))))))))))))) .
  trans doubles => mult (singles, singleton (s (s (d0)))) .
  trans triples => mult (singles, singleton (s (s (s (d0))))) .
  trans allops => u (u (u (u (u (singles, doubles), triples), singleton (twentyfive)), singleton (fifty)), singleton (d0)) .
  trans finish => add (u (doubles, singleton (fifty)), add (allops, allops)) .
}
select Dart .
exec finish .
