type nat = D | N0 of nat | N1 of nat | N2 of nat | N3 of nat | N4 of nat | N5 of nat | N6 of nat | N7 of nat | N8 of nat | N9 of nat ;;

let rec print_Nat (rec_x:nat) =
   match rec_x with
   | D ->
      print_string "D"
   | N0 rec_x1 ->
      print_string "N0";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N1 rec_x1 ->
      print_string "N1";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N2 rec_x1 ->
      print_string "N2";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N3 rec_x1 ->
      print_string "N3";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N4 rec_x1 ->
      print_string "N4";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N5 rec_x1 ->
      print_string "N5";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N6 rec_x1 ->
      print_string "N6";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N7 rec_x1 ->
      print_string "N7";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N8 rec_x1 ->
      print_string "N8";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | N9 rec_x1 ->
      print_string "N9";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
;;

let rec plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, D -> x
   | D, x -> x
   | (N0 x), (N0 y) -> (N0 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N1 y) -> (N1 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N2 y) -> (N2 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N3 y) -> (N3 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N4 y) -> (N4 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N5 y) -> (N5 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N6 y) -> (N6 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N7 y) -> (N7 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N8 y) -> (N8 (plus (plus x  y)  (N0 D)))
   | (N0 x), (N9 y) -> (N9 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N1 y) -> (N2 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N2 y) -> (N3 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N3 y) -> (N4 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N4 y) -> (N5 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N5 y) -> (N6 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N6 y) -> (N7 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N7 y) -> (N8 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N8 y) -> (N9 (plus (plus x  y)  (N0 D)))
   | (N1 x), (N9 y) -> (N0 (plus (plus x  y)  (N1 D)))
   | (N2 x), (N2 y) -> (N4 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N3 y) -> (N5 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N4 y) -> (N6 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N5 y) -> (N7 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N6 y) -> (N8 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N7 y) -> (N9 (plus (plus x  y)  (N0 D)))
   | (N2 x), (N8 y) -> (N0 (plus (plus x  y)  (N1 D)))
   | (N2 x), (N9 y) -> (N1 (plus (plus x  y)  (N1 D)))
   | (N3 x), (N3 y) -> (N6 (plus (plus x  y)  (N0 D)))
   | (N3 x), (N4 y) -> (N7 (plus (plus x  y)  (N0 D)))
   | (N3 x), (N5 y) -> (N8 (plus (plus x  y)  (N0 D)))
   | (N3 x), (N6 y) -> (N9 (plus (plus x  y)  (N0 D)))
   | (N3 x), (N7 y) -> (N0 (plus (plus x  y)  (N1 D)))
   | (N3 x), (N8 y) -> (N1 (plus (plus x  y)  (N1 D)))
   | (N3 x), (N9 y) -> (N2 (plus (plus x  y)  (N1 D)))
   | (N4 x), (N4 y) -> (N8 (plus (plus x  y)  (N0 D)))
   | (N4 x), (N5 y) -> (N9 (plus (plus x  y)  (N0 D)))
   | (N4 x), (N6 y) -> (N0 (plus (plus x  y)  (N1 D)))
   | (N4 x), (N7 y) -> (N1 (plus (plus x  y)  (N1 D)))
   | (N4 x), (N8 y) -> (N2 (plus (plus x  y)  (N1 D)))
   | (N4 x), (N9 y) -> (N3 (plus (plus x  y)  (N1 D)))
   | (N5 x), (N5 y) -> (N0 (plus (plus x  y)  (N1 D)))
   | (N5 x), (N6 y) -> (N1 (plus (plus x  y)  (N1 D)))
   | (N5 x), (N7 y) -> (N2 (plus (plus x  y)  (N1 D)))
   | (N5 x), (N8 y) -> (N3 (plus (plus x  y)  (N1 D)))
   | (N5 x), (N9 y) -> (N4 (plus (plus x  y)  (N1 D)))
   | (N6 x), (N6 y) -> (N2 (plus (plus x  y)  (N1 D)))
   | (N6 x), (N7 y) -> (N3 (plus (plus x  y)  (N1 D)))
   | (N6 x), (N8 y) -> (N4 (plus (plus x  y)  (N1 D)))
   | (N6 x), (N9 y) -> (N5 (plus (plus x  y)  (N1 D)))
   | (N7 x), (N7 y) -> (N4 (plus (plus x  y)  (N1 D)))
   | (N7 x), (N8 y) -> (N5 (plus (plus x  y)  (N1 D)))
   | (N7 x), (N9 y) -> (N6 (plus (plus x  y)  (N1 D)))
   | (N8 x), (N8 y) -> (N6 (plus (plus x  y)  (N1 D)))
   | (N8 x), (N9 y) -> (N7 (plus (plus x  y)  (N1 D)))
   | (N9 x), (N9 y) -> (N8 (plus (plus x  y)  (N1 D)))
   | (N1 y), (N0 x)  -> (N1 (plus (plus x  y)  (N0 D)))
   | (N2 y), (N0 x)  -> (N2 (plus (plus x  y)  (N0 D)))
   | (N3 y), (N0 x)  -> (N3 (plus (plus x  y)  (N0 D)))
   | (N4 y), (N0 x)  -> (N4 (plus (plus x  y)  (N0 D)))
   | (N5 y), (N0 x)  -> (N5 (plus (plus x  y)  (N0 D)))
   | (N6 y), (N0 x)  -> (N6 (plus (plus x  y)  (N0 D)))
   | (N7 y), (N0 x)  -> (N7 (plus (plus x  y)  (N0 D)))
   | (N8 y), (N0 x)  -> (N8 (plus (plus x  y)  (N0 D)))
   | (N9 y), (N0 x)  -> (N9 (plus (plus x  y)  (N0 D)))
   | (N2 y), (N1 x)  -> (N3 (plus (plus x  y)  (N0 D)))
   | (N3 y), (N1 x)  -> (N4 (plus (plus x  y)  (N0 D)))
   | (N4 y), (N1 x)  -> (N5 (plus (plus x  y)  (N0 D)))
   | (N5 y), (N1 x)  -> (N6 (plus (plus x  y)  (N0 D)))
   | (N6 y), (N1 x)  -> (N7 (plus (plus x  y)  (N0 D)))
   | (N7 y), (N1 x)  -> (N8 (plus (plus x  y)  (N0 D)))
   | (N8 y), (N1 x)  -> (N9 (plus (plus x  y)  (N0 D)))
   | (N9 y), (N1 x)  -> (N0 (plus (plus x  y)  (N1 D)))
   | (N3 y), (N2 x)  -> (N5 (plus (plus x  y)  (N0 D)))
   | (N4 y), (N2 x)  -> (N6 (plus (plus x  y)  (N0 D)))
   | (N5 y), (N2 x)  -> (N7 (plus (plus x  y)  (N0 D)))
   | (N6 y), (N2 x)  -> (N8 (plus (plus x  y)  (N0 D)))
   | (N7 y), (N2 x)  -> (N9 (plus (plus x  y)  (N0 D)))
   | (N8 y), (N2 x)  -> (N0 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N2 x)  -> (N1 (plus (plus x  y)  (N1 D)))
   | (N4 y), (N3 x)  -> (N7 (plus (plus x  y)  (N0 D)))
   | (N5 y), (N3 x)  -> (N8 (plus (plus x  y)  (N0 D)))
   | (N6 y), (N3 x)  -> (N9 (plus (plus x  y)  (N0 D)))
   | (N7 y), (N3 x)  -> (N0 (plus (plus x  y)  (N1 D)))
   | (N8 y), (N3 x)  -> (N1 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N3 x)  -> (N2 (plus (plus x  y)  (N1 D)))
   | (N5 y), (N4 x)  -> (N9 (plus (plus x  y)  (N0 D)))
   | (N6 y), (N4 x)  -> (N0 (plus (plus x  y)  (N1 D)))
   | (N7 y), (N4 x)  -> (N1 (plus (plus x  y)  (N1 D)))
   | (N8 y), (N4 x)  -> (N2 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N4 x)  -> (N3 (plus (plus x  y)  (N1 D)))
   | (N6 y), (N5 x)  -> (N1 (plus (plus x  y)  (N1 D)))
   | (N7 y), (N5 x)  -> (N2 (plus (plus x  y)  (N1 D)))
   | (N8 y), (N5 x)  -> (N3 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N5 x)  -> (N4 (plus (plus x  y)  (N1 D)))
   | (N7 y), (N6 x)  -> (N3 (plus (plus x  y)  (N1 D)))
   | (N8 y), (N6 x)  -> (N4 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N6 x)  -> (N5 (plus (plus x  y)  (N1 D)))
   | (N8 y), (N7 x)  -> (N5 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N7 x)  -> (N6 (plus (plus x  y)  (N1 D)))
   | (N9 y), (N8 x)  -> (N7 (plus (plus x  y)  (N1 D)))

