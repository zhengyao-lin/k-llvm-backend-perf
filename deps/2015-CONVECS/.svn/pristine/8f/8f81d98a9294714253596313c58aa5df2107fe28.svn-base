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

let rec g (rec_x1:nat) : nat =
   match rec_x1 with
   | D0 -> D0
   | (S x) -> x

and f (rec_x1:nat) : nat =
   match rec_x1 with
   | (S x) when x = D0 -> D0
   | (S x) when x <> D0 -> x
   | D0 -> (S D0)
;;

let main () =
   print_Nat ((f (g D0)));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
