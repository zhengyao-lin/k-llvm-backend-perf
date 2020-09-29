type prop = Tt | Ff ;;

let rec print_Prop (rec_x:prop) =
   match rec_x with
   | Tt ->
      print_string "Tt"
   | Ff ->
      print_string "Ff"
;;

let rec xand (rec_x1:prop) (rec_x2:prop) : prop =
   match rec_x1, rec_x2 with
   | p, Tt -> p
   | p, Ff -> Ff

and xor (rec_x1:prop) (rec_x2:prop) : prop =
   match rec_x1, rec_x2 with
   | p, Ff -> p
   | Ff, Tt -> Tt
   | Tt, Tt -> Ff

and not (rec_x1:prop) : prop =
   match rec_x1 with
   | p -> (xor p  Tt)

and yor (rec_x1:prop) (rec_x2:prop) : prop =
   match rec_x1, rec_x2 with
   | p, q -> (xor (xand p  q)  (xor p  q))

and implies (rec_x1:prop) (rec_x2:prop) : prop =
   match rec_x1, rec_x2 with
   | p, q -> (not (xor p  (xand p  q)))

and iff (rec_x1:prop) (rec_x2:prop) : prop =
   match rec_x1, rec_x2 with
   | p, q -> (not (xor p  q))
;;

let a : prop = Ff ;;

let b : prop = Tt ;;

let c : prop = Ff ;;

let d : prop = Tt ;;

let e : prop = Ff ;;

let a1 : prop = Tt ;;

let a2 : prop = Ff ;;

let a3 : prop = Tt ;;

let a4 : prop = Ff ;;

let a5 : prop = Tt ;;

let a6 : prop = Ff ;;

let a7 : prop = Tt ;;

let a8 : prop = Ff ;;

let a9 : prop = Tt ;;

let a10 : prop = Ff ;;

let a11 : prop = Tt ;;

let a12 : prop = Ff ;;

let a13 : prop = Tt ;;

let a14 : prop = Ff ;;

let a15 : prop = Tt ;;

let a16 : prop = Ff ;;

let a17 : prop = Tt ;;

let a18 : prop = Ff ;;

let main () =
   print_Prop ((implies (xand (iff (iff (yor a1  a2)  (yor (not a3)  (iff (xor a4  a5) (not (not (not a6))))))  (not (xand (xand a7  a8)  (not (xor (xor (yor a9  (xand a10 a11))  a2)  (xand (xand a11  (xor a2  (iff a5  a5)))  (xor (xor a7  a7) (iff a9  a4))))))))  (implies (iff (iff (yor a1  a2)  (yor (not a3) (iff (xor a4  a5)  (not (not (not a6))))))  (not (xand (xand a7  a8) (not (xor (xor (yor a9  (xand a10  a11))  a2)  (xand (xand a11  (xor a2  (iff a5 a5)))  (xor (xor a7  a7)  (iff a9  a4))))))))  (not (xand (implies (xand a1 a2)  (not (xor (yor (yor (xor (implies (xand a3  a4)  (implies a5  a6))  (yor a7 a8))  (xor (iff a9  a10)  a11))  (xor (xor a2  a2)  a7))  (iff (yor a4  a9) (xor (not a6)  a6)))))  (not (iff (not a11)  (not a9))))))) (not (xand (implies (xand a1  a2)  (not (xor (yor (yor (xor (implies (xand a3  a4) (implies a5  a6))  (yor a7  a8))  (xor (iff a9  a10)  a11))  (xor (xor a2 a2)  a7))  (iff (yor a4  a9)  (xor (not a6)  a6)))))  (not (iff (not a11) (not a9)))))));
   print_newline ();
   flush stdout;
   print_Prop ((implies (xand (not (xand (xor a1  (xor (yor a2  a3)  a4))  (xor (iff (xor (not a5) (yor (xor (iff a6  a7)  (iff a8  a9))  (xand a10  a9)))  (iff (not (not a2)) (implies (yor a9  a6)  (yor a10  a5))))  (not (yor a9  (implies (not a8)  (yor a4 a9)))))))  (implies (not (xand (xor a1  (xor (yor a2  a3)  a4)) (xor (iff (xor (not a5)  (yor (xor (iff a6  a7)  (iff a8  a9))  (xand a10  a9))) (iff (not (not a2))  (implies (yor a9  a6)  (yor a10  a5))))  (not (yor a9 (implies (not a8)  (yor a4  a9)))))))  (not (implies (implies (xand (yor a1 (xor (xor a2  a3)  (not a4)))  (not (xor a5  (xand a6  a7)))) (implies (xor (implies a8  a9)  a10)  (xor (xand a4  (yor a4  a1))  a2))) (yor (yor (xor (yor a4  a7)  a2)  (xand a8  a1))  (not (not (not a6)))))))) (not (implies (implies (xand (yor a1  (xor (xor a2  a3)  (not a4)))  (not (xor a5 (xand a6  a7))))  (implies (xor (implies a8  a9)  a10)  (xor (xand a4  (yor a4 a1))  a2)))  (yor (yor (xor (yor a4  a7)  a2)  (xand a8  a1)) (not (not (not a6))))))));
   print_newline ();
   flush stdout;
   print_Prop ((implies (xand (not (xand (xor a1  (xor (yor a2  a3)  a4))  (xor (iff (xor (not a5) (yor (xor (iff a6  a7)  (iff a8  a9))  (xand a10  a11)))  (implies (yor a4 (xand a3  (iff a1  a2)))  (not (not a4))))  (xor (implies (implies a6  a1) (not a1))  (not a9)))))  (implies (not (xand (xor a1  (xor (yor a2  a3)  a4)) (xor (iff (xor (not a5)  (yor (xor (iff a6  a7)  (iff a8  a9))  (xand a10 a11)))  (implies (yor a4  (xand a3  (iff a1  a2)))  (not (not a4)))) (xor (implies (implies a6  a1)  (not a1))  (not a9))))) (not (implies (implies (xand (yor a1  (xor (xor a2  a3)  (not a4)))  (not (xor a5 (xand a6  a7))))  (implies (xor (implies a8  a9)  a10)  (xor (xand a11 (implies a2  a8))  a8)))  (not (yor (implies (yor a5  (yor a8  (xand a8  a9))) (not a2))  (not a7)))))))  (not (implies (implies (xand (yor a1  (xor (xor a2 a3)  (not a4)))  (not (xor a5  (xand a6  a7))))  (implies (xor (implies a8 a9)  a10)  (xor (xand a11  (implies a2  a8))  a8)))  (not (yor (implies (yor a5 (yor a8  (xand a8  a9)))  (not a2))  (not a7)))))));
   print_newline ();
   flush stdout;
   exit 0
;;

main ()
