type bool = True | False

and nat = D0 | S of nat

and natList = Nil | Cons of nat * natList

and listPair = Pair of natList * natList ;;

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

and print_NatList (rec_x:natList) =
   match rec_x with
   | Nil ->
      print_string "Nil"
   | Cons (rec_x1, rec_x2) ->
      print_string "Cons";
      print_string " (";
      print_Nat rec_x1;
      print_string ",";
      print_NatList rec_x2;
      print_string ")"

and print_ListPair (rec_x:listPair) =
   match rec_x with
   | Pair (rec_x1, rec_x2) ->
      print_string "Pair";
      print_string " (";
      print_NatList rec_x1;
      print_string ",";
      print_NatList rec_x2;
      print_string ")"
;;

let d10 : nat = (S (S (S (S (S (S (S (S (S (S D0)))))))))) ;;

let rec lte (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0, (S n) -> True
   | (S n), D0 -> False
   | D0, D0 -> True
   | (S n), (S m) -> (lte n  m)

and plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> n
   | (S n), m -> (S (plus n  m))

and times (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> D0
   | (S n), m -> (plus m  (times n  m))

and rev (rec_x1:nat) : natList =
   match rec_x1 with
   | (S n) -> (Cons ((S n), (rev n)))
   | D0 -> (Cons (D0, Nil))

and merge (rec_x1:natList) (rec_x2:natList) : natList =
   match rec_x1, rec_x2 with
   | Nil, l -> l
   | l, Nil -> l
   | (Cons (x, l1)), (Cons (y, l2)) when (lte x  y) = True -> (Cons (x, (merge l1  (Cons (y, l2)))))
   | (Cons (x, l1)), (Cons (y, l2)) when (lte x  y) = False -> (Cons (y, (merge (Cons (x, l1))  l2)))

and split (rec_x1:natList) : listPair =
   match rec_x1 with
   | (Cons (x, (Cons (y, l)))) -> (Pair ((Cons (x, (p1 (split l)))), (Cons (y, (p2 (split l))))))
   | Nil -> (Pair (Nil, Nil))
   | (Cons (x, Nil)) -> (Pair ((Cons (x, Nil)), Nil))

and mergesort (rec_x1:natList) : natList =
   match rec_x1 with
   | Nil -> Nil
   | (Cons (x, Nil)) -> (Cons (x, Nil))
   | (Cons (x, (Cons (y, l)))) -> (merge (mergesort (Cons (x, (p1 (split l)))))  (mergesort (Cons (y, (p2 (split l))))))

and p1 (rec_x1:listPair) : natList =
   match rec_x1 with
   | (Pair (l1, l2)) -> l1

and p2 (rec_x1:listPair) : natList =
   match rec_x1 with
   | (Pair (l1, l2)) -> l2
;;

let main () =
   print_NatList ((mergesort (rev (times d10  (times d10  d10)))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
