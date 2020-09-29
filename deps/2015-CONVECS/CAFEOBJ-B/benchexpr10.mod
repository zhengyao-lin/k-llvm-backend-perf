-- CAFEOBJ-B
mod! BenchExpr10 {
  [ Xnat SNat Tree Boolean ]
  op Xtrue : -> Boolean { constr }
  op Xfalse : -> Boolean { constr }
  op zero : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op exz : -> SNat { constr }
  op exone : -> SNat { constr }
  op exs : SNat -> SNat { constr }
  op explus : SNat SNat -> SNat { constr }
  op exmult : SNat SNat -> SNat { constr }
  op exexp : SNat SNat -> SNat { constr }
  op leaf : Xnat -> Tree { constr }
  op node : Xnat Xnat Tree Tree -> Tree { constr }
  op or : Boolean Boolean -> Boolean
  op and : Boolean Boolean -> Boolean
  op neg : Boolean -> Boolean
  op equal : Xnat Xnat -> Boolean
  op less : Xnat Xnat -> Boolean
  op plus : Xnat Xnat -> Xnat
  op mult : Xnat Xnat -> Xnat
  op exp : Xnat Xnat -> Xnat
  op succ17 : Xnat -> Xnat
  op pred17 : Xnat -> Xnat
  op plus17 : Xnat Xnat -> Xnat
  op mult17 : Xnat Xnat -> Xnat
  op exp17 : Xnat Xnat -> Xnat
  op buildtree : Xnat Xnat -> Tree
  op calctree17 : Xnat -> Xnat
  op getmax : Tree -> Xnat
  op getval : Tree -> Xnat
  op eval : SNat -> Xnat
  op eval17 : SNat -> Xnat
  op evalsym17 : SNat -> Xnat
  op evalexp17 : SNat -> Xnat
  op benchevalsym17 : SNat -> Boolean
  op benchevalexp17 : SNat -> Boolean
  op benchevaltree17 : SNat -> Boolean
  op one : -> SNat
  op two : -> SNat
  op three : -> SNat
  op four : -> SNat
  op five : -> SNat
  op six : -> SNat
  op seven : -> SNat
  op eight : -> SNat
  op nine : -> SNat
  op ten : -> SNat
  op eleven : -> SNat
  op twelve : -> SNat
  op thirteen : -> SNat
  op fourteen : -> SNat
  op fifteen : -> SNat
  op sixteen : -> SNat
  op seventeen : -> SNat
  op eighteen : -> SNat
  op nineteen : -> SNat
  op twenty : -> SNat
  op twentyone : -> SNat
  op twentytwo : -> SNat
  op twentythree : -> SNat
  op twentyfour : -> SNat
  op twentyfive : -> SNat
  op twentysix : -> SNat
  op twentyseven : -> SNat
  op twentyeight : -> SNat
  op twentynine : -> SNat
  op thirty : -> SNat
  op thirtyone : -> SNat
  op thirtytwo : -> SNat
  op thirtythree : -> SNat
  op thirtyfour : -> SNat
  op thirtyfive : -> SNat
  op dec : SNat -> SNat
  op d0 : -> Xnat
  op d1 : -> Xnat
  op d2 : -> Xnat
  op d3 : -> Xnat
  op d4 : -> Xnat
  op d5 : -> Xnat
  op d6 : -> Xnat
  op d7 : -> Xnat
  op d8 : -> Xnat
  op d9 : -> Xnat
  op d10 : -> Xnat
  op d11 : -> Xnat
  op d12 : -> Xnat
  op d13 : -> Xnat
  op d14 : -> Xnat
  op d15 : -> Xnat
  op d16 : -> Xnat
  op d17 : -> Xnat
  op expand : SNat -> SNat
  op nat2sym : Xnat -> SNat
  trans or (Xtrue, B:Boolean) => Xtrue .
  trans or (Xfalse, B:Boolean) => B .
  trans and (Xtrue, B:Boolean) => B .
  trans and (Xfalse, B:Boolean) => Xfalse .
  trans neg (Xfalse) => Xtrue .
  trans neg (Xtrue) => Xfalse .
  trans d0 => zero .
  trans d1 => s (d0) .
  trans d2 => s (d1) .
  trans d3 => s (d2) .
  trans d4 => s (d3) .
  trans d5 => s (d4) .
  trans d6 => s (d5) .
  trans d7 => s (d6) .
  trans d8 => s (d7) .
  trans d9 => s (d8) .
  trans d10 => s (d9) .
  trans d11 => s (d10) .
  trans d12 => s (d11) .
  trans d13 => s (d12) .
  trans d14 => s (d13) .
  trans d15 => s (d14) .
  trans d16 => s (d15) .
  trans d17 => s (d16) .
  trans one => exs (exz) .
  trans two => exs (one) .
  trans three => exs (two) .
  trans four => exs (three) .
  trans five => exs (four) .
  trans six => exs (five) .
  trans seven => exs (six) .
  trans eight => exs (seven) .
  trans nine => exs (eight) .
  trans ten => exs (nine) .
  trans eleven => exs (ten) .
  trans twelve => exs (eleven) .
  trans thirteen => exs (twelve) .
  trans fourteen => exs (thirteen) .
  trans fifteen => exs (fourteen) .
  trans sixteen => exs (fifteen) .
  trans seventeen => exs (sixteen) .
  trans eighteen => exs (seventeen) .
  trans nineteen => exs (eighteen) .
  trans twenty => exs (nineteen) .
  trans twentyone => exs (twenty) .
  trans twentytwo => exs (twentyone) .
  trans twentythree => exs (twentytwo) .
  trans twentyfour => exs (twentythree) .
  trans twentyfive => exs (twentyfour) .
  trans twentysix => exs (twentyfive) .
  trans twentyseven => exs (twentysix) .
  trans twentyeight => exs (twentyseven) .
  trans twentynine => exs (twentyeight) .
  trans thirty => exs (twentynine) .
  trans thirtyone => exs (thirty) .
  trans thirtytwo => exs (thirtyone) .
  trans thirtythree => exs (thirtytwo) .
  trans thirtyfour => exs (thirtythree) .
  trans thirtyfive => exs (thirtyfour) .
  trans dec (exexp (Xs:SNat,exz)) => exs (exz) .
  trans dec (exexp (Xs:SNat,exs (Ys:SNat))) => exmult (exexp (Xs,Ys),Xs) .
  trans dec (exexp (Xs:SNat,explus (Ys:SNat,Zs:SNat))) => exmult (exexp (Xs,Ys),exexp (Xs,Zs)) .
  trans dec (exexp (Xs:SNat,exmult (Ys:SNat,Zs:SNat))) => dec (exexp (exexp (Xs,Ys),Zs)) .
  trans dec (exexp (Xs:SNat,exexp (Ys:SNat,Zs:SNat))) => dec (exexp (Xs, dec (exexp (Ys,Zs)))) .
  trans benchevalsym17 (Xs:SNat) => equal (eval17 (exexp (two, Xs)), evalsym17 (exexp (two, Xs))) .
  trans benchevalexp17 (Xs:SNat) => equal (eval17 (exexp (two, Xs)), evalexp17 (exexp (two, Xs))) .
  trans benchevaltree17 (Xs:SNat) => equal (calctree17 (eval (Xs)), getval (buildtree (eval (Xs), zero))) .
  trans equal (zero, zero) => Xtrue .
  trans equal (zero, s (X:Xnat)) => Xfalse .
  trans equal (s (X:Xnat), zero) => Xfalse .
  trans equal (s (X:Xnat), s (Y:Xnat)) => equal (X, Y) .
  trans less (zero, Y:Xnat) => Xtrue .
  trans less (s (X:Xnat), s (Y:Xnat)) => less (X, Y) .
  trans less (s (X:Xnat), zero) => Xfalse .
  trans plus (X:Xnat, zero) => X .
  trans plus (X:Xnat, s (Y:Xnat)) => s (plus (X, Y)) .
  trans mult (X:Xnat, zero) => zero .
  trans mult (X:Xnat, s (Y:Xnat)) => plus (mult (X, Y), X) .
  trans exp (X:Xnat, zero) => s (zero) .
  trans exp (X:Xnat, s (Y:Xnat)) => mult (X, exp (X, Y)) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))))) => zero .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) => s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))) => s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))) => s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))) => s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))) => s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (s (zero))))))))))) => s (s (s (s (s (s (s (s (s (s (s (zero))))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (s (zero)))))))))) => s (s (s (s (s (s (s (s (s (s (zero)))))))))) .
  trans succ17 (s (s (s (s (s (s (s (s (zero))))))))) => s (s (s (s (s (s (s (s (s (zero))))))))) .
  trans succ17 (s (s (s (s (s (s (s (zero)))))))) => s (s (s (s (s (s (s (s (zero)))))))) .
  trans succ17 (s (s (s (s (s (s (zero))))))) => s (s (s (s (s (s (s (zero))))))) .
  trans succ17 (s (s (s (s (s (zero)))))) => s (s (s (s (s (s (zero)))))) .
  trans succ17 (s (s (s (s (zero))))) => s (s (s (s (s (zero))))) .
  trans succ17 (s (s (s (zero)))) => s (s (s (s (zero)))) .
  trans succ17 (s (s (zero))) => s (s (s (zero))) .
  trans succ17 (s (zero)) => s (s (zero)) .
  trans succ17 (zero) => s (zero) .
  trans pred17 (s (X:Xnat)) => X .
  trans pred17 (zero) => s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) .
  trans plus17 (X:Xnat, zero) => X .
  trans plus17 (X:Xnat, s (Y:Xnat)) => succ17 (plus17 (X, Y)) .
  trans mult17 (X:Xnat, zero) => zero .
  trans mult17 (X:Xnat, s (Y:Xnat)) => plus17 (X, mult17 (X, Y)) .
  trans exp17 (X:Xnat, zero) => succ17 (zero) .
  trans exp17 (X:Xnat, s (Y:Xnat)) => mult17 (X, exp17 (X, Y)) .
  trans eval (exz) => zero .
  trans eval (exs (Xs:SNat)) => s (eval (Xs)) .
  trans eval (explus (Xs:SNat, Ys:SNat)) => plus (eval (Xs), eval (Ys)) .
  trans eval (exmult (Xs:SNat, Ys:SNat)) => mult (eval (Xs), eval (Ys)) .
  trans eval (exexp (Xs:SNat, Ys:SNat)) => exp (eval (Xs), eval (Ys)) .
  trans eval17 (exz) => zero .
  trans eval17 (exone) => s (zero) .
  trans eval17 (exs (Xs:SNat)) => succ17 (eval17 (Xs)) .
  trans eval17 (explus (Xs:SNat, Ys:SNat)) => plus17 (eval17 (Xs), eval17 (Ys)) .
  trans eval17 (exmult (Xs:SNat, Ys:SNat)) => mult17 (eval17 (Xs), eval17 (Ys)) .
  trans eval17 (exexp (Xs:SNat, Ys:SNat)) => exp17 (eval17 (Xs), eval (Ys)) .
  trans evalsym17 (exz) => zero .
  trans evalsym17 (exs (Xs:SNat)) => succ17 (evalsym17 (Xs)) .
  trans evalsym17 (explus (Xs:SNat, Ys:SNat)) => plus17 (evalsym17 (Xs), evalsym17 (Ys)) .
  trans evalsym17 (exmult (Xs:SNat, exz)) => zero .
  trans evalsym17 (exmult (Xs:SNat, exs (Ys:SNat))) => evalsym17 (explus (exmult (Xs, Ys), Xs)) .
  trans evalsym17 (exmult (Xs:SNat, explus (Ys:SNat, Zs:SNat))) => evalsym17 (explus (exmult (Xs, Ys), exmult (Xs, Zs))) .
  trans evalsym17 (exmult (Xs:SNat, exmult (Ys:SNat, Zs:SNat))) => evalsym17 (exmult (exmult (Xs, Ys), Zs)) .
  trans evalsym17 (exmult (Xs:SNat, exexp (Ys:SNat, Zs:SNat))) => evalsym17 (exmult (Xs, dec (exexp (Ys, Zs)))) .
  trans evalsym17 (exexp (Xs:SNat, exz)) => succ17 (zero) .
  trans evalsym17 (exexp (Xs:SNat, exs (Ys:SNat))) => evalsym17 (exmult (exexp (Xs, Ys), Xs)) .
  trans evalsym17 (exexp (Xs:SNat, explus (Ys:SNat, Zs:SNat))) => evalsym17 (exmult (exexp (Xs, Ys), exexp (Xs, Zs))) .
  trans evalsym17 (exexp (Xs:SNat, exmult (Ys:SNat, Zs:SNat))) => evalsym17 (exexp (exexp (Xs, Ys), Zs)) .
  trans evalsym17 (exexp (Xs:SNat, exexp (Ys:SNat, Zs:SNat))) => evalsym17 (exexp (Xs, dec (exexp (Ys, Zs)))) .
  trans evalexp17 (Xs:SNat) => eval17 (expand (Xs)) .
  trans getval (leaf (Val:Xnat)) => Val .
  trans getval (node (Val:Xnat, Max:Xnat, Left:Tree, Right:Tree)) => Val .
  trans getmax (leaf (Val:Xnat)) => Val .
  trans getmax (node (Val:Xnat, Max:Xnat, Left:Tree, Right:Tree)) => Max .
  trans calctree17 (X:Xnat) => mult17 (exp17 (s (s (zero)), pred17 (X)), pred17 (exp17 (s (s (zero)), X))) .
  trans nat2sym (zero) => exz .
  trans nat2sym (s (X:Xnat)) => exs (nat2sym (X)) .
  trans expand (exz) => exz .
  trans expand (exone) => exone .
  trans expand (exs (Xs:SNat)) => explus (exone, expand (Xs)) .
  trans expand (explus (Xs:SNat, Ys:SNat)) => explus (expand (Xs), expand (Ys)) .
  trans expand (exmult (Xs:SNat, exz)) => exz .
  trans expand (exmult (Xs:SNat, exone)) => expand (Xs) .
  trans expand (exmult (Xs:SNat, explus (Ys:SNat, Zs:SNat))) => expand (explus (exmult (Xs, Ys), exmult (Xs, Zs))) .
  trans expand (exmult (Xs:SNat, exs (Ys:SNat))) => expand (exmult (Xs, expand (exs (Ys)))) .
  trans expand (exmult (Xs:SNat, exmult (Ys:SNat,Zs:SNat))) => expand (exmult (Xs, expand (exmult (Ys,Zs)))) .
  trans expand (exmult (Xs:SNat, exexp (Ys:SNat,Zs:SNat))) => expand (exmult (Xs, expand (exexp (Ys,Zs)))) .
  trans expand (exexp (Xs:SNat, exz)) => exone .
  trans expand (exexp (Xs:SNat, exone)) => expand (Xs) .
  trans expand (exexp (Xs:SNat, explus (Ys:SNat, Zs:SNat))) => expand (exmult (exexp (Xs, Ys), exexp (Xs, Zs))) .
  trans expand (exexp (Xs:SNat, exs (Ys:SNat))) => expand (exexp (Xs, expand (exs (Ys)))) .
  trans expand (exexp (Xs:SNat, exmult (Ys:SNat,Zs:SNat))) => expand (exexp (Xs, expand (exmult (Ys,Zs)))) .
  trans expand (exexp (Xs:SNat, exexp (Ys:SNat,Zs:SNat))) => expand (exexp (Xs, expand (exexp (Ys,Zs)))) .
  trans buildtree (zero, Val:Xnat) => leaf (Val) .
  trans buildtree (s (X:Xnat), Y:Xnat) => node (plus17 (getval (buildtree (X, Y)),getval (buildtree (X, succ17 (getmax (buildtree (X, Y)))))), getmax (buildtree (X, succ17 (getmax (buildtree (X, Y))))), buildtree (X, Y),buildtree (X, succ17 (getmax (buildtree (X, Y))))) .
}
select BenchExpr10 .
exec benchevalexp17 (ten) .
