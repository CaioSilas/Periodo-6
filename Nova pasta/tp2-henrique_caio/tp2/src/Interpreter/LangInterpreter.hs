--Caio Silas de Araujo Amaro - 21.1.4111
--Henrique Dantas Pighini - 21.1.4025

module Interpreter.LangInterpreter (interpProgram) where


import Data.Fixed (mod')
import Data.Char
import Data.List (union)
import Syntax.Syntax


type Env = [(Var, Value)]

(.+.) :: Value -> Value -> Value
(EInt n) .+. (EInt m) = EInt (n + m)
(EInt n) .+. (EFloat m) = EFloat (fromIntegral n + m)
(EFloat n) .+. (EInt m) = EFloat (n + fromIntegral m)
(EFloat n) .+. (EFloat m) = EFloat (n + m)
_        .+. _        = error "Type error"

(.*.) :: Value -> Value -> Value
(EInt n) .*. (EInt m) = EInt (n * m)
(EInt n) .*. (EFloat m) = EFloat (fromIntegral n * m)
(EFloat n) .*. (EInt m) = EFloat (n * fromIntegral m)
(EFloat n) .*. (EFloat m) = EFloat (n * m)
_        .*. _        = error "Type error"

(.-.) :: Value -> Value -> Value
(EInt n) .-. (EInt m) = EInt (n - m)
(EInt n) .-. (EFloat m) = EFloat (fromIntegral n - m)
(EFloat n) .-. (EInt m) = EFloat (n - fromIntegral m)
(EFloat n) .-. (EFloat m) = EFloat (n - m)
_        .-. _        = error "Type error"

(./.) :: Value -> Value -> Value
(EInt n) ./. (EInt m) = EInt (div n m)
(EInt n) ./. (EFloat m) = EFloat (fromIntegral n / m)
(EFloat n) ./. (EInt m) = EFloat (n / fromIntegral m)
(EFloat n) ./. (EFloat m) = EFloat (n / m)
_        ./. _        = error "Type error"

(.&&.) :: Value -> Value -> Value
(EBool b1) .&&. (EBool b2) = EBool (b1 && b2)
_          .&&. _         = error "Type error"

(.<.) :: Value -> Value -> Value
(EInt b1) .<. (EInt b2) = EBool (b1 < b2)
_         .<. _         = error "Type error"

(.==.) :: Value -> Value -> Value
(EInt b1) .==. (EInt b2) = EBool (b1 == b2)
_         .==. _         = error "Type error"

(.!=.) :: Value -> Value -> Value
(EInt b1) .!=. (EInt b2) = EBool (b1 /= b2)
_         .!=. _         = error "Type error"

(.%.) :: Value -> Value -> Value
(EInt n) .%. (EInt m) = EInt (n `mod` m)
(EInt n) .%. (EFloat m) = EFloat (fromIntegral n `mod'` m)
(EFloat n) .%. (EInt m) = EFloat (n `mod'` fromIntegral m)
(EFloat n) .%. (EFloat m) = EFloat (n `mod'` m)
_ .%. _ = error "Type error"


printValue :: Value -> IO ()
printValue (EInt n) = print n
printValue (EFloat f) = print f
printValue (EBool b) = print b
printValue (EChar c) = print c
printValue (ENull) = print "NULL"

readValue :: IO Value
readValue = do
  s <- getLine
  if all isDigit s || '.' `elem` s then
    if '.' `elem` s then
      return $ EFloat (read s)
    else
      return $ EInt (read s)
  else if s `elem` ["True", "False"] then
    return $ EBool (read s)
  else
    error "type error"

interpBinOp :: Env -> (Value -> Value -> Value) -> Exp -> Exp -> IO Value
interpBinOp env f e1 e2
  = do
       v1 <- interpExp env e1
       v2 <- interpExp env e2
       return (f v1 v2)

interpExp :: Env -> Exp -> IO Value
interpExp _   (EValue v) = return v
interpExp env (EVar v)
  = case lookup v env of
      Just val -> return val
      Nothing  -> error "Undefined variable"
interpExp env (Add e1 e2)
  = do
      v1 <- interpExp env e1
      v2 <- interpExp env e2
      return (v1 .+. v2)
interpExp env (Mul e1 e2)
  = do
      v1 <- interpExp env e1
      v2 <- interpExp env e2
      return (v1 .*. v2)
interpExp env (Sub e1 e2)
  = interpBinOp env (.-.) e1 e2
interpExp env (Div e1 e2)
  = interpBinOp env (./.) e1 e2
interpExp env (Mod e1 e2)
  = interpBinOp env (.%.) e1 e2
interpExp env (Conj e1 e2)
  = interpBinOp env (.&&.) e1 e2
interpExp env (Equal e1 e2)
  = interpBinOp env (.==.) e1 e2
interpExp env (NEqual e1 e2)
  = interpBinOp env (.!=.) e1 e2
interpExp env (Relac e1 e2)
  = interpBinOp env (.<.) e1 e2

interpExp env (Not e)
  = do
       v1 <- interpExp env e
       case v1 of
         (EBool b) -> return (EBool (not b))
         _         -> error "type error!"

interpExp env (Negate e)
  = do
       v1 <- interpExp env e
       case v1 of
         (EInt b) -> return (EInt (-b))
         _         -> error "type error!"

insertVal :: Var -> Value -> Env -> Env
insertVal v val env = (v, val) : env

defaultValue :: Ty -> Value
defaultValue TSInt  = EInt 0
defaultValue TSFloat  = EFloat 0.0
defaultValue TSBool = EBool False
defaultValue TSChar = EChar ' '


removeVars :: [Var] -> Env -> Env
removeVars vs env
  = [(x,v) | (x,v) <- env, x `notElem` vs]

interpStmt :: Env -> Stmt -> IO (Env, [Var])
interpStmt env (Def t v me)
  = case me of
      Just e -> do
        v1 <- interpExp env e
        return (insertVal v v1 env, [v])
      Nothing -> return (insertVal v (defaultValue t) env, [v])
interpStmt env (Assign v e)
  = do
      val <- interpExp env e
      return (insertVal v val env, [])
interpStmt env (IfElse e1 b1 b2)
  = do
      val1 <- interpExp env e1
      case val1 of
        EBool True ->
          do
            (env', _) <- interpBlock env b1
            return (env', [])
        EBool False ->
          do
            (env', _) <- interpBlock env b2
            return (env', [])
        _           -> error "type error"
interpStmt env (Iterate e b)
  = do
       v1 <- interpExp env e
       case v1 of
         EBool False -> return (env, [])
         EBool True -> do
           (env1, _) <- interpBlock env b
           (env', _) <- interpStmt env1 (Iterate e b)
           return (env', [])
         _ -> error "type error"
interpStmt env (Print e)
  = do
      v1 <- interpExp env e
      printValue v1
      return (env , [])
interpStmt env (CRead x)
  = do
      n <- readValue
      return (insertVal x n env, [])

interpBlock :: Env -> Block -> IO (Env, [Var])
interpBlock env (Block stms)
  = do
       (env1, vs) <- interpList env stms
       return (removeVars vs env1, [])
interpBlock env (Block [stms])
  = do
       (env1, vs) <- interpStmt env stms
       return (removeVars vs env1, [])



interpList :: Env -> [Stmt] -> IO (Env, [Var])
interpList env [] = return (env, [])
interpList env (s : ss)
  = do
       (env1, vs) <- interpStmt env s
       (env2, vss) <- interpList env1 ss
       return (env2, vs `union` vss)


interpStructure :: Env -> Structure -> IO (Env, [Var])
interpStructure env (Func var params tys block) = do
  let paramDefaults = map (\t -> defaultValue t) tys
  let paramEnv = zip (map (\(Decl v _) -> v) params) paramDefaults
  let funcEnv = env ++ paramEnv
  (_, vs) <- interpBlock funcEnv block
  return (removeVars (map (\(Decl v _) -> v) params) funcEnv, var : vs)


interpStructures :: Env -> [Structure] -> IO (Env, [Var])
interpStructures env [] = return (env, [])
interpStructures env (struct : structs) = do
  (env1, vs1) <- interpStructure env struct
  (env2, vs2) <- interpStructures env1 structs
  return (env2, vs1 `union` vs2)

interpProgram :: Program -> IO Env
interpProgram (Program strcs) = do
  (env, _) <- interpStructures [] strcs
  return env