and mult0 (rec_x1:nat) : nat =
   match rec_x1 with
   | x -> D

and mult1 (rec_x1:nat) : nat =
   match rec_x1 with
   | x -> x

and mult2 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult2 x)))
   | (N1 x) -> (N2 (plus (N0 D)  (mult2 x)))
   | (N2 x) -> (N4 (plus (N0 D)  (mult2 x)))
   | (N3 x) -> (N6 (plus (N0 D)  (mult2 x)))
   | (N4 x) -> (N8 (plus (N0 D)  (mult2 x)))
   | (N5 x) -> (N0 (plus (N1 D)  (mult2 x)))
   | (N6 x) -> (N2 (plus (N1 D)  (mult2 x)))
   | (N7 x) -> (N4 (plus (N1 D)  (mult2 x)))
   | (N8 x) -> (N6 (plus (N1 D)  (mult2 x)))
   | (N9 x) -> (N8 (plus (N1 D)  (mult2 x)))

and mult3 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult3 x)))
   | (N1 x) -> (N3 (plus (N0 D)  (mult3 x)))
   | (N2 x) -> (N6 (plus (N0 D)  (mult3 x)))
   | (N3 x) -> (N9 (plus (N0 D)  (mult3 x)))
   | (N4 x) -> (N2 (plus (N1 D)  (mult3 x)))
   | (N5 x) -> (N5 (plus (N1 D)  (mult3 x)))
   | (N6 x) -> (N8 (plus (N1 D)  (mult3 x)))
   | (N7 x) -> (N1 (plus (N2 D)  (mult3 x)))
   | (N8 x) -> (N4 (plus (N2 D)  (mult3 x)))
   | (N9 x) -> (N7 (plus (N2 D)  (mult3 x)))

