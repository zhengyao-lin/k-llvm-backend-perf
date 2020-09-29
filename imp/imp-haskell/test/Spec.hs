import Test.Hspec
import Test.QuickCheck

import Data.Map as MAP

import Imp.AST
import Imp.Parser
import Imp.Eval

main :: IO ()
main = hspec $ do
    describe "parser correstness" $ do
        it "parses empty program" $ do
            (parseProgram "" "int ;" `shouldBe` Right (Program [] []))

    describe "eval correctness" $ do
        it "executes simple program" $ do
            (eval (Program [] [AssignStmt "a" (IntConst 10)]) `shouldBe` (Right $ MAP.insert "a" 10 MAP.empty))
