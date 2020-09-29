-- CAFEOBJ-A
mod! OddEven {
  [ Xnat Xbool ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op odd : Xnat -> Xbool
  op even : Xnat -> Xbool
  eq odd (d0) = Xfalse .
  ceq odd (s (N:Xnat)) = Xtrue if even (N) == Xtrue .
  ceq odd (s (N:Xnat)) = Xfalse if even (N) == Xfalse .
  eq even (d0) = Xtrue .
  ceq even (s (N:Xnat)) = Xtrue if odd (N) == Xtrue .
  ceq even (s (N:Xnat)) = Xfalse if odd (N) == Xfalse .
}
select OddEven .
red odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0)))))))))))))))) .
red odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))))) .
red odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0)))))))))))))))))))))))))) .
