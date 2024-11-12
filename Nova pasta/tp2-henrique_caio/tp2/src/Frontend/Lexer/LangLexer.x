--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

-- Initial Haskell code block
{
module Frontend.Lexer.LangLexer (Token (..), Lexeme (..), lexer) where
}

%wrapper "posn"

$digit = 0-9            -- digits
$alpha = [a-zA-Z]       -- alphabetic characters

-- second RE macros

@identifier  = $alpha[$alpha $digit]* -- identifiers
@number      = $digit* "." $digit+ | $digit+ "." $digit* | $digit+
@charLiteral = \'[\\]*$alpha\'

-- token declarations.

tokens :-
      $white+                 ; -- removing whitespace
      "//".*                  ; -- removing line comments
      @number                  { mkNumber }
      @charLiteral             { mkChar }
      "Int"                    { simpleToken TInt }
      "Char"                   { simpleToken TChar }
      "Bool"                   { simpleToken TBool }
      "Float"                  { simpleToken TFloat }
      "["                      { simpleToken TLBracket }
      "]"                      { simpleToken TRBracket }
      "."                      { simpleToken TDot }
      "("                      { simpleToken TLParen }
      ")"                      { simpleToken TRParen }
      "!"                      { simpleToken TNot }
      "*"                      { simpleToken TMul }
      "/"                      { simpleToken TDiv }
      "%"                      { simpleToken TMod }
      "+"                      { simpleToken TAdd }
      "-"                      { simpleToken TSub }
      "<"                      { simpleToken TRelac }
      "=="                     { simpleToken TEqual }
      "!="                     { simpleToken TNEqual }
      "&&"                     { simpleToken TConj }     
      "="                      { simpleToken TAssign }
      "if"                     { simpleToken TIf }
      "else"                   { simpleToken TElse }
      "read"                   { simpleToken TRead }
      "print"                  { simpleToken TPrint }
      "return"                 { simpleToken TReturn }
      "iterate"                { simpleToken TIterate }
      "{"                      { simpleToken TLKeys }
      "}"                      { simpleToken TRKeys }
      ":"                      { simpleToken TColon }
      "::"                     { simpleToken TDoubleColon }
      ","                      { simpleToken TComma }
      ";"                      { simpleToken TSemicolon }
      "true"                   {simpleToken TTrue}
      "false"                  {simpleToken TFalse}
      @identifier              { mkIdent }

-- more Haskell code

{

-- token definition

data Token
  = Token {
      pos :: (Int, Int)
    , lexeme :: Lexeme 
    } deriving (Eq, Ord, Show)

data Lexeme
  -- types
  = TInt
  | TChar
  | TBool
  | TFloat
  | TIdent String
  -- comands
  | TAssign
  | TIf
  | TElse
  | TRead
  | TPrint
  | TReturn
  | TIterate
  -- values
  | TNumberF Float
  | TNumber Int
  | TCharLit Char
  | TTrue 
  | TFalse 
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
  | TVInt 
  | TVBool 
  
  deriving (Eq, Ord, Show)

position :: AlexPosn -> (Int, Int)
position (AlexPn _ x y) = (x,y)


mkIdent :: AlexPosn -> String -> Token 
mkIdent p s
  | s == "if"   = Token (position p) TIf
  | s == "else" = Token (position p) TElse
  | s == "true" = Token (position p) TTrue
  | s == "false" = Token (position p) TFalse
  | s == "int"   = Token (position p) TVInt
  | s == "bool"  = Token (position p) TVBool
  | s == "read"  = Token (position p) TRead
  | s == "print" = Token (position p) TPrint
  | s == "iterate" = Token (position p) TIterate
  | otherwise = Token (position p) (TIdent s)


mkNumber :: AlexPosn -> String -> Token
mkNumber p s =
  if '.' `elem` s
    then Token (position p) (TNumberF $ read s)
    else Token (position p) (TNumber $ read s)

mkChar :: AlexPosn -> String -> Token
mkChar p s = Token (position p) (TCharLit (head s))

simpleToken :: Lexeme -> AlexPosn -> String -> Token
simpleToken lx p _ = Token (position p) lx

lexer :: String -> [Token]
lexer = alexScanTokens
}