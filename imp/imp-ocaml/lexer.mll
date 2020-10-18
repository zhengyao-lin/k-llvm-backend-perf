{
  open Parser;;
  exception UnknownCharacter of string
}

rule token = parse
  | "//"            { comment lexbuf }
  | [' ' '\t' '\n'] { token lexbuf } (* skip whitespaces *)
  | '+'             { PLUS }
  | '/'             { DIV }
  | "<="            { LEQ }
  | '!'             { NOT }
  | "&&"            { AND }
  | '='             { EQ }
  | '('             { LPAREN }
  | ')'             { RPAREN }
  | '{'             { LBRACKET }
  | '}'             { RBRACKET }
  | ';'             { SEMICOLON }
  | ','             { COMMA }
  | "if"            { IF }
  | "else"          { ELSE }
  | "while"         { WHILE }
  | "true"          { TRUE }
  | "false"         { FALSE }
  | "int"           { INT_TYPE }
  | eof             { EOF }
  | '-'?['0'-'9']+ as i { INT (Big_int.big_int_of_string i) }
  | ['a'-'z' 'A'-'Z']['0'-'9' 'a'-'z' 'A'-'Z' '_']* as s { ID s }
  | _ as c { raise (UnknownCharacter (String.make 1 c)) }
and comment = parse
  | '\n' { token lexbuf }
  | _    { comment lexbuf }
