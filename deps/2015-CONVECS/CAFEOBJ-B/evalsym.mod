-- CAFEOBJ-B
mod! EvalSym {
  [ Xbool Pos ENat SNat ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d1 : -> Pos { constr }
  op cDub : Xbool Pos -> Pos { constr }
  op Exz : -> ENat { constr }
  op Exs : ENat -> ENat { constr }
  op Explus : ENat ENat -> ENat { constr }
  op Exmult : ENat ENat -> ENat { constr }
  op Exexp : ENat ENat -> ENat { constr }
  op Z : -> SNat { constr }
  op S : SNat -> SNat { constr }
  op eqBool : Xbool Xbool -> Xbool
  op and : Xbool Xbool -> Xbool
  op eqPos : Pos Pos -> Xbool
  op lambda0 : ENat -> Xbool
  op eq : SNat SNat -> Xbool
  op succ17 : SNat -> SNat
  op plus17 : SNat SNat -> SNat
  op mult17 : SNat SNat -> SNat
  op exp17 : SNat SNat -> SNat
  op eval17 : ENat -> SNat
  op evalsym17 : ENat -> SNat
  op dec : ENat -> ENat
  op two : -> ENat
  op seventeen : -> ENat
  op f : ENat -> Xbool
  trans eqBool (Xtrue,b:Xbool) => b .
  trans eqBool (Xfalse,Xtrue) => Xfalse .
  trans eqBool (Xfalse,Xfalse) => Xtrue .
  trans and (b:Xbool,Xtrue) => b .
  trans and (b:Xbool,Xfalse) => Xfalse .
  trans eqPos (d1,d1) => Xtrue .
  trans eqPos (d1,cDub (b:Xbool,p:Pos)) => Xfalse .
  trans eqPos (cDub (b:Xbool,p:Pos),d1) => Xfalse .
  trans eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => and (eqBool (b,c), eqPos (p,q)) .
  trans lambda0 (m:ENat) => eq (eval17 (m),evalsym17 (m)) .
  trans eq (Z,Z) => Xtrue .
  trans eq (Z,S (r:SNat)) => Xfalse .
  trans eq (S (r:SNat),Z) => Xfalse .
  trans eq (S (r:SNat),S (t:SNat)) => eq (r,t) .
  ctrans succ17 (r:SNat) => Z if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xtrue .
  ctrans succ17 (r:SNat) => S (r) if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xfalse .
  trans plus17 (r:SNat,Z) => r .
  trans plus17 (r:SNat,S (t:SNat)) => succ17 (plus17 (r,t)) .
  trans mult17 (r:SNat,Z) => Z .
  trans mult17 (r:SNat,S (t:SNat)) => plus17 (r,mult17 (r,t)) .
  trans exp17 (r:SNat,Z) => succ17 (Z) .
  trans exp17 (r:SNat,S (t:SNat)) => mult17 (r,exp17 (r,t)) .
  trans eval17 (Exz) => Z .
  trans eval17 (Exs (n:ENat)) => succ17 (eval17 (n)) .
  trans eval17 (Explus (n:ENat,m:ENat)) => plus17 (eval17 (n),eval17 (m)) .
  trans eval17 (Exmult (n:ENat,m:ENat)) => mult17 (eval17 (n),eval17 (m)) .
  trans eval17 (Exexp (n:ENat,m:ENat)) => exp17 (eval17 (n),eval17 (m)) .
  trans evalsym17 (Exz) => Z .
  trans evalsym17 (Exs (n:ENat)) => succ17 (evalsym17 (n)) .
  trans evalsym17 (Explus (n:ENat,m:ENat)) => plus17 (evalsym17 (n),evalsym17 (m)) .
  trans evalsym17 (Exmult (n:ENat,Exz)) => Z .
  trans evalsym17 (Exmult (n:ENat,Exs (m:ENat))) => evalsym17 (Explus (Exmult (n,m),n)) .
  trans evalsym17 (Exmult (n:ENat,Explus (m:ENat,o:ENat))) => evalsym17 (Explus (Exmult (n,m),Exmult (n,o))) .
  trans evalsym17 (Exmult (n:ENat,Exmult (m:ENat,o:ENat))) => evalsym17 (Exmult (Exmult (n,m),o)) .
  trans evalsym17 (Exmult (n:ENat,Exexp (m:ENat,o:ENat))) => evalsym17 (Exmult (n,dec (Exexp (m,o)))) .
  trans evalsym17 (Exexp (n:ENat,Exz)) => succ17 (Z) .
  trans evalsym17 (Exexp (n:ENat,Exs (m:ENat))) => evalsym17 (Exmult (Exexp (n,m),n)) .
  trans evalsym17 (Exexp (n:ENat,Explus (m:ENat,o:ENat))) => evalsym17 (Exmult (Exexp (n,m),Exexp (n,o))) .
  trans evalsym17 (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) => evalsym17 (Exexp (Exexp (n,m),o)) .
  trans evalsym17 (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) => evalsym17 (Exexp (n,dec (Exexp (m,o)))) .
  trans dec (Exexp (n:ENat,Exz)) => Exs (Exz) .
  trans dec (Exexp (n:ENat,Exs (m:ENat))) => Exmult (Exexp (n,m),n) .
  trans dec (Exexp (n:ENat,Explus (m:ENat,o:ENat))) => Exmult (Exexp (n,m),Exexp (n,o)) .
  trans dec (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) => dec (Exexp (Exexp (n,m),o)) .
  trans dec (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) => dec (Exexp (n,dec (Exexp (m,o)))) .
  trans two => Exs (Exs (Exz)) .
  trans seventeen => Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz)))))))))))))))))))))))) .
  trans f (m:ENat) => lambda0 (Exexp (two,m)) .
}
select EvalSym .
exec f (seventeen) .
