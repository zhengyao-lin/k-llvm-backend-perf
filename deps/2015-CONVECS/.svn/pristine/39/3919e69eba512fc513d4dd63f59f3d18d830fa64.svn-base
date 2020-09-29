-- CAFEOBJ-B
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
  trans eqBool (T,b:Xbool) => b .
  trans eqBool (F,T) => F .
  trans eqBool (F,F) => T .
  trans and (T,b:Xbool) => b .
  trans and (F,b:Xbool) => F .
  trans Xnot (T) => F .
  trans Xnot (F) => T .
  trans eqPos (One,One) => T .
  trans eqPos (One,cDub (b:Xbool,p:Pos)) => F .
  trans eqPos (cDub (b:Xbool,p:Pos),One) => F .
  trans eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => and (eqBool (b,c), eqPos (p,q)) .
  trans lePos (One,p:Pos) => T .
  trans lePos (cDub (b:Xbool,p:Pos),One) => F .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b == c .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b =/= c and b == F .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b =/= c and b == T .
  trans ltPos (p:Pos,One) => F .
  trans ltPos (One,cDub (b:Xbool,p:Pos)) => T .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b == c .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b =/= c and b == F .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b =/= c and b == T .
  trans gePos (p:Pos,q:Pos) => lePos (q,p) .
  trans succ2Pos (One) => cDub (F,One) .
  trans succ2Pos (cDub (F,p:Pos)) => cDub (T,p) .
  trans succ2Pos (cDub (T,p:Pos)) => cDub (F,succ2Pos (p)) .
  trans plusPos (p:Pos,q:Pos) => addc (F,p,q) .
  trans addc (F,One,p:Pos) => succ2Pos (p) .
  trans addc (T,One,p:Pos) => succ2Pos (succ2Pos (p)) .
  trans addc (F,p:Pos,One) => succ2Pos (p) .
  trans addc (T,p:Pos,One) => succ2Pos (succ2Pos (p)) .
  ctrans addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => cDub (b,addc (c,p,q)) if c == d .
  ctrans addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => cDub (Xnot (b),addc (b,p,q)) if c =/= d .
  ctrans lambda0 (n:Xnat,y:Xnat,x:Xnat,h:Xnat) => bs2 (n,h,y) if lt (f (h),n) == T .
  ctrans lambda0 (n:Xnat,y:Xnat,x:Xnat,h:Xnat) => bs2 (n,x,h) if lt (f (h),n) == F .
  trans max2Int (cInt (m:Xnat),n:Xnat) => max2 (m,n) .
  trans max2Int (cNeg (p:Pos),n:Xnat) => n .
  trans min2 (Zero) => cInt (Zero) .
  trans min2 (cNat (p:Pos)) => cNeg (p) .
  ctrans minus (m:Xnat,n:Xnat) => cInt (gtesubtn (m,n)) if ge (m,n) == T .
  ctrans minus (m:Xnat,n:Xnat) => min2 (gtesubtn (n,m)) if lt (m,n) == T .
  trans eq (Zero,Zero) => T .
  trans eq (Zero,cNat (p:Pos)) => F .
  trans eq (cNat (p:Pos),Zero) => F .
  trans eq (cNat (p:Pos),cNat (q:Pos)) => eqPos (p,q) .
  trans ite (T,m:Xnat,n:Xnat) => m .
  trans ite (F,m:Xnat,n:Xnat) => n .
  trans Pos2Nat (p:Pos) => cNat (p) .
  trans Nat2Pos (cNat (p:Pos)) => p .
  trans le (Zero,n:Xnat) => T .
  trans le (cNat (p:Pos),Zero) => F .
  trans le (cNat (p:Pos),cNat (q:Pos)) => lePos (p,q) .
  trans lt (n:Xnat,Zero) => F .
  trans lt (Zero,cNat (p:Pos)) => T .
  trans lt (cNat (p:Pos),cNat (q:Pos)) => ltPos (p,q) .
  trans ge (m:Xnat,n:Xnat) => le (n,m) .
  trans max2 (m:Xnat,n:Xnat) => ite (le (m,n),n,m) .
  trans succ2 (Zero) => One .
  trans succ2 (cNat (p:Pos)) => succ2Pos (p) .
  trans pred2 (One) => Zero .
  trans pred2 (cDub (T,p:Pos)) => cNat (cDub (F,p)) .
  trans pred2 (cDub (F,p:Pos)) => dub (T,pred2 (p)) .
  trans dub (F,Zero) => Zero .
  trans dub (T,Zero) => cNat (One) .
  trans dub (b:Xbool,cNat (p:Pos)) => cNat (cDub (b,p)) .
  trans plusNatPos (Zero,p:Pos) => p .
  trans plusNatPos (cNat (p:Pos),q:Pos) => plusPos (p,q) .
  trans plus (Zero,n:Xnat) => n .
  trans plus (n:Xnat,Zero) => n .
  trans plus (cNat (p:Pos),cNat (q:Pos)) => cNat (addc (F,p,q)) .
  trans gtesubtp (p:Pos,q:Pos) => gtesubtb (F,p,q) .
  trans gtesubtn (n:Xnat,Zero) => n .
  trans gtesubtn (cNat (p:Pos),cNat (q:Pos)) => gtesubtp (p,q) .
  trans gtesubtb (F,p:Pos,One) => pred2 (p) .
  trans gtesubtb (T,p:Pos,One) => pred2 (Nat2Pos (pred2 (p))) .
  ctrans gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => dub (b,gtesubtb (b,p,q)) if c == d .
  ctrans gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => dub (Xnot (b),gtesubtb (d,p,q)) if c =/= d .
  ctrans dividePos (p:Pos,q:Pos) => cNat (succ2 (divide (gtesubtp (p,q),q))) if gePos (p,q) == T .
  ctrans dividePos (p:Pos,q:Pos) => Zero if ltPos (p,q) == T .
  trans divide (Zero,p:Pos) => Zero .
  trans divide (cNat (p:Pos),q:Pos) => dividePos (p,q) .
  trans f (Zero) => Zero .
  trans f (cNat (One)) => cNat (One) .
  trans f (cNat (cDub (b:Xbool,p:Pos))) => plus (f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (One)),Zero)),f (max2Int (minus (cNat (cDub (b,p)),Pos2Nat (cDub (F,One))),Zero))) .
  trans bs (n:Xnat,m:Xnat) => bs2 (n,Zero,m) .
  ctrans bs2 (n:Xnat,x:Xnat,y:Xnat) => x if eq (Pos2Nat (plusNatPos (x,One)),y) == T .
  ctrans bs2 (n:Xnat,x:Xnat,y:Xnat) => lambda0 (n,y,x,divide (plus (x,y),cDub (F,One))) if eq (Pos2Nat (plusNatPos (x,One)),y) == F .
}
select BinarySearch .
exec bs (Pos2Nat (cDub (T,cDub (T,cDub (F,cDub (T,cDub (F,cDub (T,cDub (T,cDub (F,cDub (T,cDub (F,cDub (T,One)))))))))))),Pos2Nat (cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,One)))))))) .
