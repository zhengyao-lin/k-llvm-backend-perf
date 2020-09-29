-- CAFEOBJ-B
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
  trans notBool (Xtrue) => Xfalse .
  trans notBool (Xfalse) => Xtrue .
  trans andBool (P:Xbool, Xtrue) => P .
  trans andBool (P:Xbool, Xfalse) => Xfalse .
  trans orBool (P:Xbool, Xtrue) => Xtrue .
  trans orBool (P:Xbool, Xfalse) => P .
  trans xorBool (P:Xbool, Q:Xbool) => orBool (andBool (P, notBool (Q)), andBool (Q, notBool (P))) .
  trans impliesBool (P:Xbool, Q:Xbool) => orBool (Q, notBool (P)) .
  trans iffBool (P:Xbool, Q:Xbool) => andBool (impliesBool (P, Q), impliesBool (Q, P)) .
  trans eqBool (P:Xbool, Q:Xbool) => iffBool (P, Q) .
  trans neBool (P:Xbool, Q:Xbool) => xorBool (P, Q) .
}
select check2 .
exec neBool (Xfalse, Xtrue) .
