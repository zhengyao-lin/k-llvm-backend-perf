data Xbool = Xtrue | Xfalse
  deriving (Show, Eq, Ord)

data Strg = A | B | C Strg Strg 
  deriving (Show, Eq, Ord)

data List = Nil | L Strg List 
  deriving (Show, Eq, Ord)

gte :: Strg -> Strg -> Xbool
merge :: List -> List -> List
sort :: List -> List
xodd :: List -> List
xeven :: List -> List

gte B A = Xtrue
gte A B = Xfalse
gte A A = Xtrue
gte B B = Xtrue
gte (C e s) e2 = (gte e e2)
gte e (C e2 s2) | e == e2 = Xfalse
gte e (C e2 s2) | e /= e2 = (gte e e2)
merge Nil l1 = l1
merge l1 Nil = l1
merge (L s l1) (L s2 l2) | (gte s s2) == Xtrue = (L s2 (merge (L s l1) l2))
merge (L s l1) (L s2 l2) | (gte s s2) == Xfalse = (L s (merge l1 (L s2 l2)))
xodd Nil = Nil
xodd (L s Nil) = (L s Nil)
xodd (L s (L s2 l1)) = (L s (xodd l1))
xeven Nil = Nil
xeven (L s Nil) = Nil
xeven (L s (L s2 l1)) = (L s2 (xeven l1))
sort Nil = Nil
sort (L s Nil) = (L s Nil)
sort (L s (L s2 l1)) = (merge (sort (xodd (L s (L s2 l1)))) (sort (xeven (L s (L s2 l1)))))

main = do
 print (sort (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) (L (C A (C B (C A B))) (L (C B (C A (C B B))) (L (C A (C B (C A A))) (L (C B (C B (C B B))) (L (C B (C B (C B A))) (L (C A (C A (C A B))) (L (C B (C B (C A A))) (L (C A (C A (C A A))) (L (C A (C A (C B B))) (L (C B (C A (C B A))) Nil)))))))))))))))))))))))))))))))))))))))))))))))))))
