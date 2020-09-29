data Disk = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | D10 | D11 | D12 | D13 | D14 | D15 | D16 | D17 | D18 | D19 | D20
  deriving (Show, Eq, Ord)

data Tower = A | B | C
  deriving (Show, Eq, Ord)

data Move = Movedisk Disk Tower Tower 
  deriving (Show, Eq, Ord)

data List = Nil | Cons Move List 
  deriving (Show, Eq, Ord)

dec :: Disk -> Disk
other :: Tower -> Tower -> Tower
conc :: List -> List -> List
solve :: Tower -> Tower -> Disk -> List

dec D20 = D19
dec D19 = D18
dec D18 = D17
dec D17 = D16
dec D16 = D15
dec D15 = D14
dec D14 = D13
dec D13 = D12
dec D12 = D11
dec D11 = D10
dec D10 = D9
dec D9 = D8
dec D8 = D7
dec D7 = D6
dec D6 = D5
dec D5 = D4
dec D4 = D3
dec D3 = D2
dec D2 = D1
dec D1 = D0
other A B = C
other B A = C
other A C = B
other C A = B
other B C = A
other C B = A
conc Nil l = l
conc l Nil = l
conc (Cons h t) l = (Cons h (conc t l))
solve oRG dEST D0 = Nil
solve oRG dEST d | d /= D0 = (conc (solve oRG (other oRG dEST) (dec d)) (Cons (Movedisk d oRG dEST) (solve (other oRG dEST) dEST (dec d))))

main = do
 print (solve A B D20)
