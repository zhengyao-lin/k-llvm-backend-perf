-- CAFEOBJ-A
mod! Merge {
  [ Xbool Strg List ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op a : -> Strg { constr }
  op b : -> Strg { constr }
  op c : Strg Strg -> Strg { constr }
  op nil : -> List { constr }
  op l : Strg List -> List { constr }
  op gte : Strg Strg -> Xbool
  op merge : List List -> List
  op sort : List -> List
  op odd : List -> List
  op even : List -> List
  eq gte (b, a) = Xtrue .
  eq gte (a, b) = Xfalse .
  eq gte (a, a) = Xtrue .
  eq gte (b, b) = Xtrue .
  eq gte (c (E:Strg, S:Strg), E2:Strg) = gte (E, E2) .
  ceq gte (E:Strg, c (E2:Strg, S2:Strg)) = Xfalse if E == E2 .
  ceq gte (E:Strg, c (E2:Strg, S2:Strg)) = gte (E, E2) if E =/= E2 .
  eq merge (nil, L1:List) = L1 .
  eq merge (L1:List, nil) = L1 .
  ceq merge (l (S:Strg, L1:List), l (S2:Strg, L2:List)) = l (S2, merge (l (S, L1), L2)) if gte (S, S2) == Xtrue .
  ceq merge (l (S:Strg, L1:List), l (S2:Strg, L2:List)) = l (S, merge (L1, l (S2, L2))) if gte (S, S2) == Xfalse .
  eq odd (nil) = nil .
  eq odd (l (S:Strg, nil)) = l (S, nil) .
  eq odd (l (S:Strg, l (S2:Strg, L1:List))) = l (S, odd (L1)) .
  eq even (nil) = nil .
  eq even (l (S:Strg, nil)) = nil .
  eq even (l (S:Strg, l (S2:Strg, L1:List))) = l (S2, even (L1)) .
  eq sort (nil) = nil .
  eq sort (l (S:Strg, nil)) = l (S, nil) .
  eq sort (l (S:Strg, l (S2:Strg, L1:List))) = merge (sort (odd (l (S, l (S2, L1)))), sort (even (l (S, l (S2, L1))))) .
}
select Merge .
red sort (l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))), l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))), l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),nil))))))))))))))))))))))))))))))))))))))))))))))))))) .
