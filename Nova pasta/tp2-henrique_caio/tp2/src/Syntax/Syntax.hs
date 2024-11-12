--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

-- |

module Syntax.Syntax (
  Var(..),
  Value(..),
  Exp(..),
  LValue(..),
  Ty(..),
  Program(..),
  Structure(..),
  Block(..),
  Reg(..),
  Param(..),
  Stmt(..)
) where
-- definition of expressions
newtype Var = Var { unVar :: String } deriving (Eq, Ord, Show)

data Value
  = EInt Int
  | EFloat Float
  | EBool Bool
  | EChar Char
  | ENull
  deriving (Eq, Ord, Show)


data Exp
  = EValue Value
  | EVar Var
  | Add Exp Exp
  | Mul Exp Exp
  | Sub Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
  | Equal Exp Exp
  | NEqual Exp Exp
  | Relac Exp Exp
  | Negate Exp
  | Conj Exp Exp
  | Not Exp
  -- | Lv LValue
  | ExpFunc Var [Exp] Exp
  | New Ty [Exp]
  deriving (Eq, Ord, Show)


data LValue
  = LValue Var
  | VLValue LValue Exp
  | AccReg Var Var
  deriving (Eq, Ord, Show)

-- types
data Ty 
    = TSInt 
    | TSFloat 
    | TSBool 
    | TSChar 
    | TSId
    | TSVector Ty
    deriving (Eq, Ord, Show)

-- syntax for statements


-- newtype Program
--   = Program {unProgram :: Block}
--     deriving (Eq, Ord, Show)

data Program
  = Program {unProgram :: [Structure]}
  deriving (Eq, Ord, Show)

data Structure 
  = Data Var Reg
  | Func Var [Param] [Ty] Block
  deriving (Eq, Ord, Show)

data Block
  = Block { unBlock :: [Stmt] }
  | OneStmt Stmt
  deriving (Eq, Ord, Show)

data Reg
  = AttReg [Param]
  deriving (Eq, Ord, Show)

data Param
  = Decl Var Ty
  deriving (Eq, Ord, Show)

data Stmt
  = Assign Var Exp
  | If Exp Block
  | IfElse Exp Block Block
  | Print Exp
  | CRead Var
  | Iterate Exp Block
  | CallFunc Var [Exp] [Var]
  | Return [Exp]  
  | DeclReg Var Var
  | Def Ty Var (Maybe Exp)
  deriving (Eq, Ord, Show)
