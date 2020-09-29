-- CAFEOBJ-A
mod! Permutations7 {
  [ Xnat NatList NatListList ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op nil : -> NatList { constr }
  op l : Xnat -> NatList { constr }
  op ll : NatList NatList -> NatList { constr }
  op nilP : -> NatListList { constr }
  op p : NatList -> NatListList { constr }
  op pp : NatListList NatListList -> NatListList { constr }
  op perm : Xnat -> NatListList
  op insert1 : Xnat NatListList -> NatListList
  op insert0 : Xnat NatList -> NatListList
  op map-cons : Xnat NatListList -> NatListList
  op ppreduce : NatListList NatListList -> NatListList
  op ppflat : NatListList NatListList -> NatListList
  eq perm (d0) = ppreduce (p (nil), nilP) .
  eq perm (s (d0)) = ppreduce (p (ll (l (s (d0)), nil)), nilP) .
  eq perm (s (N:Xnat)) = insert1 (s (N), perm (N)) .
  eq insert1 (N:Xnat, pp (p (P1:NatList), Ps:NatListList)) = ppreduce (insert0 (N, P1), insert1 (N, Ps)) .
  eq insert1 (N:Xnat, p (P1:NatList)) = insert0 (N,P1) .
  eq insert1 (N:Xnat, nilP) = nilP .
  eq insert0 (N:Xnat, ll (l (M:Xnat), P2:NatList)) = ppreduce (p (ll (l (N), ll (l (M), P2))), map-cons (M, insert0 (N, P2))) .
  eq insert0 (N:Xnat, nil) = ppreduce (p (ll (l (N), nil)), nilP) .
  eq map-cons (M:Xnat, pp (p (P1:NatList), Ps:NatListList)) = ppreduce (p (ll (l (M), P1)), map-cons (M, Ps)) .
  eq map-cons (M:Xnat, p (P1:NatList)) = p (ll (l (M), P1)) .
  eq map-cons (M:Xnat, nilP) = nilP .
  eq ppreduce (nilP, Ps2:NatListList) = Ps2 .
  eq ppreduce (Ps1:NatListList, nilP) = Ps1 .
  eq ppreduce (Ps1:NatListList, Ps2:NatListList) = ppflat (Ps1, ppflat (Ps2, nilP)) .
  eq ppflat (nilP, accumulator:NatListList) = accumulator .
  eq ppflat (p (P1:NatList), accumulator:NatListList) = pp (p (P1), accumulator) .
  eq ppflat (pp (Ps1:NatListList, Ps2:NatListList), accumulator:NatListList) = ppflat (Ps1, ppflat (Ps2, accumulator)) .
}
select Permutations7 .
red perm (s (s (s (s (s (s (s (d0)))))))) .
