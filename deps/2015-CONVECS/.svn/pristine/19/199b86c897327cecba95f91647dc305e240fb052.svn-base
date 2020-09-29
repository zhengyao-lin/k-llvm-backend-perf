type nat = D0 | S of nat | P | N ;;

let rec print_Nat (rec_x:nat) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | P ->
      print_string "P"
   | N ->
      print_string "N"
;;

let d1 : nat = (S D0) ;;

let rec c (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0, y -> y
   | (S x), y -> (S (c x y))

and f (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) (rec_x4:nat) (rec_x5:nat) : nat =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | x, y, (S z), t, u -> (f x  y  z  (c t  t)  u)
   | x, (S y), D0, t, u -> (f x  y  P  t  t)
   | (S x), D0, D0, t, u -> (f x  N  P  d1  D0)
   | D0, D0, D0, t, u -> t
   | x, (S y), P, t, u -> (f x  y  P  t  (S u))
   | x, D0, P, t, u -> (f x  N  P  (S t)  u)
   | (S x), N, P, t, u -> (f x  N  P  t  u)
   | D0, N, P, t, u -> u
;;

let main () =
   print_Nat ((f (S (S (S (S (S (S D0))))))  (S (S (S (S (S D0)))))  (S (S D0))  D0  d1));
   print_newline ();
   flush stdout;
   print_Nat ((f (S (S (S (S D0))))  (S (S (S D0)))  (S (S (S (S (S D0)))))  D0  d1));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
