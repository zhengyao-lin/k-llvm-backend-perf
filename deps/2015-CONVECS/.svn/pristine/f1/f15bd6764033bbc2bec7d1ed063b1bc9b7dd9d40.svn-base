type bool = T | F

and pos = One | CDub of bool * pos

and int = CInt of nat | CNeg of pos

and nat = Zero | CNat of pos ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | T ->
      print_string "T"
   | F ->
      print_string "F"

and print_Pos (rec_x:pos) =
   match rec_x with
   | One ->
      print_string "One"
   | CDub (rec_x1, rec_x2) ->
      print_string "CDub";
      print_string " (";
      print_Bool rec_x1;
      print_string ",";
      print_Pos rec_x2;
      print_string ")"

and print_Int (rec_x:int) =
   match rec_x with
   | CInt rec_x1 ->
      print_string "CInt";
      print_string " (";
      print_Nat rec_x1;
      print_string ")"
   | CNeg rec_x1 ->
      print_string "CNeg";
      print_string " (";
      print_Pos rec_x1;
      print_string ")"

and print_Nat (rec_x:nat) =
   match rec_x with
   | Zero ->
      print_string "Zero"
   | CNat rec_x1 ->
      print_string "CNat";
      print_string " (";
      print_Pos rec_x1;
      print_string ")"
;;

let rec eqBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | T,b -> b
   | F,T -> F
   | F,F -> T

