type uSingleton = Ucons of nat

and nat = D0 | Succ of nat ;;

let rec print_USingleton (rec_x:uSingleton) =
   match rec_x with
   | Ucons rec_x1 ->
      print_string "Ucons";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"

and print_Nat (rec_x:nat) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | Succ rec_x1 ->
      print_string "Succ";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
;;

let main () =
   print_Nat (D0);
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
