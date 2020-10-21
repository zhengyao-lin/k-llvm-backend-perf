module Main where

import System.Environment
import System.Exit

import Lambda.AST
import Lambda.Eval
import Lambda.Parser

import qualified Data.Set as S

main :: IO ()
main = do
    args <- getArgs
    case args of
        [srcPath] -> do
            src <- readFile srcPath
            case parseTerm srcPath src of
                Left err -> putStrLn ("failed to parse source: " ++ show err) *> exitFailure
                Right term -> do
                    putStrLn ("evaluating: " ++ (show term))
                    putStrLn (show (eval term))
        _ ->
            putStrLn "expecting exactly one argument for program path" *> exitFailure
