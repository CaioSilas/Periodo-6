--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

-- basic haskell block

{
module Frontend.Parser.LangParser (langParser) where

import Frontend.Lexer.LangLexer
import Syntax.Syntax
}   

%name parser
%tokentype { Token }
%error     {parseError}


%token
     'Int'            {Token _ TInt}
     'Char'           {Token _ TChar}
     'Bool'           {Token _ TBool}
     'Float'          {Token _ TFloat}
     '['              {Token _ TLBracket}
     ']'              {Token _ TRBracket}
     '.'              {Token _ TDot}
     '('              {Token _ TLParen}
     ')'              {Token _ TRParen}
     '!'              {Token _ TNot}
     '*'              {Token _ TMul}
     '/'              {Token _ TDiv}
     '%'              {Token _ TMod}
     '+'              {Token _ TAdd}
     '-'              {Token _ TSub}
     '<'              {Token _ TRelac}
     '=='             {Token _ TEqual}
     '!='             {Token _ TNEqual}
     '&&'             {Token _ TConj}     
     '='              {Token _ TAssign}
     'if'             {Token _ TIf}
     'else'           {Token _ TElse}
     'read'           {Token _ TRead}
     'print'          {Token _ TPrint}
     'return'         {Token _ TReturn}
     'iterate'        {Token _ TIterate}
     '{'              {Token _ TLKeys}
     '}'              {Token _ TRKeys}
     ':'              {Token _ TColon}
     '::'             {Token _ TDoubleColon}
     ','              {Token _ TComma}
     ';'              {Token _ TSemicolon}
     'true'           {Token _ TTrue}
     'false'          {Token _ TFalse}
     id               {Token _ (TIdent $$)}
     float            {Token _ (TNumberF $$)}
     char            {Token _ (TCharLit $$)}
     int              {Token _ (TNumber $$)}

     -- specifying precedences is sufficient to solve shift/reduce ambiguities.

%left '+' '-'
%left '*' '/' '%'
%nonassoc '<' '==' '!='
%left '&&'
%right '!' '-' 'else'
%nonassoc 'read' 'print' 'return' 'iterate' 'if' 'else'

%%

-- definition of the grammar rules and its associated actions.


Program : StructureList                            { Program $1 }

StructureList : StructureList Structure           { $2 : $1 }
        |                                         { [] }

Structure : Id '(' ParamList ')' TypeList CodeBlock {Func $1 $3 $5 $6}   

ParamList : ParamList ',' Param                       {$3 : $1}
       | Param                                        {[$1]} 
       |                                           {[]}

Param : Id '::' PTy                                  {Decl $1 $3}


List   : List ',' Expr    {$3 : $1}
       |                  {[]}

-- CodeBlockList : CodeBlockList CodeBlock           { $2 : $1 }
--         |                                         { [] }

CodeBlock : '{' StmtList '}'                       { Block (reverse $2) }
          | Stmt                                   { OneStmt $1 }

StmtList : StmtList Stmt                           { $2 : $1 }
        |                                         { [] }

Stmt   : 'if' '(' Expr ')' CodeBlock 'else' CodeBlock       %shift {IfElse $3 $5 $7}
       | 'if' '(' Expr ')' CodeBlock                        %shift {If $3 $5}
       | 'iterate' '(' Expr ')' CodeBlock                          {Iterate $3 $5}
       | 'print' Expr ';'                                          {Print $2}
       | 'read' Id ';'                                           {CRead $2}
       | 'return' List ';'                                         {Return $2}
       | Id '=' Expr ';'                                         {Assign $1 $3}
       | PTy Id Init ';'                                            {Def $1 $2 $3}

    
Expr   : Expr '+' Expr                             {Add $1 $3}
       | Expr '*' Expr                             {Mul $1 $3}
       | Expr '-' Expr                             {Sub $1 $3}
       | Expr '/' Expr                             {Div $1 $3}
       | Expr '%' Expr                             {Mod $1 $3}
       | Expr '<' Expr                             {Relac $1 $3}
       | Expr '==' Expr                            {Equal $1 $3}
       | Expr '!=' Expr                            {NEqual $1 $3}
       | Expr '&&' Expr                            {Conj $1 $3}
       | '!' Expr                                  {Not $2}
       | '-' Expr                                  {Negate $2}
       |  float                                    {EValue (EFloat $1)}
       |  int                                      {EValue (EInt $1)}
       |  char                                     {EValue (EChar $1)}
       | 'true'                                    {EValue (EBool True)}
       | 'false'                                   {EValue (EBool False)}
       | Id                                        {EVar $1}       
       | '(' Expr ')'                              {$2}
       | '[' Expr ']'                              {$2}

Id : id                                            {Var $1}


TypeList : TypeList ',' PTy                     {$3 : $1}
         | ':' PTy {[$2]}
         |                                      {[]}

PTy : 'Int'                                        {TSInt}
    | 'Bool'                                       {TSBool}
    | 'Float'                                      {TSFloat}
    | 'Char'                                       {TSChar}


Init : '=' Expr                                   {Just $2}
     |                                             {Nothing}

{
parseError :: [Token] -> a
parseError [] = error "Parse error!"
parseError (t : _) = error $ "Parse error " ++ (show t)

langParser :: String -> Program
langParser = parser . lexer
}