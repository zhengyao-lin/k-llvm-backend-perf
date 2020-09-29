type bool = True | False ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"
;;

let a : bool = True ;;

let rec not (rec_x1:bool) : bool =
   match rec_x1 with
   | x when x = False -> True
   | x when x = True -> False
;;

let main () =
   print_Bool ((not a));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
