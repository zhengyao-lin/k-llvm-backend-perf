-- CAFEOBJ-A
mod! Calls {
  [ S ]
  op nullary-constructor : -> S { constr }
  op unary-constructor : S -> S { constr }
  op nary-constructor : S S S -> S { constr }
  op nullary-function : -> S
  op unary-function : S -> S
  op nary-function : S S S -> S
  op a : -> S
  op b : -> S
  op c : -> S
  op d : -> S
  op e : -> S
  op f : -> S
  eq nullary-function = nullary-constructor .
  eq unary-function (x:S) = unary-constructor (x) .
  eq nary-function (x:S, y:S, z:S) = nary-constructor (x, y, z) .
  eq a = nullary-constructor .
  eq b = unary-constructor (nullary-constructor) .
  eq c = nary-constructor (nullary-constructor, nullary-constructor, nullary-constructor) .
  eq d = nullary-function .
  eq e = unary-function (nullary-function) .
  eq f = nary-function (nullary-function, nullary-function, nullary-function) .
}
select Calls .
red nullary-constructor .
red unary-constructor (nullary-constructor) .
red nary-constructor (nullary-constructor, nullary-constructor, nullary-constructor) .
red nullary-function .
red unary-function (nullary-function) .
red nary-function (nullary-function, nullary-function, nullary-function) .
