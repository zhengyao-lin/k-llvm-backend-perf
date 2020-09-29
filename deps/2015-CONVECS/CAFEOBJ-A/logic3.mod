-- CAFEOBJ-A
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
  eq a = d0 .
  eq b = d1 .
  eq c = d2 .
  eq d = d0 .
  eq e = d1 .
  eq f = d2 .
  eq g = d0 .
  eq h = d1 .
  eq succ (d0) = d1 .
  eq succ (d1) = d2 .
  eq succ (d2) = d0 .
  eq plus (d0, X:Bool3) = X .
  eq plus (d1, X:Bool3) = succ (X) .
  eq plus (d2, X:Bool3) = succ (succ (X)) .
  eq times (d0, X:Bool3) = d0 .
  eq times (d1, X:Bool3) = X .
  eq times (d2, d0) = d0 .
  eq times (d2, d1) = d2 .
  eq times (d2, d2) = d1 .
  eq and (X:Bool3,Y:Bool3) = plus ( times (times (X, X), times (Y, Y)),plus ( times (d2, times (times (X, X), Y)),plus ( times (d2, times (times (Y, Y), X)),times (d2, times (X, Y)) ))) .
  eq or (X:Bool3,Y:Bool3) = plus ( times (d2, times (times (X, X), times (Y, Y))),plus ( times (times (X, X), Y),plus ( times (times (Y, Y), X),plus ( times (X, Y),plus (X, Y) )))) .
  eq Xnot (X:Bool3) = plus (times (d2, X), d1) .
  ceq eq (X:Bool3,Y:Bool3) = d1 if X == Y .
  ceq eq (X:Bool3,Y:Bool3) = d0 if X =/= Y .
}
select Logic3 .
red eq (and (and (and (a, b), and (c, d)), and (and (e, f), and (g, h))), Xnot (or (or (or (Xnot (a), Xnot (b)), or (Xnot (c), Xnot (d))),or (or (Xnot (e), Xnot (f)), or (Xnot (g), Xnot (h)))))) .
