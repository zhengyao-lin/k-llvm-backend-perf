type disk = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | D10 | D11 | D12 | D13 | D14 | D15 | D16 | D17 | D18 | D19 | D20

and tower = A | B | C

and move = Movedisk of disk * tower * tower

and list = Nil | Cons of move * list ;;

let rec print_Disk (rec_x:disk) =
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
   | D10 ->
      print_string "D10"
   | D11 ->
      print_string "D11"
   | D12 ->
      print_string "D12"
   | D13 ->
      print_string "D13"
   | D14 ->
      print_string "D14"
   | D15 ->
      print_string "D15"
   | D16 ->
      print_string "D16"
   | D17 ->
      print_string "D17"
   | D18 ->
      print_string "D18"
   | D19 ->
      print_string "D19"
   | D20 ->
      print_string "D20"

and print_Tower (rec_x:tower) =
   match rec_x with
   | A ->
      print_string "A"
   | B ->
      print_string "B"
   | C ->
      print_string "C"

and print_Move (rec_x:move) =
   match rec_x with
   | Movedisk (rec_x1, rec_x2, rec_x3) ->
      print_string "Movedisk";
      print_string " (";
      print_Disk rec_x1;
      print_string ",";
      print_Tower rec_x2;
      print_string ",";
      print_Tower rec_x3;
      print_string ")"

and print_List (rec_x:list) =
   match rec_x with
   | Nil ->
      print_string "Nil"
   | Cons (rec_x1, rec_x2) ->
      print_string "Cons";
      print_string " (";
      print_Move rec_x1;
      print_string ",";
      print_List rec_x2;
      print_string ")"
;;

let rec dec (rec_x1:disk) : disk =
   match rec_x1 with
   | D20 -> D19
   | D19 -> D18
   | D18 -> D17
   | D17 -> D16
   | D16 -> D15
   | D15 -> D14
   | D14 -> D13
   | D13 -> D12
   | D12 -> D11
   | D11 -> D10
   | D10 -> D9
   | D9 -> D8
   | D8 -> D7
   | D7 -> D6
   | D6 -> D5
   | D5 -> D4
   | D4 -> D3
   | D3 -> D2
   | D2 -> D1
   | D1 -> D0

and other (rec_x1:tower) (rec_x2:tower) : tower =
   match rec_x1, rec_x2 with
   | A, B -> C
   | B, A -> C
   | A, C -> B
   | C, A -> B
   | B, C -> A
   | C, B -> A

and conc (rec_x1:list) (rec_x2:list) : list =
   match rec_x1, rec_x2 with
   | Nil, l -> l
   | l, Nil -> l
   | (Cons (h, t)), l -> (Cons (h, (conc t  l)))

and solve (rec_x1:tower) (rec_x2:tower) (rec_x3:disk) : list =
   match rec_x1, rec_x2, rec_x3 with
   | oRG, dEST, D0 -> Nil
   | oRG, dEST, d when d <> D0 -> (conc (solve oRG  (other oRG  dEST)  (dec d))  (Cons ((Movedisk (d, oRG, dEST)), (solve (other oRG  dEST)  dEST  (dec d)))))
;;

let main () =
   print_List ((solve A  B  D4));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
