data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data Set = Empty | Singleton Nat  | Union Set Set 
  deriving (Show, Eq, Ord)

plus :: Nat -> Nat -> Nat
times :: Nat -> Nat -> Nat
five :: Nat
ten :: Nat
fifteen :: Nat
twentyfive :: Nat
fifty :: Nat
u :: Set -> Set -> Set
flat :: Set -> Set -> Set
add :: Set -> Set -> Set
mult :: Set -> Set -> Set
singles :: Set
doubles :: Set
triples :: Set
allops :: Set
finish :: Set

plus D0 n = n
plus (S n) m = (S (plus n m))
times D0 n = D0
times (S n) m = (plus m (times n m))
u Empty s0 = s0
u s0 Empty = s0
u s0 s1 | s0 == s1 = s0
u s0 s1 | s0 /= s1 = (flat s0 (flat s1 Empty))
flat Empty s0 = s0
flat (Singleton i) s0 = (Union (Singleton i) s0)
flat (Union s1 s2) s0 = (flat s1 (flat s2 s0))
add Empty s0 = s0
add s0 Empty = s0
add (Singleton i) (Singleton j) = (Singleton (plus i j))
add (Singleton i) (Union (Singleton j) s0) = (add (Singleton (plus i j)) s0)
add (Union (Singleton i) s1) s2 = (u (add (Singleton i) s2) (add s1 s2))
mult Empty s0 = s0
mult s0 Empty = s0
mult (Singleton i) (Singleton j) = (Singleton (times i j))
mult (Union (Singleton i) s1) s2 = (u (mult (Singleton i) s2) (mult s1 s2))
five = (S (S (S (S (S D0)))))
ten = (S (S (S (S (S five)))))
fifteen = (S (S (S (S (S ten)))))
twentyfive = (S (S (S (S (S (S (S (S (S (S fifteen))))))))))
fifty = (plus twentyfive twentyfive)
singles = (add (Singleton (S D0)) (add (Singleton (S (S D0))) (add (Singleton (S (S (S D0)))) (add (Singleton (S (S (S (S D0))))) (add (Singleton five) (add (Singleton (S five)) (add (Singleton (S (S five))) (add (Singleton (S (S (S five)))) (add (Singleton (S (S (S (S five))))) (add (Singleton ten) (add (Singleton (S ten)) (add (Singleton (S (S ten))) (add (Singleton (S (S (S ten)))) (add (Singleton (S (S (S (S ten))))) (add (Singleton fifteen) (add (Singleton (S fifteen)) (add (Singleton (S (S fifteen))) (add (Singleton (S (S (S fifteen)))) (add (Singleton (S (S (S (S fifteen))))) (Singleton (plus five fifteen)))))))))))))))))))))
doubles = (mult singles (Singleton (S (S D0))))
triples = (mult singles (Singleton (S (S (S D0)))))
allops = (u (u (u (u (u singles doubles) triples) (Singleton twentyfive)) (Singleton fifty)) (Singleton D0))
finish = (add (u doubles (Singleton fifty)) (add allops allops))

main = do
 print finish
