type bool = True | False

and nat = D0 | S of nat

and natList = Nil | Cons of nat * natList ;;

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
;;

let d10 : nat = (S (S (S (S (S (S (S (S (S (S D0)))))))))) ;;

let rec lt (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0,D0 -> False
   | D0, (S n) -> True
   | (S n), D0 -> False
   | (S n), (S m) -> (lt n  m)

and plus (rec_x1:nat) (rec_x2:nat) : nat =
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

and rev (rec_x1:nat) : natList =
   match rec_x1 with
   | (S n) -> (bubsort (S n)  (rev n))
   | D0 -> (Cons (D0, Nil))

and bubsort (rec_x1:nat) (rec_x2:natList) : natList =
   match rec_x1, rec_x2 with
   | n, Nil -> (Cons (n, Nil))
   | n, (Cons (m, l)) when (lt m  n) = True -> (Cons (m, (bubsort n  l)))
   | n, (Cons (m, l)) when (lt m  n) = False -> (Cons (n, (bubsort m  l)))
;;

let main () =
   print_NatList ((rev (fact (S (S (S (S (S (S D0)))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
