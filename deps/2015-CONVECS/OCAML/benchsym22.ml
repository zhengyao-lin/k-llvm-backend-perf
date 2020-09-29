type boolean = True | False

and nat = Zero | S of nat

and sNat = Exz | Exone | Exs of sNat | Explus of sNat * sNat | Exmult of sNat * sNat | Exexp of sNat * sNat

and tree = Leaf of nat | Node of nat * nat * tree * tree ;;

let rec print_Boolean (rec_x:boolean) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Nat (rec_x:nat) =
   match rec_x with
   | Zero ->
      print_string "Zero"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"

and print_SNat (rec_x:sNat) =
   match rec_x with
   | Exz ->
      print_string "Exz"
   | Exone ->
      print_string "Exone"
   | Exs rec_x1 ->
      print_string "Exs";
      print_string " (";
      print_SNat rec_x1;
      print_string ")"
   | Explus (rec_x1, rec_x2) ->
      print_string "Explus";
      print_string " (";
      print_SNat rec_x1;
      print_string ",";
      print_SNat rec_x2;
      print_string ")"
   | Exmult (rec_x1, rec_x2) ->
      print_string "Exmult";
      print_string " (";
      print_SNat rec_x1;
      print_string ",";
      print_SNat rec_x2;
      print_string ")"
   | Exexp (rec_x1, rec_x2) ->
      print_string "Exexp";
      print_string " (";
      print_SNat rec_x1;
      print_string ",";
      print_SNat rec_x2;
      print_string ")"

and print_Tree (rec_x:tree) =
   match rec_x with
   | Leaf rec_x1 ->
      print_string "Leaf";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | Node (rec_x1, rec_x2, rec_x3, rec_x4) ->
      print_string "Node";
      print_string " (";
      print_Nat rec_x1;
      print_string ",";
      print_Nat rec_x2;
      print_string ",";
      print_Tree rec_x3;
      print_string ",";
      print_Tree rec_x4;
      print_string ")"
;;

let rec yor (rec_x1:boolean) (rec_x2:boolean) : boolean =
   match rec_x1, rec_x2 with
   | True, b -> True
   | False, b -> b

and xand (rec_x1:boolean) (rec_x2:boolean) : boolean =
   match rec_x1, rec_x2 with
   | True, b -> b
   | False, b -> False

and neg (rec_x1:boolean) : boolean =
   match rec_x1 with
   | False -> True
   | True -> False
;;

let d0 : nat = Zero ;;

let d1 : nat = (S d0) ;;

let d2 : nat = (S d1) ;;

let d3 : nat = (S d2) ;;

let d4 : nat = (S d3) ;;

let d5 : nat = (S d4) ;;

let d6 : nat = (S d5) ;;

let d7 : nat = (S d6) ;;

let d8 : nat = (S d7) ;;

let d9 : nat = (S d8) ;;

let d10 : nat = (S d9) ;;

let d11 : nat = (S d10) ;;

let d12 : nat = (S d11) ;;

let d13 : nat = (S d12) ;;

let d14 : nat = (S d13) ;;

let d15 : nat = (S d14) ;;

let d16 : nat = (S d15) ;;

let d17 : nat = (S d16) ;;

let one : sNat = (Exs Exz) ;;

let two : sNat = (Exs one) ;;

let three : sNat = (Exs two) ;;

let four : sNat = (Exs three) ;;

let five : sNat = (Exs four) ;;

let six : sNat = (Exs five) ;;

let seven : sNat = (Exs six) ;;

let eight : sNat = (Exs seven) ;;

let nine : sNat = (Exs eight) ;;

let ten : sNat = (Exs nine) ;;

let eleven : sNat = (Exs ten) ;;

let twelve : sNat = (Exs eleven) ;;

let thirteen : sNat = (Exs twelve) ;;

let fourteen : sNat = (Exs thirteen) ;;

let fifteen : sNat = (Exs fourteen) ;;

let sixteen : sNat = (Exs fifteen) ;;

let seventeen : sNat = (Exs sixteen) ;;

let eighteen : sNat = (Exs seventeen) ;;

let nineteen : sNat = (Exs eighteen) ;;

let twenty : sNat = (Exs nineteen) ;;

let twentyone : sNat = (Exs twenty) ;;

let twentytwo : sNat = (Exs twentyone) ;;

let twentythree : sNat = (Exs twentytwo) ;;

let twentyfour : sNat = (Exs twentythree) ;;

let twentyfive : sNat = (Exs twentyfour) ;;

let twentysix : sNat = (Exs twentyfive) ;;

let twentyseven : sNat = (Exs twentysix) ;;

let twentyeight : sNat = (Exs twentyseven) ;;

let twentynine : sNat = (Exs twentyeight) ;;

let thirty : sNat = (Exs twentynine) ;;

let thirtyone : sNat = (Exs thirty) ;;

