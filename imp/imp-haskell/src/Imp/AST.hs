module Imp.AST where

data ArithExpr = IntConst Integer
               | Variable Identifier
               | NegateInt ArithExpr
               | DivideInt ArithExpr ArithExpr
               | PlusInt ArithExpr ArithExpr
               deriving (Eq, Show)

data BoolExpr = BoolConst Bool
              | LessThanOrEqualInt ArithExpr ArithExpr
              | NotBool BoolExpr
              | AndBool BoolExpr BoolExpr
              deriving (Eq, Show)

type Identifier = String

type Block = [Stmt]

data Stmt = BlockStmt Block
          | AssignStmt Identifier ArithExpr
          | IfThenElseStmt BoolExpr Stmt Stmt
          | WhileStmt BoolExpr Stmt
          deriving (Eq, Show)

data Program = Program [Identifier] Block deriving (Eq, Show)
