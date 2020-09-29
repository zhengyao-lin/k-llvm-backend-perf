type nat = D0 | S of nat

and natList = Nil | L of nat | Ll of natList * natList

and natListList = NilP | P of natList | Pp of natListList * natListList ;;

let rec print_Nat (rec_x:nat) =
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
   | L rec_x1 ->
      print_string "L";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | Ll (rec_x1, rec_x2) ->
      print_string "Ll";
      print_string " (";
      print_NatList rec_x1;
      print_string ",";
      print_NatList rec_x2;
      print_string ")"

and print_NatListList (rec_x:natListList) =
   match rec_x with
   | NilP ->
      print_string "NilP"
   | P rec_x1 ->
      print_string "P";
      print_string " (";
      print_NatList rec_x1;
      print_string ")"
   | Pp (rec_x1, rec_x2) ->
      print_string "Pp";
      print_string " (";
      print_NatListList rec_x1;
      print_string ",";
      print_NatListList rec_x2;
      print_string ")"
;;

let rec perm (rec_x1:nat) : natListList =
   match rec_x1 with
   | D0 -> (ppreduce (P Nil)  NilP)
   | (S D0) -> (ppreduce (P (Ll ((L (S D0)), Nil)))  NilP)
   | (S n) -> (insert1 (S n)  (perm n))

and insert1 (rec_x1:nat) (rec_x2:natListList) : natListList =
   match rec_x1, rec_x2 with
   | n, (Pp ((P p1), ps)) -> (ppreduce (insert0 n  p1)  (insert1 n  ps))
   | n, (P p1) -> (insert0 n p1)
   | n, NilP -> NilP

and insert0 (rec_x1:nat) (rec_x2:natList) : natListList =
   match rec_x1, rec_x2 with
   | n, (Ll ((L m), p2)) -> (ppreduce (P (Ll ((L n), (Ll ((L m), p2)))))  (map_cons m  (insert0 n  p2)))
   | n, Nil -> (ppreduce (P (Ll ((L n), Nil)))  NilP)

and map_cons (rec_x1:nat) (rec_x2:natListList) : natListList =
   match rec_x1, rec_x2 with
   | m, (Pp ((P p1), ps)) -> (ppreduce (P (Ll ((L m), p1)))  (map_cons m  ps))
   | m, (P p1) -> (P (Ll ((L m), p1)))
   | m, NilP -> NilP

and ppreduce (rec_x1:natListList) (rec_x2:natListList) : natListList =
   match rec_x1, rec_x2 with
   | NilP, ps2 -> ps2
   | ps1, NilP -> ps1
   | ps1, ps2 -> (ppflat ps1  (ppflat ps2  NilP))

and ppflat (rec_x1:natListList) (rec_x2:natListList) : natListList =
   match rec_x1, rec_x2 with
   | NilP, accumulator -> accumulator
   | (P p1), accumulator -> (Pp ((P p1), accumulator))
   | (Pp (ps1, ps2)), accumulator -> (ppflat ps1  (ppflat ps2  accumulator))
;;

let main () =
   print_NatListList ((perm (S (S (S (S (S (S D0))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
