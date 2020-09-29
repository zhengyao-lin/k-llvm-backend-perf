type nat = D0 | S of nat

and set = Empty | Singleton of nat | Union of set * set ;;

let rec print_Nat (rec_x:nat) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"

and print_Set (rec_x:set) =
   match rec_x with
   | Empty ->
      print_string "Empty"
   | Singleton rec_x1 ->
      print_string "Singleton";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | Union (rec_x1, rec_x2) ->
      print_string "Union";
      print_string " (";
      print_Set rec_x1;
      print_string ",";
      print_Set rec_x2;
      print_string ")"
;;

let rec plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> n
   | (S n), m -> (S (plus n  m))

and times (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, n -> D0
   | (S n), m -> (plus m  (times n  m))

and u (rec_x1:set) (rec_x2:set) : set =
   match rec_x1, rec_x2 with
   | Empty, s0 -> s0
   | s0, Empty -> s0
   | s0, s1 when s0 = s1 -> s0
   | s0, s1 when s0 <> s1 -> (flat s0  (flat s1  Empty))

and flat (rec_x1:set) (rec_x2:set) : set =
   match rec_x1, rec_x2 with
   | Empty, s0 -> s0
   | (Singleton i), s0 -> (Union ((Singleton i), s0))
   | (Union (s1, s2)), s0 -> (flat s1  (flat s2  s0))

and add (rec_x1:set) (rec_x2:set) : set =
   match rec_x1, rec_x2 with
   | Empty, s0 -> s0
   | s0, Empty -> s0
   | (Singleton i), (Singleton j) -> (Singleton (plus i  j))
   | (Singleton i), (Union ((Singleton j), s0)) -> (add (Singleton (plus i  j))  s0)
   | (Union ((Singleton i), s1)), s2 -> (u (add (Singleton i)  s2)  (add s1  s2))

and mult (rec_x1:set) (rec_x2:set) : set =
   match rec_x1, rec_x2 with
   | Empty, s0 -> s0
   | s0, Empty -> s0
   | (Singleton i), (Singleton j) -> (Singleton (times i  j))
   | (Union ((Singleton i), s1)), s2 -> (u (mult (Singleton i)  s2)  (mult s1  s2))
;;

let five : nat = (S (S (S (S (S D0))))) ;;

let ten : nat = (S (S (S (S (S five))))) ;;

let fifteen : nat = (S (S (S (S (S ten))))) ;;

let twentyfive : nat = (S (S (S (S (S (S (S (S (S (S fifteen)))))))))) ;;

let fifty : nat = (plus twentyfive  twentyfive) ;;

let singles : set = (add (Singleton (S D0))  (add (Singleton (S (S D0)))  (add (Singleton (S (S (S D0)))) (add (Singleton (S (S (S (S D0)))))  (add (Singleton five) (add (Singleton (S five))  (add (Singleton (S (S five))) (add (Singleton (S (S (S five))))  (add (Singleton (S (S (S (S five)))))  (add (Singleton ten)  (add (Singleton (S ten))  (add (Singleton (S (S ten))) (add (Singleton (S (S (S ten))))  (add (Singleton (S (S (S (S ten)))))  (add (Singleton fifteen) (add (Singleton (S fifteen))  (add (Singleton (S (S fifteen)))  (add (Singleton (S (S (S fifteen))))  (add (Singleton (S (S (S (S fifteen)))))  (Singleton (plus five  fifteen))))))))))))))))))))) ;;

let doubles : set = (mult singles  (Singleton (S (S D0)))) ;;

let triples : set = (mult singles  (Singleton (S (S (S D0))))) ;;

let allops : set = (u (u (u (u (u singles  doubles)  triples)  (Singleton twentyfive))  (Singleton fifty))  (Singleton D0)) ;;

let finish : set = (add (u doubles  (Singleton fifty))  (add allops  allops)) ;;

let main () =
   print_Set (finish);
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