let thirtytwo : sNat = (Exs thirtyone) ;;

let thirtythree : sNat = (Exs thirtytwo) ;;

let thirtyfour : sNat = (Exs thirtythree) ;;

let thirtyfive : sNat = (Exs thirtyfour) ;;

let rec dec (rec_x1:sNat) : sNat =
   match rec_x1 with
   | (Exexp (xs,Exz)) -> (Exs Exz)
   | (Exexp (xs,(Exs ys))) -> (Exmult ((Exexp (xs,ys)),xs))
   | (Exexp (xs,(Explus (ys,zs)))) -> (Exmult ((Exexp (xs,ys)),(Exexp (xs,zs))))
   | (Exexp (xs,(Exmult (ys,zs)))) -> (dec (Exexp ((Exexp (xs,ys)),zs)))
   | (Exexp (xs,(Exexp (ys,zs)))) -> (dec (Exexp (xs, (dec (Exexp (ys,zs))))))

and benchevalsym17 (rec_x1:sNat) : boolean =
   match rec_x1 with
   | xs -> (equal (eval17 (Exexp (two, xs)))  (evalsym17 (Exexp (two, xs))))

and benchevalexp17 (rec_x1:sNat) : boolean =
   match rec_x1 with
   | xs -> (equal (eval17 (Exexp (two, xs)))  (evalexp17 (Exexp (two, xs))))

and benchevaltree17 (rec_x1:sNat) : boolean =
   match rec_x1 with
   | xs -> (equal (calctree17 (eval xs))  (getval (buildtree (eval xs)  Zero)))

and equal (rec_x1:nat) (rec_x2:nat) : boolean =
   match rec_x1, rec_x2 with
   | Zero, Zero -> True
   | Zero, (S x) -> False
   | (S x), Zero -> False
   | (S x), (S y) -> (equal x  y)

and less (rec_x1:nat) (rec_x2:nat) : boolean =
   match rec_x1, rec_x2 with
   | Zero, y -> True
   | (S x), (S y) -> (less x  y)
   | (S x), Zero -> False

and plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> x
   | x, (S y) -> (S (plus x  y))

and mult (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> Zero
   | x, (S y) -> (plus (mult x  y)  x)

and exp (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> (S Zero)
   | x, (S y) -> (mult x  (exp x  y))

and succ17 (rec_x1:nat) : nat =
   match rec_x1 with
   | (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))))) -> Zero
   | (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))) -> (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))))
   | (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))) -> (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))))
   | (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))) -> (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))
   | (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))) -> (S (S (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))))
   | (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))) -> (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))
   | (S (S (S (S (S (S (S (S (S (S Zero)))))))))) -> (S (S (S (S (S (S (S (S (S (S (S Zero)))))))))))
   | (S (S (S (S (S (S (S (S (S Zero))))))))) -> (S (S (S (S (S (S (S (S (S (S Zero))))))))))
   | (S (S (S (S (S (S (S (S Zero)))))))) -> (S (S (S (S (S (S (S (S (S Zero)))))))))
   | (S (S (S (S (S (S (S Zero))))))) -> (S (S (S (S (S (S (S (S Zero))))))))
   | (S (S (S (S (S (S Zero)))))) -> (S (S (S (S (S (S (S Zero)))))))
   | (S (S (S (S (S Zero))))) -> (S (S (S (S (S (S Zero))))))
   | (S (S (S (S Zero)))) -> (S (S (S (S (S Zero)))))
   | (S (S (S Zero))) -> (S (S (S (S Zero))))
   | (S (S Zero)) -> (S (S (S Zero)))
   | (S Zero) -> (S (S Zero))
   | Zero -> (S Zero)

and pred17 (rec_x1:nat) : nat =
   match rec_x1 with
   | (S x) -> x
   | Zero -> (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Zero))))))))))))))))

