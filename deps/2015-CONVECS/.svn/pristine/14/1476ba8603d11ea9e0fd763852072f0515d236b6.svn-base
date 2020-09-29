-- CAFEOBJ-A
mod! Sieve100 {
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
  eq two = s (s (z)) .
  eq ten = s (s (s (s (s (s (s (s (s (s (z)))))))))) .
  eq digitList = dl (d0, dl (d1, dl (d2, dl (d3, dl (d4, dl (d5, dl (d6, dl (d7, dl (d8, dl (d9, nil)))))))))) .
  eq ifNat (Xtrue, N:Xnat, M:Xnat) = N .
  eq ifNat (Xfalse, N:Xnat, M:Xnat) = M .
  ceq conv (X:Xnat) = dl (digit (X), nil) if lt (X, ten) == Xtrue .
  ceq conv (X:Xnat) = ap (conv (div (X, ten)), conv (rem (X, ten))) if lt (X, ten) == Xfalse .
  ceq rem (X:Xnat, Y:Xnat) = ifNat (lt (X, Y), X, rem (sub (X, Y), Y)) if Y =/= z .
  ceq div (X:Xnat, Y:Xnat) = ifNat (lt (X, Y), z, s (div (sub (X, Y), Y))) if Y =/= z .
  eq lt (z, s (X:Xnat)) = Xtrue .
  eq lt (X:Xnat, z) = Xfalse .
  eq lt (s (X:Xnat), s (Y:Xnat)) = lt (X, Y) .
  eq sub (z, s (Y:Xnat)) = z .
  eq sub (X:Xnat, z) = X .
  eq sub (s (X:Xnat), s (Y:Xnat)) = sub (X, Y) .
  eq digit (X:Xnat) = find (digitList, X) .
  eq find (dl (Dig:Digit, L1:List), z) = Dig .
  eq find (dl (Dig:Digit, L1:List), s (X:Xnat)) = find (L1, X) .
  eq ap (nil, L1:List) = L1 .
  eq ap (dl (Dig:Digit, L1:List), L2:List) = dl (Dig, ap (L1, L2)) .
  eq add (z, Y:Xnat) = Y .
  eq add (s (X:Xnat), Y:Xnat) = s (add (X, Y)) .
  eq mult (z, Y:Xnat) = z .
  eq mult (s (X:Xnat), Y:Xnat) = add (Y, mult (X, Y)) .
  eq fact (z) = s (z) .
  eq fact (s (X:Xnat)) = mult (s (X), fact (X)) .
  ceq divides (N:Xnat, M:Xnat) = auxdiv (N, M, M) if M =/= z .
  eq auxdiv (z, z, M:Xnat) = Xtrue .
  eq auxdiv (z, s (X:Xnat), M:Xnat) = Xfalse .
  eq auxdiv (s (X:Xnat), s (Y:Xnat), M:Xnat) = auxdiv (X, Y, M) .
  eq auxdiv (s (X:Xnat), z, M:Xnat) = auxdiv (s (X), M, M) .
  ceq intsBetween (N:Xnat, M:Xnat) = nil if N == M .
  ceq intsBetween (N:Xnat, M:Xnat) = l (N, intsBetween (s (N), M)) if N =/= M .
  eq sieve (l (N:Xnat, L1:List)) = l (N, sieve (filter (L1, N))) .
  eq sieve (nil) = nil .
  ceq filter (l (N:Xnat, L1:List), M:Xnat) = filter (L1, M) if divides (N, M) == Xtrue .
  ceq filter (l (N:Xnat, L1:List), M:Xnat) = l (N, filter (L1, M)) if divides (N, M) == Xfalse .
  eq filter (nil, M:Xnat) = nil .
  eq e (N:Xnat, L1:List) = ll (conv (N), L1) .
}
select Sieve100 .
red sieve (intsBetween (s (s (z)), mult (ten, ten))) .
