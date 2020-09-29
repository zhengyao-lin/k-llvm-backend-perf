-- CAFEOBJ-A
mod! Langton7 {
  [ Xnat ]
  op d0 : -> Xnat { constr }
  op s : Xnat -> Xnat { constr }
  op d1 : -> Xnat
  op d2 : -> Xnat
  op d3 : -> Xnat
  op d4 : -> Xnat
  op d5 : -> Xnat
  op d6 : -> Xnat
  op d7 : -> Xnat
  op plus : Xnat Xnat -> Xnat
  op langton : Xnat Xnat Xnat Xnat Xnat -> Xnat
  op next : Xnat Xnat Xnat Xnat Xnat -> Xnat
  eq d1 = s (d0) .
  eq d2 = s (s (d0)) .
  eq d3 = s (s (s (d0))) .
  eq d4 = s (s (s (s (d0)))) .
  eq d5 = s (s (s (s (s (d0))))) .
  eq d6 = s (s (s (s (s (s (d0)))))) .
  eq d7 = s (s (s (s (s (s (s (d0))))))) .
  eq plus (X:Xnat, d0) = X .
  eq plus (s (X:Xnat), Y:Xnat) = s (plus (X,Y)) .
  eq plus (X:Xnat, s (Y:Xnat)) = s (plus (X,Y)) .
  eq langton (d0,s (d0),d0,d0,d0) = d2 .
  eq langton (d0,s (s (s (s (s (s (d0)))))),d0,d0,d0) = d3 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),d0,d0,d0) = d1 .
  eq langton (d0,X:Xnat,d0,d0,d0) = d0 .
  eq langton (d0,s (d0),d0,d0,s (d0)) = d2 .
  eq langton (d0,s (s (d0)),d0,d0,s (d0)) = d2 .
  eq langton (d0,s (s (s (d0))),d0,d0,s (d0)) = d2 .
  eq langton (d0,s (d0),d0,d0,s (s (d0))) = d2 .
  eq langton (d0,s (s (s (s (s (s (d0)))))),d0,d0,s (s (d0))) = d2 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),d0,d0,s (s (d0))) = d2 .
  eq langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (d0)))))) = d5 .
  eq langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (s (d0))))))) = d2 .
  eq langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (s (s (d0)))))))) = d2 .
  eq langton (d0,s (s (d0)),d0,s (d0),d0) = d2 .
  eq langton (d0,s (s (d0)),d0,s (s (d0)),s (d0)) = d5 .
  eq langton (d0,s (s (d0)),d0,s (s (d0)),s (s (s (d0)))) = d2 .
  eq langton (d0,s (s (d0)),d0,s (s (s (s (s (d0))))),s (s (d0))) = d2 .
  eq langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (d0)))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (d0))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (d0)))))) = d5 .
  eq langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (s (d0))))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d1 .
  eq langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (d0))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (d0)))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (s (d0))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (s (s (s (s (d0)))))))) = d1 .
  eq langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (s (s (s (s (d0)))))),s (s (d0))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (d0))) = d1 .
  eq langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (s (s (s (s (s (d0))))))),s (s (d0))) = d5 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (d0)))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (s (d0))))))) = d1 .
  eq langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (s (s (d0)))))))) = d1 .
  eq langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),d0,s (s (s (s (s (d0))))),s (s (d0))) = d1 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),d0,d0) = d7 .
  eq langton (d0,s (s (s (s (d0)))),s (d0),d0,s (s (d0))) = d4 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),d0,s (s (d0))) = d7 .
  eq langton (d0,s (s (s (s (d0)))),s (d0),s (d0),s (s (d0))) = d4 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (d0),s (s (d0))) = d7 .
  eq langton (d0,s (s (d0)),s (d0),s (s (d0)),d0) = d6 .
  eq langton (d0,s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) = d4 .
  eq langton (d0,s (s (s (s (s (s (d0)))))),s (d0),s (s (d0)),s (s (d0))) = d3 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) = d7 .
  eq langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (d0)))) = d7 .
  eq langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (d0))))) = d4 .
  eq langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) = d6 .
  eq langton (d0,s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) = d4 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) = d7 .
  eq langton (d0,s (d0),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d0 .
  eq langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d7 .
  eq langton (d0,s (s (d0)),s (d0),s (s (s (s (s (d0))))),s (s (s (s (d0))))) = d7 .
  eq langton (s (d0),s (s (s (s (d0)))),s (d0),s (d0),s (s (d0))) = d4 .
  eq langton (s (d0),s (s (s (s (s (s (s (d0))))))),s (d0),s (d0),s (s (d0))) = d7 .
  eq langton (s (d0),s (s (d0)),s (d0),s (d0),s (s (s (s (s (d0)))))) = d2 .
  eq langton (s (d0),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) = d4 .
  eq langton (s (d0),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) = d7 .
  eq langton (s (d0),s (s (d0)),s (d0),s (s (d0)),s (s (s (s (d0))))) = d4 .
  eq langton (s (d0),s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d7 .
  eq langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) = d4 .
  eq langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) = d7 .
  eq langton (s (s (d0)),s (s (s (d0))),s (d0),s (s (d0)),s (s (s (s (d0))))) = d4 .
  eq langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (s (s (s (d0)))))) = d7 .
  eq langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (s (d0))),s (s (d0))) = d4 .
  eq langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (s (d0))),s (s (d0))) = d7 .
  eq langton (s (s (d0)),s (s (s (s (s (d0))))),s (d0),s (s (s (s (d0)))),s (s (d0))) = d5 .
  eq langton (s (s (d0)),s (s (s (s (s (s (d0)))))),s (d0),s (s (s (s (d0)))),s (s (d0))) = d7 .
  eq langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (s (s (s (d0))))),s (s (d0))) = d5 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),d0,d0) = d1 .
  eq langton (d0,s (s (s (s (s (d0))))),s (s (d0)),d0,s (s (d0))) = d0 .
  eq langton (d0,s (s (d0)),s (s (d0)),d0,s (s (s (d0)))) = d6 .
  eq langton (d0,s (s (d0)),s (s (d0)),d0,s (s (s (s (d0))))) = d3 .
  eq langton (d0,s (d0),s (s (d0)),d0,s (s (s (s (s (d0)))))) = d7 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),d0,s (s (s (s (s (d0)))))) = d5 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0)),d0) = d3 .
  eq langton (d0,s (s (d0)),s (s (d0)),s (s (d0)),s (s (s (d0)))) = d1 .
  eq langton (d0,s (s (d0)),s (s (d0)),s (s (d0)),s (s (s (s (s (d0)))))) = d0 .
  eq langton (d0,s (d0),s (s (d0)),s (s (s (d0))),s (s (d0))) = d6 .
  eq langton (d0,s (s (d0)),s (s (d0)),s (s (s (d0))),s (s (d0))) = d6 .
  eq langton (d0,s (s (d0)),s (s (d0)),s (s (s (s (s (d0))))),s (s (s (s (s (d0)))))) = d1 .
  eq langton (d0,s (s (d0)),s (s (d0)),s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0)))))))) = d5 .
  eq langton (s (d0),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0),s (s (d0))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (d0))),d0,d0) = d2 .
  eq langton (d0,s (s (s (s (d0)))),s (s (s (d0))),d0,d0) = d1 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (s (d0))),d0,d0) = d6 .
  eq langton (d0,s (s (d0)),s (s (s (d0))),d0,s (s (s (s (d0))))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (d0))),d0,s (s (s (s (s (s (d0))))))) = d2 .
  eq langton (d0,s (s (d0)),s (s (s (d0))),s (d0),d0) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (d0))),s (d0),s (s (d0))) = d0 .
  eq langton (d0,s (d0),s (s (s (d0))),s (s (d0)),s (s (s (s (s (d0)))))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (d0),s (d0)) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0))) = d0 .
  eq langton (d0,s (s (s (s (s (d0))))),s (s (s (s (d0)))),s (d0),s (s (d0))) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (d0)) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (d0))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (s (d0)))) = d6 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (s (s (s (d0)))))) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (s (d0))),s (s (d0))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),d0,d0) = d2 .
  eq langton (d0,s (s (s (d0))),s (s (s (s (s (d0))))),d0,s (s (d0))) = d2 .
  eq langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (d0))))),d0,s (s (d0))) = d2 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),d0,s (s (s (s (s (d0)))))) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),d0) = d2 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) = d2 .
  eq langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) = d2 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) = d0 .
  eq langton (d0,s (s (s (s (d0)))),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) = d4 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d2 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) = d2 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) = d0 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (d0))))) = d2 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d2 .
  eq langton (d0,s (d0),s (s (s (s (s (s (d0)))))),d0,d0) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (d0)))))),d0,d0) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) = d0 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) = d5 .
  eq langton (s (d0),s (s (s (d0))),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) = d1 .
  eq langton (s (d0),s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (s (d0))) = d5 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (d0)) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0))) = d0 .
  eq langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0))) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (d0)) = d0 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0))) = d1 .
  eq langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (d0)))) = d1 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (s (s (d0)))))) = d5 .
  eq langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) = d0 .
  eq langton (V:Xnat, W:Xnat, X:Xnat, Y:Xnat, Z:Xnat) = X .
  eq next (V:Xnat,W:Xnat,Y:Xnat,Z:Xnat,s (X:Xnat)) = plus (langton (V,W,Y,Z,s (X)),next (V,W,Y,Z,X)) .
  eq next (V:Xnat,W:Xnat,Y:Xnat,s (X:Xnat),d0) = plus (langton (V,W,Y,s (X),d0),next (V,W,Y,X,d7)) .
  eq next (V:Xnat,W:Xnat,s (X:Xnat),d0,d0) = plus (langton (V,W,s (X),d0,d0),next (V,W,X,d7,d7)) .
  eq next (Y:Xnat,s (X:Xnat),d0,d0,d0) = plus (langton (Y,s (X),d0,d0,d0),next (Y,X,d7,d7,d7)) .
  eq next (s (X:Xnat),d0,d0,d0,d0) = plus (langton (s (X),d0,d0,d0,d0),next (X,d7,d7,d7,d7)) .
  eq next (d0,d0,d0,d0,d0) = langton (d0,d0,d0,d0,d0) .
}
select Langton7 .
red next (d7,d7,d7,d7,d7) .
