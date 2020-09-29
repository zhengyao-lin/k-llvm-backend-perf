type nat = D0 | S of nat ;;

let rec print_Nat (rec_x:nat) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
;;

let d1 : nat = (S D0) ;;

let d2 : nat = (S (S D0)) ;;

let d3 : nat = (S (S (S D0))) ;;

let d4 : nat = (S (S (S (S D0)))) ;;

let d5 : nat = (S (S (S (S (S D0))))) ;;

let d6 : nat = (S (S (S (S (S (S D0)))))) ;;

let d7 : nat = (S (S (S (S (S (S (S D0))))))) ;;

let rec plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, D0 -> x
   | (S x), y -> (S (plus x y))
   | x, (S y) -> (S (plus x y))

and langton (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) (rec_x4:nat) (rec_x5:nat) : nat =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | D0,(S D0),D0,D0,D0 -> d2
   | D0,(S (S (S (S (S (S D0)))))),D0,D0,D0 -> d3
   | D0,(S (S (S (S (S (S (S D0))))))),D0,D0,D0 -> d1
   | D0,x,D0,D0,D0 -> D0
   | D0,(S D0),D0,D0,(S D0) -> d2
   | D0,(S (S D0)),D0,D0,(S D0) -> d2
   | D0,(S (S (S D0))),D0,D0,(S D0) -> d2
   | D0,(S D0),D0,D0,(S (S D0)) -> d2
   | D0,(S (S (S (S (S (S D0)))))),D0,D0,(S (S D0)) -> d2
   | D0,(S (S (S (S (S (S (S D0))))))),D0,D0,(S (S D0)) -> d2
   | D0,(S (S D0)),D0,D0,(S (S (S (S (S D0))))) -> d5
   | D0,(S (S D0)),D0,D0,(S (S (S (S (S (S D0)))))) -> d2
   | D0,(S (S D0)),D0,D0,(S (S (S (S (S (S (S D0))))))) -> d2
   | D0,(S (S D0)),D0,(S D0),D0 -> d2
   | D0,(S (S D0)),D0,(S (S D0)),(S D0) -> d5
   | D0,(S (S D0)),D0,(S (S D0)),(S (S (S D0))) -> d2
   | D0,(S (S D0)),D0,(S (S (S (S (S D0))))),(S (S D0)) -> d2
   | (S D0),(S (S D0)),D0,(S (S D0)),(S (S (S D0))) -> d1
   | (S D0),(S (S D0)),D0,(S (S D0)),(S (S (S (S D0)))) -> d1
   | (S D0),(S (S D0)),D0,(S (S D0)),(S (S (S (S (S D0))))) -> d5
   | (S D0),(S (S D0)),D0,(S (S D0)),(S (S (S (S (S (S D0)))))) -> d1
   | (S D0),(S (S D0)),D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d1
   | (S D0),(S (S (S (S (S D0))))),D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S D0)))),(S (S D0)) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S D0)))),(S (S (S D0))) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S D0)))),(S (S (S (S D0)))) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S D0)))),(S (S (S (S (S (S (S D0))))))) -> d1
   | (S D0),(S (S (S (S (S D0))))),D0,(S (S (S (S (S (S D0)))))),(S (S D0)) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S (S (S (S D0))))))),(S (S D0)) -> d1
   | (S D0),(S (S (S (S (S D0))))),D0,(S (S (S (S (S (S (S D0))))))),(S (S D0)) -> d5
   | (S D0),(S (S D0)),D0,(S (S (S (S (S (S (S D0))))))),(S (S (S (S (S D0))))) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S (S (S (S D0))))))),(S (S (S (S (S (S D0)))))) -> d1
   | (S D0),(S (S D0)),D0,(S (S (S (S (S (S (S D0))))))),(S (S (S (S (S (S (S D0))))))) -> d1
   | (S (S D0)),(S (S (S (S (S (S (S D0))))))),D0,(S (S (S (S (S D0))))),(S (S D0)) -> d1
   | D0,(S (S (S (S (S (S (S D0))))))),(S D0),D0,D0 -> d7
   | D0,(S (S (S (S D0)))),(S D0),D0,(S (S D0)) -> d4
   | D0,(S (S (S (S (S (S (S D0))))))),(S D0),D0,(S (S D0)) -> d7
   | D0,(S (S (S (S D0)))),(S D0),(S D0),(S (S D0)) -> d4
   | D0,(S (S (S (S (S (S (S D0))))))),(S D0),(S D0),(S (S D0)) -> d7
   | D0,(S (S D0)),(S D0),(S (S D0)),D0 -> d6
   | D0,(S (S (S (S D0)))),(S D0),(S (S D0)),(S (S D0)) -> d4
   | D0,(S (S (S (S (S (S D0)))))),(S D0),(S (S D0)),(S (S D0)) -> d3
   | D0,(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)),(S (S D0)) -> d7
   | D0,(S (S D0)),(S D0),(S (S D0)),(S (S (S D0))) -> d7
   | D0,(S (S D0)),(S D0),(S (S D0)),(S (S (S (S D0)))) -> d4
   | D0,(S (S D0)),(S D0),(S (S D0)),(S (S (S (S (S (S D0)))))) -> d6
   | D0,(S (S (S (S D0)))),(S D0),(S (S D0)),(S (S (S (S (S (S D0)))))) -> d4
   | D0,(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)),(S (S (S (S (S (S D0)))))) -> d7
   | D0,(S D0),(S D0),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> D0
   | D0,(S (S D0)),(S D0),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d7
   | D0,(S (S D0)),(S D0),(S (S (S (S (S D0))))),(S (S (S (S D0)))) -> d7
   | (S D0),(S (S (S (S D0)))),(S D0),(S D0),(S (S D0)) -> d4
   | (S D0),(S (S (S (S (S (S (S D0))))))),(S D0),(S D0),(S (S D0)) -> d7
   | (S D0),(S (S D0)),(S D0),(S D0),(S (S (S (S (S D0))))) -> d2
   | (S D0),(S (S (S (S D0)))),(S D0),(S (S D0)),(S (S D0)) -> d4
   | (S D0),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)),(S (S D0)) -> d7
   | (S D0),(S (S D0)),(S D0),(S (S D0)),(S (S (S (S D0)))) -> d4
   | (S D0),(S (S D0)),(S D0),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d7
   | (S (S D0)),(S (S (S (S D0)))),(S D0),(S (S D0)),(S (S D0)) -> d4
   | (S (S D0)),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)),(S (S D0)) -> d7
   | (S (S D0)),(S (S (S D0))),(S D0),(S (S D0)),(S (S (S (S D0)))) -> d4
   | (S (S D0)),(S (S (S (S D0)))),(S D0),(S (S D0)),(S (S (S (S (S D0))))) -> d7
   | (S (S D0)),(S (S (S (S D0)))),(S D0),(S (S (S D0))),(S (S D0)) -> d4
   | (S (S D0)),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S (S D0))),(S (S D0)) -> d7
   | (S (S D0)),(S (S (S (S (S D0))))),(S D0),(S (S (S (S D0)))),(S (S D0)) -> d5
   | (S (S D0)),(S (S (S (S (S (S D0)))))),(S D0),(S (S (S (S D0)))),(S (S D0)) -> d7
   | (S (S D0)),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S (S (S (S D0))))),(S (S D0)) -> d5
   | D0,(S (S (S (S (S (S (S D0))))))),(S (S D0)),D0,D0 -> d1
   | D0,(S (S (S (S (S D0))))),(S (S D0)),D0,(S (S D0)) -> D0
   | D0,(S (S D0)),(S (S D0)),D0,(S (S (S D0))) -> d6
   | D0,(S (S D0)),(S (S D0)),D0,(S (S (S (S D0)))) -> d3
   | D0,(S D0),(S (S D0)),D0,(S (S (S (S (S D0))))) -> d7
   | D0,(S (S (S (S (S (S (S D0))))))),(S (S D0)),D0,(S (S (S (S (S D0))))) -> d5
   | D0,(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S D0)),D0 -> d3
   | D0,(S (S D0)),(S (S D0)),(S (S D0)),(S (S (S D0))) -> d1
   | D0,(S (S D0)),(S (S D0)),(S (S D0)),(S (S (S (S (S D0))))) -> D0
   | D0,(S D0),(S (S D0)),(S (S (S D0))),(S (S D0)) -> d6
   | D0,(S (S D0)),(S (S D0)),(S (S (S D0))),(S (S D0)) -> d6
   | D0,(S (S D0)),(S (S D0)),(S (S (S (S (S D0))))),(S (S (S (S (S D0))))) -> d1
   | D0,(S (S D0)),(S (S D0)),(S (S (S (S (S D0))))),(S (S (S (S (S (S (S D0))))))) -> d5
   | (S D0),(S (S (S (S (S (S D0)))))),(S (S D0)),(S D0),(S (S D0)) -> d1
   | D0,(S (S D0)),(S (S (S D0))),D0,D0 -> d2
   | D0,(S (S (S (S D0)))),(S (S (S D0))),D0,D0 -> d1
   | D0,(S (S (S (S (S (S (S D0))))))),(S (S (S D0))),D0,D0 -> d6
   | D0,(S (S D0)),(S (S (S D0))),D0,(S (S (S (S D0)))) -> d1
   | D0,(S (S D0)),(S (S (S D0))),D0,(S (S (S (S (S (S D0)))))) -> d2
   | D0,(S (S D0)),(S (S (S D0))),(S D0),D0 -> d1
   | D0,(S (S D0)),(S (S (S D0))),(S D0),(S (S D0)) -> D0
   | D0,(S D0),(S (S (S D0))),(S (S D0)),(S (S (S (S (S D0))))) -> d1
   | D0,(S (S D0)),(S (S (S (S D0)))),(S D0),(S D0) -> D0
   | D0,(S (S D0)),(S (S (S (S D0)))),(S D0),(S (S D0)) -> D0
   | D0,(S (S (S (S (S D0))))),(S (S (S (S D0)))),(S D0),(S (S D0)) -> D0
   | D0,(S (S D0)),(S (S (S (S D0)))),(S (S D0)),(S D0) -> D0
   | D0,(S (S D0)),(S (S (S (S D0)))),(S (S D0)),(S (S D0)) -> d1
   | D0,(S (S D0)),(S (S (S (S D0)))),(S (S D0)),(S (S (S D0))) -> d6
   | D0,(S (S D0)),(S (S (S (S D0)))),(S (S D0)),(S (S (S (S (S D0))))) -> D0
   | D0,(S (S D0)),(S (S (S (S D0)))),(S (S (S D0))),(S (S D0)) -> d1
   | D0,(S (S D0)),(S (S (S (S (S D0))))),D0,D0 -> d2
   | D0,(S (S (S D0))),(S (S (S (S (S D0))))),D0,(S (S D0)) -> d2
   | D0,(S (S (S (S (S (S (S D0))))))),(S (S (S (S (S D0))))),D0,(S (S D0)) -> d2
   | D0,(S (S D0)),(S (S (S (S (S D0))))),D0,(S (S (S (S (S D0))))) -> D0
   | D0,(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),D0 -> d2
   | D0,(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S D0) -> d2
   | D0,(S (S (S (S (S D0))))),(S (S (S (S (S D0))))),(S (S D0)),(S D0) -> d2
   | D0,(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S (S D0)) -> D0
   | D0,(S (S (S (S D0)))),(S (S (S (S (S D0))))),(S (S D0)),(S (S D0)) -> d4
   | D0,(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d2
   | (S D0),(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S D0) -> d2
   | (S D0),(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S (S D0)) -> D0
   | (S D0),(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S (S (S (S D0)))) -> d2
   | (S D0),(S (S D0)),(S (S (S (S (S D0))))),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> d2
   | D0,(S D0),(S (S (S (S (S (S D0)))))),D0,D0 -> d1
   | D0,(S (S D0)),(S (S (S (S (S (S D0)))))),D0,D0 -> d1
   | D0,(S (S D0)),(S (S (S (S (S (S D0)))))),(S (S D0)),(S D0) -> D0
   | (S D0),(S (S D0)),(S (S (S (S (S (S D0)))))),(S (S D0)),(S D0) -> d5
   | (S D0),(S (S (S D0))),(S (S (S (S (S (S D0)))))),(S (S D0)),(S D0) -> d1
   | (S D0),(S (S D0)),(S (S (S (S (S (S D0)))))),(S (S D0)),(S (S D0)) -> d5
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S D0),(S D0) -> D0
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)) -> D0
   | D0,(S (S (S (S (S D0))))),(S (S (S (S (S (S (S D0))))))),(S D0),(S (S D0)) -> D0
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S D0) -> D0
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S D0)) -> d1
   | D0,(S (S (S (S (S D0))))),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S D0)) -> d1
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S (S D0))) -> d1
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S (S (S (S D0))))) -> d5
   | D0,(S (S D0)),(S (S (S (S (S (S (S D0))))))),(S (S D0)),(S (S (S (S (S (S (S D0))))))) -> D0
   | v, w, x, y, z -> x

and next (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) (rec_x4:nat) (rec_x5:nat) : nat =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | v,w,y,z,(S x) -> (plus (langton v w y z (S x)) (next v w y z x))
   | v,w,y,(S x),D0 -> (plus (langton v w y (S x) D0) (next v w y x d7))
   | v,w,(S x),D0,D0 -> (plus (langton v w (S x) D0 D0) (next v w x d7 d7))
   | y,(S x),D0,D0,D0 -> (plus (langton y (S x) D0 D0 D0) (next y x d7 d7 d7))
   | (S x),D0,D0,D0,D0 -> (plus (langton (S x) D0 D0 D0 D0) (next x d7 d7 d7 d7))
   | D0,D0,D0,D0,D0 -> (langton D0 D0 D0 D0 D0)
;;

let main () =
   print_Nat ((next d7 d7 d7 d7 d7));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
