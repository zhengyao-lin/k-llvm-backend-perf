type list = L of elt * list | Nil

and elt = A | B | C | D | E ;;

let rec print_List (rec_x:list) =
   match rec_x with
   | L (rec_x1, rec_x2) ->
      print_string "L";
      print_string " (";
      print_Elt rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
   | Nil ->
      print_string "Nil"

and print_Elt (rec_x:elt) =
   match rec_x with
   | A ->
      print_string "A"
   | B ->
      print_string "B"
   | C ->
      print_string "C"
   | D ->
      print_string "D"
   | E ->
      print_string "E"
;;

let rec conc (rec_x1:list) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | (L (e0, l1)), l2 -> (L (e0, (conc l1  l2)))
   | Nil, l2 -> l2

and dup (rec_x1:list) : list =
   match rec_x1 with
   | l1 -> (conc l1  l1)

and rev (rec_x1:list) : list =
   match rec_x1 with
   | (L (e0, l1)) -> (conc (rev l1)  (L (e0, Nil)))
   | Nil -> Nil
;;

let main () =
   print_List ((rev (dup (L (A, (L (B, (L (C, (L (D, (L (E, Nil)))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
