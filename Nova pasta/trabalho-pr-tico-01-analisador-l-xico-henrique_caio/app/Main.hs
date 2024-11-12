module Main where
import System.Environment
import Lexing.Lexer

main :: IO ()
main = do
    args <- getArgs
    case args of 
        [f] -> do
            x <- readFile f