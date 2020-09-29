-- CAFEOBJ-A
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
  eq or (Xtrue, B:Boolean) = Xtrue .
  eq or (Xfalse, B:Boolean) = B .
  eq and (Xtrue, B:Boolean) = B .
  eq and (Xfalse, B:Boolean) = Xfalse .
  eq neg (Xfalse) = Xtrue .
  eq neg (Xtrue) = Xfalse .
  eq d0 = zero .
  eq d1 = s (d0) .
  eq d2 = s (d1) .
  eq d3 = s (d2) .
  eq d4 = s (d3) .
  eq d5 = s (d4) .
  eq d6 = s (d5) .
  eq d7 = s (d6) .
  eq d8 = s (d7) .
  eq d9 = s (d8) .
  eq d10 = s (d9) .
  eq d11 = s (d10) .
  eq d12 = s (d11) .
  eq d13 = s (d12) .
  eq d14 = s (d13) .
  eq d15 = s (d14) .
  eq d16 = s (d15) .
  eq d17 = s (d16) .
  eq one = exs (exz) .
  eq two = exs (one) .
  eq three = exs (two) .
  eq four = exs (three) .
  eq five = exs (four) .
  eq six = exs (five) .
  eq seven = exs (six) .
  eq eight = exs (seven) .
  eq nine = exs (eight) .
  eq ten = exs (nine) .
  eq eleven = exs (ten) .
  eq twelve = exs (eleven) .
  eq thirteen = exs (twelve) .
  eq fourteen = exs (thirteen) .
  eq fifteen = exs (fourteen) .
  eq sixteen = exs (fifteen) .
  eq seventeen = exs (sixteen) .
  eq eighteen = exs (seventeen) .
  eq nineteen = exs (eighteen) .
  eq twenty = exs (nineteen) .
  eq twentyone = exs (twenty) .
  eq twentytwo = exs (twentyone) .
  eq twentythree = exs (twentytwo) .
  eq twentyfour = exs (twentythree) .
  eq twentyfive = exs (twentyfour) .
  eq twentysix = exs (twentyfive) .
  eq twentyseven = exs (twentysix) .
  eq twentyeight = exs (twentyseven) .
  eq twentynine = exs (twentyeight) .
  eq thirty = exs (twentynine) .
  eq thirtyone = exs (thirty) .
  eq thirtytwo = exs (thirtyone) .
  eq thirtythree = exs (thirtytwo) .
  eq thirtyfour = exs (thirtythree) .
  eq thirtyfive = exs (thirtyfour) .
  eq dec (exexp (Xs:SNat,exz)) = exs (exz) .
  eq dec (exexp (Xs:SNat,exs (Ys:SNat))) = exmult (exexp (Xs,Ys),Xs) .
  eq dec (exexp (Xs:SNat,explus (Ys:SNat,Zs:SNat))) = exmult (exexp (Xs,Ys),exexp (Xs,Zs)) .
  eq dec (exexp (Xs:SNat,exmult (Ys:SNat,Zs:SNat))) = dec (exexp (exexp (Xs,Ys),Zs)) .
  eq dec (exexp (Xs:SNat,exexp (Ys:SNat,Zs:SNat))) = dec (exexp (Xs, dec (exexp (Ys,Zs)))) .
  eq benchevalsym17 (Xs:SNat) = equal (eval17 (exexp (two, Xs)), evalsym17 (exexp (two, Xs))) .
  eq benchevalexp17 (Xs:SNat) = equal (eval17 (exexp (two, Xs)), evalexp17 (exexp (two, Xs))) .
  eq benchevaltree17 (Xs:SNat) = equal (calctree17 (eval (Xs)), getval (buildtree (eval (Xs), zero))) .
  eq equal (zero, zero) = Xtrue .
  eq equal (zero, s (X:Xnat)) = Xfalse .
  eq equal (s (X:Xnat), zero) = Xfalse .
  eq equal (s (X:Xnat), s (Y:Xnat)) = equal (X, Y) .
  eq less (zero, Y:Xnat) = Xtrue .
  eq less (s (X:Xnat), s (Y:Xnat)) = less (X, Y) .
  eq less (s (X:Xnat), zero) = Xfalse .
  eq plus (X:Xnat, zero) = X .
  eq plus (X:Xnat, s (Y:Xnat)) = s (plus (X, Y)) .
  eq mult (X:Xnat, zero) = zero .
  eq mult (X:Xnat, s (Y:Xnat)) = plus (mult (X, Y), X) .
  eq exp (X:Xnat, zero) = s (zero) .
  eq exp (X:Xnat, s (Y:Xnat)) = mult (X, exp (X, Y)) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))))) = zero .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) = s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))) = s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))) = s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))) = s (s (s (s (s (s (s (s (s (s (s (s (s (zero))))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))) = s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (s (zero))))))))))) = s (s (s (s (s (s (s (s (s (s (s (zero))))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (s (zero)))))))))) = s (s (s (s (s (s (s (s (s (s (zero)))))))))) .
  eq succ17 (s (s (s (s (s (s (s (s (zero))))))))) = s (s (s (s (s (s (s (s (s (zero))))))))) .
  eq succ17 (s (s (s (s (s (s (s (zero)))))))) = s (s (s (s (s (s (s (s (zero)))))))) .
  eq succ17 (s (s (s (s (s (s (zero))))))) = s (s (s (s (s (s (s (zero))))))) .
  eq succ17 (s (s (s (s (s (zero)))))) = s (s (s (s (s (s (zero)))))) .
  eq succ17 (s (s (s (s (zero))))) = s (s (s (s (s (zero))))) .
  eq succ17 (s (s (s (zero)))) = s (s (s (s (zero)))) .
  eq succ17 (s (s (zero))) = s (s (s (zero))) .
  eq succ17 (s (zero)) = s (s (zero)) .
  eq succ17 (zero) = s (zero) .
  eq pred17 (s (X:Xnat)) = X .
  eq pred17 (zero) = s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero)))))))))))))))) .
  eq plus17 (X:Xnat, zero) = X .
  eq plus17 (X:Xnat, s (Y:Xnat)) = succ17 (plus17 (X, Y)) .
  eq mult17 (X:Xnat, zero) = zero .
  eq mult17 (X:Xnat, s (Y:Xnat)) = plus17 (X, mult17 (X, Y)) .
  eq exp17 (X:Xnat, zero) = succ17 (zero) .
  eq exp17 (X:Xnat, s (Y:Xnat)) = mult17 (X, exp17 (X, Y)) .
  eq eval (exz) = zero .
  eq eval (exs (Xs:SNat)) = s (eval (Xs)) .
  eq eval (explus (Xs:SNat, Ys:SNat)) = plus (eval (Xs), eval (Ys)) .
  eq eval (exmult (Xs:SNat, Ys:SNat)) = mult (eval (Xs), eval (Ys)) .
  eq eval (exexp (Xs:SNat, Ys:SNat)) = exp (eval (Xs), eval (Ys)) .
  eq eval17 (exz) = zero .
  eq eval17 (exone) = s (zero) .
  eq eval17 (exs (Xs:SNat)) = succ17 (eval17 (Xs)) .
  eq eval17 (explus (Xs:SNat, Ys:SNat)) = plus17 (eval17 (Xs), eval17 (Ys)) .
  eq eval17 (exmult (Xs:SNat, Ys:SNat)) = mult17 (eval17 (Xs), eval17 (Ys)) .
  eq eval17 (exexp (Xs:SNat, Ys:SNat)) = exp17 (eval17 (Xs), eval (Ys)) .
  eq evalsym17 (exz) = zero .
  eq evalsym17 (exs (Xs:SNat)) = succ17 (evalsym17 (Xs)) .
  eq evalsym17 (explus (Xs:SNat, Ys:SNat)) = plus17 (evalsym17 (Xs), evalsym17 (Ys)) .
  eq evalsym17 (exmult (Xs:SNat, exz)) = zero .
  eq evalsym17 (exmult (Xs:SNat, exs (Ys:SNat))) = evalsym17 (explus (exmult (Xs, Ys), Xs)) .
  eq evalsym17 (exmult (Xs:SNat, explus (Ys:SNat, Zs:SNat))) = evalsym17 (explus (exmult (Xs, Ys), exmult (Xs, Zs))) .
  eq evalsym17 (exmult (Xs:SNat, exmult (Ys:SNat, Zs:SNat))) = evalsym17 (exmult (exmult (Xs, Ys), Zs)) .
  eq evalsym17 (exmult (Xs:SNat, exexp (Ys:SNat, Zs:SNat))) = evalsym17 (exmult (Xs, dec (exexp (Ys, Zs)))) .
  eq evalsym17 (exexp (Xs:SNat, exz)) = succ17 (zero) .
  eq evalsym17 (exexp (Xs:SNat, exs (Ys:SNat))) = evalsym17 (exmult (exexp (Xs, Ys), Xs)) .
  eq evalsym17 (exexp (Xs:SNat, explus (Ys:SNat, Zs:SNat))) = evalsym17 (exmult (exexp (Xs, Ys), exexp (Xs, Zs))) .
  eq evalsym17 (exexp (Xs:SNat, exmult (Ys:SNat, Zs:SNat))) = evalsym17 (exexp (exexp (Xs, Ys), Zs)) .
  eq evalsym17 (exexp (Xs:SNat, exexp (Ys:SNat, Zs:SNat))) = evalsym17 (exexp (Xs, dec (exexp (Ys, Zs)))) .
  eq evalexp17 (Xs:SNat) = eval17 (expand (Xs)) .
  eq getval (leaf (Val:Xnat)) = Val .
  eq getval (node (Val:Xnat, Max:Xnat, Left:Tree, Right:Tree)) = Val .
  eq getmax (leaf (Val:Xnat)) = Val .
  eq getmax (node (Val:Xnat, Max:Xnat, Left:Tree, Right:Tree)) = Max .
  eq calctree17 (X:Xnat) = mult17 (exp17 (s (s (zero)), pred17 (X)), pred17 (exp17 (s (s (zero)), X))) .
  eq nat2sym (zero) = exz .
  eq nat2sym (s (X:Xnat)) = exs (nat2sym (X)) .
  eq expand (exz) = exz .
  eq expand (exone) = exone .
  eq expand (exs (Xs:SNat)) = explus (exone, expand (Xs)) .
  eq expand (explus (Xs:SNat, Ys:SNat)) = explus (expand (Xs), expand (Ys)) .
  eq expand (exmult (Xs:SNat, exz)) = exz .
  eq expand (exmult (Xs:SNat, exone)) = expand (Xs) .
  eq expand (exmult (Xs:SNat, explus (Ys:SNat, Zs:SNat))) = expand (explus (exmult (Xs, Ys), exmult (Xs, Zs))) .
  eq expand (exmult (Xs:SNat, exs (Ys:SNat))) = expand (exmult (Xs, expand (exs (Ys)))) .
  eq expand (exmult (Xs:SNat, exmult (Ys:SNat,Zs:SNat))) = expand (exmult (Xs, expand (exmult (Ys,Zs)))) .
  eq expand (exmult (Xs:SNat, exexp (Ys:SNat,Zs:SNat))) = expand (exmult (Xs, expand (exexp (Ys,Zs)))) .
  eq expand (exexp (Xs:SNat, exz)) = exone .
  eq expand (exexp (Xs:SNat, exone)) = expand (Xs) .
  eq expand (exexp (Xs:SNat, explus (Ys:SNat, Zs:SNat))) = expand (exmult (exexp (Xs, Ys), exexp (Xs, Zs))) .
  eq expand (exexp (Xs:SNat, exs (Ys:SNat))) = expand (exexp (Xs, expand (exs (Ys)))) .
  eq expand (exexp (Xs:SNat, exmult (Ys:SNat,Zs:SNat))) = expand (exexp (Xs, expand (exmult (Ys,Zs)))) .
  eq expand (exexp (Xs:SNat, exexp (Ys:SNat,Zs:SNat))) = expand (exexp (Xs, expand (exexp (Ys,Zs)))) .
  eq buildtree (zero, Val:Xnat) = leaf (Val) .
  eq buildtree (s (X:Xnat), Y:Xnat) = node (plus17 (getval (buildtree (X, Y)),getval (buildtree (X, succ17 (getmax (buildtree (X, Y)))))), getmax (buildtree (X, succ17 (getmax (buildtree (X, Y))))), buildtree (X, Y),buildtree (X, succ17 (getmax (buildtree (X, Y))))) .
}
select BenchExpr10 .
red benchevalexp17 (ten) .
