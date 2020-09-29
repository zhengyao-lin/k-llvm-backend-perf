type s = Nullary_constructor | Unary_constructor of s | Nary_constructor of s * s * s ;;

let rec print_S (rec_x:s) =
   match rec_x with
   | Nullary_constructor ->
      print_string "Nullary_constructor"
   | Unary_constructor rec_x1 ->
      print_string "Unary_constructor";
      print_string " (";
      print_S rec_x1;
      print_string ")"
   | Nary_constructor (rec_x1, rec_x2, rec_x3) ->
      print_string "Nary_constructor";
      print_string " (";
      print_S rec_x1;
      print_string ",";
      print_S rec_x2;
      print_string ",";
      print_S rec_x3;
      print_string ")"
;;

let nullary_function : s = Nullary_constructor ;;

let rec unary_function (rec_x1:s) : s =
   match rec_x1 with
   | x -> (Unary_constructor x)

and nary_function (rec_x1:s) (rec_x2:s) (rec_x3:s) : s =
   match rec_x1, rec_x2, rec_x3 with
   | x, y, z -> (Nary_constructor (x, y, z))
;;

let a : s = Nullary_constructor ;;

let b : s = (Unary_constructor Nullary_constructor) ;;

let c : s = (Nary_constructor (Nullary_constructor, Nullary_constructor, Nullary_constructor)) ;;

let d : s = nullary_function ;;

let e : s = (unary_function nullary_function) ;;

let f : s = (nary_function nullary_function  nullary_function  nullary_function) ;;

let main () =
   print_S (Nullary_constructor);
   print_newline ();
   flush stdout;
   print_S ((Unary_constructor Nullary_constructor));
   print_newline ();
   flush stdout;
   print_S ((Nary_constructor (Nullary_constructor, Nullary_constructor, Nullary_constructor)));
   print_newline ();
   flush stdout;
   print_S (nullary_function);
   print_newline ();
   flush stdout;
   print_S ((unary_function nullary_function));
   print_newline ();
   flush stdout;
   print_S ((nary_function nullary_function  nullary_function  nullary_function));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