and mult4 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult4 x)))
   | (N1 x) -> (N4 (plus (N0 D)  (mult4 x)))
   | (N2 x) -> (N8 (plus (N0 D)  (mult4 x)))
   | (N3 x) -> (N2 (plus (N1 D)  (mult4 x)))
   | (N4 x) -> (N6 (plus (N1 D)  (mult4 x)))
   | (N5 x) -> (N0 (plus (N2 D)  (mult4 x)))
   | (N6 x) -> (N4 (plus (N2 D)  (mult4 x)))
   | (N7 x) -> (N8 (plus (N2 D)  (mult4 x)))
   | (N8 x) -> (N2 (plus (N3 D)  (mult4 x)))
   | (N9 x) -> (N6 (plus (N3 D)  (mult4 x)))

and mult5 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult5 x)))
   | (N1 x) -> (N5 (plus (N0 D)  (mult5 x)))
   | (N2 x) -> (N0 (plus (N1 D)  (mult5 x)))
   | (N3 x) -> (N5 (plus (N1 D)  (mult5 x)))
   | (N4 x) -> (N0 (plus (N2 D)  (mult5 x)))
   | (N5 x) -> (N5 (plus (N2 D)  (mult5 x)))
   | (N6 x) -> (N0 (plus (N3 D)  (mult5 x)))
   | (N7 x) -> (N5 (plus (N3 D)  (mult5 x)))
   | (N8 x) -> (N0 (plus (N4 D)  (mult5 x)))
   | (N9 x) -> (N5 (plus (N4 D)  (mult5 x)))

and mult6 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult6 x)))
   | (N1 x) -> (N6 (plus (N0 D)  (mult6 x)))
   | (N2 x) -> (N2 (plus (N1 D)  (mult6 x)))
   | (N3 x) -> (N8 (plus (N1 D)  (mult6 x)))
   | (N4 x) -> (N4 (plus (N2 D)  (mult6 x)))
   | (N5 x) -> (N0 (plus (N3 D)  (mult6 x)))
   | (N6 x) -> (N6 (plus (N3 D)  (mult6 x)))
   | (N7 x) -> (N2 (plus (N4 D)  (mult6 x)))
   | (N8 x) -> (N8 (plus (N4 D)  (mult6 x)))
   | (N9 x) -> (N4 (plus (N5 D)  (mult6 x)))

and mult7 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult7 x)))
   | (N1 x) -> (N7 (plus (N0 D)  (mult7 x)))
   | (N2 x) -> (N4 (plus (N1 D)  (mult7 x)))
   | (N3 x) -> (N1 (plus (N2 D)  (mult7 x)))
   | (N4 x) -> (N8 (plus (N2 D)  (mult7 x)))
   | (N5 x) -> (N5 (plus (N3 D)  (mult7 x)))
   | (N6 x) -> (N2 (plus (N4 D)  (mult7 x)))
   | (N7 x) -> (N9 (plus (N4 D)  (mult7 x)))
   | (N8 x) -> (N6 (plus (N5 D)  (mult7 x)))
   | (N9 x) -> (N3 (plus (N6 D)  (mult7 x)))

