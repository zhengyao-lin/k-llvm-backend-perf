-- CAFEOBJ-A
mod! RevElt {
  [ Elt List ]
  op l : Elt List -> List { constr }
  op nil : -> List { constr }
  op a : -> Elt { constr }
  op b : -> Elt { constr }
  op c : -> Elt { constr }
  op d : -> Elt { constr }
  op e : -> Elt { constr }
  op conc : List List -> List
  op dup : List -> List
  op rev : List -> List
  eq conc (l (E0:Elt, L1:List), L2:List) = l (E0, conc (L1, L2)) .
  eq conc (nil, L2:List) = L2 .
  eq dup (L1:List) = conc (L1, L1) .
  eq rev (l (E0:Elt, L1:List)) = conc (rev (L1), l (E0, nil)) .
  eq rev (nil) = nil .
}
select RevElt .
red rev (dup (l (a, l (b, l (c, l (d, l (e, nil))))))) .
