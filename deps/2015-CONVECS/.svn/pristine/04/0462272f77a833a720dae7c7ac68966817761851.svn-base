-- CAFEOBJ-A
mod! Fib32 {
  [ Xbool Pos Int Xnat ]
  op T : -> Xbool { constr }
  op F : -> Xbool { constr }
  op d1 : -> Pos { constr }
  op cDub : Xbool Pos -> Pos { constr }
  op cInt : Xnat -> Int { constr }
  op cNeg : Pos -> Int { constr }
  op d0 : -> Xnat { constr }
  op cNat : Pos -> Xnat { constr }
  op Xnot : Xbool -> Xbool
  op eqPos : Pos Pos -> Xbool
  op lePos : Pos Pos -> Xbool
  op ltPos : Pos Pos -> Xbool
  op s : Pos -> Pos
  op addc : Xbool Pos Pos -> Pos
  op Int2Nat : Int -> Xnat
  op minus : Xnat -> Int
  op minus2 : Xnat Xnat -> Int
  op eq : Xnat Xnat -> Xbool
  op Pos2Nat : Pos -> Xnat
  op Nat2Pos : Xnat -> Pos
  op le : Xnat Xnat -> Xbool
  op lt : Xnat Xnat -> Xbool
  op ge : Xnat Xnat -> Xbool
  op gt : Xnat Xnat -> Xbool
  op pre : Pos -> Xnat
  op dub : Xbool Xnat -> Xnat
  op plus : Xnat Xnat -> Xnat
  op gtesubtPos : Pos Pos -> Xnat
  op gtesubt : Xnat Xnat -> Xnat
  op gtesubtb : Xbool Pos Pos -> Xnat
  op fib : Xnat -> Xnat
  op eqBool : Xbool Xbool -> Xbool
  op and : Xbool Xbool -> Xbool
  eq eqBool (T,b:Xbool) = b .
  eq eqBool (F,T) = F .
  eq eqBool (F,F) = T .
  eq and (T,b:Xbool) = b .
  eq and (F,b:Xbool) = F .
  eq Xnot (T) = F .
  eq Xnot (F) = T .
  eq eqPos (d1,d1) = T .
  eq eqPos (d1,cDub (b:Xbool,p:Pos)) = F .
  eq eqPos (cDub (b:Xbool,p:Pos),d1) = F .
  eq eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = and (eqBool (b,c),eqPos (p,q)) .
  eq lePos (d1,p:Pos) = T .
  eq lePos (cDub (b:Xbool,p:Pos),d1) = F .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b == c .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b =/= c and b == F .
  ceq lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b =/= c and b == T .
  eq ltPos (p:Pos,d1) = F .
  eq ltPos (d1,cDub (b:Xbool,p:Pos)) = T .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b == c .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = lePos (p,q) if b =/= c and b == F .
  ceq ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) = ltPos (p,q) if b =/= c and b == T .
  eq s (d1) = cDub (F,d1) .
  eq s (cDub (F,p:Pos)) = cDub (T,p) .
  eq s (cDub (T,p:Pos)) = cDub (F,s (p)) .
  eq addc (F,d1,p:Pos) = s (p) .
  eq addc (T,d1,p:Pos) = s (s (p)) .
  eq addc (F,p:Pos,d1) = s (p) .
  eq addc (T,p:Pos,d1) = s (s (p)) .
  ceq addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = cDub (b,addc (c,p,q)) if c == d .
  ceq addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = cDub (Xnot (b),addc (c,p,q)) if c =/= d .
  eq Int2Nat (cInt (n:Xnat)) = n .
  eq minus (d0) = cInt (d0) .
  eq minus (cNat (p:Pos)) = cNeg (p) .
  ceq minus2 (m:Xnat,n:Xnat) = cInt (gtesubt (m,n)) if ge (m,n) == T .
  ceq minus2 (m:Xnat,n:Xnat) = minus (gtesubt (n,m)) if ge (m,n) == F .
  eq Pos2Nat (p:Pos) = cNat (p) .
  eq Nat2Pos (cNat (p:Pos)) = p .
  eq eq (d0,d0) = T .
  eq eq (d0,cNat (p:Pos)) = F .
  eq eq (cNat (p:Pos),d0) = F .
  eq eq (cNat (p:Pos),cNat (q:Pos)) = eqPos (p,q) .
  eq le (d0,n:Xnat) = T .
  eq le (cNat (p:Pos),d0) = F .
  eq le (cNat (p:Pos),cNat (q:Pos)) = lePos (p,q) .
  eq lt (n:Xnat,d0) = F .
  eq lt (d0,cNat (p:Pos)) = T .
  eq lt (cNat (p:Pos),cNat (q:Pos)) = ltPos (p,q) .
  eq ge (m:Xnat,n:Xnat) = le (n,m) .
  eq gt (m:Xnat,n:Xnat) = lt (n,m) .
  eq pre (d1) = d0 .
  eq pre (cDub (T,p:Pos)) = cNat (cDub (F,p)) .
  eq pre (cDub (F,p:Pos)) = dub (T,pre (p)) .
  eq dub (F,d0) = d0 .
  eq dub (T,d0) = cNat (d1) .
  eq dub (b:Xbool,cNat (p:Pos)) = cNat (cDub (b,p)) .
  eq plus (d0,n:Xnat) = n .
  eq plus (n:Xnat,d0) = n .
  eq plus (cNat (p:Pos),cNat (q:Pos)) = cNat (addc (F,p,q)) .
  eq gtesubtPos (p:Pos,q:Pos) = gtesubtb (F,p,q) .
  eq gtesubt (n:Xnat,d0) = n .
  eq gtesubt (cNat (p:Pos),cNat (q:Pos)) = gtesubtPos (p,q) .
  eq gtesubtb (F,p:Pos,d1) = pre (p) .
  eq gtesubtb (T,p:Pos,d1) = pre (Nat2Pos (pre (p))) .
  ceq gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = dub (b,gtesubtb (b,p,q)) if c == d .
  ceq gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = dub (Xnot (b),gtesubtb (T,p,q)) if c =/= d and c == F .
  ceq gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) = dub (Xnot (b),gtesubtb (d,p,q)) if c =/= d and c == T .
  eq fib (d0) = d0 .
  eq fib (cNat (d1)) = cNat (d1) .
  eq fib (cNat (cDub (b:Xbool,p:Pos))) = plus (fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (d1)))),fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (cDub (F,d1)))))) .
}
select Fib32 .
red fib (Pos2Nat (cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,d1))))))) .
