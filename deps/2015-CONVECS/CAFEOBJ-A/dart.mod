-- CAFEOBJ-A
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
  eq plus (d0, N:Xnat) = N .
  eq plus (s (N:Xnat), M:Xnat) = s (plus (N, M)) .
  eq times (d0, N:Xnat) = d0 .
  eq times (s (N:Xnat), M:Xnat) = plus (M, times (N, M)) .
  eq u (empty, S0:Set) = S0 .
  eq u (S0:Set, empty) = S0 .
  ceq u (S0:Set, S1:Set) = S0 if S0 == S1 .
  ceq u (S0:Set, S1:Set) = flat (S0, flat (S1, empty)) if S0 =/= S1 .
  eq flat (empty, S0:Set) = S0 .
  eq flat (singleton (I:Xnat), S0:Set) = union (singleton (I), S0) .
  eq flat (union (S1:Set, S2:Set), S0:Set) = flat (S1, flat (S2, S0)) .
  eq add (empty, S0:Set) = S0 .
  eq add (S0:Set, empty) = S0 .
  eq add (singleton (I:Xnat), singleton (J:Xnat)) = singleton (plus (I, J)) .
  eq add (singleton (I:Xnat), union (singleton (J:Xnat), S0:Set)) = add (singleton (plus (I, J)), S0) .
  eq add (union (singleton (I:Xnat), S1:Set), S2:Set) = u (add (singleton (I), S2), add (S1, S2)) .
  eq mult (empty, S0:Set) = S0 .
  eq mult (S0:Set, empty) = S0 .
  eq mult (singleton (I:Xnat), singleton (J:Xnat)) = singleton (times (I, J)) .
  eq mult (union (singleton (I:Xnat), S1:Set), S2:Set) = u (mult (singleton (I), S2), mult (S1, S2)) .
  eq five = s (s (s (s (s (d0))))) .
  eq ten = s (s (s (s (s (five))))) .
  eq fifteen = s (s (s (s (s (ten))))) .
  eq twentyfive = s (s (s (s (s (s (s (s (s (s (fifteen)))))))))) .
  eq fifty = plus (twentyfive, twentyfive) .
  eq singles = add (singleton (s (d0)), add (singleton (s (s (d0))), add (singleton (s (s (s (d0)))),add (singleton (s (s (s (s (d0))))), add (singleton (five),add (singleton (s (five)), add (singleton (s (s (five))),add (singleton (s (s (s (five)))), add (singleton (s (s (s (s (five))))), add (singleton (ten), add (singleton (s (ten)), add (singleton (s (s (ten))),add (singleton (s (s (s (ten)))), add (singleton (s (s (s (s (ten))))), add (singleton (fifteen),add (singleton (s (fifteen)), add (singleton (s (s (fifteen))), add (singleton (s (s (s (fifteen)))), add (singleton (s (s (s (s (fifteen))))), singleton (plus (five, fifteen))))))))))))))))))))) .
  eq doubles = mult (singles, singleton (s (s (d0)))) .
  eq triples = mult (singles, singleton (s (s (s (d0))))) .
  eq allops = u (u (u (u (u (singles, doubles), triples), singleton (twentyfive)), singleton (fifty)), singleton (d0)) .
  eq finish = add (u (doubles, singleton (fifty)), add (allops, allops)) .
}
select Dart .
red finish .