and xand (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | T,b -> b
   | F,b -> F

and not (rec_x1:bool) : bool =
   match rec_x1 with
   | T -> F
   | F -> T

and eqPos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | One,One -> T
   | One,(CDub (b,p)) -> F
   | (CDub (b,p)),One -> F
   | (CDub (b,p)),(CDub (c,q)) -> (xand (eqBool b c)  (eqPos p q))

and lePos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | One,p -> T
   | (CDub (b,p)),One -> F
   | (CDub (b,p)),(CDub (c,q)) when b = c -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = F -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = T -> (ltPos p q)

and ltPos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | p,One -> F
   | One,(CDub (b,p)) -> T
   | (CDub (b,p)),(CDub (c,q)) when b = c -> (ltPos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = F -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = T -> (ltPos p q)

and gePos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | p,q -> (lePos q p)

and succ2Pos (rec_x1:pos) : pos =
   match rec_x1 with
   | One -> (CDub (F,One))
   | (CDub (F,p)) -> (CDub (T,p))
   | (CDub (T,p)) -> (CDub (F,(succ2Pos p)))

and plusPos (rec_x1:pos) (rec_x2:pos) : pos =
   match rec_x1, rec_x2 with
   | p,q -> (addc F p q)

and addc (rec_x1:bool) (rec_x2:pos) (rec_x3:pos) : pos =
   match rec_x1, rec_x2, rec_x3 with
   | F,One,p -> (succ2Pos p)
   | T,One,p -> (succ2Pos (succ2Pos p))
   | F,p,One -> (succ2Pos p)
   | T,p,One -> (succ2Pos (succ2Pos p))
   | b,(CDub (c,p)),(CDub (d,q)) when c = d -> (CDub (b,(addc c p q)))
   | b,(CDub (c,p)),(CDub (d,q)) when c <> d -> (CDub ((not b),(addc b p q)))

and lambda0 (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) (rec_x4:nat) : nat =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | n,y,x,h when (lt (f h) n) = T -> (bs2 n h y)
   | n,y,x,h when (lt (f h) n) = F -> (bs2 n x h)

and max2Int (rec_x1:int) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | (CInt m),n -> (max2 m n)
   | (CNeg p),n -> n

and min2 (rec_x1:nat) : int =
   match rec_x1 with
   | Zero -> (CInt Zero)
   | (CNat p) -> (CNeg p)

and minus (rec_x1:nat) (rec_x2:nat) : int =
   match rec_x1, rec_x2 with
   | m,n when (ge m n) = T -> (CInt (gtesubtn m n))
   | m,n when (lt m n) = T -> (min2 (gtesubtn n m))

and eq (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | Zero,Zero -> T
   | Zero,(CNat p) -> F
   | (CNat p),Zero -> F
   | (CNat p),(CNat q) -> (eqPos p q)

and ite (rec_x1:bool) (rec_x2:nat) (rec_x3:nat) : nat =
   match rec_x1, rec_x2, rec_x3 with
   | T,m,n -> m
   | F,m,n -> n

and pos2Nat (rec_x1:pos) : nat =
   match rec_x1 with
   | p -> (CNat p)

and nat2Pos (rec_x1:nat) : pos =
   match rec_x1 with
   | (CNat p) -> p

and le (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | Zero,n -> T
   | (CNat p),Zero -> F
   | (CNat p),(CNat q) -> (lePos p q)

and lt (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | n,Zero -> F
   | Zero,(CNat p) -> T
   | (CNat p),(CNat q) -> (ltPos p q)

and ge (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | m,n -> (le n m)

and max2 (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | m,n -> (ite (le m n) n m)

and succ2 (rec_x1:nat) : pos =
   match rec_x1 with
   | Zero -> One
   | (CNat p) -> (succ2Pos p)

and pred2 (rec_x1:pos) : nat =
   match rec_x1 with
   | One -> Zero
   | (CDub (T,p)) -> (CNat (CDub (F,p)))
   | (CDub (F,p)) -> (dub T (pred2 p))

and dub (rec_x1:bool) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | F,Zero -> Zero
   | T,Zero -> (CNat One)
   | b,(CNat p) -> (CNat (CDub (b,p)))

and plusNatPos (rec_x1:nat) (rec_x2:pos) : pos =
   match rec_x1, rec_x2 with
   | Zero,p -> p
   | (CNat p),q -> (plusPos p q)

and plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | Zero,n -> n
   | n,Zero -> n
   | (CNat p),(CNat q) -> (CNat (addc F p q))

and gtesubtp (rec_x1:pos) (rec_x2:pos) : nat =
   match rec_x1, rec_x2 with
   | p,q -> (gtesubtb F p q)

and gtesubtn (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | n,Zero -> n
   | (CNat p),(CNat q) -> (gtesubtp p q)

and gtesubtb (rec_x1:bool) (rec_x2:pos) (rec_x3:pos) : nat =
   match rec_x1, rec_x2, rec_x3 with
   | F,p,One -> (pred2 p)
   | T,p,One -> (pred2 (nat2Pos (pred2 p)))
   | b,(CDub (c,p)),(CDub (d,q)) when c = d -> (dub b (gtesubtb b p q))
   | b,(CDub (c,p)),(CDub (d,q)) when c <> d -> (dub (not b) (gtesubtb d p q))

and dividePos (rec_x1:pos) (rec_x2:pos) : nat =
   match rec_x1, rec_x2 with
   | p,q when (gePos p q) = T -> (CNat (succ2 (divide (gtesubtp p q) q)))
   | p,q when (ltPos p q) = T -> Zero

and divide (rec_x1:nat) (rec_x2:pos) : nat =
   match rec_x1, rec_x2 with
   | Zero,p -> Zero
   | (CNat p),q -> (dividePos p q)

and f (rec_x1:nat) : nat =
   match rec_x1 with
   | Zero -> Zero
   | (CNat One) -> (CNat One)
   | (CNat (CDub (b,p))) -> (plus (f (max2Int (minus (CNat (CDub (b,p))) (pos2Nat One)) Zero)) (f (max2Int (minus (CNat (CDub (b,p))) (pos2Nat (CDub (F,One)))) Zero)))

and bs (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | n,m -> (bs2 n Zero m)

and bs2 (rec_x1:nat) (rec_x2:nat) (rec_x3:nat) : nat =
   match rec_x1, rec_x2, rec_x3 with
   | n,x,y when (eq (pos2Nat (plusNatPos x One)) y) = T -> x
   | n,x,y when (eq (pos2Nat (plusNatPos x One)) y) = F -> (lambda0 n y x (divide (plus x y) (CDub (F,One))))
;;

let main () =
   print_Nat ((bs (pos2Nat (CDub (T,(CDub (T,(CDub (F,(CDub (T,(CDub (F,(CDub (T,(CDub (T,(CDub (F,(CDub (T,(CDub (F,(CDub (T,One))))))))))))))))))))))) (pos2Nat (CDub (F,(CDub (F,(CDub (F,(CDub (F,(CDub (F,(CDub (F,One)))))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
