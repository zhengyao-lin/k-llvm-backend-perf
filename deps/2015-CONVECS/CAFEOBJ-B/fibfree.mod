-- CAFEOBJ-B
mod! FibFree {
  [ Xnat ]
  op d : -> Xnat { constr }
  op n0 : Xnat -> Xnat { constr }
  op n1 : Xnat -> Xnat { constr }
  op n2 : Xnat -> Xnat { constr }
  op n3 : Xnat -> Xnat { constr }
  op n4 : Xnat -> Xnat { constr }
  op n5 : Xnat -> Xnat { constr }
  op n6 : Xnat -> Xnat { constr }
  op n7 : Xnat -> Xnat { constr }
  op n8 : Xnat -> Xnat { constr }
  op n9 : Xnat -> Xnat { constr }
  op plus : Xnat Xnat -> Xnat
  op times : Xnat Xnat -> Xnat
  op mult0 : Xnat -> Xnat
  op mult1 : Xnat -> Xnat
  op mult2 : Xnat -> Xnat
  op mult3 : Xnat -> Xnat
  op mult4 : Xnat -> Xnat
  op mult5 : Xnat -> Xnat
  op mult6 : Xnat -> Xnat
  op mult7 : Xnat -> Xnat
  op mult8 : Xnat -> Xnat
  op mult9 : Xnat -> Xnat
  op fib : Xnat -> Xnat
  op fact : Xnat -> Xnat
  op prec : Xnat -> Xnat
  op reduce : Xnat -> Xnat
  trans plus (X:Xnat, d) => X .
  trans plus (d, X:Xnat) => X .
  trans plus (n0 (X:Xnat), n0 (Y:Xnat)) => n0 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n1 (Y:Xnat)) => n1 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n2 (Y:Xnat)) => n2 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n3 (Y:Xnat)) => n3 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n4 (Y:Xnat)) => n4 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n5 (Y:Xnat)) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n6 (Y:Xnat)) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n7 (Y:Xnat)) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n8 (Y:Xnat)) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n0 (X:Xnat), n9 (Y:Xnat)) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n1 (Y:Xnat)) => n2 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n2 (Y:Xnat)) => n3 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n3 (Y:Xnat)) => n4 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n4 (Y:Xnat)) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n5 (Y:Xnat)) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n6 (Y:Xnat)) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n7 (Y:Xnat)) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n8 (Y:Xnat)) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n1 (X:Xnat), n9 (Y:Xnat)) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n2 (X:Xnat), n2 (Y:Xnat)) => n4 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n3 (Y:Xnat)) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n4 (Y:Xnat)) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n5 (Y:Xnat)) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n6 (Y:Xnat)) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n7 (Y:Xnat)) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (X:Xnat), n8 (Y:Xnat)) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n2 (X:Xnat), n9 (Y:Xnat)) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n3 (X:Xnat), n3 (Y:Xnat)) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (X:Xnat), n4 (Y:Xnat)) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (X:Xnat), n5 (Y:Xnat)) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (X:Xnat), n6 (Y:Xnat)) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (X:Xnat), n7 (Y:Xnat)) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n3 (X:Xnat), n8 (Y:Xnat)) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n3 (X:Xnat), n9 (Y:Xnat)) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n4 (X:Xnat), n4 (Y:Xnat)) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n4 (X:Xnat), n5 (Y:Xnat)) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n4 (X:Xnat), n6 (Y:Xnat)) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n4 (X:Xnat), n7 (Y:Xnat)) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n4 (X:Xnat), n8 (Y:Xnat)) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n4 (X:Xnat), n9 (Y:Xnat)) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (X:Xnat), n5 (Y:Xnat)) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (X:Xnat), n6 (Y:Xnat)) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (X:Xnat), n7 (Y:Xnat)) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (X:Xnat), n8 (Y:Xnat)) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (X:Xnat), n9 (Y:Xnat)) => n4 (plus (plus (X, Y), n1 (d))) .
  trans plus (n6 (X:Xnat), n6 (Y:Xnat)) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n6 (X:Xnat), n7 (Y:Xnat)) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n6 (X:Xnat), n8 (Y:Xnat)) => n4 (plus (plus (X, Y), n1 (d))) .
  trans plus (n6 (X:Xnat), n9 (Y:Xnat)) => n5 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (X:Xnat), n7 (Y:Xnat)) => n4 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (X:Xnat), n8 (Y:Xnat)) => n5 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (X:Xnat), n9 (Y:Xnat)) => n6 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (X:Xnat), n8 (Y:Xnat)) => n6 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (X:Xnat), n9 (Y:Xnat)) => n7 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (X:Xnat), n9 (Y:Xnat)) => n8 (plus (plus (X, Y), n1 (d))) .
  trans plus (n1 (Y:Xnat), n0 (X:Xnat) ) => n1 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (Y:Xnat), n0 (X:Xnat) ) => n2 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (Y:Xnat), n0 (X:Xnat) ) => n3 (plus (plus (X, Y), n0 (d))) .
  trans plus (n4 (Y:Xnat), n0 (X:Xnat) ) => n4 (plus (plus (X, Y), n0 (d))) .
  trans plus (n5 (Y:Xnat), n0 (X:Xnat) ) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n6 (Y:Xnat), n0 (X:Xnat) ) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n7 (Y:Xnat), n0 (X:Xnat) ) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n8 (Y:Xnat), n0 (X:Xnat) ) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n9 (Y:Xnat), n0 (X:Xnat) ) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n2 (Y:Xnat), n1 (X:Xnat) ) => n3 (plus (plus (X, Y), n0 (d))) .
  trans plus (n3 (Y:Xnat), n1 (X:Xnat) ) => n4 (plus (plus (X, Y), n0 (d))) .
  trans plus (n4 (Y:Xnat), n1 (X:Xnat) ) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n5 (Y:Xnat), n1 (X:Xnat) ) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n6 (Y:Xnat), n1 (X:Xnat) ) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n7 (Y:Xnat), n1 (X:Xnat) ) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n8 (Y:Xnat), n1 (X:Xnat) ) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n9 (Y:Xnat), n1 (X:Xnat) ) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n3 (Y:Xnat), n2 (X:Xnat) ) => n5 (plus (plus (X, Y), n0 (d))) .
  trans plus (n4 (Y:Xnat), n2 (X:Xnat) ) => n6 (plus (plus (X, Y), n0 (d))) .
  trans plus (n5 (Y:Xnat), n2 (X:Xnat) ) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n6 (Y:Xnat), n2 (X:Xnat) ) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n7 (Y:Xnat), n2 (X:Xnat) ) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n8 (Y:Xnat), n2 (X:Xnat) ) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n2 (X:Xnat) ) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n4 (Y:Xnat), n3 (X:Xnat) ) => n7 (plus (plus (X, Y), n0 (d))) .
  trans plus (n5 (Y:Xnat), n3 (X:Xnat) ) => n8 (plus (plus (X, Y), n0 (d))) .
  trans plus (n6 (Y:Xnat), n3 (X:Xnat) ) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n7 (Y:Xnat), n3 (X:Xnat) ) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (Y:Xnat), n3 (X:Xnat) ) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n3 (X:Xnat) ) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n5 (Y:Xnat), n4 (X:Xnat) ) => n9 (plus (plus (X, Y), n0 (d))) .
  trans plus (n6 (Y:Xnat), n4 (X:Xnat) ) => n0 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (Y:Xnat), n4 (X:Xnat) ) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (Y:Xnat), n4 (X:Xnat) ) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n4 (X:Xnat) ) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n6 (Y:Xnat), n5 (X:Xnat) ) => n1 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (Y:Xnat), n5 (X:Xnat) ) => n2 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (Y:Xnat), n5 (X:Xnat) ) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n5 (X:Xnat) ) => n4 (plus (plus (X, Y), n1 (d))) .
  trans plus (n7 (Y:Xnat), n6 (X:Xnat) ) => n3 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (Y:Xnat), n6 (X:Xnat) ) => n4 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n6 (X:Xnat) ) => n5 (plus (plus (X, Y), n1 (d))) .
  trans plus (n8 (Y:Xnat), n7 (X:Xnat) ) => n5 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n7 (X:Xnat) ) => n6 (plus (plus (X, Y), n1 (d))) .
  trans plus (n9 (Y:Xnat), n8 (X:Xnat) ) => n7 (plus (plus (X, Y), n1 (d))) .
  trans mult0 (X:Xnat) => d .
  trans mult1 (X:Xnat) => X .
  trans mult2 (d) => d .
  trans mult2 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult2 (X))) .
  trans mult2 (n1 (X:Xnat)) => n2 (plus (n0 (d), mult2 (X))) .
  trans mult2 (n2 (X:Xnat)) => n4 (plus (n0 (d), mult2 (X))) .
  trans mult2 (n3 (X:Xnat)) => n6 (plus (n0 (d), mult2 (X))) .
  trans mult2 (n4 (X:Xnat)) => n8 (plus (n0 (d), mult2 (X))) .
  trans mult2 (n5 (X:Xnat)) => n0 (plus (n1 (d), mult2 (X))) .
  trans mult2 (n6 (X:Xnat)) => n2 (plus (n1 (d), mult2 (X))) .
  trans mult2 (n7 (X:Xnat)) => n4 (plus (n1 (d), mult2 (X))) .
  trans mult2 (n8 (X:Xnat)) => n6 (plus (n1 (d), mult2 (X))) .
  trans mult2 (n9 (X:Xnat)) => n8 (plus (n1 (d), mult2 (X))) .
  trans mult3 (d) => d .
  trans mult3 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult3 (X))) .
  trans mult3 (n1 (X:Xnat)) => n3 (plus (n0 (d), mult3 (X))) .
  trans mult3 (n2 (X:Xnat)) => n6 (plus (n0 (d), mult3 (X))) .
  trans mult3 (n3 (X:Xnat)) => n9 (plus (n0 (d), mult3 (X))) .
  trans mult3 (n4 (X:Xnat)) => n2 (plus (n1 (d), mult3 (X))) .
  trans mult3 (n5 (X:Xnat)) => n5 (plus (n1 (d), mult3 (X))) .
  trans mult3 (n6 (X:Xnat)) => n8 (plus (n1 (d), mult3 (X))) .
  trans mult3 (n7 (X:Xnat)) => n1 (plus (n2 (d), mult3 (X))) .
  trans mult3 (n8 (X:Xnat)) => n4 (plus (n2 (d), mult3 (X))) .
  trans mult3 (n9 (X:Xnat)) => n7 (plus (n2 (d), mult3 (X))) .
  trans mult4 (d) => d .
  trans mult4 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult4 (X))) .
  trans mult4 (n1 (X:Xnat)) => n4 (plus (n0 (d), mult4 (X))) .
  trans mult4 (n2 (X:Xnat)) => n8 (plus (n0 (d), mult4 (X))) .
  trans mult4 (n3 (X:Xnat)) => n2 (plus (n1 (d), mult4 (X))) .
  trans mult4 (n4 (X:Xnat)) => n6 (plus (n1 (d), mult4 (X))) .
  trans mult4 (n5 (X:Xnat)) => n0 (plus (n2 (d), mult4 (X))) .
  trans mult4 (n6 (X:Xnat)) => n4 (plus (n2 (d), mult4 (X))) .
  trans mult4 (n7 (X:Xnat)) => n8 (plus (n2 (d), mult4 (X))) .
  trans mult4 (n8 (X:Xnat)) => n2 (plus (n3 (d), mult4 (X))) .
  trans mult4 (n9 (X:Xnat)) => n6 (plus (n3 (d), mult4 (X))) .
  trans mult5 (d) => d .
  trans mult5 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult5 (X))) .
  trans mult5 (n1 (X:Xnat)) => n5 (plus (n0 (d), mult5 (X))) .
  trans mult5 (n2 (X:Xnat)) => n0 (plus (n1 (d), mult5 (X))) .
  trans mult5 (n3 (X:Xnat)) => n5 (plus (n1 (d), mult5 (X))) .
  trans mult5 (n4 (X:Xnat)) => n0 (plus (n2 (d), mult5 (X))) .
  trans mult5 (n5 (X:Xnat)) => n5 (plus (n2 (d), mult5 (X))) .
  trans mult5 (n6 (X:Xnat)) => n0 (plus (n3 (d), mult5 (X))) .
  trans mult5 (n7 (X:Xnat)) => n5 (plus (n3 (d), mult5 (X))) .
  trans mult5 (n8 (X:Xnat)) => n0 (plus (n4 (d), mult5 (X))) .
  trans mult5 (n9 (X:Xnat)) => n5 (plus (n4 (d), mult5 (X))) .
  trans mult6 (d) => d .
  trans mult6 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult6 (X))) .
  trans mult6 (n1 (X:Xnat)) => n6 (plus (n0 (d), mult6 (X))) .
  trans mult6 (n2 (X:Xnat)) => n2 (plus (n1 (d), mult6 (X))) .
  trans mult6 (n3 (X:Xnat)) => n8 (plus (n1 (d), mult6 (X))) .
  trans mult6 (n4 (X:Xnat)) => n4 (plus (n2 (d), mult6 (X))) .
  trans mult6 (n5 (X:Xnat)) => n0 (plus (n3 (d), mult6 (X))) .
  trans mult6 (n6 (X:Xnat)) => n6 (plus (n3 (d), mult6 (X))) .
  trans mult6 (n7 (X:Xnat)) => n2 (plus (n4 (d), mult6 (X))) .
  trans mult6 (n8 (X:Xnat)) => n8 (plus (n4 (d), mult6 (X))) .
  trans mult6 (n9 (X:Xnat)) => n4 (plus (n5 (d), mult6 (X))) .
  trans mult7 (d) => d .
  trans mult7 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult7 (X))) .
  trans mult7 (n1 (X:Xnat)) => n7 (plus (n0 (d), mult7 (X))) .
  trans mult7 (n2 (X:Xnat)) => n4 (plus (n1 (d), mult7 (X))) .
  trans mult7 (n3 (X:Xnat)) => n1 (plus (n2 (d), mult7 (X))) .
  trans mult7 (n4 (X:Xnat)) => n8 (plus (n2 (d), mult7 (X))) .
  trans mult7 (n5 (X:Xnat)) => n5 (plus (n3 (d), mult7 (X))) .
  trans mult7 (n6 (X:Xnat)) => n2 (plus (n4 (d), mult7 (X))) .
  trans mult7 (n7 (X:Xnat)) => n9 (plus (n4 (d), mult7 (X))) .
  trans mult7 (n8 (X:Xnat)) => n6 (plus (n5 (d), mult7 (X))) .
  trans mult7 (n9 (X:Xnat)) => n3 (plus (n6 (d), mult7 (X))) .
  trans mult8 (d) => d .
  trans mult8 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult8 (X))) .
  trans mult8 (n1 (X:Xnat)) => n8 (plus (n0 (d), mult8 (X))) .
  trans mult8 (n2 (X:Xnat)) => n6 (plus (n1 (d), mult8 (X))) .
  trans mult8 (n3 (X:Xnat)) => n4 (plus (n2 (d), mult8 (X))) .
  trans mult8 (n4 (X:Xnat)) => n2 (plus (n3 (d), mult8 (X))) .
  trans mult8 (n5 (X:Xnat)) => n0 (plus (n4 (d), mult8 (X))) .
  trans mult8 (n6 (X:Xnat)) => n8 (plus (n4 (d), mult8 (X))) .
  trans mult8 (n7 (X:Xnat)) => n6 (plus (n5 (d), mult8 (X))) .
  trans mult8 (n8 (X:Xnat)) => n4 (plus (n6 (d), mult8 (X))) .
  trans mult8 (n9 (X:Xnat)) => n2 (plus (n7 (d), mult8 (X))) .
  trans mult9 (d) => d .
  trans mult9 (n0 (X:Xnat)) => n0 (plus (n0 (d), mult9 (X))) .
  trans mult9 (n1 (X:Xnat)) => n9 (plus (n0 (d), mult9 (X))) .
  trans mult9 (n2 (X:Xnat)) => n8 (plus (n1 (d), mult9 (X))) .
  trans mult9 (n3 (X:Xnat)) => n7 (plus (n2 (d), mult9 (X))) .
  trans mult9 (n4 (X:Xnat)) => n6 (plus (n3 (d), mult9 (X))) .
  trans mult9 (n5 (X:Xnat)) => n5 (plus (n4 (d), mult9 (X))) .
  trans mult9 (n6 (X:Xnat)) => n4 (plus (n5 (d), mult9 (X))) .
  trans mult9 (n7 (X:Xnat)) => n3 (plus (n6 (d), mult9 (X))) .
  trans mult9 (n8 (X:Xnat)) => n2 (plus (n7 (d), mult9 (X))) .
  trans mult9 (n9 (X:Xnat)) => n1 (plus (n8 (d), mult9 (X))) .
  trans times (X:Xnat, d) => d .
  trans times (n0 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult0 (Y)) .
  trans times (n1 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult1 (Y)) .
  trans times (n2 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult2 (Y)) .
  trans times (n3 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult3 (Y)) .
  trans times (n4 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult4 (Y)) .
  trans times (n5 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult5 (Y)) .
  trans times (n6 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult6 (Y)) .
  trans times (n7 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult7 (Y)) .
  trans times (n8 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult8 (Y)) .
  trans times (n9 (X:Xnat), Y:Xnat) => plus (n0 (times (X, Y)), mult9 (Y)) .
  trans times (d, X:Xnat) => d .
  trans prec (d) => d .
  trans prec (n0 (X:Xnat)) => d .
  trans prec (n1 (X:Xnat)) => n0 (X) .
  trans prec (n2 (X:Xnat)) => n1 (X) .
  trans prec (n3 (X:Xnat)) => n2 (X) .
  trans prec (n4 (X:Xnat)) => n3 (X) .
  trans prec (n5 (X:Xnat)) => n4 (X) .
  trans prec (n6 (X:Xnat)) => n5 (X) .
  trans prec (n7 (X:Xnat)) => n6 (X) .
  trans prec (n8 (X:Xnat)) => n7 (X) .
  trans prec (n9 (X:Xnat)) => n8 (X) .
  ctrans fact (X:Xnat) => n1 (d) if X == d .
  ctrans fact (X:Xnat) => times (X, fact (prec (X))) if X =/= d .
  ctrans fib (X:Xnat) => n1 (d) if X == d .
  ctrans fib (X:Xnat) => n1 (d) if X =/= d and X == n1 (d) .
  ctrans fib (X:Xnat) => plus (fib (prec (X)), fib (prec (prec (X)))) if X =/= d and X =/= n1 (d) .
  trans reduce (d) => d .
  ctrans reduce (n0 (X:Xnat)) => d if reduce (X) == d .
  ctrans reduce (n0 (X:Xnat)) => n0 (reduce (X)) if reduce (X) =/= d .
  trans reduce (n1 (X:Xnat)) => n1 (reduce (X)) .
  trans reduce (n2 (X:Xnat)) => n2 (reduce (X)) .
  trans reduce (n3 (X:Xnat)) => n3 (reduce (X)) .
  trans reduce (n4 (X:Xnat)) => n4 (reduce (X)) .
  trans reduce (n5 (X:Xnat)) => n5 (reduce (X)) .
  trans reduce (n6 (X:Xnat)) => n6 (reduce (X)) .
  trans reduce (n7 (X:Xnat)) => n7 (reduce (X)) .
  trans reduce (n8 (X:Xnat)) => n8 (reduce (X)) .
  trans reduce (n9 (X:Xnat)) => n9 (reduce (X)) .
}
select FibFree .
exec reduce (fib (n6 (n1 (d)))) .
exec reduce (fib (n7 (n5 (d)))) .
