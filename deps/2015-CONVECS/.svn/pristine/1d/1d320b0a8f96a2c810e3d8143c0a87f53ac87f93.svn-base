type nSingleton = Ncons

and uSingleton = Ucons of nat

and nat = D0 | Succ of nat ;;

let rec print_NSingleton (rec_x:nSingleton) =
   match rec_x with
   | Ncons ->
      print_string "Ncons"

and print_USingleton (rec_x:uSingleton) =
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

let d1 : nat = (Succ D0) ;;

let rec d2 : nat = 
   match 0 with
   | 0 when D0 = D0 -> D0

and d3 : nat = 
   match 0 with
   | 0 when D0 <> D0 -> D0
   | 0 when (Succ D0) = D0 -> D0
   | 0 when (Succ D0) <> D0 -> (Succ D0)

and f (rec_x1:nat) : nat =
   match rec_x1 with
   | n when n <> D0 && n <> (Succ D0) -> n
;;

let main () =
   print_NSingleton (Ncons);
   print_newline ();
   flush stdout;
   print_USingleton ((Ucons D0));
   print_newline ();
   flush stdout;
   print_Nat (d1);
   print_newline ();
   flush stdout;
   print_Nat (d2);
   print_newline ();
   flush stdout;
   print_Nat (d3);
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
