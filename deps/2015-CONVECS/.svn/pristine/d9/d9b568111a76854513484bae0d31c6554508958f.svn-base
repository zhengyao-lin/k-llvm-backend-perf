type bool3 = D0 | D1 | D2 ;;

let rec print_Bool3 (rec_x:bool3) =
   match rec_x with
   | D0 ->
      print_string "D0"
   | D1 ->
      print_string "D1"
   | D2 ->
      print_string "D2"
;;

let a : bool3 = D0 ;;

let b : bool3 = D1 ;;

let c : bool3 = D2 ;;

let d : bool3 = D0 ;;

let e : bool3 = D1 ;;

let f : bool3 = D2 ;;

let g : bool3 = D0 ;;

let h : bool3 = D1 ;;

let rec succ (rec_x1:bool3) : bool3 =
   match rec_x1 with
   | D0 -> D1
   | D1 -> D2
   | D2 -> D0

and plus (rec_x1:bool3) (rec_x2:bool3) : bool3 =
   match rec_x1, rec_x2 with
   | D0, x -> x
   | D1, x -> (succ x)
   | D2, x -> (succ (succ x))

and times (rec_x1:bool3) (rec_x2:bool3) : bool3 =
   match rec_x1, rec_x2 with
   | D0, x -> D0
   | D1, x -> x
   | D2, D0 -> D0
   | D2, D1 -> D2
   | D2, D2 -> D1

and xand (rec_x1:bool3) (rec_x2:bool3) : bool3 =
   match rec_x1, rec_x2 with
   | x,y -> (plus  (times (times x  x)  (times y  y)) (plus  (times D2  (times (times x  x)  y)) (plus  (times D2  (times (times y  y)  x)) (times D2  (times x  y)) )))

and yor (rec_x1:bool3) (rec_x2:bool3) : bool3 =
   match rec_x1, rec_x2 with
   | x,y -> (plus  (times D2  (times (times x  x)  (times y  y))) (plus  (times (times x  x)  y) (plus  (times (times y  y)  x) (plus  (times x  y) (plus x  y) ))))

and not (rec_x1:bool3) : bool3 =
   match rec_x1 with
   | x -> (plus (times D2  x)  D1)

and eq (rec_x1:bool3) (rec_x2:bool3) : bool3 =
   match rec_x1, rec_x2 with
   | x,y when x = y -> D1
   | x,y when x <> y -> D0
;;

let main () =
   print_Bool3 ((eq (xand (xand (xand a  b)  (xand c  d))  (xand (xand e  f)  (xand g  h)))  (not (yor (yor (yor (not a)  (not b))  (yor (not c)  (not d))) (yor (yor (not e)  (not f))  (yor (not g)  (not h)))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
