-- CAFEOBJ-B
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
  trans nullary-function => nullary-constructor .
  trans unary-function (x:S) => unary-constructor (x) .
  trans nary-function (x:S, y:S, z:S) => nary-constructor (x, y, z) .
  trans a => nullary-constructor .
  trans b => unary-constructor (nullary-constructor) .
  trans c => nary-constructor (nullary-constructor, nullary-constructor, nullary-constructor) .
  trans d => nullary-function .
  trans e => unary-function (nullary-function) .
  trans f => nary-function (nullary-function, nullary-function, nullary-function) .
}
select Calls .
exec nullary-constructor .
exec unary-constructor (nullary-constructor) .
exec nary-constructor (nullary-constructor, nullary-constructor, nullary-constructor) .
exec nullary-function .
exec unary-function (nullary-function) .
exec nary-function (nullary-function, nullary-function, nullary-function) .
