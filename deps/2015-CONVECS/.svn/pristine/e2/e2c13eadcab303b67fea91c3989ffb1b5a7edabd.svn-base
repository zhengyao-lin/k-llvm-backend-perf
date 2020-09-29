-- CAFEOBJ-A
mod! Tak18 {
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
  eq gte (d0, d0) = Xtrue .
  eq gte (s (X:Xnat), d0) = Xtrue .
  eq gte (d0, s (X:Xnat)) = Xfalse .
  eq gte (s (X:Xnat), s (Y:Xnat)) = gte (X, Y) .
  eq gte-Int (Pos (X:Xnat), Pos (Y:Xnat)) = gte (X,Y) .
  eq gte-Int (Neg (X:Xnat), Neg (Y:Xnat)) = gte (Y,X) .
  eq gte-Int (Pos (X:Xnat), Neg (Y:Xnat)) = Xtrue .
  eq gte-Int (Neg (X:Xnat), Pos (Y:Xnat)) = Xfalse .
  eq pred (Pos (d0)) = Neg (d0) .
  eq pred (Pos (s (X:Xnat))) = Pos (X) .
  eq pred (Neg (X:Xnat)) = Neg (s (X)) .
  eq succ (Neg (d0)) = Pos (d0) .
  eq succ (Neg (s (X:Xnat))) = Neg (X) .
  eq succ (Pos (X:Xnat)) = Pos (s (X)) .
  ceq tak (I:Int, J:Int, K:Int) = K if gte-Int (J, I) == Xtrue .
  ceq tak (I:Int, J:Int, K:Int) = tak (tak (pred (I), J, K), tak (pred (J), K, I), tak (pred (K), I, J)) if gte-Int (J, I) == Xfalse .
}
select Tak18 .
red tak (Pos (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))), Pos (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))), Pos (s (s (s (s (s (s (d0)))))))) .
