-- CAFEOBJ-B
mod! EvalExpr {
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
  op eqENat : ENat ENat -> Xbool
  op eq : SNat SNat -> Xbool
  op succ17 : SNat -> SNat
  op plus17 : SNat SNat -> SNat
  op mult17 : SNat SNat -> SNat
  op exp17 : SNat SNat -> SNat
  op eval17 : ENat -> SNat
  op evalexp17 : ENat -> SNat
  op expand : ENat -> ENat
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
  trans lambda0 (m:ENat) => eq (eval17 (m),evalexp17 (m)) .
  trans eq (Z,Z) => Xtrue .
  trans eq (Z,S (r:SNat)) => Xfalse .
  trans eq (S (r:SNat),Z) => Xfalse .
  trans eq (S (r:SNat),S (t:SNat)) => eq (r,t) .
  trans eqENat (Exz,Exz) => Xtrue .
  trans eqENat (Exz,Exs (m:ENat)) => Xfalse .
  trans eqENat (Exz,Explus (m:ENat,n:ENat)) => Xfalse .
  trans eqENat (Exz,Exmult (m:ENat,n:ENat)) => Xfalse .
  trans eqENat (Exz,Exexp (m:ENat,n:ENat)) => Xfalse .
  trans eqENat (Exs (m:ENat),Exz) => Xfalse .
  trans eqENat (Exs (n:ENat),Exs (m:ENat)) => eqENat (n,m) .
  trans eqENat (Exs (m:ENat),Explus (n:ENat,o:ENat)) => Xfalse .
  trans eqENat (Exs (n:ENat),Exmult (m:ENat,o:ENat)) => Xfalse .
  trans eqENat (Exs (m:ENat),Exexp (n:ENat,o:ENat)) => Xfalse .
  trans eqENat (Explus (n:ENat,m:ENat),Exz) => Xfalse .
  trans eqENat (Explus (m:ENat,n:ENat),Exs (o:ENat)) => Xfalse .
  trans eqENat (Explus (n:ENat,m:ENat),Explus (o:ENat,l:ENat)) => and (eqENat (n,o),eqENat (m,l)) .
  trans eqENat (Explus (m:ENat,n:ENat),Exmult (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Explus (n:ENat,m:ENat),Exexp (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Exmult (m:ENat,n:ENat),Exz) => Xfalse .
  trans eqENat (Exmult (n:ENat,m:ENat),Exs (o:ENat)) => Xfalse .
  trans eqENat (Exmult (m:ENat,n:ENat),Explus (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Exmult (n:ENat,m:ENat),Exmult (o:ENat,l:ENat)) => and (eqENat (n,o),eqENat (m,l)) .
  trans eqENat (Exmult (m:ENat,n:ENat),Exexp (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Exexp (n:ENat,m:ENat),Exz) => Xfalse .
  trans eqENat (Exexp (m:ENat,n:ENat),Exs (o:ENat)) => Xfalse .
  trans eqENat (Exexp (n:ENat,m:ENat),Explus (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Exexp (m:ENat,n:ENat),Exmult (o:ENat,l:ENat)) => Xfalse .
  trans eqENat (Exexp (m:ENat,n:ENat),Exexp (o:ENat,l:ENat)) => and (eqENat (m,o),eqENat (n,l)) .
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
  trans evalexp17 (n:ENat) => eval17 (expand (n)) .
  trans expand (Exz) => Exz .
  trans expand (Exs (n:ENat)) => Explus (Exs (Exz),n) .
  trans expand (Explus (n:ENat,m:ENat)) => Explus (expand (n),expand (m)) .
  trans expand (Exmult (n:ENat,Exz)) => Exz .
  trans expand (Exmult (n:ENat,Exs (Exz))) => expand (n) .
  trans expand (Exmult (n:ENat,Explus (m:ENat,o:ENat))) => expand (Explus (Exmult (n,m),Exmult (n,o))) .
  trans expand (Exmult (n:ENat,Exmult (m:ENat,o:ENat))) => expand (Exmult (n,expand (Exmult (m,o)))) .
  trans expand (Exmult (n:ENat,Exexp (m:ENat,o:ENat))) => expand (Exmult (n,expand (Exexp (m,o)))) .
  trans expand (Exexp (n:ENat,Exz)) => Exs (Exz) .
  ctrans expand (Exexp (n:ENat,Exs (m:ENat))) => expand (n) if eqENat (m,Exz) == Xtrue .
  ctrans expand (Exexp (n:ENat,Exs (m:ENat))) => expand (Exexp (n,expand (Exs (m)))) if eqENat (m,Exz) == Xfalse .
  trans expand (Exexp (n:ENat,Explus (m:ENat,o:ENat))) => expand (Exmult (Exexp (n,m),Exexp (n,o))) .
  trans expand (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) => expand (Exexp (n,expand (Exmult (m,o)))) .
  trans expand (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) => expand (Exexp (n,expand (Exexp (m,o)))) .
  trans two => Exs (Exs (Exz)) .
  trans seventeen => Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz))))))))))))))))))) .
  trans f (m:ENat) => lambda0 (Exexp (two,m)) .
}
select EvalExpr .
exec f (seventeen) .
