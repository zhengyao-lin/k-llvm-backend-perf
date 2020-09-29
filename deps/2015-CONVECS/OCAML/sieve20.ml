type bool = True | False

and nat = S of nat | Z

and digit = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9

and list = Nil | D of digit | Dl of digit * list | L of nat * list | Ll of list * list ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Nat (rec_x:nat) =
   match rec_x with
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | Z ->
      print_string "Z"

and print_Digit (rec_x:digit) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | D1 ->
      print_string "D1"
   | D2 ->
      print_string "D2"
   | D3 ->
      print_string "D3"
   | D4 ->
      print_string "D4"
   | D5 ->
      print_string "D5"
   | D6 ->
      print_string "D6"
   | D7 ->
      print_string "D7"
   | D8 ->
      print_string "D8"
   | D9 ->
      print_string "D9"

and print_List (rec_x:list) =
   match rec_x with
   | Nil ->
      print_string "Nil"
   | D rec_x1 ->
      print_string "D";
      print_string " (";
      print_Digit rec_x1;
      print_string ")"
   | Dl (rec_x1, rec_x2) ->
      print_string "Dl";
      print_string " (";
      print_Digit rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
   | L (rec_x1, rec_x2) ->
      print_string "L";
      print_string " (";
      print_Nat rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
   | Ll (rec_x1, rec_x2) ->
      print_string "Ll";
      print_string " (";
      print_List rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
;;

let two : nat = (S (S Z)) ;;

let ten : nat = (S (S (S (S (S (S (S (S (S (S Z)))))))))) ;;

let digitList : list = (Dl (D0, (Dl (D1, (Dl (D2, (Dl (D3, (Dl (D4, (Dl (D5, (Dl (D6, (Dl (D7, (Dl (D8, (Dl (D9, Nil)))))))))))))))))))) ;;

let rec ifNat (rec_x1:bool) (rec_x2:nat) (rec_x3:nat) : nat =
   match rec_x1, rec_x2, rec_x3 with
   | True, n, m -> n
   | False, n, m -> m

and conv (rec_x1:nat) : list =
   match rec_x1 with
   | x when (lt x  ten) = True -> (Dl ((digit x), Nil))
   | x when (lt x  ten) = False -> (ap (conv (div x  ten))  (conv (rem x  ten)))

and rem (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, y when y <> Z -> (ifNat (lt x  y)  x  (rem (sub x  y)  y))

and div (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, y when y <> Z -> (ifNat (lt x  y)  Z  (S (div (sub x  y)  y)))

and lt (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | Z, (S x) -> True
   | x, Z -> False
   | (S x), (S y) -> (lt x  y)

and sub (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | Z, (S y) -> Z
   | x, Z -> x
   | (S x), (S y) -> (sub x  y)

and digit (rec_x1:nat) : digit =
   match rec_x1 with
   | x -> (find digitList  x)

and find (rec_x1:list) (rec_x2:nat) : digit =
   match rec_x1, rec_x2 with
   | (Dl (dig, l1)), Z -> dig
   | (Dl (dig, l1)), (S x) -> (find l1  x)

and ap (rec_x1:list) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | Nil, l1 -> l1
   | (Dl (dig, l1)), l2 -> (Dl (dig, (ap l1  l2)))

and add (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | Z, y -> y
   | (S x), y -> (S (add x  y))

and mult (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | Z, y -> Z
   | (S x), y -> (add y  (mult x  y))

and fact (rec_x1:nat) : nat =
   match rec_x1 with
   | Z -> (S Z)
   | (S x) -> (mult (S x)  (fact x))

and divides (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | n, m when m <> Z -> (auxdiv n  m  m)

and auxdiv (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) : bool =
   match rec_x1, rec_x2, rec_x3 with
   | Z, Z, m -> True
   | Z, (S x), m -> False
   | (S x), (S y), m -> (auxdiv x  y  m)
   | (S x), Z, m -> (auxdiv (S x)  m  m)

and intsBetween (rec_x1:nat) (rec_x2:nat) : list =
   match rec_x1, rec_x2 with
   | n, m when n = m -> Nil
   | n, m when n <> m -> (L (n, (intsBetween (S n)  m)))

and sieve (rec_x1:list) : list =
   match rec_x1 with
   | (L (n, l1)) -> (L (n, (sieve (filter l1  n))))
   | Nil -> Nil

and filter (rec_x1:list) (rec_x2:nat) : list =
   match rec_x1, rec_x2 with
   | (L (n, l1)), m when (divides n  m) = True -> (filter l1  m)
   | (L (n, l1)), m when (divides n  m) = False -> (L (n, (filter l1  m)))
   | Nil, m -> Nil

and e (rec_x1:nat) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | n, l1 -> (Ll ((conv n), l1))
;;

let main () =
   print_List ((sieve (intsBetween (S (S Z))  (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
