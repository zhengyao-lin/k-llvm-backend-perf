type bool = T | F

and pos = D1 | CDub of bool * pos

and int = CInt of nat | CNeg of pos

and nat = D0 | CNat of pos ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | T ->
      print_string "T"
   | F ->
      print_string "F"

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
   | D0 ->
      print_string "D0"
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
   | D1,D1 -> T
   | D1,(CDub (b,p)) -> F
   | (CDub (b,p)),D1 -> F
   | (CDub (b,p)),(CDub (c,q)) -> (xand (eqBool b c) (eqPos p q))

and lePos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | D1,p -> T
   | (CDub (b,p)),D1 -> F
   | (CDub (b,p)),(CDub (c,q)) when b = c -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = F -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = T -> (ltPos p q)

and ltPos (rec_x1:pos) (rec_x2:pos) : bool =
   match rec_x1, rec_x2 with
   | p,D1 -> F
   | D1,(CDub (b,p)) -> T
   | (CDub (b,p)),(CDub (c,q)) when b = c -> (ltPos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = F -> (lePos p q)
   | (CDub (b,p)),(CDub (c,q)) when b <> c && b = T -> (ltPos p q)

and s (rec_x1:pos) : pos =
   match rec_x1 with
   | D1 -> (CDub (F,D1))
   | (CDub (F,p)) -> (CDub (T,p))
   | (CDub (T,p)) -> (CDub (F,(s p)))

and addc (rec_x1:bool) (rec_x2:pos) (rec_x3:pos) : pos =
   match rec_x1, rec_x2, rec_x3 with
   | F,D1,p -> (s p)
   | T,D1,p -> (s (s p))
   | F,p,D1 -> (s p)
   | T,p,D1 -> (s (s p))
   | b,(CDub (c,p)),(CDub (d,q)) when c = d -> (CDub (b,(addc c p q)))
   | b,(CDub (c,p)),(CDub (d,q)) when c <> d -> (CDub ((not b),(addc c p q)))

and int2Nat (rec_x1:int) : nat =
   match rec_x1 with
   | (CInt n) -> n

and minus (rec_x1:nat) : int =
   match rec_x1 with
   | D0 -> (CInt D0)
   | (CNat p) -> (CNeg p)

and minus2 (rec_x1:nat) (rec_x2:nat) : int =
   match rec_x1, rec_x2 with
   | m,n when (ge m n) = T -> (CInt (gtesubt m n))
   | m,n when (ge m n) = F -> (minus (gtesubt n m))

and pos2Nat (rec_x1:pos) : nat =
   match rec_x1 with
   | p -> (CNat p)

and nat2Pos (rec_x1:nat) : pos =
   match rec_x1 with
   | (CNat p) -> p

and eq (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0,D0 -> T
   | D0,(CNat p) -> F
   | (CNat p),D0 -> F
   | (CNat p),(CNat q) -> (eqPos p q)

and le (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | D0,n -> T
   | (CNat p),D0 -> F
   | (CNat p),(CNat q) -> (lePos p q)

and lt (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | n,D0 -> F
   | D0,(CNat p) -> T
   | (CNat p),(CNat q) -> (ltPos p q)

and ge (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | m,n -> (le n m)

and gt (rec_x1:nat) (rec_x2:nat) : bool =
   match rec_x1, rec_x2 with
   | m,n -> (lt n m)

and pre (rec_x1:pos) : nat =
   match rec_x1 with
   | D1 -> D0
   | (CDub (T,p)) -> (CNat (CDub (F,p)))
   | (CDub (F,p)) -> (dub T (pre p))

and dub (rec_x1:bool) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | F,D0 -> D0
   | T,D0 -> (CNat D1)
   | b,(CNat p) -> (CNat (CDub (b,p)))

and plus (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | D0,n -> n
   | n,D0 -> n
   | (CNat p),(CNat q) -> (CNat (addc F p q))

and gtesubtPos (rec_x1:pos) (rec_x2:pos) : nat =
   match rec_x1, rec_x2 with
   | p,q -> (gtesubtb F p q)

and gtesubt (rec_x1:nat) (rec_x2:nat) : nat =
   match rec_x1, rec_x2 with
   | n,D0 -> n
   | (CNat p),(CNat q) -> (gtesubtPos p q)

and gtesubtb (rec_x1:bool) (rec_x2:pos) (rec_x3:pos) : nat =
   match rec_x1, rec_x2, rec_x3 with
   | F,p,D1 -> (pre p)
   | T,p,D1 -> (pre (nat2Pos (pre p)))
   | b,(CDub (c,p)),(CDub (d,q)) when c = d -> (dub b (gtesubtb b p q))
   | b,(CDub (c,p)),(CDub (d,q)) when c <> d && c = F -> (dub (not b) (gtesubtb T p q))
   | b,(CDub (c,p)),(CDub (d,q)) when c <> d && c = T -> (dub (not b) (gtesubtb d p q))

and fib (rec_x1:nat) : nat =
   match rec_x1 with
   | D0 -> D0
   | (CNat D1) -> (CNat D1)
   | (CNat (CDub (b,p))) -> (plus (fib (int2Nat (minus2 (CNat (CDub (b,p))) (pos2Nat D1)))) (fib (int2Nat (minus2 (CNat (CDub (b,p))) (pos2Nat (CDub (F,D1)))))))
;;

let main () =
   print_Nat ((fib (pos2Nat (CDub (F,(CDub (F,(CDub (F,(CDub (F,(CDub (F,D1)))))))))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
