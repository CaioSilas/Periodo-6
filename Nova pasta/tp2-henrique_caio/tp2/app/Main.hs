--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

module Main (main) where

import System.Environment (getArgs)
import Frontend.Parser.LangParser
import Interpreter.LangInterpreter

-- main :: IO ()
-- main = do
--     putStrLn "Hello, Haskell!"

main :: IO ()
main = do
  args <- getArgs
  runInterpreter args

printErrorMessage :: IO ()
printErrorMessage
  = do
       putStrLn "Usage"
       putStrLn "tp2 <file>"

runInterpreter :: [String] -> IO ()
runInterpreter [arg1]
  = do
      content <- readFile arg1
      let ast = langParser content
      _ <- interpProgram ast
      return ()
runInterpreter _
  = printErrorMessage
