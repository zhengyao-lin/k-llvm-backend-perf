{- Big-step semantics of a variant of (untyped) lambda calculus -}

module Lambda.Eval where

import Lambda.AST

import qualified Data.Set as S

freeVarIn :: Term -> S.Set VariableName
freeVarIn (BoolConst _) = S.empty
freeVarIn (IntConst _) = S.empty
freeVarIn (Product t1 t2) = S.union (freeVarIn t1) (freeVarIn t2)
freeVarIn (Division t1 t2) = S.union (freeVarIn t1) (freeVarIn t2)
freeVarIn (Sum t1 t2) = S.union (freeVarIn t1) (freeVarIn t2)
freeVarIn (LessThanOrEqual t1 t2) = S.union (freeVarIn t1) (freeVarIn t2)
freeVarIn (Ite t1 t2 t3) = S.union (S.union (freeVarIn t1) (freeVarIn t2)) (freeVarIn t3)
freeVarIn (Application t1 t2) = S.union (freeVarIn t1) (freeVarIn t2)
freeVarIn (Variable x) = S.singleton x
freeVarIn (Lambda x t) = S.delete x (freeVarIn t)
freeVarIn (Mu f t) = S.delete f (freeVarIn t)

-- generate a fresh variable distinct from the given set
genFreshVarDisinctFrom :: S.Set VariableName -> VariableName
genFreshVarDisinctFrom s = head $ dropWhile (`S.member` s) (map (('v':) . show) [(0::Integer)..])

-- substition in a binder term and avoid free var capturing
-- by doing transformation preseving alpha equivalence
captureFreeSubstitute :: VariableName -> Term -> (VariableName, Term) -> (VariableName, Term)
captureFreeSubstitute x s (y, t)
    | x == y = (y, t)
    | otherwise =
        let fv_s = freeVarIn s
            fv_t = freeVarIn t
            fresh = genFreshVarDisinctFrom (S.union fv_s fv_t)
        in if S.member y fv_s then -- variable capturing
            (fresh, substitute x s $ substitute y (Variable fresh) $ t)
        else
            (y, substitute x s t)

-- t[s/x], if there is variable capturing
-- use alpha equivalence to transform to
-- a new equivalent term
substitute :: VariableName -> Term -> Term -> Term
substitute _ _ t@(BoolConst _) = t
substitute _ _ t@(IntConst _) = t
substitute x s (Product t1 t2) = Product (substitute x s t1) (substitute x s t2)
substitute x s (Division t1 t2) = Division (substitute x s t1) (substitute x s t2) 
substitute x s (Sum t1 t2) = Sum (substitute x s t1) (substitute x s t2)
substitute x s (LessThanOrEqual t1 t2) = LessThanOrEqual (substitute x s t1) (substitute x s t2)
substitute x s (Ite t1 t2 t3) = Ite (substitute x s t1) (substitute x s t2) (substitute x s t3)
substitute x s (Application t1 t2) = Application (substitute x s t1) (substitute x s t2)

substitute x s t@(Variable y)
    | x == y = s
    | otherwise = t

substitute x s (Lambda y t) = uncurry Lambda $ captureFreeSubstitute x s (y, t)
substitute x s (Mu y t) = uncurry Mu $ captureFreeSubstitute x s (y, t)

eval :: Term -> Term
eval t@(BoolConst _) = t
eval t@(IntConst _) = t
eval t@(Variable _) = t

eval (Product t1 t2) =
    case (eval t1, eval t2) of
        (IntConst n, IntConst m) -> IntConst (n * m)
        (t1, t2) -> Product t1 t2

eval (Division t1 t2) =
    case (eval t1, eval t2) of
        (IntConst n, IntConst m) ->
            if m /= 0 then IntConst (div n m)
            else Division (IntConst n) (IntConst m)
        (t1, t2) -> Division t1 t2

eval (Sum t1 t2) =
    case (eval t1, eval t2) of
        (IntConst n, IntConst m) -> IntConst (n + m)
        (t1, t2) -> Sum t1 t2

eval (LessThanOrEqual t1 t2) =
    case (eval t1, eval t2) of
        (IntConst n, IntConst m) -> BoolConst (n <= m)
        (t1, t2) -> LessThanOrEqual t1 t2

eval (Ite t1 t2 t3) =
    case eval t1 of
        BoolConst True -> eval t2
        BoolConst False -> eval t3
        t1 -> Ite t1 t2 t3

eval (Application t1 t2) =
    case (eval t1, eval t2) of
        (Lambda x t1, t2) -> eval (substitute x t2 t1)
        (t1, t2) -> Application t1 t2

eval t@(Lambda _ _) = t
eval t@(Mu f t') = eval (substitute f t t')
