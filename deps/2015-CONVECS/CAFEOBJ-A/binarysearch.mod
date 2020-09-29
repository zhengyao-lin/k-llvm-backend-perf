-- CAFEOBJ-A
mod! BinarySearch {
  [ Xbool Pos Int Xnat ]
  op T : -> Xbool { constr }
  op F : -> Xbool { constr }
  op One : -> Pos { constr }
  op cDub : Xbool Pos -> Pos { constr }
  op cInt : Xnat -> Int { constr }
  op cNeg : Pos -> Int { constr }
  op Zero : -> Xnat { constr }
  op cNat : Pos -> Xnat { constr }
  op eqBool : Xbool Xbool -> Xbool
  op Xnot : Xbool -> Xbool
  op and : Xbool Xbool -> Xbool
  op eqPos : Pos Pos -> Xbool
  op lePos : Pos Pos -> Xbool
  op ltPos : Pos Pos -> Xbool
  op gePos : Pos Pos -> Xbool
  op succ2Pos : Pos -> Pos
  op plusPos : Pos Pos -> Pos
  op addc : Xbool Pos Pos -> Pos
  op lambda0 : Xnat Xnat Xnat Xnat -> Xnat
  op max2Int : Int Xnat -> Xnat
  op min2 : Xnat -> Int
  op minus : Xnat Xnat -> Int
  op eq : Xnat Xnat -> Xbool
  op ite : Xbool Xnat Xnat -> Xnat
  op Pos2Nat : Pos -> Xnat
  op Nat2Pos : Xnat -> Pos
  op le : Xnat Xnat -> Xbool
  op lt : Xnat Xnat -> Xbool
  op ge : Xnat Xnat -> Xbool
  op max2 : Xnat Xnat -> Xnat
  op succ2 : Xnat -> Pos
  op pred2 : Pos -> Xnat
  op dub : Xbool Xnat -> Xnat
  op plusNatPos : Xnat Pos -> Pos
  op plus : Xnat Xnat -> Xnat
  op gtesubtp : Pos Pos -> Xnat
  op gtesubtn : Xnat Xnat -> Xnat
  op gtesubtb : Xbool Pos Pos -> Xnat
  op dividePos : Pos Pos -> Xnat
  op divide : Xnat Pos -> Xnat
  op f : Xnat -> Xnat
  op bs : Xnat Xnat -> Xnat
  op bs2 : Xnat Xnat Xnat -> Xnat
  eq eqBool (T,b:Xbool) = b .
  eq eqBool (F,T) = F .
  eq eqBool (F,F) = T .
  eq and (T,b:Xbool) = b .
  eq and (F,b:Xbool) = F .
  eq Xnot (T) = F .
  eq Xnot (F) = T .
  eq eqPos (One,One) = T .
  eq eqPos (One,cDub (b:Xbool,p:Pos)) = F .
  eq eqPos (cDub (b:Xbool,p:Pos),One) = F .
  eq eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = and (eqBool (b,c), eqPos (p,q)) .
  eq lePos (One,p:Pos) = T .
  eq lePos (cDub (b:Xbool,p:Pos),One) = F .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b == c .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b =/= c and b == F .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b =/= c and b == T .
  eq ltPos (p:Pos,One) = F .
  eq ltPos (One,cDub (b:Xbool,p:Pos)) = T .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b == c .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b =/= c and b == F .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b =/= c and b == T .
  eq gePos (p:Pos,q:Pos) = lePos (q,p) .
  eq succ2Pos (One) = cDub (F,One) .
  eq succ2Pos (cDub (F,p:Pos)) = cDub (T,p) .
  eq succ2Pos (cDub (T,p:Pos)) = cDub (F,succ2Pos (p)) .
  eq plusPos (p:Pos,q:Pos) = addc (F,p,q) .
  eq addc (F,One,p:Pos) = succ2Pos (p) .
  eq addc (T,One,p:Pos) = succ2Pos (succ2Pos (p)) .
  eq addc (F,p:Pos,One) = succ2Pos (p) .
  eq addc (T,p:Pos,One) = succ2Pos (succ2Pos (p)) .
  ceq addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = cDub (b,addc (c,p,q)) if c == d .
  ceq addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = cDub (Xnot (b),addc (b,p,q)) if c =/= d .
  ceq lambda0 (n:Xnat,y:Xnat,x:Xnat,h:Xnat) = bs2 (n,h,y) if lt (f (h),n) == T .
  ceq lambda0 (n:Xnat,y:Xnat,x:Xnat,h:Xnat) = bs2 (n,x,h) if lt (f (h),n) == F .
  eq max2Int (cInt (m:Xnat),n:Xnat) = max2 (m,n) .
  eq max2Int (cNeg (p:Pos),n:Xnat) = n .
  eq min2 (Zero) = cInt (Zero) .
  eq min2 (cNat (p:Pos)) = cNeg (p) .
  ceq minus (m:Xnat,n:Xnat) = cInt (gtesubtn (m,n)) if ge (m,n) == T .
  ceq minus (m:Xnat,n:Xnat) = min2 (gtesubtn (n,m)) if lt (m,n) == T .
  eq eq (Zero,Zero) = T .
  eq eq (Zero,cNat (p:Pos)) = F .
  eq eq (cNat (p:Pos),Zero) = F .
  eq eq (cNat (p:Pos),cNat (q:Pos)) = eqPos (p,q) .
  eq ite (T,m:Xnat,n:Xnat) = m .
  eq ite (F,m:Xnat,n:Xnat) = n .
  eq Pos2Nat (p:Pos) = cNat (p) .
  eq Nat2Pos (cNat (p:Pos)) = p .
  eq le (Zero,n:Xnat) = T .
  eq le (cNat (p:Pos),Zero) = F .
  eq le (cNat (p:Pos),cNat (q:Pos)) = lePos (p,q) .
  eq lt (n:Xnat,Zero) = F .
  eq lt (Zero,cNat (p:Pos)) = T .
  eq lt (cNat (p:Pos),cNat (q:Pos)) = ltPos (p,q) .
  eq ge (m:Xnat,n:Xnat) = le (n,m) .
  eq max2 (m:Xnat,n:Xnat) = ite (le (m,n),n,m) .
  eq succ2 (Zero) = One .
  eq succ2 (cNat (p:Pos)) = succ2Pos (p) .
  eq pred2 (One) = Zero .
  eq pred2 (cDub (T,p:Pos)) = cNat (cDub (F,p)) .
  eq pred2 (cDub (F,p:Pos)) = dub (T,pred2 (p)) .
  eq dub (F,Zero) = Zero .
  eq dub (T,Zero) = cNat (One) .
  eq dub (b:Xbool,cNat (p:Pos)) = cNat (cDub (b,p)) .
  eq plusNatPos (Zero,p:Pos) = p .
  eq plusNatPos (cNat (p:Pos),q:Pos) = plusPos (p,q) .
  eq plus (Zero,n:Xnat) = n .
  eq plus (n:Xnat,Zero) = n .
  eq plus (cNat (p:Pos),cNat (q:Pos)) = cNat (addc (F,p,q)) .
  eq gtesubtp (p:Pos,q:Pos) = gtesubtb (F,p,q) .
  eq gtesubtn (n:Xnat,Zero) = n .
  eq gtesubtn (cNat (p:Pos),cNat (q:Pos)) = gtesubtp (p,q) .
  eq gtesubtb (F,p:Pos,One) = pred2 (p) .
  eq gtesubtb (T,p:Pos,One) = pred2 (Nat2Pos (pred2 (p))) .
  ceq gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = dub (b,gtesubtb (b,p,q)) if c == d .
  ceq gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = dub (Xnot (b),gtesubtb (d,p,q)) if c =/= d .
  ceq dividePos (p:Pos,q:Pos) = cNat (succ2 (divide (gtesubtp (p,q),q))) if gePos (p,q) == T .
  ceq dividePos (p:Pos,q:Pos) = Zero if ltPos (p,q) == T .
  eq divide (Zero,p:Pos) = Zero .
  eq divide (cNat (p:Pos),q:Pos) = dividePos (p,q) .
  eq f (Zero) = Zero .
  eq f (cNat (One)) = cNat (One) .
  eq f (cNat (cDub (b:Xbool,p:Pos))) = plus (f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (One)),Zero)),f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (cDub (F,One))),Zero))) .
  eq bs (n:Xnat,m:Xnat) = bs2 (n,Zero,m) .
  ceq bs2 (n:Xnat,x:Xnat,y:Xnat) = x if eq (Pos2Nat (plusNatPos (x,One)),y) == T .
  ceq bs2 (n:Xnat,x:Xnat,y:Xnat) = lambda0 (n,y,x,divide (plus (x,y),cDub (F,One))) if eq (Pos2Nat (plusNatPos (x,One)),y) == F .
}
select BinarySearch .
red bs (Pos2Nat (cDub (T,cDub (T,cDub (F,cDub (T,cDub (F,cDub (T,cDub (T,cDub (F,cDub (T,cDub (F,cDub (T,One)))))))))))),Pos2Nat (cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,One)))))))) .
