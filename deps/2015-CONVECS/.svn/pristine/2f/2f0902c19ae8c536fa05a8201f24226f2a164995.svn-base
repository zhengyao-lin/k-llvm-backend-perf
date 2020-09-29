-- CAFEOBJ-B
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
  trans d1 => s (d0) .
  trans d2 => s (s (d0)) .
  trans d3 => s (s (s (d0))) .
  trans d4 => s (s (s (s (d0)))) .
  trans d5 => s (s (s (s (s (d0))))) .
  trans d6 => s (s (s (s (s (s (d0)))))) .
  trans d7 => s (s (s (s (s (s (s (d0))))))) .
  trans plus (X:Xnat, d0) => X .
  trans plus (s (X:Xnat), Y:Xnat) => s (plus (X,Y)) .
  trans plus (X:Xnat, s (Y:Xnat)) => s (plus (X,Y)) .
  trans langton (d0,s (d0),d0,d0,d0) => d2 .
  trans langton (d0,s (s (s (s (s (s (d0)))))),d0,d0,d0) => d3 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),d0,d0,d0) => d1 .
  trans langton (d0,X:Xnat,d0,d0,d0) => d0 .
  trans langton (d0,s (d0),d0,d0,s (d0)) => d2 .
  trans langton (d0,s (s (d0)),d0,d0,s (d0)) => d2 .
  trans langton (d0,s (s (s (d0))),d0,d0,s (d0)) => d2 .
  trans langton (d0,s (d0),d0,d0,s (s (d0))) => d2 .
  trans langton (d0,s (s (s (s (s (s (d0)))))),d0,d0,s (s (d0))) => d2 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),d0,d0,s (s (d0))) => d2 .
  trans langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (d0)))))) => d5 .
  trans langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (s (d0))))))) => d2 .
  trans langton (d0,s (s (d0)),d0,d0,s (s (s (s (s (s (s (d0)))))))) => d2 .
  trans langton (d0,s (s (d0)),d0,s (d0),d0) => d2 .
  trans langton (d0,s (s (d0)),d0,s (s (d0)),s (d0)) => d5 .
  trans langton (d0,s (s (d0)),d0,s (s (d0)),s (s (s (d0)))) => d2 .
  trans langton (d0,s (s (d0)),d0,s (s (s (s (s (d0))))),s (s (d0))) => d2 .
  trans langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (d0)))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (d0))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (d0)))))) => d5 .
  trans langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (s (d0))))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d1 .
  trans langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (d0))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (d0)))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (s (d0))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (d0)))),s (s (s (s (s (s (s (d0)))))))) => d1 .
  trans langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (s (s (s (s (d0)))))),s (s (d0))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (d0))) => d1 .
  trans langton (s (d0),s (s (s (s (s (d0))))),d0,s (s (s (s (s (s (s (d0))))))),s (s (d0))) => d5 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (d0)))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (s (d0))))))) => d1 .
  trans langton (s (d0),s (s (d0)),d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (s (s (d0)))))))) => d1 .
  trans langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),d0,s (s (s (s (s (d0))))),s (s (d0))) => d1 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),d0,d0) => d7 .
  trans langton (d0,s (s (s (s (d0)))),s (d0),d0,s (s (d0))) => d4 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),d0,s (s (d0))) => d7 .
  trans langton (d0,s (s (s (s (d0)))),s (d0),s (d0),s (s (d0))) => d4 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (d0),s (s (d0))) => d7 .
  trans langton (d0,s (s (d0)),s (d0),s (s (d0)),d0) => d6 .
  trans langton (d0,s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) => d4 .
  trans langton (d0,s (s (s (s (s (s (d0)))))),s (d0),s (s (d0)),s (s (d0))) => d3 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) => d7 .
  trans langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (d0)))) => d7 .
  trans langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (d0))))) => d4 .
  trans langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) => d6 .
  trans langton (d0,s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) => d4 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (s (s (s (s (d0))))))) => d7 .
  trans langton (d0,s (d0),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d0 .
  trans langton (d0,s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d7 .
  trans langton (d0,s (s (d0)),s (d0),s (s (s (s (s (d0))))),s (s (s (s (d0))))) => d7 .
  trans langton (s (d0),s (s (s (s (d0)))),s (d0),s (d0),s (s (d0))) => d4 .
  trans langton (s (d0),s (s (s (s (s (s (s (d0))))))),s (d0),s (d0),s (s (d0))) => d7 .
  trans langton (s (d0),s (s (d0)),s (d0),s (d0),s (s (s (s (s (d0)))))) => d2 .
  trans langton (s (d0),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) => d4 .
  trans langton (s (d0),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) => d7 .
  trans langton (s (d0),s (s (d0)),s (d0),s (s (d0)),s (s (s (s (d0))))) => d4 .
  trans langton (s (d0),s (s (d0)),s (d0),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d7 .
  trans langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (d0))) => d4 .
  trans langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0)),s (s (d0))) => d7 .
  trans langton (s (s (d0)),s (s (s (d0))),s (d0),s (s (d0)),s (s (s (s (d0))))) => d4 .
  trans langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0)),s (s (s (s (s (d0)))))) => d7 .
  trans langton (s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (s (d0))),s (s (d0))) => d4 .
  trans langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (s (d0))),s (s (d0))) => d7 .
  trans langton (s (s (d0)),s (s (s (s (s (d0))))),s (d0),s (s (s (s (d0)))),s (s (d0))) => d5 .
  trans langton (s (s (d0)),s (s (s (s (s (s (d0)))))),s (d0),s (s (s (s (d0)))),s (s (d0))) => d7 .
  trans langton (s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (s (s (s (d0))))),s (s (d0))) => d5 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),d0,d0) => d1 .
  trans langton (d0,s (s (s (s (s (d0))))),s (s (d0)),d0,s (s (d0))) => d0 .
  trans langton (d0,s (s (d0)),s (s (d0)),d0,s (s (s (d0)))) => d6 .
  trans langton (d0,s (s (d0)),s (s (d0)),d0,s (s (s (s (d0))))) => d3 .
  trans langton (d0,s (d0),s (s (d0)),d0,s (s (s (s (s (d0)))))) => d7 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),d0,s (s (s (s (s (d0)))))) => d5 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0)),d0) => d3 .
  trans langton (d0,s (s (d0)),s (s (d0)),s (s (d0)),s (s (s (d0)))) => d1 .
  trans langton (d0,s (s (d0)),s (s (d0)),s (s (d0)),s (s (s (s (s (d0)))))) => d0 .
  trans langton (d0,s (d0),s (s (d0)),s (s (s (d0))),s (s (d0))) => d6 .
  trans langton (d0,s (s (d0)),s (s (d0)),s (s (s (d0))),s (s (d0))) => d6 .
  trans langton (d0,s (s (d0)),s (s (d0)),s (s (s (s (s (d0))))),s (s (s (s (s (d0)))))) => d1 .
  trans langton (d0,s (s (d0)),s (s (d0)),s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0)))))))) => d5 .
  trans langton (s (d0),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0),s (s (d0))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (d0))),d0,d0) => d2 .
  trans langton (d0,s (s (s (s (d0)))),s (s (s (d0))),d0,d0) => d1 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (s (d0))),d0,d0) => d6 .
  trans langton (d0,s (s (d0)),s (s (s (d0))),d0,s (s (s (s (d0))))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (d0))),d0,s (s (s (s (s (s (d0))))))) => d2 .
  trans langton (d0,s (s (d0)),s (s (s (d0))),s (d0),d0) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (d0))),s (d0),s (s (d0))) => d0 .
  trans langton (d0,s (d0),s (s (s (d0))),s (s (d0)),s (s (s (s (s (d0)))))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (d0),s (d0)) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (d0),s (s (d0))) => d0 .
  trans langton (d0,s (s (s (s (s (d0))))),s (s (s (s (d0)))),s (d0),s (s (d0))) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (d0)) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (d0))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (s (d0)))) => d6 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (d0)),s (s (s (s (s (d0)))))) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (d0)))),s (s (s (d0))),s (s (d0))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),d0,d0) => d2 .
  trans langton (d0,s (s (s (d0))),s (s (s (s (s (d0))))),d0,s (s (d0))) => d2 .
  trans langton (d0,s (s (s (s (s (s (s (d0))))))),s (s (s (s (s (d0))))),d0,s (s (d0))) => d2 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),d0,s (s (s (s (s (d0)))))) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),d0) => d2 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) => d2 .
  trans langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) => d2 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) => d0 .
  trans langton (d0,s (s (s (s (d0)))),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) => d4 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d2 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (d0)) => d2 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (d0))) => d0 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (d0))))) => d2 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (d0))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d2 .
  trans langton (d0,s (d0),s (s (s (s (s (s (d0)))))),d0,d0) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (d0)))))),d0,d0) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) => d0 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) => d5 .
  trans langton (s (d0),s (s (s (d0))),s (s (s (s (s (s (d0)))))),s (s (d0)),s (d0)) => d1 .
  trans langton (s (d0),s (s (d0)),s (s (s (s (s (s (d0)))))),s (s (d0)),s (s (d0))) => d5 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (d0)) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0))) => d0 .
  trans langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0))))))),s (d0),s (s (d0))) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (d0)) => d0 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0))) => d1 .
  trans langton (d0,s (s (s (s (s (d0))))),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (d0))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (d0)))) => d1 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (s (s (d0)))))) => d5 .
  trans langton (d0,s (s (d0)),s (s (s (s (s (s (s (d0))))))),s (s (d0)),s (s (s (s (s (s (s (d0)))))))) => d0 .
  trans langton (V:Xnat, W:Xnat, X:Xnat, Y:Xnat, Z:Xnat) => X .
  trans next (V:Xnat,W:Xnat,Y:Xnat,Z:Xnat,s (X:Xnat)) => plus (langton (V,W,Y,Z,s (X)),next (V,W,Y,Z,X)) .
  trans next (V:Xnat,W:Xnat,Y:Xnat,s (X:Xnat),d0) => plus (langton (V,W,Y,s (X),d0),next (V,W,Y,X,d7)) .
  trans next (V:Xnat,W:Xnat,s (X:Xnat),d0,d0) => plus (langton (V,W,s (X),d0,d0),next (V,W,X,d7,d7)) .
  trans next (Y:Xnat,s (X:Xnat),d0,d0,d0) => plus (langton (Y,s (X),d0,d0,d0),next (Y,X,d7,d7,d7)) .
  trans next (s (X:Xnat),d0,d0,d0,d0) => plus (langton (s (X),d0,d0,d0,d0),next (X,d7,d7,d7,d7)) .
  trans next (d0,d0,d0,d0,d0) => langton (d0,d0,d0,d0,d0) .
}
select Langton7 .
exec next (d7,d7,d7,d7,d7) .
