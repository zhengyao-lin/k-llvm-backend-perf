-- CAFEOBJ-A
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
  eq eqBool (Xtrue,b:Xbool) = b .
  eq eqBool (Xfalse,Xtrue) = Xfalse .
  eq eqBool (Xfalse,Xfalse) = Xtrue .
  eq and (b:Xbool,Xtrue) = b .
  eq and (b:Xbool,Xfalse) = Xfalse .
  eq eqPos (d1,d1) = Xtrue .
  eq eqPos (d1,cDub (b:Xbool,p:Pos)) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),d1) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = and (eqBool (b,c), eqPos (p,q)) .
  eq lambda0 (m:ENat) = eq (eval17 (m),evalsym17 (m)) .
  eq eq (Z,Z) = Xtrue .
  eq eq (Z,S (r:SNat)) = Xfalse .
  eq eq (S (r:SNat),Z) = Xfalse .
  eq eq (S (r:SNat),S (t:SNat)) = eq (r,t) .
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
  eq evalsym17 (Exz) = Z .
  eq evalsym17 (Exs (n:ENat)) = succ17 (evalsym17 (n)) .
  eq evalsym17 (Explus (n:ENat,m:ENat)) = plus17 (evalsym17 (n),evalsym17 (m)) .
  eq evalsym17 (Exmult (n:ENat,Exz)) = Z .
  eq evalsym17 (Exmult (n:ENat,Exs (m:ENat))) = evalsym17 (Explus (Exmult (n,m),n)) .
  eq evalsym17 (Exmult (n:ENat,Explus (m:ENat,o:ENat))) = evalsym17 (Explus (Exmult (n,m),Exmult (n,o))) .
  eq evalsym17 (Exmult (n:ENat,Exmult (m:ENat,o:ENat))) = evalsym17 (Exmult (Exmult (n,m),o)) .
  eq evalsym17 (Exmult (n:ENat,Exexp (m:ENat,o:ENat))) = evalsym17 (Exmult (n,dec (Exexp (m,o)))) .
  eq evalsym17 (Exexp (n:ENat,Exz)) = succ17 (Z) .
  eq evalsym17 (Exexp (n:ENat,Exs (m:ENat))) = evalsym17 (Exmult (Exexp (n,m),n)) .
  eq evalsym17 (Exexp (n:ENat,Explus (m:ENat,o:ENat))) = evalsym17 (Exmult (Exexp (n,m),Exexp (n,o))) .
  eq evalsym17 (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) = evalsym17 (Exexp (Exexp (n,m),o)) .
  eq evalsym17 (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) = evalsym17 (Exexp (n,dec (Exexp (m,o)))) .
  eq dec (Exexp (n:ENat,Exz)) = Exs (Exz) .
  eq dec (Exexp (n:ENat,Exs (m:ENat))) = Exmult (Exexp (n,m),n) .
  eq dec (Exexp (n:ENat,Explus (m:ENat,o:ENat))) = Exmult (Exexp (n,m),Exexp (n,o)) .
  eq dec (Exexp (n:ENat,Exmult (m:ENat,o:ENat))) = dec (Exexp (Exexp (n,m),o)) .
  eq dec (Exexp (n:ENat,Exexp (m:ENat,o:ENat))) = dec (Exexp (n,dec (Exexp (m,o)))) .
  eq two = Exs (Exs (Exz)) .
  eq seventeen = Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exz)))))))))))))))))))))))) .
  eq f (m:ENat) = lambda0 (Exexp (two,m)) .
}
select EvalSym .
red f (seventeen) .
