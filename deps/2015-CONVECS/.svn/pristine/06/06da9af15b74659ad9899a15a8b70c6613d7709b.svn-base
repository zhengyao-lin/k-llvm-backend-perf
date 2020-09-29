-- CAFEOBJ-B
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
  trans eqBool (T,b:Xbool) => b .
  trans eqBool (F,T) => F .
  trans eqBool (F,F) => T .
  trans and (T,b:Xbool) => b .
  trans and (F,b:Xbool) => F .
  trans Xnot (T) => F .
  trans Xnot (F) => T .
  trans eqPos (d1,d1) => T .
  trans eqPos (d1,cDub (b:Xbool,p:Pos)) => F .
  trans eqPos (cDub (b:Xbool,p:Pos),d1) => F .
  trans eqPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => and (eqBool (b,c),eqPos (p,q)) .
  trans lePos (d1,p:Pos) => T .
  trans lePos (cDub (b:Xbool,p:Pos),d1) => F .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b == c .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b =/= c and b == F .
  ctrans lePos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b =/= c and b == T .
  trans ltPos (p:Pos,d1) => F .
  trans ltPos (d1,cDub (b:Xbool,p:Pos)) => T .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b == c .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => lePos (p,q) if b =/= c and b == F .
  ctrans ltPos (cDub (b:Xbool,p:Pos),cDub (c:Xbool,q:Pos)) => ltPos (p,q) if b =/= c and b == T .
  trans s (d1) => cDub (F,d1) .
  trans s (cDub (F,p:Pos)) => cDub (T,p) .
  trans s (cDub (T,p:Pos)) => cDub (F,s (p)) .
  trans addc (F,d1,p:Pos) => s (p) .
  trans addc (T,d1,p:Pos) => s (s (p)) .
  trans addc (F,p:Pos,d1) => s (p) .
  trans addc (T,p:Pos,d1) => s (s (p)) .
  ctrans addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => cDub (b,addc (c,p,q)) if c == d .
  ctrans addc (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => cDub (Xnot (b),addc (c,p,q)) if c =/= d .
  trans Int2Nat (cInt (n:Xnat)) => n .
  trans minus (d0) => cInt (d0) .
  trans minus (cNat (p:Pos)) => cNeg (p) .
  ctrans minus2 (m:Xnat,n:Xnat) => cInt (gtesubt (m,n)) if ge (m,n) == T .
  ctrans minus2 (m:Xnat,n:Xnat) => minus (gtesubt (n,m)) if ge (m,n) == F .
  trans Pos2Nat (p:Pos) => cNat (p) .
  trans Nat2Pos (cNat (p:Pos)) => p .
  trans eq (d0,d0) => T .
  trans eq (d0,cNat (p:Pos)) => F .
  trans eq (cNat (p:Pos),d0) => F .
  trans eq (cNat (p:Pos),cNat (q:Pos)) => eqPos (p,q) .
  trans le (d0,n:Xnat) => T .
  trans le (cNat (p:Pos),d0) => F .
  trans le (cNat (p:Pos),cNat (q:Pos)) => lePos (p,q) .
  trans lt (n:Xnat,d0) => F .
  trans lt (d0,cNat (p:Pos)) => T .
  trans lt (cNat (p:Pos),cNat (q:Pos)) => ltPos (p,q) .
  trans ge (m:Xnat,n:Xnat) => le (n,m) .
  trans gt (m:Xnat,n:Xnat) => lt (n,m) .
  trans pre (d1) => d0 .
  trans pre (cDub (T,p:Pos)) => cNat (cDub (F,p)) .
  trans pre (cDub (F,p:Pos)) => dub (T,pre (p)) .
  trans dub (F,d0) => d0 .
  trans dub (T,d0) => cNat (d1) .
  trans dub (b:Xbool,cNat (p:Pos)) => cNat (cDub (b,p)) .
  trans plus (d0,n:Xnat) => n .
  trans plus (n:Xnat,d0) => n .
  trans plus (cNat (p:Pos),cNat (q:Pos)) => cNat (addc (F,p,q)) .
  trans gtesubtPos (p:Pos,q:Pos) => gtesubtb (F,p,q) .
  trans gtesubt (n:Xnat,d0) => n .
  trans gtesubt (cNat (p:Pos),cNat (q:Pos)) => gtesubtPos (p,q) .
  trans gtesubtb (F,p:Pos,d1) => pre (p) .
  trans gtesubtb (T,p:Pos,d1) => pre (Nat2Pos (pre (p))) .
  ctrans gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => dub (b,gtesubtb (b,p,q)) if c == d .
  ctrans gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => dub (Xnot (b),gtesubtb (T,p,q)) if c =/= d and c == F .
  ctrans gtesubtb (b:Xbool,cDub (c:Xbool,p:Pos),cDub (d:Xbool,q:Pos)) => dub (Xnot (b),gtesubtb (d,p,q)) if c =/= d and c == T .
  trans fib (d0) => d0 .
  trans fib (cNat (d1)) => cNat (d1) .
  trans fib (cNat (cDub (b:Xbool,p:Pos))) => plus (fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (d1)))),fib (Int2Nat (minus2 (cNat (cDub (b,p)),Pos2Nat (cDub (F,d1)))))) .
}
select Fib32 .
exec fib (Pos2Nat (cDub (F,cDub (F,cDub (F,cDub (F,cDub (F,d1))))))) .
