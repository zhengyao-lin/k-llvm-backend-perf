type bool = True | False

and int = D0 | S of int | P of int

and bank = West | East

and text = Missionary_rows_east | Two_missionaries_row_east | Missionary_and_cannibal_row_east | Cannibal_rows_east | Two_cannibals_row_east | Missionary_rows_west | Two_missionaries_row_west | Missionary_and_cannibal_row_west | Cannibal_rows_west | Two_cannibals_row_west

and position = Pos of bank * int * int * int * int

and move = Mov of text * int * int * int * int * bank

and moveList = Nil_ml | Cm of move * moveList

and posList = Nil_pl | Cp of position * posList

and textList = Nil_tl | Fail | Ct of text * textList ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"

and print_Int (rec_x:int) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | S rec_x1 ->
      print_string "S";
      print_string " (";
      print_Int rec_x1;
      print_string ")"
   | P rec_x1 ->
      print_string "P";
      print_string " (";
      print_Int rec_x1;
      print_string ")"

and print_Bank (rec_x:bank) =
   match rec_x with
   | West ->
      print_string "West"
   | East ->
      print_string "East"

and print_Text (rec_x:text) =
   match rec_x with
   | Missionary_rows_east ->
      print_string "Missionary_rows_east"
   | Two_missionaries_row_east ->
      print_string "Two_missionaries_row_east"
   | Missionary_and_cannibal_row_east ->
      print_string "Missionary_and_cannibal_row_east"
   | Cannibal_rows_east ->
      print_string "Cannibal_rows_east"
   | Two_cannibals_row_east ->
      print_string "Two_cannibals_row_east"
   | Missionary_rows_west ->
      print_string "Missionary_rows_west"
   | Two_missionaries_row_west ->
      print_string "Two_missionaries_row_west"
   | Missionary_and_cannibal_row_west ->
      print_string "Missionary_and_cannibal_row_west"
   | Cannibal_rows_west ->
      print_string "Cannibal_rows_west"
   | Two_cannibals_row_west ->
      print_string "Two_cannibals_row_west"

and print_Position (rec_x:position) =
   match rec_x with
   | Pos (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5) ->
      print_string "Pos";
      print_string " (";
      print_Bank rec_x1;
      print_string ",";
      print_Int rec_x2;
      print_string ",";
      print_Int rec_x3;
      print_string ",";
      print_Int rec_x4;
      print_string ",";
      print_Int rec_x5;
      print_string ")"

and print_Move (rec_x:move) =
   match rec_x with
   | Mov (rec_x1, rec_x2, rec_x3, rec_x4, rec_x5, rec_x6) ->
      print_string "Mov";
      print_string " (";
      print_Text rec_x1;
      print_string ",";
      print_Int rec_x2;
      print_string ",";
      print_Int rec_x3;
      print_string ",";
      print_Int rec_x4;
      print_string ",";
      print_Int rec_x5;
      print_string ",";
      print_Bank rec_x6;
      print_string ")"

and print_MoveList (rec_x:moveList) =
   match rec_x with
   | Nil_ml ->
      print_string "Nil_ml"
   | Cm (rec_x1, rec_x2) ->
      print_string "Cm";
      print_string " (";
      print_Move rec_x1;
      print_string ",";
      print_MoveList rec_x2;
      print_string ")"

and print_PosList (rec_x:posList) =
   match rec_x with
   | Nil_pl ->
      print_string "Nil_pl"
   | Cp (rec_x1, rec_x2) ->
      print_string "Cp";
      print_string " (";
      print_Position rec_x1;
      print_string ",";
      print_PosList rec_x2;
      print_string ")"

and print_TextList (rec_x:textList) =
   match rec_x with
   | Nil_tl ->
      print_string "Nil_tl"
   | Fail ->
      print_string "Fail"
   | Ct (rec_x1, rec_x2) ->
      print_string "Ct";
      print_string " (";
      print_Text rec_x1;
      print_string ",";
      print_TextList rec_x2;
      print_string ")"
;;

