-- CAFEOBJ-B
mod! TautologyHard {
  [ Prop ]
  op tt : -> Prop { constr }
  op ff : -> Prop { constr }
  op and : Prop Prop -> Prop
  op xor : Prop Prop -> Prop
  op Xnot : Prop -> Prop
  op or : Prop Prop -> Prop
  op implies : Prop Prop -> Prop
  op iff : Prop Prop -> Prop
  op a : -> Prop
  op b : -> Prop
  op c : -> Prop
  op d : -> Prop
  op e : -> Prop
  op a1 : -> Prop
  op a2 : -> Prop
  op a3 : -> Prop
  op a4 : -> Prop
  op a5 : -> Prop
  op a6 : -> Prop
  op a7 : -> Prop
  op a8 : -> Prop
  op a9 : -> Prop
  op a10 : -> Prop
  op a11 : -> Prop
  op a12 : -> Prop
  op a13 : -> Prop
  op a14 : -> Prop
  op a15 : -> Prop
  op a16 : -> Prop
  op a17 : -> Prop
  op a18 : -> Prop
  trans and (P:Prop, tt) => P .
  trans and (P:Prop, ff) => ff .
  trans xor (P:Prop, ff) => P .
  trans xor (ff, tt) => tt .
  trans xor (tt, tt) => ff .
  trans Xnot (P:Prop) => xor (P, tt) .
  trans or (P:Prop, Q:Prop) => xor (and (P, Q), xor (P, Q)) .
  trans implies (P:Prop, Q:Prop) => Xnot (xor (P, and (P, Q))) .
  trans iff (P:Prop, Q:Prop) => Xnot (xor (P, Q)) .
  trans a => ff .
  trans b => tt .
  trans c => ff .
  trans d => tt .
  trans e => ff .
  trans a1 => tt .
  trans a2 => ff .
  trans a3 => tt .
  trans a4 => ff .
  trans a5 => tt .
  trans a6 => ff .
  trans a7 => tt .
  trans a8 => ff .
  trans a9 => tt .
  trans a10 => ff .
  trans a11 => tt .
  trans a12 => ff .
  trans a13 => tt .
  trans a14 => ff .
  trans a15 => tt .
  trans a16 => ff .
  trans a17 => tt .
  trans a18 => ff .
}
select TautologyHard .
exec implies (and (iff (iff (or (a1, a2), or (Xnot (a3), iff (xor (a4, a5),Xnot (Xnot (Xnot (a6)))))), Xnot (and (and (a7, a8), Xnot (xor (xor (or (a9, and (a10,a11)), a2), and (and (a11, xor (a2, iff (a5, a5))), xor (xor (a7, a7),iff (a9, a4)))))))), implies (iff (iff (or (a1, a2), or (Xnot (a3),iff (xor (a4, a5), Xnot (Xnot (Xnot (a6)))))), Xnot (and (and (a7, a8),Xnot (xor (xor (or (a9, and (a10, a11)), a2), and (and (a11, xor (a2, iff (a5,a5))), xor (xor (a7, a7), iff (a9, a4)))))))), Xnot (and (implies (and (a1,a2), Xnot (xor (or (or (xor (implies (and (a3, a4), implies (a5, a6)), or (a7,a8)), xor (iff (a9, a10), a11)), xor (xor (a2, a2), a7)), iff (or (a4, a9),xor (Xnot (a6), a6))))), Xnot (iff (Xnot (a11), Xnot (a9))))))),Xnot (and (implies (and (a1, a2), Xnot (xor (or (or (xor (implies (and (a3, a4),implies (a5, a6)), or (a7, a8)), xor (iff (a9, a10), a11)), xor (xor (a2,a2), a7)), iff (or (a4, a9), xor (Xnot (a6), a6))))), Xnot (iff (Xnot (a11),Xnot (a9)))))) .
exec implies (and (Xnot (and (xor (a1, xor (or (a2, a3), a4)), xor (iff (xor (Xnot (a5),or (xor (iff (a6, a7), iff (a8, a9)), and (a10, a9))), iff (Xnot (Xnot (a2)),implies (or (a9, a6), or (a10, a5)))), Xnot (or (a9, implies (Xnot (a8), or (a4,a9))))))), implies (Xnot (and (xor (a1, xor (or (a2, a3), a4)),xor (iff (xor (Xnot (a5), or (xor (iff (a6, a7), iff (a8, a9)), and (a10, a9))),iff (Xnot (Xnot (a2)), implies (or (a9, a6), or (a10, a5)))), Xnot (or (a9,implies (Xnot (a8), or (a4, a9))))))), Xnot (implies (implies (and (or (a1,xor (xor (a2, a3), Xnot (a4))), Xnot (xor (a5, and (a6, a7)))),implies (xor (implies (a8, a9), a10), xor (and (a4, or (a4, a1)), a2))),or (or (xor (or (a4, a7), a2), and (a8, a1)), Xnot (Xnot (Xnot (a6)))))))),Xnot (implies (implies (and (or (a1, xor (xor (a2, a3), Xnot (a4))), Xnot (xor (a5,and (a6, a7)))), implies (xor (implies (a8, a9), a10), xor (and (a4, or (a4,a1)), a2))), or (or (xor (or (a4, a7), a2), and (a8, a1)),Xnot (Xnot (Xnot (a6))))))) .
exec implies (and (Xnot (and (xor (a1, xor (or (a2, a3), a4)), xor (iff (xor (Xnot (a5),or (xor (iff (a6, a7), iff (a8, a9)), and (a10, a11))), implies (or (a4,and (a3, iff (a1, a2))), Xnot (Xnot (a4)))), xor (implies (implies (a6, a1),Xnot (a1)), Xnot (a9))))), implies (Xnot (and (xor (a1, xor (or (a2, a3), a4)),xor (iff (xor (Xnot (a5), or (xor (iff (a6, a7), iff (a8, a9)), and (a10,a11))), implies (or (a4, and (a3, iff (a1, a2))), Xnot (Xnot (a4)))),xor (implies (implies (a6, a1), Xnot (a1)), Xnot (a9))))),Xnot (implies (implies (and (or (a1, xor (xor (a2, a3), Xnot (a4))), Xnot (xor (a5,and (a6, a7)))), implies (xor (implies (a8, a9), a10), xor (and (a11,implies (a2, a8)), a8))), Xnot (or (implies (or (a5, or (a8, and (a8, a9))),Xnot (a2)), Xnot (a7))))))), Xnot (implies (implies (and (or (a1, xor (xor (a2,a3), Xnot (a4))), Xnot (xor (a5, and (a6, a7)))), implies (xor (implies (a8,a9), a10), xor (and (a11, implies (a2, a8)), a8))), Xnot (or (implies (or (a5,or (a8, and (a8, a9))), Xnot (a2)), Xnot (a7)))))) .
