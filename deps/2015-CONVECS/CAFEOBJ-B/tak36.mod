-- CAFEOBJ-B
mod! Tak36 {
  [ Xbool Xnat Int ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op Pos : Xnat -> Int { constr }
  op Neg : Xnat -> Int { constr }
  op gte : Xnat Xnat -> Xbool
  op gte-Int : Int Int -> Xbool
  op pred : Int -> Int
  op succ : Int -> Int
  op tak : Int Int Int -> Int
  trans gte (d0, d0) => Xtrue .
  trans gte (s (X:Xnat), d0) => Xtrue .
  trans gte (d0, s (X:Xnat)) => Xfalse .
  trans gte (s (X:Xnat), s (Y:Xnat)) => gte (X, Y) .
  trans gte-Int (Pos (X:Xnat), Pos (Y:Xnat)) => gte (X,Y) .
  trans gte-Int (Neg (X:Xnat), Neg (Y:Xnat)) => gte (Y,X) .
  trans gte-Int (Pos (X:Xnat), Neg (Y:Xnat)) => Xtrue .
  trans gte-Int (Neg (X:Xnat), Pos (Y:Xnat)) => Xfalse .
  trans pred (Pos (d0)) => Neg (d0) .
  trans pred (Pos (s (X:Xnat))) => Pos (X) .
  trans pred (Neg (X:Xnat)) => Neg (s (X)) .
  trans succ (Neg (d0)) => Pos (d0) .
  trans succ (Neg (s (X:Xnat))) => Neg (X) .
  trans succ (Pos (X:Xnat)) => Pos (s (X)) .
  ctrans tak (I:Int, J:Int, K:Int) => K if gte-Int (J, I) == Xtrue .
  ctrans tak (I:Int, J:Int, K:Int) => tak (tak (pred (I), J, K), tak (pred (J), K, I), tak (pred (K), I, J)) if gte-Int (J, I) == Xfalse .
}
select Tak36 .
exec tak (Pos (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))))))))))))))))))))), Pos (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))), Pos (s (s (s (s (s (s (s (s (s (s (s (s (d0)))))))))))))) .
