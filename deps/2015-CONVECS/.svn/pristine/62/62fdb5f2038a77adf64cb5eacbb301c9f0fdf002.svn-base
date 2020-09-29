-- CAFEOBJ-B
mod! Logic3 {
  [ Bool3 ]
  op d0 : -> Bool3 { constr }
  op d1 : -> Bool3 { constr }
  op d2 : -> Bool3 { constr }
  op a : -> Bool3
  op b : -> Bool3
  op c : -> Bool3
  op d : -> Bool3
  op e : -> Bool3
  op f : -> Bool3
  op g : -> Bool3
  op h : -> Bool3
  op plus : Bool3 Bool3 -> Bool3
  op times : Bool3 Bool3 -> Bool3
  op and : Bool3 Bool3 -> Bool3
  op or : Bool3 Bool3 -> Bool3
  op Xnot : Bool3 -> Bool3
  op succ : Bool3 -> Bool3
  op eq : Bool3 Bool3 -> Bool3
  trans a => d0 .
  trans b => d1 .
  trans c => d2 .
  trans d => d0 .
  trans e => d1 .
  trans f => d2 .
  trans g => d0 .
  trans h => d1 .
  trans succ (d0) => d1 .
  trans succ (d1) => d2 .
  trans succ (d2) => d0 .
  trans plus (d0, X:Bool3) => X .
  trans plus (d1, X:Bool3) => succ (X) .
  trans plus (d2, X:Bool3) => succ (succ (X)) .
  trans times (d0, X:Bool3) => d0 .
  trans times (d1, X:Bool3) => X .
  trans times (d2, d0) => d0 .
  trans times (d2, d1) => d2 .
  trans times (d2, d2) => d1 .
  trans and (X:Bool3,Y:Bool3) => plus ( times (times (X, X), times (Y, Y)),plus ( times (d2, times (times (X, X), Y)),plus ( times (d2, times (times (Y, Y), X)),times (d2, times (X, Y)) ))) .
  trans or (X:Bool3,Y:Bool3) => plus ( times (d2, times (times (X, X), times (Y, Y))),plus ( times (times (X, X), Y),plus ( times (times (Y, Y), X),plus ( times (X, Y),plus (X, Y) )))) .
  trans Xnot (X:Bool3) => plus (times (d2, X), d1) .
  ctrans eq (X:Bool3,Y:Bool3) => d1 if X == Y .
  ctrans eq (X:Bool3,Y:Bool3) => d0 if X =/= Y .
}
select Logic3 .
exec eq (and (and (and (a, b), and (c, d)), and (and (e, f), and (g, h))), Xnot (or (or (or (Xnot (a), Xnot (b)), or (Xnot (c), Xnot (d))),or (or (Xnot (e), Xnot (f)), or (Xnot (g), Xnot (h)))))) .
