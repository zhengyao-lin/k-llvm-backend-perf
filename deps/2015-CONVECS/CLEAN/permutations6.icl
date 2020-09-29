module permutations6

import StdEnv;

:: Nat =
     D0
   | S !Nat

:: NatList =
     XNil
   | L !Nat
   | Ll !NatList !NatList

:: NatListList =
     NilP
   | P !NatList
   | Pp !NatListList !NatListList

instance == Nat where
   (==) (D0) (D0) = True
   (==) (S rec_x1) (S rec_y1) = (rec_x1 == rec_y1)
   (==) rec_x rec_y = False

instance == NatList where
   (==) (XNil) (XNil) = True
   (==) (L rec_x1) (L rec_y1) = (rec_x1 == rec_y1)
   (==) (Ll rec_x1 rec_x2) (Ll rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance == NatListList where
   (==) (NilP) (NilP) = True
   (==) (P rec_x1) (P rec_y1) = (rec_x1 == rec_y1)
   (==) (Pp rec_x1 rec_x2) (Pp rec_y1 rec_y2) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2)
   (==) rec_x rec_y = False

instance <<< Nat where
   (<<<) rec_file (D0) = rec_file <<< "D0"
   (<<<) rec_file (S rec_x1) = rec_file <<< "S" <<< " (" <<< rec_x1 <<< ")"

instance <<< NatList where
   (<<<) rec_file (XNil) = rec_file <<< "XNil"
   (<<<) rec_file (L rec_x1) = rec_file <<< "L" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Ll rec_x1 rec_x2) = rec_file <<< "Ll" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

instance <<< NatListList where
   (<<<) rec_file (NilP) = rec_file <<< "NilP"
   (<<<) rec_file (P rec_x1) = rec_file <<< "P" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Pp rec_x1 rec_x2) = rec_file <<< "Pp" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ")"

perm :: !Nat -> NatListList
perm D0 = (ppreduce (P XNil) NilP)
perm (S D0) = (ppreduce (P (Ll (L (S D0)) XNil)) NilP)
perm (S n) = (insert1 (S n) (perm n))

insert1 :: !Nat !NatListList -> NatListList
insert1 n (Pp (P p1) ps) = (ppreduce (insert0 n p1) (insert1 n ps))
insert1 n (P p1) = (insert0 n p1)
insert1 n NilP = NilP

insert0 :: !Nat !NatList -> NatListList
insert0 n (Ll (L m) p2) = (ppreduce (P (Ll (L n) (Ll (L m) p2))) (map_cons m (insert0 n p2)))
insert0 n XNil = (ppreduce (P (Ll (L n) XNil)) NilP)

map_cons :: !Nat !NatListList -> NatListList
map_cons m (Pp (P p1) ps) = (ppreduce (P (Ll (L m) p1)) (map_cons m ps))
map_cons m (P p1) = (P (Ll (L m) p1))
map_cons m NilP = NilP

ppreduce :: !NatListList !NatListList -> NatListList
ppreduce NilP ps2 = ps2
ppreduce ps1 NilP = ps1
ppreduce ps1 ps2 = (ppflat ps1 (ppflat ps2 NilP))

ppflat :: !NatListList !NatListList -> NatListList
ppflat NilP accumulator = accumulator
ppflat (P p1) accumulator = (Pp (P p1) accumulator)
ppflat (Pp ps1 ps2) accumulator = (ppflat ps1 (ppflat ps2 accumulator))

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< (perm (S (S (S (S (S (S D0))))))) <<< "\n"
   = snd (fclose console world)
