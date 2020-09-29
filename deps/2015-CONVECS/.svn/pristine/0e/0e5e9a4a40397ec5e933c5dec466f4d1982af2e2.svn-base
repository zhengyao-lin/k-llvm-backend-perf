-- CAFEOBJ-A
mod! EvalTree {
  [ Xbool Pos Tree SNat ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d1 : -> Pos { constr }
  op cDub : Xbool Pos -> Pos { constr }
  op leaf : SNat -> Tree { constr }
  op node : SNat SNat Tree Tree -> Tree { constr }
  op Z : -> SNat { constr }
  op S : SNat -> SNat { constr }
  op eqBool : Xbool Xbool -> Xbool
  op and : Xbool Xbool -> Xbool
  op eqPos : Pos Pos -> Xbool
  op eq : SNat SNat -> Xbool
  op f : SNat -> Xbool
  op lambda6 : SNat -> Xbool
  op lambda5 : SNat Tree -> Tree
  op lambda4 : SNat Tree SNat SNat -> Tree
  op lambda3 : SNat Tree Tree -> Tree
  op lambda2 : SNat Tree Tree SNat SNat -> Tree
  op lambda1 : SNat Tree Tree SNat -> Tree
  op buildtree : SNat SNat -> Tree
  op lambda0 : SNat SNat -> SNat
  op succ17 : SNat -> SNat
  op pred17 : SNat -> SNat
  op plus17 : SNat SNat -> SNat
  op mult17 : SNat SNat -> SNat
  op exp17 : SNat SNat -> SNat
  op evaltree17 : SNat -> SNat
  op getval : Tree -> SNat
  op getmax : Tree -> SNat
  op seventeen : -> SNat
  eq eqBool (Xtrue,b:Xbool) = b .
  eq eqBool (Xfalse,Xtrue) = Xfalse .
  eq eqBool (Xfalse,Xfalse) = Xtrue .
  eq and (b:Xbool,Xtrue) = b .
  eq and (b:Xbool,Xfalse) = Xfalse .
  eq eqPos (d1,d1) = Xtrue .
  eq eqPos (d1,cDub (b:Xbool,p:Pos)) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),d1) = Xfalse .
  eq eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = and (eqBool (b,c), eqPos (p,q)) .
  eq lambda6 (n:SNat) = eq (evaltree17 (n),getval (buildtree (n,Z))) .
  eq lambda5 (n:SNat,left:Tree) = lambda4 (n,left,getmax (left),getval (left)) .
  eq lambda4 (n:SNat,left:Tree,max:SNat,o:SNat) = lambda3 (o,left,buildtree (n,succ17 (max))) .
  eq lambda3 (n:SNat,left:Tree,right:Tree) = lambda2 (n,left,right,getval (right),getmax (right)) .
  eq lambda2 (n:SNat,left:Tree,right:Tree,o:SNat,max:SNat) = lambda1 (max,left,right,plus17 (n,o)) .
  eq lambda1 (max:SNat,left:Tree,right:Tree,n:SNat) = node (n,max,left,right) .
  eq lambda0 (n:SNat,o:SNat) = mult17 (n,o) .
  eq eq (Z,Z) = Xtrue .
  eq eq (Z,S (n:SNat)) = Xfalse .
  eq eq (S (n:SNat),Z) = Xfalse .
  eq eq (S (n:SNat),S (o:SNat)) = eq (n,o) .
  ceq succ17 (n:SNat) = Z if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xtrue .
  ceq succ17 (n:SNat) = S (n) if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xfalse .
  eq pred17 (Z) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z)))))))))))))))) .
  eq pred17 (S (n:SNat)) = n .
  eq plus17 (n:SNat,Z) = n .
  eq plus17 (n:SNat,S (o:SNat)) = succ17 (plus17 (n,o)) .
  eq mult17 (n:SNat,Z) = Z .
  eq mult17 (n:SNat,S (o:SNat)) = plus17 (n,mult17 (n,o)) .
  eq exp17 (n:SNat,Z) = succ17 (Z) .
  eq exp17 (n:SNat,S (o:SNat)) = mult17 (n,exp17 (n,o)) .
  eq evaltree17 (n:SNat) = lambda0 (exp17 (S (S (Z)),pred17 (n)),pred17 (exp17 (S (S (Z)),n))) .
  eq getval (leaf (n:SNat)) = n .
  eq getval (node (n:SNat,max:SNat,left:Tree,right:Tree)) = n .
  eq getmax (leaf (n:SNat)) = n .
  eq getmax (node (n:SNat,max:SNat,left:Tree,right:Tree)) = max .
  eq buildtree (Z,n:SNat) = leaf (n) .
  eq buildtree (S (n:SNat),o:SNat) = lambda5 (n,buildtree (n,o)) .
  eq seventeen = S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z )))) ))))) ))))) ))))) .
  eq f (n:SNat) = lambda6 (seventeen) .
}
select EvalTree .
red f (seventeen) .
