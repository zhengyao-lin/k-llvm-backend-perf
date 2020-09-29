-- CAFEOBJ-B
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
  trans eqBool (Xtrue,b:Xbool) => b .
  trans eqBool (Xfalse,Xtrue) => Xfalse .
  trans eqBool (Xfalse,Xfalse) => Xtrue .
  trans and (b:Xbool,Xtrue) => b .
  trans and (b:Xbool,Xfalse) => Xfalse .
  trans eqPos (d1,d1) => Xtrue .
  trans eqPos (d1,cDub (b:Xbool,p:Pos)) => Xfalse .
  trans eqPos (cDub (b:Xbool,p:Pos),d1) => Xfalse .
  trans eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => and (eqBool (b,c), eqPos (p,q)) .
  trans lambda6 (n:SNat) => eq (evaltree17 (n),getval (buildtree (n,Z))) .
  trans lambda5 (n:SNat,left:Tree) => lambda4 (n,left,getmax (left),getval (left)) .
  trans lambda4 (n:SNat,left:Tree,max:SNat,o:SNat) => lambda3 (o,left,buildtree (n,succ17 (max))) .
  trans lambda3 (n:SNat,left:Tree,right:Tree) => lambda2 (n,left,right,getval (right),getmax (right)) .
  trans lambda2 (n:SNat,left:Tree,right:Tree,o:SNat,max:SNat) => lambda1 (max,left,right,plus17 (n,o)) .
  trans lambda1 (max:SNat,left:Tree,right:Tree,n:SNat) => node (n,max,left,right) .
  trans lambda0 (n:SNat,o:SNat) => mult17 (n,o) .
  trans eq (Z,Z) => Xtrue .
  trans eq (Z,S (n:SNat)) => Xfalse .
  trans eq (S (n:SNat),Z) => Xfalse .
  trans eq (S (n:SNat),S (o:SNat)) => eq (n,o) .
  ctrans succ17 (n:SNat) => Z if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xtrue .
  ctrans succ17 (n:SNat) => S (n) if eq (n,S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z))))))))))))))))) == Xfalse .
  trans pred17 (Z) => S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Z)))))))))))))))) .
  trans pred17 (S (n:SNat)) => n .
  trans plus17 (n:SNat,Z) => n .
  trans plus17 (n:SNat,S (o:SNat)) => succ17 (plus17 (n,o)) .
  trans mult17 (n:SNat,Z) => Z .
  trans mult17 (n:SNat,S (o:SNat)) => plus17 (n,mult17 (n,o)) .
  trans exp17 (n:SNat,Z) => succ17 (Z) .
  trans exp17 (n:SNat,S (o:SNat)) => mult17 (n,exp17 (n,o)) .
  trans evaltree17 (n:SNat) => lambda0 (exp17 (S (S (Z)),pred17 (n)),pred17 (exp17 (S (S (Z)),n))) .
  trans getval (leaf (n:SNat)) => n .
  trans getval (node (n:SNat,max:SNat,left:Tree,right:Tree)) => n .
  trans getmax (leaf (n:SNat)) => n .
  trans getmax (node (n:SNat,max:SNat,left:Tree,right:Tree)) => max .
  trans buildtree (Z,n:SNat) => leaf (n) .
  trans buildtree (S (n:SNat),o:SNat) => lambda5 (n,buildtree (n,o)) .
  trans seventeen => S (S (S (S (S ( S (S (S (S (S ( S (S (S (S (S ( S (S (S (S ( Z )))) ))))) ))))) ))))) .
  trans f (n:SNat) => lambda6 (seventeen) .
}
select EvalTree .
exec f (seventeen) .
