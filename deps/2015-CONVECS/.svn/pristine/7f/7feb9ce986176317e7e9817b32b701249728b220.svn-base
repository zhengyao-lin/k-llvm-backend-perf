-- CAFEOBJ-A
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
  eq eqBool (Xtrue,b:Xbool) = b .
  eq eqBool (Xfalse,Xtrue) = Xfalse .
  eq eqBool (Xfalse,Xfalse) = Xtrue .
  eq and (b:Xbool,Xtrue) = b .
  eq and (b:Xbool,Xfalse) = Xfalse .
  eq eqPos (d1,d1) = Xtrue .
  eq eqPos (d1,cDub (b:Xbool,p:Pos)) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),d1) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = and (eqBool (b,c), eqPos (p,q)) .
  eq lambda0 (m:ENat) = eq (eval17 (m),evalexp17 (m)) .
  eq eq (Z,Z) = Xtrue .
  eq eq (Z,S (r:SNat)) = Xfalse .
  eq eq (S (r:SNat),Z) = Xfalse .
  eq eq (S (r:SNat),S (t:SNat)) = eq (r,t) .
  eq eqENat (Exz,Exz) = Xtrue .
  eq eqENat (Exz,Exs (m:ENat)) = Xfalse .
  eq eqENat (Exz,Explus (m:ENat,n:ENat)) = Xfalse .
  eq eqENat (Exz,Exmult (m:ENat,n:ENat)) = Xfalse .
  eq eqENat (Exz,Exexp (m:ENat,n:ENat)) = Xfalse .
  eq eqENat (Exs (m:ENat),Exz) = Xfalse .
  eq eqENat (Exs (n:ENat),Exs (m:ENat)) = eqENat (n,m) .
  eq eqENat (Exs (m:ENat),Explus (n:ENat,o:ENat)) = Xfalse .
  eq eqENat (Exs (n:ENat),Exmult (m:ENat,o:ENat)) = Xfalse .
  eq eqENat (Exs (m:ENat),Exexp (n:ENat,o:ENat)) = Xfalse .
  eq eqENat (Explus (n:ENat,m:ENat),Exz) = Xfalse .
  eq eqENat (Explus (m:ENat,n:ENat),Exs (o:ENat)) = Xfalse .
  eq eqENat (Explus (n:ENat,m:ENat),Explus (o:ENat,l:ENat)) = and (eqENat (n,o),eqENat (m,l)) .
  eq eqENat (Explus (m:ENat,n:ENat),Exmult (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Explus (n:ENat,m:ENat),Exexp (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Exmult (m:ENat,n:ENat),Exz) = Xfalse .
  eq eqENat (Exmult (n:ENat,m:ENat),Exs (o:ENat)) = Xfalse .
  eq eqENat (Exmult (m:ENat,n:ENat),Explus (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Exmult (n:ENat,m:ENat),Exmult (o:ENat,l:ENat)) = and (eqENat (n,o),eqENat (m,l)) .
  eq eqENat (Exmult (m:ENat,n:ENat),Exexp (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Exexp (n:ENat,m:ENat),Exz) = Xfalse .
  eq eqENat (Exexp (m:ENat,n:ENat),Exs (o:ENat)) = Xfalse .
  eq eqENat (Exexp (n:ENat,m:ENat),Explus (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Exexp (m:ENat,n:ENat),Exmult (o:ENat,l:ENat)) = Xfalse .
  eq eqENat (Exexp (m:ENat,n:ENat),Exexp (o:ENat,l:ENat)) = and (eqENat (m,o),eqENat (n,l)) .
  ceq succ17 (r:SNat) = Z if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xtrue .
  ceq succ17 (r:SNat) = S (r) if eq (r,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xfalse .
  eq plus17 (r:SNat,Z) = r .
  eq plus17 (r:SNat,S (t:SNat)) = succ17 (plus17 (r,t)) .
  eq mult17 (r:SNat,Z) = Z .
  eq mult17 (r:SNat,S (t:SNat)) = plus17 (r,mult17 (r,t)) .
  eq exp17 (r:SNat,Z) = succ17 (Z) .
  eq exp17 (r:SNat,S (t:SNat)) = mult17 (r,exp17 (r,t)) .
  eq eval17 (Exz) = Z .
  eq eval17 (Exs (n:ENat)) = succ17 (eval17 (n)) .
  eq eval17 (Explus (n:ENat,m:ENat)) = plus17 (eval17 (n),eval17 (m)) .
  eq eval17 (Exmult (n:ENat,m:ENat)) = mult17 (eval17 (n),eval17 (m)) .
  eq eval17 (Exexp (n:ENat,m:ENat)) = exp17 (eval17 (n),eval17 (m)) .
  eq evalexp17 (n:ENat) = eval17 (expand (n)) .
  eq expand (Exz) = Exz .
  eq expand (Exs (n:ENat)) = Explus (Exs (Exz),n) .
  eq expand (Explus (n:ENat,m:ENat)) = Explus (expand (n),expand (m)) .
  eq expand (Exmult (n:ENat,Exz)) = Exz .
  eq expand (Exmult (n:ENat,Exs (Exz))) = expand (n) .
  eq expand (Exmult (n:ENat,Explus (m:ENat,o:ENat))) = expand (Explus (Exmult (n,m),Exmult (n,o))) .
  eq expand (Exmult (n:ENat,Exmult (m:ENat,o:ENat))) = expand (Exmult (n,expand (Exmult (m,o)))) .
  eq expand (Exmult (n:ENat,Exexp (m:ENat,o:ENat))) = expand (Exmult (n,expand (Exexp (m,o)))) .
  eq expand (Exexp (n:ENat,Exz)) = Exs (Exz) .
  ceq expand (Exexp (n:ENat,Exs (m:ENat))) = expand (n) if eqENat (m,Exz) == Xtrue .
  ceq expand (Exexp (n:ENat,Exs (m:ENat))) = expand (Exexp (n,expand (Exs (m)))) if eqENat (m,Exz) == Xfalse .
  eq expand (Exexp (n:ENat,Explus (m:ENat,o:ENat))) = expand (Exmult (Exexp (n,m),Exexp (n,o))) .
  eq expand (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) = expand (Exexp (n,expand (Exmult (m,o)))) .
  eq expand (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) = expand (Exexp (n,expand (Exexp (m,o)))) .
  eq two = Exs (Exs (Exz)) .
  eq seventeen = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz))))))))))))))))))) .
  eq f (m:ENat) = lambda0 (Exexp (two,m)) .
}
select EvalExpr .
red f (seventeen) .
