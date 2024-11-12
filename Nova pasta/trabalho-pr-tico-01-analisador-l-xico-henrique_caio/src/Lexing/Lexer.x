--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

-- Initial Haskell code block
{
module Lexing.Lexer (lexer, testLexer, testLexerFile) where
}

-- definition of the wrapper

%wrapper "basic"

-- macros for the lexer definition.
-- first character set macros

$digit = 0-9            -- digits
$alpha = [a-zA-Z]       -- alphabetic characters

-- second RE macros

@identifier = $alpha[$alpha $digit]* -- identifiers
@number     = $digit+



-- token declarations.

tokens :-
  $white+                 ; -- removing whitespace
  "//".*                  ; -- removing line comments
  "Int"                   { \ _ -> TInt }
  "Char"                  { \ _ -> TChar }
  "Bool"                  { \ _ -> TBool }
  "Float"                 { \ _ -> TFloat }
  \[                      { \ _ -> TLBracket }
  \]                      { \ _ -> TRBracket }
  \.                      { \ _ -> TDot }
  \(                      { \ _ -> TLParen }
  \)                      { \ _ -> TRParen }
  \!                      { \ _ -> TNot }
  \*                      { \ _ -> TMul }
  \/                      { \ _ -> TDiv }
  \%                      { \ _ -> TMod }
  \+                      { \ _ -> TAdd }
  \-                      { \ _ -> TSub }
  \<                      { \ _ -> TRelac }
  "=="                    { \ _ -> TEqual }
  "!="                    { \ _ -> TNEqual }
  "&&"                    { \ _ -> TConj }     
  \=                      { \ _ -> TAssign }
  "if"                    { \ _ -> TIf }
  "else"                  { \ _ -> TElse }
  "read"                  { \ _ -> TRead }
  "print"                 { \ _ -> TPrint }
  "return"                { \ _ -> TReturn }
  "iterate"               { \ _ -> TIterate }
  \{                      { \ _ -> TLKeys }
  \}                      { \ _ -> TRKeys }
  \:                      { \ _ -> TColon }
  "::"                    { \ _ -> TDoubleColon }
  \,                      { \ _ -> TComma }
  \;                      { \ _ -> TSemicolon }
  @number                 { \ s -> TNumber (read s) }
  @identifier             { \ s -> TId s }




-- more Haskell code

-- token definitions
{
data Token
  -- types
  = TInt
  | TChar
  | TBool
  | TFloat
  | TId String
  -- comands
  | TAssign
  | TIf
  | TElse
  | TRead
  | TPrint
  | TReturn
  | TIterate
  -- values
  | TNumber Int
  -- operators
  | TAdd
  | TSub
  | TMul
  | TDiv
  | TMod
  | TLKeys
  | TRKeys
  | TLParen
  | TRParen
  | TLBracket
  | TRBracket
  | TDot
  | TEqual
  | TNEqual
  | TConj
  | TNot
  | TRelac
  | TColon
  | TDoubleColon
  | TComma
  | TSemicolon
  deriving (Eq, Show)

lexer :: String -> [Token]
lexer = alexScanTokens

testLexer :: IO ()
testLexer
  = do
      s <- getLine
      let tokens = lexer s
      mapM_ print tokens

testLexerFile :: String -> IO ()
testLexerFile filePath
  = do
    -- filePath <- getLine
    contents <- readFile filePath
    let tokens = lexer contents
    mapM_ print tokens
}
