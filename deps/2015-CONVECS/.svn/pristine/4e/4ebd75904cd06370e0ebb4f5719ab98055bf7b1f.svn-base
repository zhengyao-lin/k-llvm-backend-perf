data Nat = D0 | S Nat 
  deriving (Show, Eq, Ord)

data NatList = Nil | L Nat  | Ll NatList NatList 
  deriving (Show, Eq, Ord)

data NatListList = NilP | P NatList  | Pp NatListList NatListList 
  deriving (Show, Eq, Ord)

perm :: Nat -> NatListList
insert1 :: Nat -> NatListList -> NatListList
insert0 :: Nat -> NatList -> NatListList
map_cons :: Nat -> NatListList -> NatListList
ppreduce :: NatListList -> NatListList -> NatListList
ppflat :: NatListList -> NatListList -> NatListList

perm D0 = (ppreduce (P Nil) NilP)
perm (S D0) = (ppreduce (P (Ll (L (S D0)) Nil)) NilP)
perm (S n) = (insert1 (S n) (perm n))
insert1 n (Pp (P p1) ps) = (ppreduce (insert0 n p1) (insert1 n ps))
insert1 n (P p1) = (insert0 n p1)
insert1 n NilP = NilP
insert0 n (Ll (L m) p2) = (ppreduce (P (Ll (L n) (Ll (L m) p2))) (map_cons m (insert0 n p2)))
insert0 n Nil = (ppreduce (P (Ll (L n) Nil)) NilP)
map_cons m (Pp (P p1) ps) = (ppreduce (P (Ll (L m) p1)) (map_cons m ps))
map_cons m (P p1) = (P (Ll (L m) p1))
map_cons m NilP = NilP
ppreduce NilP ps2 = ps2
ppreduce ps1 NilP = ps1
ppreduce ps1 ps2 = (ppflat ps1 (ppflat ps2 NilP))
ppflat NilP accumulator = accumulator
ppflat (P p1) accumulator = (Pp (P p1) accumulator)
ppflat (Pp ps1 ps2) accumulator = (ppflat ps1 (ppflat ps2 accumulator))

main = do
 print (perm (S (S (S (S (S (S D0)))))))
