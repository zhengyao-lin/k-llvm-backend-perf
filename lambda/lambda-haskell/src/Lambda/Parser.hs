module Lambda.Parser where

import Text.Parsec

import Lambda.AST

whitespace = oneOf " \n\r\f\t"
whitespaces = skipMany whitespace
whitespaces1 = skipMany1 whitespace

intConstP :: Parsec String () Term
intConstP = IntConst <$> read <$> (many1 (oneOf ('-':['0'..'9'])))

boolConstP :: Parsec String () Term
boolConstP = BoolConst <$> ((string "true" *> return True) <|> (string "false" *> return False))

variableNameP :: Parsec String () VariableName
variableNameP = do
    id <- (:) <$> oneOf ('_' : (['A'..'Z'] ++ ['a'..'z']))
              <*> many (oneOf ('_' : (['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'])))
    if id `elem` [ "if", "then", "else", "lambda", "mu", "false", "true", "in", "let", "letrec" ] then
        fail ("'" ++ id ++ "' is a keyword")
    else
        return id

variableP = Variable <$> variableNameP

letP :: Parsec String () Term
letP = do
    string "let"; whitespaces
    var <- variableNameP; whitespaces
    char '='; whitespaces
    def <- termP; whitespaces
    string "in"; whitespaces
    term <- termP
    return (Application (Lambda var term) def)

lecrecP :: Parsec String () Term
lecrecP = do
    string "letrec"; whitespaces
    f <- variableNameP; whitespaces1
    x <- variableNameP; whitespaces
    char '='; whitespaces
    def <- termP; whitespaces
    string "in"; whitespaces
    term <- termP
    return (Application (Lambda f term) (Mu f (Lambda x def)))

atomP :: Parsec String () Term
atomP =
    choice $ map try [
        intConstP,
        boolConstP,
        variableP,
        char '(' *> whitespaces *> termP <* whitespaces <* char ')',
        Ite <$> (string "if" *> whitespaces *> termP <* whitespaces)
            <*> (string "then" *> whitespaces *> termP <* whitespaces)
            <*> (string "else" *> whitespaces *> termP <* whitespaces),
        Lambda <$> (try (string "lambda") *> whitespaces *> variableNameP <* whitespaces)
               <*> (char '.' *> whitespaces *> termP <* whitespaces),
        Mu <$> (try (string "mu") *> whitespaces *> variableNameP <* whitespaces)
           <*> (char '.' *> whitespaces *> termP <* whitespaces),
        letP,
        lecrecP
    ]

applicationP' :: Term -> Parsec String () Term
applicationP' left = try (whitespaces1 *> atomP >>= applicationP' . Application left) <|> return left

applicationP :: Parsec String () Term
applicationP = atomP >>= applicationP'

multiplicativeP :: Parsec String () Term
multiplicativeP = chainl1 applicationP (try (whitespaces *> char '*' *> whitespaces *> return Product) <|>
                                        try (whitespaces *> char '/' *> whitespaces *> return Division))

additiveP :: Parsec String () Term
additiveP = chainl1 multiplicativeP (try (whitespaces *> char '+' *> whitespaces *> return Sum))

comparativeP :: Parsec String () Term
comparativeP = (try (LessThanOrEqual <$> additiveP <* whitespaces <* string "<=" <* whitespaces <*> additiveP)) <|>
               additiveP

termP :: Parsec String () Term
termP = whitespaces *> comparativeP <* whitespaces

parseTerm :: SourceName -> String -> Either ParseError Term
parseTerm sourceName src = parse (termP <* eof) sourceName src
