type bool = True | False

and pos = D1 | CDub of bool * pos

and eNat = Exz | Exs of eNat | Explus of eNat * eNat | Exmult of eNat * eNat | Exexp of eNat * eNat

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

and print_ENat (rec_x:eNat) =
   match rec_x with
   | Exz ->
      print_string "Exz"
   | Exs rec_x1 ->
      print_string "Exs";
      print_string " (";
      print_ENat rec_x1;
      print_string ")"
   | Explus (rec_x1, rec_x2) ->
      print_string "Explus";
      print_string " (";
      print_ENat rec_x1;
      print_string ",";
      print_ENat rec_x2;
      print_string ")"
   | Exmult (rec_x1, rec_x2) ->
      print_string "Exmult";
      print_string " (";
      print_ENat rec_x1;
      print_string ",";
      print_ENat rec_x2;
      print_string ")"
   | Exexp (rec_x1, rec_x2) ->
      print_string "Exexp";
      print_string " (";
      print_ENat rec_x1;
      print_string ",";
      print_ENat rec_x2;
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

and lambda0 (rec_x1:eNat) : bool =
   match rec_x1 with
   | m -> (eq (eval17 m) (evalexp17 m))

and eq (rec_x1:sNat) (rec_x2:sNat) : bool =
   match rec_x1, rec_x2 with
   | Z,Z -> True
   | Z,(S r) -> False
   | (S r),Z -> False
   | (S r),(S t) -> (eq r t)

and eqENat (rec_x1:eNat) (rec_x2:eNat) : bool =
   match rec_x1, rec_x2 with
   | Exz,Exz -> True
   | Exz,(Exs m) -> False
   | Exz,(Explus (m,n)) -> False
   | Exz,(Exmult (m,n)) -> False
   | Exz,(Exexp (m,n)) -> False
   | (Exs m),Exz -> False
   | (Exs n),(Exs m) -> (eqENat n m)
   | (Exs m),(Explus (n,o)) -> False
   | (Exs n),(Exmult (m,o)) -> False
   | (Exs m),(Exexp (n,o)) -> False
   | (Explus (n,m)),Exz -> False
   | (Explus (m,n)),(Exs o) -> False
   | (Explus (n,m)),(Explus (o,l)) -> (xand (eqENat n o) (eqENat m l))
   | (Explus (m,n)),(Exmult (o,l)) -> False
   | (Explus (n,m)),(Exexp (o,l)) -> False
   | (Exmult (m,n)),Exz -> False
   | (Exmult (n,m)),(Exs o) -> False
   | (Exmult (m,n)),(Explus (o,l)) -> False
   | (Exmult (n,m)),(Exmult (o,l)) -> (xand (eqENat n o) (eqENat m l))
   | (Exmult (m,n)),(Exexp (o,l)) -> False
   | (Exexp (n,m)),Exz -> False
   | (Exexp (m,n)),(Exs o) -> False
   | (Exexp (n,m)),(Explus (o,l)) -> False
   | (Exexp (m,n)),(Exmult (o,l)) -> False
   | (Exexp (m,n)),(Exexp (o,l)) -> (xand (eqENat m o) (eqENat n l))

and succ17 (rec_x1:sNat) : sNat =
   match rec_x1 with
   | r when (eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) = True -> Z
   | r when (eq r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))) = False -> (S r)

and plus17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | r,Z -> r
   | r,(S t) -> (succ17 (plus17 r t))

and mult17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | r,Z -> Z
   | r,(S t) -> (plus17 r (mult17 r t))

and exp17 (rec_x1:sNat) (rec_x2:sNat) : sNat =
   match rec_x1, rec_x2 with
   | r,Z -> (succ17 Z)
   | r,(S t) -> (mult17 r (exp17 r t))

and eval17 (rec_x1:eNat) : sNat =
   match rec_x1 with
   | Exz -> Z
   | (Exs n) -> (succ17 (eval17 n))
   | (Explus (n,m)) -> (plus17 (eval17 n) (eval17 m))
   | (Exmult (n,m)) -> (mult17 (eval17 n) (eval17 m))
   | (Exexp (n,m)) -> (exp17 (eval17 n) (eval17 m))

and evalexp17 (rec_x1:eNat) : sNat =
   match rec_x1 with
   | n -> (eval17 (expand n))

and expand (rec_x1:eNat) : eNat =
   match rec_x1 with
   | Exz -> Exz
   | (Exs n) -> (Explus ((Exs Exz),n))
   | (Explus (n,m)) -> (Explus ((expand n),(expand m)))
   | (Exmult (n,Exz)) -> Exz
   | (Exmult (n,(Exs Exz))) -> (expand n)
   | (Exmult (n,(Explus (m,o)))) -> (expand (Explus ((Exmult (n,m)),(Exmult (n,o)))))
   | (Exmult (n,(Exmult (m,o)))) -> (expand (Exmult (n,(expand (Exmult (m,o))))))
   | (Exmult (n,(Exexp (m,o)))) -> (expand (Exmult (n,(expand (Exexp (m,o))))))
   | (Exexp (n,Exz)) -> (Exs Exz)
   | (Exexp (n,(Exs m))) when (eqENat m Exz) = True -> (expand n)
   | (Exexp (n,(Exs m))) when (eqENat m Exz) = False -> (expand (Exexp (n,(expand (Exs m)))))
   | (Exexp (n,(Explus (m,o)))) -> (expand (Exmult ((Exexp (n,m)),(Exexp (n,o)))))
   | (Exexp (n,(Exmult (m,o)))) -> (expand (Exexp (n,(expand (Exmult (m,o))))))
   | (Exexp (n,(Exexp (m,o)))) -> (expand (Exexp (n,(expand (Exexp (m,o))))))
;;

let two : eNat = (Exs (Exs Exz)) ;;

let seventeen : eNat = (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs (Exs Exz))))))))))))))))))) ;;

let rec f (rec_x1:eNat) : bool =
   match rec_x1 with
   | m -> (lambda0 (Exexp (two,m)))
;;

let main () =
   print_Bool ((f seventeen));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