let rec xand (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | l, True -> l
   | l, False -> False

and yor (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | l, True -> True
   | l, False -> l

and plus (rec_x1:int) (rec_x2:int) : int =
   match rec_x1, rec_x2 with
   | x, D0 -> x
   | D0, y -> y
   | (S x), (S y) -> (S (S (plus x  y)))
   | (P x), (P y) -> (P (P (plus x  y)))
   | (S x), (P y) -> (plus x  y)
   | (P x), (S y) -> (plus x  y)

and gte (rec_x1:int) (rec_x2:int) : bool =
   match rec_x1, rec_x2 with
   | D0, D0 -> True
   | D0, (S y) -> False
   | D0, (P y) -> True
   | (S x), D0 -> True
   | (S x), (S y) -> (gte x  y)
   | (S x), (P y) -> True
   | (P x), D0 -> False
   | (P x), (S y) -> False
   | (P x), (P y) -> (gte x  y)

and equal (rec_x1:int) (rec_x2:int) : bool =
   match rec_x1, rec_x2 with
   | x, y -> (xand (gte x  y)  (gte y  x))
;;

let d1 : int = (S D0) ;;

let d2 : int = (S (S D0)) ;;

let d3 : int = (S (S (S D0))) ;;

let m1 : int = (P D0) ;;

let m2 : int = (P (P D0)) ;;

let moves : moveList = (Cm ((Mov (Missionary_rows_east, m1, D0, d1, D0, East)),(Cm ((Mov (Two_missionaries_row_east, m2, D0, d2, D0, East)),(Cm ((Mov (Missionary_and_cannibal_row_east, m1, m1, d1, d1, East)),(Cm ((Mov (Cannibal_rows_east, D0, m1, D0, d1, East)),(Cm ((Mov (Two_cannibals_row_east, D0, m2, D0, d2, East)),(Cm ((Mov (Missionary_rows_west, d1, D0, m1, D0, West)),(Cm ((Mov (Two_missionaries_row_west, d2, D0, m2, D0, West)),(Cm ((Mov (Missionary_and_cannibal_row_west, d1, d1, m1, m1, West)),(Cm ((Mov (Cannibal_rows_west, D0, d1, D0, m1, West)),(Cm ((Mov (Two_cannibals_row_west, D0, d2, D0, m2, West)), Nil_ml)))))))))))))))))))) ;;

let rec member (rec_x1:position) (rec_x2:posList) : bool =
   match rec_x1, rec_x2 with
   | nP, Nil_pl -> False
   | nP, (Cp (posi, prev)) when nP = posi -> True
   | nP, (Cp (posi, prev)) when nP <> posi -> (member nP  prev)

and evalct (rec_x1:text) (rec_x2:textList) : textList =
   match rec_x1, rec_x2 with
   | t, Fail -> Fail
   | t, tL when tL <> Fail -> (Ct (t,tL))

and gte_tl (rec_x1:textList) (rec_x2:textList) : bool =
   match rec_x1, rec_x2 with
   | tL, Nil_tl -> True
   | Nil_tl, (Ct (t, tL)) -> False
   | (Ct (t, tL)), (Ct (t2, tL2)) -> (gte_tl tL  tL2)

and best (rec_x1:textList) (rec_x2:textList) : textList =
   match rec_x1, rec_x2 with
   | Fail, tL -> tL
   | tL, Fail -> tL
   | tL, tL2 when (gte_tl tL  tL2) = True && tL <> Fail && tL2 <> Fail -> tL2
   | tL, tL2 when (gte_tl tL  tL2) = False && tL <> Fail && tL2 <> Fail -> tL

and solve (rec_x1:position) (rec_x2:position) (rec_x3:posList) : textList =
   match rec_x1, rec_x2, rec_x3 with
   | posi, final, prev when posi = final -> Nil_tl
   | posi, final, prev when posi <> final -> (xtry moves  posi  final  prev)

and xtry (rec_x1:moveList) (rec_x2:position) (rec_x3:position) (rec_x4:posList) : textList =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | Nil_ml, posi, final, prev -> Fail
   | (Cm (m, mL)), posi, final, prev -> (best (apply m  posi  final  prev)  (xtry mL  posi  final  prev))

and apply (rec_x1:move) (rec_x2:position) (rec_x3:position) (rec_x4:posList) : textList =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | (Mov (t, dMW, dCW, dME, dCE, d)), (Pos (b, mW, cW, mE, cE)), final, prev when d <> b -> (check t  (Pos (d, (plus mW  dMW), (plus cW  dCW), (plus mE  dME), (plus cE  dCE)))  final  prev)
   | (Mov (t, dMW, dCW, dME, dCE, d)), (Pos (b, mW, cW, mE, cE)), final, prev when d = b -> Fail

and check (rec_x1:text) (rec_x2:position) (rec_x3:position) (rec_x4:posList) : textList =
   match rec_x1, rec_x2, rec_x3, rec_x4 with
   | t, nP, final, prev when (member nP  prev) = False && (valid nP) = True -> (evalct t  (solve nP  final  (Cp (nP, prev))))
   | t, nP, final, prev when (member nP  prev) = True -> Fail
   | t, nP, final, prev when (valid nP) = False -> Fail

and valid (rec_x1:position) : bool =
   match rec_x1 with
   | (Pos (b, mW, cW, mE, cE)) -> (xand (gte mW  D0)  (xand (gte cW  D0)  (xand (gte mE  D0)  (xand (gte cE  D0)  (xand (yor (equal mW  D0)  (gte mW  cW))  (yor (equal mE  D0)  (gte mE  cE)))))))
;;

let main () =
   print_TextList ((solve (Pos (West, d3, d3, D0, D0))  (Pos (East, D0, D0, d3, d3))  Nil_pl));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
