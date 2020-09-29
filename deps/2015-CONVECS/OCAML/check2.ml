type bool = True | False ;;

let rec print_Bool (rec_x:bool) =
   match rec_x with
   | True ->
      print_string "True"
   | False ->
      print_string "False"
;;

let rec notBool (rec_x1:bool) : bool =
   match rec_x1 with
   | True -> False
   | False -> True

and andBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, True -> p
   | p, False -> False

and orBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, True -> True
   | p, False -> p

and xorBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, q -> (orBool (andBool p  (notBool q))  (andBool q  (notBool p)))

and impliesBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, q -> (orBool q  (notBool p))

and iffBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, q -> (andBool (impliesBool p  q)  (impliesBool q  p))

and eqBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, q -> (iffBool p  q)

and neBool (rec_x1:bool) (rec_x2:bool) : bool =
   match rec_x1, rec_x2 with
   | p, q -> (xorBool p  q)
;;

let main () =
   print_Bool ((neBool False  True));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
