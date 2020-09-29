module dart

import StdEnv;

:: Nat =
     D0
   | S !Nat

:: Set =
     Empty
   | Singleton !Nat
   | Union !Set !Set

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == Set where
   (==) (Empty) (Empty) = True
   (==) (Singleton rec_x1) (Singleton rec_y1) = (rec_x1 == rec_y1)
   (==) (Union rec_x1 rec_x2) (Union rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

instance <<< Set where
   (<<<) rec_file (Empty) = rec_file <<< "Empty"
   (<<<) rec_file (Singleton rec_x1) = rec_file <<< "Singleton" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Union rec_x1 rec_x2) = rec_file <<< "Union" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

plus :: !Nat !Nat -> Nat
plus D0 n = n
plus (S n) m = (S (plus n m))

times :: !Nat !Nat -> Nat
times D0 n = D0
times (S n) m = (plus m (times n m))

u :: !Set !Set -> Set
u Empty s0 = s0
u s0 Empty = s0
u s0 s1 
| (s0 == s1) = s0
| (s0 <> s1) = (flat s0 (flat s1 Empty))

flat :: !Set !Set -> Set
flat Empty s0 = s0
flat (Singleton i) s0 = (Union (Singleton i) s0)
flat (Union s1 s2) s0 = (flat s1 (flat s2 s0))

add :: !Set !Set -> Set
add Empty s0 = s0
add s0 Empty = s0
add (Singleton i) (Singleton j) = (Singleton (plus i j))
add (Singleton i) (Union (Singleton j) s0) = (add (Singleton (plus i j)) s0)
add (Union (Singleton i) s1) s2 = (u (add (Singleton i) s2) (add s1 s2))

mult :: !Set !Set -> Set
mult Empty s0 = s0
mult s0 Empty = s0
mult (Singleton i) (Singleton j) = (Singleton (times i j))
mult (Union (Singleton i) s1) s2 = (u (mult (Singleton i) s2) (mult s1 s2))

five :: Nat
five = (S (S (S (S (S D0)))))

ten :: Nat
ten = (S (S (S (S (S five)))))

fifteen :: Nat
fifteen = (S (S (S (S (S ten)))))

twentyfive :: Nat
twentyfive = (S (S (S (S (S (S (S (S (S (S fifteen))))))))))

fifty :: Nat
fifty = (plus twentyfive twentyfive)

singles :: Set
singles = (add (Singleton (S D0)) (add (Singleton (S (S D0))) (add (Singleton (S (S (S D0)))) (add (Singleton (S (S (S (S D0))))) (add (Singleton five) (add (Singleton (S five)) (add (Singleton (S (S five))) (add (Singleton (S (S (S five)))) (add (Singleton (S (S (S (S five))))) (add (Singleton ten) (add (Singleton (S ten)) (add (Singleton (S (S ten))) (add (Singleton (S (S (S ten)))) (add (Singleton (S (S (S (S ten))))) (add (Singleton fifteen) (add (Singleton (S fifteen)) (add (Singleton (S (S fifteen))) (add (Singleton (S (S (S fifteen)))) (add (Singleton (S (S (S (S fifteen))))) (Singleton (plus five fifteen)))))))))))))))))))))

doubles :: Set
doubles = (mult singles (Singleton (S (S D0))))

triples :: Set
triples = (mult singles (Singleton (S (S (S D0)))))

allops :: Set
allops = (u (u (u (u (u singles doubles) triples) (Singleton twentyfive)) (Singleton fifty)) (Singleton D0))

finish :: Set
finish = (add (u doubles (Singleton fifty)) (add allops allops))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< finish <<< "\n"
   = snd (fclose console world)
