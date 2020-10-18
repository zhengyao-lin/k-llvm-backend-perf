open Bigstep;;

let run stmt state ins =
  let stmt_desugared = desugar stmt in
  let initial_cfg = StmtCfg (stmt_desugared, state, ins) in
  let final_cfg = eval initial_cfg in
  (* print_string "original program:\n";
  print_stmt stmt;
  print_string "desugared program:\n";
  print_stmt stmt_desugared;
  print_cfg initial_cfg;
  print_string "\n  ---evals to--->\n"; *)
  print_cfg final_cfg;
;;

let main () =
  let lexbuf = Lexing.from_channel stdin in
  let pgm = Parser.pgm Lexer.token lexbuf in run pgm [] []
;;


let () = main ()
;;
