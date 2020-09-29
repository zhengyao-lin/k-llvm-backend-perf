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

let rec plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> n
   | (S n), m -> (S (plus n  m))

and times (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> D0
   | (S n), m -> (plus m  (times n  m))

and fact (rec_x1:nat) : nat =
   match rec_x1 with
   | D0 -> (S D0)
   | (S n) -> (times (S n)  (fact n))
;;

let main () =
   print_Nat ((fact (S (S (S (S (S D0)))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
