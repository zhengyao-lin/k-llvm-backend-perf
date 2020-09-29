-- CAFEOBJ-B
mod! OddEven {
  [ Xnat Xbool ]
  op Xtrue : -> Xbool { constr }
  op Xfalse : -> Xbool { constr }
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op odd : Xnat -> Xbool
  op even : Xnat -> Xbool
  trans odd (d0) => Xfalse .
  ctrans odd (s (N:Xnat)) => Xtrue if even (N) == Xtrue .
  ctrans odd (s (N:Xnat)) => Xfalse if even (N) == Xfalse .
  trans even (d0) => Xtrue .
  ctrans even (s (N:Xnat)) => Xtrue if odd (N) == Xtrue .
  ctrans even (s (N:Xnat)) => Xfalse if odd (N) == Xfalse .
}
select OddEven .
exec odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0)))))))))))))))) .
exec odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0))))))))))))))))))))) .
exec odd (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (d0)))))))))))))))))))))))))) .
