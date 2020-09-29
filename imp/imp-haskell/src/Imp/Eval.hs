module Imp.Eval where

import Data.Map as MAP

import Control.Monad
import Control.Monad.State.Lazy

import Imp.AST

type ProgramState = State (Map String Integer)
type EvalError = String

maybeToEither :: b -> Maybe a -> Either b a
maybeToEither = flip maybe Right . Left

evalArithExpr :: ArithExpr -> ProgramState (Either EvalError Integer)
evalArithExpr (IntConst int) = return (Right int)
evalArithExpr (Variable var) = maybeToEither ("cannot find variable " ++ var) <$> gets (MAP.lookup var)
evalArithExpr (NegateInt expr) = fmap negate <$> evalArithExpr expr
evalArithExpr (DivideInt e1 e2) = liftedDiv <$> evalArithExpr e1 <*> evalArithExpr e2
                                  where liftedDiv i1 i2 = if i2 == Right 0 then Left "dividing by zero" else div <$> i1 <*> i2
evalArithExpr (PlusInt e1 e2) = liftedAdd <$> evalArithExpr e1 <*> evalArithExpr e2
                                where liftedAdd i1 i2 = (+) <$> i1 <*> i2

evalBoolExpr :: BoolExpr -> ProgramState (Either EvalError Bool)
evalBoolExpr (BoolConst bool) = return (Right bool)
evalBoolExpr (LessThanOrEqualInt e1 e2) = lifted <$> evalArithExpr e1 <*> evalArithExpr e2
                                          where lifted i1 i2 = (<=) <$> i1 <*> i2
evalBoolExpr (NotBool expr) = fmap not <$> evalBoolExpr expr
evalBoolExpr (AndBool e1 e2) = lifted <$> evalBoolExpr e1 <*> evalBoolExpr e2
                               where lifted i1 i2 = (&&) <$> i1 <*> i2

evalStmt :: Stmt -> ProgramState (Either EvalError ())

evalStmt (BlockStmt []) = return (Right ())
evalStmt (BlockStmt (first:rest)) = do
    result <- evalStmt first
    case result of
        Left msg -> return (Left msg)
        Right val -> evalStmt (BlockStmt rest)

evalStmt (AssignStmt var expr) = do
    val <- evalArithExpr expr
    case val of
        Left msg -> return (Left msg)
        Right val -> modify (MAP.insert var val) *> return (Right ())

evalStmt (IfThenElseStmt cond left right) = do
    cond <- evalBoolExpr cond
    case cond of
        Left msg -> return (Left msg)
        Right cond ->
            if cond then evalStmt left
            else evalStmt right

evalStmt s@(WhileStmt condExpr body) = do
    cond <- evalBoolExpr condExpr
    case cond of
        Left msg -> return (Left msg)
        Right cond ->
            if cond then evalStmt (BlockStmt [body, (WhileStmt condExpr body)])
            else return (Right ())

initState :: [Identifier] -> Map String Integer
initState [] = MAP.empty
initState (var:rest) = MAP.insert var 0 (initState rest)

eval :: Program -> Either EvalError (Map String Integer)
eval (Program vars stmts) = flip evalState (initState vars) $ do
    result <- evalStmt (BlockStmt stmts)
    case result of
        Left msg -> return (Left msg)
        Right _ -> Right <$> get
