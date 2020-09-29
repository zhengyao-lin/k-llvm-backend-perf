-- CAFEOBJ-B
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
  trans gte (b, a) => Xtrue .
  trans gte (a, b) => Xfalse .
  trans gte (a, a) => Xtrue .
  trans gte (b, b) => Xtrue .
  trans gte (c (E:Strg, S:Strg), E2:Strg) => gte (E, E2) .
  ctrans gte (E:Strg, c (E2:Strg, S2:Strg)) => Xfalse if E == E2 .
  ctrans gte (E:Strg, c (E2:Strg, S2:Strg)) => gte (E, E2) if E =/= E2 .
  trans merge (nil, L1:List) => L1 .
  trans merge (L1:List, nil) => L1 .
  ctrans merge (l (S:Strg, L1:List), l (S2:Strg, L2:List)) => l (S2, merge (l (S, L1), L2)) if gte (S, S2) == Xtrue .
  ctrans merge (l (S:Strg, L1:List), l (S2:Strg, L2:List)) => l (S, merge (L1, l (S2, L2))) if gte (S, S2) == Xfalse .
  trans odd (nil) => nil .
  trans odd (l (S:Strg, nil)) => l (S, nil) .
  trans odd (l (S:Strg, l (S2:Strg, L1:List))) => l (S, odd (L1)) .
  trans even (nil) => nil .
  trans even (l (S:Strg, nil)) => nil .
  trans even (l (S:Strg, l (S2:Strg, L1:List))) => l (S2, even (L1)) .
  trans sort (nil) => nil .
  trans sort (l (S:Strg, nil)) => l (S, nil) .
  trans sort (l (S:Strg, l (S2:Strg, L1:List))) => merge (sort (odd (l (S, l (S2, L1)))), sort (even (l (S, l (S2, L1))))) .
}
select Merge .
exec sort (l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))),l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))), l (c (a, c (b, c (a, b))), l (c (b, c (a, c (b, b))), l (c (a, c (b, c (a, a))), l (c (b, c (b, c (b, b))), l (c (b, c (b, c (b, a))), l (c (a, c (a, c (a, b))), l (c (b, c (b, c (a, a))), l (c (a, c (a, c (a, a))), l (c (a, c (a, c (b, b))), l (c (b, c (a, c (b, a))),nil))))))))))))))))))))))))))))))))))))))))))))))))))) .