and mult8 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult8 x)))
   | (N1 x) -> (N8 (plus (N0 D)  (mult8 x)))
   | (N2 x) -> (N6 (plus (N1 D)  (mult8 x)))
   | (N3 x) -> (N4 (plus (N2 D)  (mult8 x)))
   | (N4 x) -> (N2 (plus (N3 D)  (mult8 x)))
   | (N5 x) -> (N0 (plus (N4 D)  (mult8 x)))
   | (N6 x) -> (N8 (plus (N4 D)  (mult8 x)))
   | (N7 x) -> (N6 (plus (N5 D)  (mult8 x)))
   | (N8 x) -> (N4 (plus (N6 D)  (mult8 x)))
   | (N9 x) -> (N2 (plus (N7 D)  (mult8 x)))

and mult9 (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> (N0 (plus (N0 D)  (mult9 x)))
   | (N1 x) -> (N9 (plus (N0 D)  (mult9 x)))
   | (N2 x) -> (N8 (plus (N1 D)  (mult9 x)))
   | (N3 x) -> (N7 (plus (N2 D)  (mult9 x)))
   | (N4 x) -> (N6 (plus (N3 D)  (mult9 x)))
   | (N5 x) -> (N5 (plus (N4 D)  (mult9 x)))
   | (N6 x) -> (N4 (plus (N5 D)  (mult9 x)))
   | (N7 x) -> (N3 (plus (N6 D)  (mult9 x)))
   | (N8 x) -> (N2 (plus (N7 D)  (mult9 x)))
   | (N9 x) -> (N1 (plus (N8 D)  (mult9 x)))

and times (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, D -> D
   | (N0 x), y -> (plus (N0 (times x  y))  (mult0 y))
   | (N1 x), y -> (plus (N0 (times x  y))  (mult1 y))
   | (N2 x), y -> (plus (N0 (times x  y))  (mult2 y))
   | (N3 x), y -> (plus (N0 (times x  y))  (mult3 y))
   | (N4 x), y -> (plus (N0 (times x  y))  (mult4 y))
   | (N5 x), y -> (plus (N0 (times x  y))  (mult5 y))
   | (N6 x), y -> (plus (N0 (times x  y))  (mult6 y))
   | (N7 x), y -> (plus (N0 (times x  y))  (mult7 y))
   | (N8 x), y -> (plus (N0 (times x  y))  (mult8 y))
   | (N9 x), y -> (plus (N0 (times x  y))  (mult9 y))
   | D, x -> D

and prec (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) -> D
   | (N1 x) -> (N0 x)
   | (N2 x) -> (N1 x)
   | (N3 x) -> (N2 x)
   | (N4 x) -> (N3 x)
   | (N5 x) -> (N4 x)
   | (N6 x) -> (N5 x)
   | (N7 x) -> (N6 x)
   | (N8 x) -> (N7 x)
   | (N9 x) -> (N8 x)

and fact (rec_x1:nat) : nat =
   match rec_x1 with
   | x when x = D -> (N1 D)
   | x when x <> D -> (times x  (fact (prec x)))

and fib (rec_x1:nat) : nat =
   match rec_x1 with
   | x when x = D -> (N1 D)
   | x when x <> D && x = (N1 D) -> (N1 D)
   | x when x <> D && x <> (N1 D) -> (plus (fib (prec x))  (fib (prec (prec x))))

and reduce (rec_x1:nat) : nat =
   match rec_x1 with
   | D -> D
   | (N0 x) when (reduce x) = D -> D
   | (N0 x) when (reduce x) <> D -> (N0 (reduce x))
   | (N1 x) -> (N1 (reduce x))
   | (N2 x) -> (N2 (reduce x))
   | (N3 x) -> (N3 (reduce x))
   | (N4 x) -> (N4 (reduce x))
   | (N5 x) -> (N5 (reduce x))
   | (N6 x) -> (N6 (reduce x))
   | (N7 x) -> (N7 (reduce x))
   | (N8 x) -> (N8 (reduce x))
   | (N9 x) -> (N9 (reduce x))
;;

let main () =
   print_Nat ((reduce (fib (N6 (N1 D)))));
   print_newline ();
   flush stdout;
   print_Nat ((reduce (fib (N7 (N5 D)))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
