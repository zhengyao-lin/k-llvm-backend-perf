data List = L Elt List  | Nil
  deriving (Show, Eq, Ord)

data Elt = A | B | C | D | E
  deriving (Show, Eq, Ord)

conc :: List -> List -> List
dup :: List -> List
rev :: List -> List

conc (L e0 l1) l2 = (L e0 (conc l1 l2))
conc Nil l2 = l2
dup l1 = (conc l1 l1)
rev (L e0 l1) = (conc (rev l1) (L e0 Nil))
rev Nil = Nil

main = do
 print (rev (dup (L A (L B (L C (L D (L E Nil)))))))
