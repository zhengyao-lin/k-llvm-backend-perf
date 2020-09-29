module Imp.Parser where

import Data.List

import Text.Parsec
import Text.Parsec.Char

import Imp.AST

whitespace = oneOf " \n\r\f\t"
whitespaces = skipMany whitespace
whitespaces1 = skipMany1 whitespace

-- https://github.com/kframework/k/blob/master/k-distribution/include/kframework/builtin/domains.md#program-identifiers
-- r"(?<![A-Za-z0-9\\_])[A-Za-z\\_][A-Za-z0-9\\_]*"
identifierP :: Parsec String () Identifier
identifierP = try $ do
    id <- (:) <$> oneOf ('_' : (['A'..'Z'] ++ ['a'..'z']))
              <*> many (oneOf ('_' : (['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'])))
    case id of
        "if" -> fail "if is a keyword"
        "while" -> fail "while is a keyword"
        _ -> return id

identifiersP :: Parsec String () [Identifier]
identifiersP = sepBy identifierP (try (whitespaces *> char ',' *> whitespaces))

varDeclP :: Parsec String () [Identifier]
varDeclP = string "int" *> whitespaces1 *> identifiersP <* whitespaces <* char ';' <* whitespaces

-----------------------------
-- Arithmetic expressions
-----------------------------

intConstP :: Parsec String () Integer
intConstP = read <$> many1 (oneOf ['0'..'9'])

parenIntP :: Parsec String () ArithExpr
parenIntP = char '(' *> whitespaces *> arithExprP <* whitespaces <* char ')'

atomIntP :: Parsec String () ArithExpr
atomIntP = parenIntP <|> (IntConst <$> intConstP) <|> (Variable <$> identifierP)

unaryIntP :: Parsec String () ArithExpr
unaryIntP =
    (NegateInt <$> (whitespaces *> char '-' *> whitespaces *> unaryIntP)) <|>
    atomIntP

divideIntP :: Parsec String () ArithExpr
divideIntP = chainl1 unaryIntP (try (whitespaces *> char '/' *> whitespaces *> return DivideInt))

plusIntP :: Parsec String () ArithExpr
plusIntP = chainl1 divideIntP (try (whitespaces *> char '+' *> whitespaces *> return PlusInt))

arithExprP :: Parsec String () ArithExpr
arithExprP = plusIntP

-----------------------------
-- Boolean expressions
-----------------------------

boolConstP :: Parsec String () Bool
boolConstP = (string "true" *> whitespaces *> return True) <|>
             (string "false" *> whitespaces *> return False)

parenBoolP :: Parsec String () BoolExpr
parenBoolP = char '(' *> whitespaces *> boolExprP <* whitespaces <* char ')'

atomBoolP :: Parsec String () BoolExpr
atomBoolP =
    parenBoolP <|>
    (BoolConst <$> boolConstP <* whitespaces) <|>
    (LessThanOrEqualInt <$> arithExprP <*> (whitespaces *> string "<=" *> whitespaces *> arithExprP))

unaryBoolP :: Parsec String () BoolExpr
unaryBoolP =
    (NotBool <$> (char '!' *> whitespaces *> unaryBoolP)) <|>
    atomBoolP

binaryBoolP :: Parsec String () BoolExpr
binaryBoolP = chainl1 unaryBoolP (try (whitespaces *> string "&&" *> whitespaces *> return AndBool))

boolExprP :: Parsec String () BoolExpr
boolExprP = binaryBoolP

-----------------------------
-- Statements and blocks
-----------------------------

assignStmtP :: Parsec String () Stmt
assignStmtP =
    AssignStmt <$> identifierP <*> (whitespaces *> char '=' *> whitespaces *> arithExprP <* whitespaces <* char ';')

blockP :: Parsec String () Block
blockP = char '{' *> whitespaces *> stmtsP <* whitespaces <* char '}'

blockStmtP = BlockStmt <$> blockP

ifThenElseStmtP :: Parsec String () Stmt
ifThenElseStmtP = IfThenElseStmt <$>
    (string "if" *> whitespaces *> parenBoolP) <*>
    (whitespaces *> blockStmtP <* whitespaces <* string "else" <* whitespaces) <*>
    blockStmtP

whileStmtP :: Parsec String () Stmt
whileStmtP = WhileStmt <$>
    (string "while" *> whitespaces *> parenBoolP) <*>
    (whitespaces *> blockStmtP)

stmtP :: Parsec String () Stmt
stmtP =
    assignStmtP <|>
    blockStmtP <|>
    ifThenElseStmtP <|>
    whileStmtP

stmtsP :: Parsec String () [Stmt]
stmtsP = sepEndBy stmtP (try whitespaces1)

programP :: Parsec String () Program
programP = Program <$>
    (spaces *> varDeclP <* spaces) <*>
    (spaces *> stmtsP <* spaces)

substringIndex :: Eq a => [a] -> [a] -> Maybe Int
substringIndex needle [] = if needle == [] then Just 0 else Nothing
substringIndex needle hay =
    if take (length needle) hay == needle then Just 0
    else (+1) <$> substringIndex needle (drop 1 hay)

-- remove comments
preprocess :: String -> String
preprocess s = unlines $ lines s >>= \line -> do
    case substringIndex "//" line of
        Just i -> return $ take i line
        Nothing -> return line

parseProgram :: SourceName -> String -> Either ParseError Program
parseProgram sourceName src = parse (programP <* eof) sourceName (preprocess src)
