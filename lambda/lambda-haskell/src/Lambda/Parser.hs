module Lambda.Parser where

import Text.Parsec

import Lambda.AST

whitespace = oneOf " \n\r\f\t"
whitespaces = skipMany whitespace
whitespaces1 = skipMany1 whitespace

wrap :: Parsec String () a -> Parsec String () b -> Parsec String () b
wrap a b = a *> b <* a

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
    string "let"; whitespaces1
    var <- variableNameP
    wrap whitespaces (char '=')
    def <- termP; whitespaces
    wrap whitespaces (string "in")
    term <- termP
    return (Application (Lambda var term) def)

lecrecP :: Parsec String () Term
lecrecP = do
    string "letrec"; whitespaces1
    f <- variableNameP; whitespaces1
    x <- variableNameP
    wrap whitespaces (char '=')
    def <- termP;
    wrap whitespaces (string "in")
    term <- termP
    return (Application (Lambda f term) (Mu f (Lambda x def)))

atomP :: Parsec String () Term
atomP =
    try letP <|>
    try lecrecP <|>
    try intConstP <|>
    try boolConstP <|>
    try variableP <|>
    try (char '(' *> wrap whitespaces termP <* char ')') <|>
    try (Ite <$> (string "if" *> wrap whitespaces termP)
             <*> (string "then" *> wrap whitespaces termP)
             <*> (string "else" *> wrap whitespaces termP)) <|>
    try (Lambda <$> (string "lambda" *> wrap whitespaces variableNameP)
                <*> (char '.' *> wrap whitespaces termP)) <|>
    try (Mu <$> (string "mu" *> wrap whitespaces variableNameP)
            <*> (char '.' *> wrap whitespaces termP))

applicationP' :: Term -> Parsec String () Term
applicationP' left = try (do { whitespaces1; right <- atomP; applicationP' (Application left right) }) <|> return left

applicationP :: Parsec String () Term
applicationP = atomP >>= applicationP'

multiplicativeP :: Parsec String () Term
multiplicativeP = chainl1 applicationP (try (wrap whitespaces (char '*') *> return Product) <|>
                                        try (wrap whitespaces (char '/') *> return Division))

additiveP :: Parsec String () Term
additiveP = chainl1 multiplicativeP (try (wrap whitespaces (char '+') *> return Sum))

comparativeP :: Parsec String () Term
comparativeP = do
    left <- additiveP
    try (LessThanOrEqual left <$> (wrap whitespaces (string "<=") *> additiveP)) <|> return left

termP :: Parsec String () Term
termP = wrap whitespaces comparativeP

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

parseTerm :: SourceName -> String -> Either ParseError Term
parseTerm sourceName src = parse (termP <* eof) sourceName (preprocess src)
