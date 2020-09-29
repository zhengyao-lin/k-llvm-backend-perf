type bool = True | False

and nat = D0 | S of nat

and int = Pos of nat | Neg of nat ;;

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

and print_Int (rec_x:int) =
   match rec_x with
   | Pos rec_x1 ->
      print_string "Pos";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | Neg rec_x1 ->
      print_string "Neg";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
;;

let rec gte (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0, D0 -> True
   | (S x), D0 -> True
   | D0, (S x) -> False
   | (S x), (S y) -> (gte x  y)

and gte_Int (rec_x1:int) (rec_x2:int) : bool =
   match rec_x1, rec_x2 with
   | (Pos x), (Pos y) -> (gte x y)
   | (Neg x), (Neg y) -> (gte y x)
   | (Pos x), (Neg y) -> True
   | (Neg x), (Pos y) -> False

and pred (rec_x1:int) : int =
   match rec_x1 with
   | (Pos D0) -> (Neg D0)
   | (Pos (S x)) -> (Pos x)
   | (Neg x) -> (Neg (S x))

and succ (rec_x1:int) : int =
   match rec_x1 with
   | (Neg D0) -> (Pos D0)
   | (Neg (S x)) -> (Neg x)
   | (Pos x) -> (Pos (S x))

and tak (rec_x1:int) (rec_x2:int) (rec_x3:int) : int =
   match rec_x1, rec_x2, rec_x3 with
   | i, j, k when (gte_Int j  i) = True -> k
   | i, j, k when (gte_Int j  i) = False -> (tak (tak (pred i)  j  k)  (tak (pred j)  k  i)  (tak (pred k)  i  j))
;;

let main () =
   print_Int ((tak (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))))))))))))))))))))  (Pos (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))))))))  (Pos (S (S (S (S (S (S (S (S (S (S (S (S D0)))))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
