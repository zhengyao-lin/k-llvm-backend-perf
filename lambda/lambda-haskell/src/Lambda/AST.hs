module Lambda.AST where

type VariableName = String

data Term = BoolConst Bool
          | IntConst Integer
          | Variable VariableName
          
          | Product Term Term
          | Division Term Term
          | Sum Term Term
          | LessThanOrEqual Term Term

          | Ite Term Term Term

          | Application Term Term
          | Lambda VariableName Term
          | Mu VariableName Term
          deriving Eq

instance Show Term where
    show (BoolConst b) = show b
    show (IntConst n) = show n
    show (Variable v) = v
    show (Product t1 t2) = "(" ++ show t1 ++ " * " ++ show t2 ++ ")"
    show (Division t1 t2) = "(" ++ show t1 ++ " / " ++ show t2 ++ ")"
    show (Sum t1 t2) = "(" ++ show t1 ++ " + " ++ show t2 ++ ")"
    show (LessThanOrEqual t1 t2) = "(" ++ show t1 ++ " <= " ++ show t2 ++ ")"
    show (Ite t1 t2 t3) = "(" ++ "if " ++ show t1 ++ " then " ++ show t2 ++ " else " ++ show t3 ++ ")"
    show (Application t1 t2) = "(" ++ show t1 ++ " " ++ show t2 ++ ")"
    show (Lambda x t) = "(lambda " ++ x ++ ". " ++ show t ++ ")"
    show (Mu f t) = "(mu " ++ f ++ ". " ++ show t ++ ")"

