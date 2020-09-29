type bool = True | False

and pos = D1 | CDub of bool * pos

and tree = Leaf of sNat | Node of sNat * sNat * tree * tree

and sNat = Z | S of sNat ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Pos (rec_x:pos) =
   match rec_x with
   | D1 ->
      print_string "D1"
   | CDub (rec_x1, rec_x2) ->
      print_string "CDub";
      print_string " (";
      print_Bool rec_x1;
      print_string ",";
      print_Pos rec_x2;
      print_string ")"

and print_Tree (rec_x:tree) =
   match rec_x with
   | Leaf rec_x1 ->
      print_string "Leaf";
      print_string " (";
      print_SNat rec_x1;
      print_string ")"
   | Node (rec_x1, rec_x2, rec_x3, rec_x4) ->
      print_string "Node";
      print_string " (";
      print_SNat rec_x1;
      print_string ",";
      print_SNat rec_x2;
      print_string ",";
      print_Tree rec_x3;
      print_string ",";
      print_Tree rec_x4;
      print_string ")"

and print_SNat (rec_x:sNat) =
   match rec_x with
   | Z ->
      print_string "Z"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_SNat rec_x1;
      print_string ")"
;;

let rec eqBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | True,b -> b
   | False,True -> False
   | False,False -> True

and xand (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | b,True -> b
   | b,False -> False

and eqPos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | D1,D1 -> True
   | D1,(CDub (b,p)) -> False
   | (CDub (b,p)),D1 -> False
   | (CDub (b,p)),(CDub (c,q)) -> (xand (eqBool b c)  (eqPos p q))

and lambda6 (rec_x1:sNat) : bool =
   match rec_x1 with
   | n -> (eq (evaltree17 n) (getval (buildtree n Z)))

and lambda5 (rec_x1:sNat) (rec_x2:tree) : tree =
   match rec_x1, rec_x2 with
   | n,left -> (lambda4 n left (getmax left) (getval left))

and lambda4 (rec_x1:sNat) (rec_x2:tree) (rec_x3:sNat) (rec_x4:sNat) : tree =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | n,left,max,o -> (lambda3 o left (buildtree n (succ17 max)))

and lambda3 (rec_x1:sNat) (rec_x2:tree) (rec_x3:tree) : tree =
   match rec_x1, rec_x2, rec_x3 with
   | n,left,right -> (lambda2 n left right (getval right) (getmax right))

and lambda2 (rec_x1:sNat) (rec_x2:tree) (rec_x3:tree) (rec_x4:sNat) (rec_x5:sNat) : tree =
   match rec_x1, rec_x2, rec_x3, rec_x4, rec_x5 with
   | n,left,right,o,max -> (lambda1 max left right (plus17 n o))

and lambda1 (rec_x1:sNat) (rec_x2:tree) (rec_x3:tree) (rec_x4:sNat) : tree =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | max,left,right,n -> (Node (n,max,left,right))

and lambda0 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | n,o -> (mult17 n o)

and eq (rec_x1:sNat) (rec_x2:sNat) : bool =
   match rec_x1, rec_x2 with
   | Z,Z -> True
   | Z,(S n) -> False
   | (S n),Z -> False
   | (S n),(S o) -> (eq n o)

and succ17 (rec_x1:sNat) : sNat =
   match rec_x1 with
   | n when (eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) = True -> Z
   | n when (eq n (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) = False -> (S n)

and pred17 (rec_x1:sNat) : sNat =
   match rec_x1 with
   | Z -> (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))
   | (S n) -> n

and plus17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | n,Z -> n
   | n,(S o) -> (succ17 (plus17 n o))

and mult17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | n,Z -> Z
   | n,(S o) -> (plus17 n (mult17 n o))

and exp17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | n,Z -> (succ17 Z)
   | n,(S o) -> (mult17 n (exp17 n o))

and evaltree17 (rec_x1:sNat) : sNat =
   match rec_x1 with
   | n -> (lambda0 (exp17 (S (S Z)) (pred17 n)) (pred17 (exp17 (S (S Z)) n)))

and getval (rec_x1:tree) : sNat =
   match rec_x1 with
   | (Leaf n) -> n
   | (Node (n,max,left,right)) -> n

and getmax (rec_x1:tree) : sNat =
   match rec_x1 with
   | (Leaf n) -> n
   | (Node (n,max,left,right)) -> max

and buildtree (rec_x1:sNat) (rec_x2:sNat) : tree =
   match rec_x1, rec_x2 with
   | Z,n -> (Leaf n)
   | (S n),o -> (lambda5 n (buildtree n o))
;;

let seventeen : sNat = (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S (S  (S (S (S (S  Z )))) ))))) ))))) ))))) ;;

let rec f (rec_x1:sNat) : bool =
   match rec_x1 with
   | n -> (lambda6 seventeen)
;;

let main () =
   print_Bool ((f seventeen));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
