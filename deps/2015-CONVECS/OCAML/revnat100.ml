type list = L of nat * list | Nil

and nat = D0 | S of nat ;;

let rec print_List (rec_x:list) =
   match rec_x with
   | L (rec_x1, rec_x2) ->
      print_string "L";
      print_string " (";
      print_Nat rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
   | Nil ->
      print_string "Nil"

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

let d10 : nat = (S (S (S (S (S (S (S (S (S (S D0)))))))))) ;;

let rec plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> n
   | (S n), m -> (S (plus n  m))

and times (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> D0
   | (S n), m -> (plus m  (times n  m))

and gen (rec_x1:nat) : list =
   match rec_x1 with
   | (S n) -> (L ((S n), (gen n)))
   | D0 -> (L (D0, Nil))

and conc (rec_x1:list) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | (L (e, l1)), l2 -> (L (e, (conc l1  l2)))
   | Nil, l2 -> l2

and rev (rec_x1:list) : list =
   match rec_x1 with
   | (L (e, l1)) -> (conc (rev l1)  (L (e, Nil)))
   | Nil -> Nil
;;

let main () =
   print_List ((rev (gen (times d10  d10))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
