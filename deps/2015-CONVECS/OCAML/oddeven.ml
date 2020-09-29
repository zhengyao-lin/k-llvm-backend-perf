type bool = True | False

and nat = D0 | S of nat ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Nat (rec_x:nat) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
;;

let rec odd (rec_x1:nat) : bool =
   match rec_x1 with
   | D0 -> False
   | (S n) when (even n) = True -> True
   | (S n) when (even n) = False -> False

and even (rec_x1:nat) : bool =
   match rec_x1 with
   | D0 -> True
   | (S n) when (odd n) = True -> True
   | (S n) when (odd n) = False -> False
;;

let main () =
   print_Bool ((odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))));
   print_newline ();
   flush stdout;
   print_Bool ((odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0))))))))))))))))))))));
   print_newline ();
   flush stdout;
   print_Bool ((odd (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
