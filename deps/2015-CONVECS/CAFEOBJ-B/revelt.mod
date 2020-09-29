-- CAFEOBJ-B
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
  trans conc (l (E0:Elt, L1:List), L2:List) => l (E0, conc (L1, L2)) .
  trans conc (nil, L2:List) => L2 .
  trans dup (L1:List) => conc (L1, L1) .
  trans rev (l (E0:Elt, L1:List)) => conc (rev (L1), l (E0, nil)) .
  trans rev (nil) => nil .
}
select RevElt .
exec rev (dup (l (a, l (b, l (c, l (d, l (e, nil))))))) .
