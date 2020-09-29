-- CAFEOBJ-B
mod! Sieve1000 {
  [ Xbool List Xnat Digit ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op s : Xnat -> Xnat { constr }
  op z : -> Xnat { constr }
  op d0 : -> Digit { constr }
  op d1 : -> Digit { constr }
  op d2 : -> Digit { constr }
  op d3 : -> Digit { constr }
  op d4 : -> Digit { constr }
  op d5 : -> Digit { constr }
  op d6 : -> Digit { constr }
  op d7 : -> Digit { constr }
  op d8 : -> Digit { constr }
  op d9 : -> Digit { constr }
  op nil : -> List { constr }
  op d : Digit -> List { constr }
  op dl : Digit List -> List { constr }
  op l : Xnat List -> List { constr }
  op ll : List List -> List { constr }
  op lt : Xnat Xnat -> Xbool
  op sub : Xnat Xnat -> Xnat
  op div : Xnat Xnat -> Xnat
  op rem : Xnat Xnat -> Xnat
  op add : Xnat Xnat -> Xnat
  op divides : Xnat Xnat -> Xbool
  op mult : Xnat Xnat -> Xnat
  op two : -> Xnat
  op ten : -> Xnat
  op find : List Xnat -> Digit
  op digitList : -> List
  op ap : List List -> List
  op conv : Xnat -> List
  op digit : Xnat -> Digit
  op fact : Xnat -> Xnat
  op auxdiv : Xnat Xnat Xnat -> Xbool
  op ifNat : Xbool Xnat Xnat -> Xnat
  op intsBetween : Xnat Xnat -> List
  op sieve : List -> List
  op filter : List Xnat -> List
  op e : Xnat List -> List
  trans two => s (s (z)) .
  trans ten => s (s (s (s (s (s (s (s (s (s (z)))))))))) .
  trans digitList => dl (d0, dl (d1, dl (d2, dl (d3, dl (d4, dl (d5, dl (d6, dl (d7, dl (d8, dl (d9, nil)))))))))) .
  trans ifNat (Xtrue, N:Xnat, M:Xnat) => N .
  trans ifNat (Xfalse, N:Xnat, M:Xnat) => M .
  ctrans conv (X:Xnat) => dl (digit (X), nil) if lt (X, ten) == Xtrue .
  ctrans conv (X:Xnat) => ap (conv (div (X, ten)), conv (rem (X, ten))) if lt (X, ten) == Xfalse .
  ctrans rem (X:Xnat, Y:Xnat) => ifNat (lt (X, Y), X, rem (sub (X, Y), Y)) if Y =/= z .
  ctrans div (X:Xnat, Y:Xnat) => ifNat (lt (X, Y), z, s (div (sub (X, Y), Y))) if Y =/= z .
  trans lt (z, s (X:Xnat)) => Xtrue .
  trans lt (X:Xnat, z) => Xfalse .
  trans lt (s (X:Xnat), s (Y:Xnat)) => lt (X, Y) .
  trans sub (z, s (Y:Xnat)) => z .
  trans sub (X:Xnat, z) => X .
  trans sub (s (X:Xnat), s (Y:Xnat)) => sub (X, Y) .
  trans digit (X:Xnat) => find (digitList, X) .
  trans find (dl (Dig:Digit, L1:List), z) => Dig .
  trans find (dl (Dig:Digit, L1:List), s (X:Xnat)) => find (L1, X) .
  trans ap (nil, L1:List) => L1 .
  trans ap (dl (Dig:Digit, L1:List), L2:List) => dl (Dig, ap (L1, L2)) .
  trans add (z, Y:Xnat) => Y .
  trans add (s (X:Xnat), Y:Xnat) => s (add (X, Y)) .
  trans mult (z, Y:Xnat) => z .
  trans mult (s (X:Xnat), Y:Xnat) => add (Y, mult (X, Y)) .
  trans fact (z) => s (z) .
  trans fact (s (X:Xnat)) => mult (s (X), fact (X)) .
  ctrans divides (N:Xnat, M:Xnat) => auxdiv (N, M, M) if M =/= z .
  trans auxdiv (z, z, M:Xnat) => Xtrue .
  trans auxdiv (z, s (X:Xnat), M:Xnat) => Xfalse .
  trans auxdiv (s (X:Xnat), s (Y:Xnat), M:Xnat) => auxdiv (X, Y, M) .
  trans auxdiv (s (X:Xnat), z, M:Xnat) => auxdiv (s (X), M, M) .
  ctrans intsBetween (N:Xnat, M:Xnat) => nil if N == M .
  ctrans intsBetween (N:Xnat, M:Xnat) => l (N, intsBetween (s (N), M)) if N =/= M .
  trans sieve (l (N:Xnat, L1:List)) => l (N, sieve (filter (L1, N))) .
  trans sieve (nil) => nil .
  ctrans filter (l (N:Xnat, L1:List), M:Xnat) => filter (L1, M) if divides (N, M) == Xtrue .
  ctrans filter (l (N:Xnat, L1:List), M:Xnat) => l (N, filter (L1, M)) if divides (N, M) == Xfalse .
  trans filter (nil, M:Xnat) => nil .
  trans e (N:Xnat, L1:List) => ll (conv (N), L1) .
}
select Sieve1000 .
exec sieve (intsBetween (s (s (z)), mult (ten, mult (ten, ten)))) .
