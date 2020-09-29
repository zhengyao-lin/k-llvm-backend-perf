-- CAFEOBJ-A
mod! check2 {
  [ Xbool ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op notBool : Xbool -> Xbool
  op andBool : Xbool Xbool -> Xbool
  op orBool : Xbool Xbool -> Xbool
  op xorBool : Xbool Xbool -> Xbool
  op impliesBool : Xbool Xbool -> Xbool
  op iffBool : Xbool Xbool -> Xbool
  op eqBool : Xbool Xbool -> Xbool
  op neBool : Xbool Xbool -> Xbool
  eq notBool (Xtrue) = Xfalse .
  eq notBool (Xfalse) = Xtrue .
  eq andBool (P:Xbool, Xtrue) = P .
  eq andBool (P:Xbool, Xfalse) = Xfalse .
  eq orBool (P:Xbool, Xtrue) = Xtrue .
  eq orBool (P:Xbool, Xfalse) = P .
  eq xorBool (P:Xbool, Q:Xbool) = orBool (andBool (P, notBool (Q)), andBool (Q, notBool (P))) .
  eq impliesBool (P:Xbool, Q:Xbool) = orBool (Q, notBool (P)) .
  eq iffBool (P:Xbool, Q:Xbool) = andBool (impliesBool (P, Q), impliesBool (Q, P)) .
  eq eqBool (P:Xbool, Q:Xbool) = iffBool (P, Q) .
  eq neBool (P:Xbool, Q:Xbool) = xorBool (P, Q) .
}
select check2 .
red neBool (Xfalse, Xtrue) .
