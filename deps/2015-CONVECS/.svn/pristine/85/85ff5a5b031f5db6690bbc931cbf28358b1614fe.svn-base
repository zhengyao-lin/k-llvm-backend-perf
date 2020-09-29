type bool = True | False

and nat = D0 | S of nat

and natList = Nil | Cons of nat * natList

and natListPair = Pair of natList * natList ;;

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

and print_NatListPair (rec_x:natListPair) =
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

let rec not (rec_x1:bool) : bool =
   match rec_x1 with
   | True -> False
   | False -> True

and st (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0, (S n) -> True
   | (S n), D0 -> False
   | D0, D0 -> False
   | (S n), (S m) -> (st n  m)

and get (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | n, m -> (not (st n  m))

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

and split (rec_x1:nat) (rec_x2:natList) : natListPair =
   match rec_x1, rec_x2 with
   | n, (Cons (m, l)) when (st n  m) = True -> (Pair ((p1 (split n  l)), (Cons (m, (p2 (split n  l))))))
   | n, (Cons (m, l)) when (get n  m) = True -> (Pair ((Cons (m, (p1 (split n  l)))), (p2 (split n  l))))
   | n, Nil -> (Pair (Nil, Nil))

and append (rec_x1:natList) (rec_x2:natList) : natList =
   match rec_x1, rec_x2 with
   | (Cons (n, l)), lT -> (Cons (n, (append l  lT)))
   | Nil, l -> l

and qsort (rec_x1:natList) : natList =
   match rec_x1 with
   | Nil -> Nil
   | (Cons (n, l)) -> (append (qsort (p1 (split n  l)))  (Cons (n, (qsort (p2 (split n  l))))))

and p1 (rec_x1:natListPair) : natList =
   match rec_x1 with
   | (Pair (l1, l2)) -> l1

and p2 (rec_x1:natListPair) : natList =
   match rec_x1 with
   | (Pair (l1, l2)) -> l2
;;

let main () =
   print_NatList ((qsort (rev (times d10  (times d10  d10)))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