and plus17 (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> x
   | x, (S y) -> (succ17 (plus17 x  y))

and mult17 (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> Zero
   | x, (S y) -> (plus17 x  (mult17 x  y))

and exp17 (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | x, Zero -> (succ17 Zero)
   | x, (S y) -> (mult17 x  (exp17 x  y))

and eval (rec_x1:sNat) : nat =
   match rec_x1 with
   | Exz -> Zero
   | (Exs xs) -> (S (eval xs))
   | (Explus (xs, ys)) -> (plus (eval xs)  (eval ys))
   | (Exmult (xs, ys)) -> (mult (eval xs)  (eval ys))
   | (Exexp (xs, ys)) -> (exp (eval xs)  (eval ys))

and eval17 (rec_x1:sNat) : nat =
   match rec_x1 with
   | Exz -> Zero
   | Exone -> (S Zero)
   | (Exs xs) -> (succ17 (eval17 xs))
   | (Explus (xs, ys)) -> (plus17 (eval17 xs)  (eval17 ys))
   | (Exmult (xs, ys)) -> (mult17 (eval17 xs)  (eval17 ys))
   | (Exexp (xs, ys)) -> (exp17 (eval17 xs)  (eval ys))

and evalsym17 (rec_x1:sNat) : nat =
   match rec_x1 with
   | Exz -> Zero
   | (Exs xs) -> (succ17 (evalsym17 xs))
   | (Explus (xs, ys)) -> (plus17 (evalsym17 xs)  (evalsym17 ys))
   | (Exmult (xs, Exz)) -> Zero
   | (Exmult (xs, (Exs ys))) -> (evalsym17 (Explus ((Exmult (xs, ys)), xs)))
   | (Exmult (xs, (Explus (ys, zs)))) -> (evalsym17 (Explus ((Exmult (xs, ys)), (Exmult (xs, zs)))))
   | (Exmult (xs, (Exmult (ys, zs)))) -> (evalsym17 (Exmult ((Exmult (xs, ys)), zs)))
   | (Exmult (xs, (Exexp (ys, zs)))) -> (evalsym17 (Exmult (xs, (dec (Exexp (ys, zs))))))
   | (Exexp (xs, Exz)) -> (succ17 Zero)
   | (Exexp (xs, (Exs ys))) -> (evalsym17 (Exmult ((Exexp (xs, ys)), xs)))
   | (Exexp (xs, (Explus (ys, zs)))) -> (evalsym17 (Exmult ((Exexp (xs, ys)), (Exexp (xs, zs)))))
   | (Exexp (xs, (Exmult (ys, zs)))) -> (evalsym17 (Exexp ((Exexp (xs, ys)), zs)))
   | (Exexp (xs, (Exexp (ys, zs)))) -> (evalsym17 (Exexp (xs, (dec (Exexp (ys, zs))))))

and evalexp17 (rec_x1:sNat) : nat =
   match rec_x1 with
   | xs -> (eval17 (expand xs))

and getval (rec_x1:tree) : nat =
   match rec_x1 with
   | (Leaf xval) -> xval
   | (Node (xval, max, left, right)) -> xval

and getmax (rec_x1:tree) : nat =
   match rec_x1 with
   | (Leaf xval) -> xval
   | (Node (xval, max, left, right)) -> max

and calctree17 (rec_x1:nat) : nat =
   match rec_x1 with
   | x -> (mult17 (exp17 (S (S Zero))  (pred17 x))  (pred17 (exp17 (S (S Zero))  x)))

and nat2sym (rec_x1:nat) : sNat =
   match rec_x1 with
   | Zero -> Exz
   | (S x) -> (Exs (nat2sym x))

and expand (rec_x1:sNat) : sNat =
   match rec_x1 with
   | Exz -> Exz
   | Exone -> Exone
   | (Exs xs) -> (Explus (Exone, (expand xs)))
   | (Explus (xs, ys)) -> (Explus ((expand xs), (expand ys)))
   | (Exmult (xs, Exz)) -> Exz
   | (Exmult (xs, Exone)) -> (expand xs)
   | (Exmult (xs, (Explus (ys, zs)))) -> (expand (Explus ((Exmult (xs, ys)), (Exmult (xs, zs)))))
   | (Exmult (xs, (Exs ys))) -> (expand (Exmult (xs, (expand (Exs ys)))))
   | (Exmult (xs, (Exmult (ys,zs)))) -> (expand (Exmult (xs, (expand (Exmult (ys,zs))))))
   | (Exmult (xs, (Exexp (ys,zs)))) -> (expand (Exmult (xs, (expand (Exexp (ys,zs))))))
   | (Exexp (xs, Exz)) -> Exone
   | (Exexp (xs, Exone)) -> (expand xs)
   | (Exexp (xs, (Explus (ys, zs)))) -> (expand (Exmult ((Exexp (xs, ys)), (Exexp (xs, zs)))))
   | (Exexp (xs, (Exs ys))) -> (expand (Exexp (xs, (expand (Exs ys)))))
   | (Exexp (xs, (Exmult (ys,zs)))) -> (expand (Exexp (xs, (expand (Exmult (ys,zs))))))
   | (Exexp (xs, (Exexp (ys,zs)))) -> (expand (Exexp (xs, (expand (Exexp (ys,zs))))))

and buildtree (rec_x1:nat) (rec_x2:nat) : tree =
   match rec_x1, rec_x2 with
   | Zero, xval -> (Leaf xval)
   | (S x), y -> (Node ((plus17 (getval (buildtree x  y)) (getval (buildtree x  (succ17 (getmax (buildtree x  y)))))), (getmax (buildtree x  (succ17 (getmax (buildtree x  y))))), (buildtree x  y),(buildtree x  (succ17 (getmax (buildtree x  y))))))
;;

let main () =
   print_Boolean ((benchevalsym17 twentytwo));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
