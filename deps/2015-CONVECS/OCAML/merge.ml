type bool = True | False

and strg = A | B | C of strg * strg

and list = Nil | L of strg * list ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Strg (rec_x:strg) =
   match rec_x with
   | A ->
      print_string "A"
   | B ->
      print_string "B"
   | C (rec_x1, rec_x2) ->
      print_string "C";
      print_string " (";
      print_Strg rec_x1;
      print_string ",";
      print_Strg rec_x2;
      print_string ")"

and print_List (rec_x:list) =
   match rec_x with
   | Nil ->
      print_string "Nil"
   | L (rec_x1, rec_x2) ->
      print_string "L";
      print_string " (";
      print_Strg rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
;;

let rec gte (rec_x1:strg) (rec_x2:strg) : bool =
   match rec_x1, rec_x2 with
   | B, A -> True
   | A, B -> False
   | A, A -> True
   | B, B -> True
   | (C (e, s)), e2 -> (gte e  e2)
   | e, (C (e2, s2)) when e = e2 -> False
   | e, (C (e2, s2)) when e <> e2 -> (gte e  e2)

and merge (rec_x1:list) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | Nil, l1 -> l1
   | l1, Nil -> l1
   | (L (s, l1)), (L (s2, l2)) when (gte s  s2) = True -> (L (s2, (merge (L (s, l1))  l2)))
   | (L (s, l1)), (L (s2, l2)) when (gte s  s2) = False -> (L (s, (merge l1  (L (s2, l2)))))

and odd (rec_x1:list) : list =
   match rec_x1 with
   | Nil -> Nil
   | (L (s, Nil)) -> (L (s, Nil))
   | (L (s, (L (s2, l1)))) -> (L (s, (odd l1)))

and even (rec_x1:list) : list =
   match rec_x1 with
   | Nil -> Nil
   | (L (s, Nil)) -> Nil
   | (L (s, (L (s2, l1)))) -> (L (s2, (even l1)))

and sort (rec_x1:list) : list =
   match rec_x1 with
   | Nil -> Nil
   | (L (s, Nil)) -> (L (s, Nil))
   | (L (s, (L (s2, l1)))) -> (merge (sort (odd (L (s, (L (s2, l1))))))  (sort (even (L (s, (L (s2, l1)))))))
;;

let main () =
   print_List ((sort (L ((C (A, (C (B, (C (A, B)))))), (L ((C (B, (C (A, (C (B, B)))))), (L ((C (A, (C (B, (C (A, A)))))), (L ((C (B, (C (B, (C (B, B)))))), (L ((C (B, (C (B, (C (B, A)))))),(L ((C (A, (C (A, (C (A, B)))))), (L ((C (B, (C (B, (C (A, A)))))), (L ((C (A, (C (A, (C (A, A)))))), (L ((C (A, (C (A, (C (B, B)))))), (L ((C (B, (C (A, (C (B, A)))))),(L ((C (A, (C (B, (C (A, B)))))), (L ((C (B, (C (A, (C (B, B)))))), (L ((C (A, (C (B, (C (A, A)))))), (L ((C (B, (C (B, (C (B, B)))))), (L ((C (B, (C (B, (C (B, A)))))),(L ((C (A, (C (A, (C (A, B)))))), (L ((C (B, (C (B, (C (A, A)))))), (L ((C (A, (C (A, (C (A, A)))))), (L ((C (A, (C (A, (C (B, B)))))), (L ((C (B, (C (A, (C (B, A)))))),(L ((C (A, (C (B, (C (A, B)))))), (L ((C (B, (C (A, (C (B, B)))))), (L ((C (A, (C (B, (C (A, A)))))), (L ((C (B, (C (B, (C (B, B)))))), (L ((C (B, (C (B, (C (B, A)))))),(L ((C (A, (C (A, (C (A, B)))))), (L ((C (B, (C (B, (C (A, A)))))), (L ((C (A, (C (A, (C (A, A)))))), (L ((C (A, (C (A, (C (B, B)))))), (L ((C (B, (C (A, (C (B, A)))))),(L ((C (A, (C (B, (C (A, B)))))), (L ((C (B, (C (A, (C (B, B)))))), (L ((C (A, (C (B, (C (A, A)))))), (L ((C (B, (C (B, (C (B, B)))))), (L ((C (B, (C (B, (C (B, A)))))),(L ((C (A, (C (A, (C (A, B)))))), (L ((C (B, (C (B, (C (A, A)))))), (L ((C (A, (C (A, (C (A, A)))))), (L ((C (A, (C (A, (C (B, B)))))), (L ((C (B, (C (A, (C (B, A)))))), (L ((C (A, (C (B, (C (A, B)))))), (L ((C (B, (C (A, (C (B, B)))))), (L ((C (A, (C (B, (C (A, A)))))), (L ((C (B, (C (B, (C (B, B)))))), (L ((C (B, (C (B, (C (B, A)))))), (L ((C (A, (C (A, (C (A, B)))))), (L ((C (B, (C (B, (C (A, A)))))), (L ((C (A, (C (A, (C (A, A)))))), (L ((C (A, (C (A, (C (B, B)))))), (L ((C (B, (C (A, (C (B, A)))))),Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
