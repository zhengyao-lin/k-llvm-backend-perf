module Main where

import System.Environment
import System.Exit

import Text.Parsec

import Imp.Parser
import Imp.Eval

main :: IO ()
main = do
    args <- getArgs
    case args of
        [srcPath] -> do
            src <- readFile srcPath
            case parseProgram srcPath src of
                Left err -> putStrLn ("failed to parse source: " ++ show err) *> exitFailure
                Right pgm -> putStrLn $ show $ eval pgm
        _ ->
            putStrLn "expecting exactly one argument for program path" *> exitFailure
