type n = D0 | S of n | G of n ;;

let rec print_N (rec_x:n) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_N rec_x1;
      print_string ")"
   | G rec_x1 ->
      print_string "G";
      print_string " (";
      print_N rec_x1;
      print_string ")"
;;

let rec f (rec_x1:n) : n =
   match rec_x1 with
   | (G D0) -> D0
   | (G (S x)) -> (f (G x))
;;

let main () =
   print_N ((f (G (S D0))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
