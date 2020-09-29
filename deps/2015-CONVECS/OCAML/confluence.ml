type s = D0 | G of s ;;

let rec print_S (rec_x:s) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | G rec_x1 ->
      print_string "G";
      print_string " (";
      print_S rec_x1;
      print_string ")"
;;

let rec f (rec_x1:s) : s =
   match rec_x1 with
   | (G x) when x = D0 -> x
   | (G (G x)) -> (f (G x))
;;

let main () =
   print_S ((f (G (G D0))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
