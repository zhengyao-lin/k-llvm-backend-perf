%{
  open Bigstep
%}

%token <Big_int_Z.big_int> INT
%token <string> ID
%token TRUE FALSE
%token PLUS DIV
%token LEQ NOT AND EQ
%token LPAREN RPAREN LBRACKET RBRACKET SEMICOLON COMMA
%token IF ELSE WHILE INT_TYPE
%token EOF

%start pgm
%type <Bigstep.pgm> pgm
%%

pgm: stmts EOF { $1 }

stmts: stmt stmts { SeqStmt ($1, $2) }
     | stmt       { $1 }

stmt: ID EQ aexp SEMICOLON                   { AssignStmt ($1, $3) }
    | IF LPAREN bexp RPAREN block ELSE block { IfStmt ($3, $5, $7) }
    | WHILE LPAREN bexp RPAREN block         { WhileStmt ($3, $5) }
    | block                                  { BlockStmt $1 }
    | INT_TYPE ids SEMICOLON                 { BlockStmt EmptyBlock }

ids: ID COMMA ids { $1 :: $3 }
   | ID           { [ $1 ] }

block: LBRACKET RBRACKET       { EmptyBlock }
     | LBRACKET stmts RBRACKET { StmtBlock $2 }

aexp_primary: INT                { IntAExp $1 }
            | ID                 { IdAExp $1 }
            | LPAREN aexp RPAREN { $2 }

aexp_multiplicative: aexp_primary                         { $1 }
                   | aexp_multiplicative DIV aexp_primary { DivAExp ($1, $3) }

aexp_additive: aexp_multiplicative                    { $1 }
             | aexp_additive PLUS aexp_multiplicative { PlusAExp ($1, $3) }

aexp: aexp_additive { $1 }

bexp_primary: TRUE               { BoolBExp true }
            | FALSE              { BoolBExp false }
            | LPAREN bexp RPAREN { $2 }
            | aexp LEQ aexp      { LessThanOrEqualBExp ($1, $3) }

bexp_unary: bexp_primary   { $1 }
          | NOT bexp_unary { NotBExp $2 }

bexp_binary: bexp_unary                 { $1 }
           | bexp_binary AND bexp_unary { AndBExp ($1, $3) }

bexp: bexp_binary { $1 }
