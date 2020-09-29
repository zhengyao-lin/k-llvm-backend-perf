data S = Nullary_constructor | Unary_constructor S  | Nary_constructor S S S 
  deriving (Show, Eq, Ord)

nullary_function :: S
unary_function :: S -> S
nary_function :: S -> S -> S -> S
a :: S
b :: S
c :: S
d :: S
e :: S
f :: S

nullary_function = Nullary_constructor
unary_function x = (Unary_constructor x)
nary_function x y z = (Nary_constructor x y z)
a = Nullary_constructor
b = (Unary_constructor Nullary_constructor)
c = (Nary_constructor Nullary_constructor Nullary_constructor Nullary_constructor)
d = nullary_function
e = (unary_function nullary_function)
f = (nary_function nullary_function nullary_function nullary_function)

main = do
 print Nullary_constructor
 print (Unary_constructor Nullary_constructor)
 print (Nary_constructor Nullary_constructor Nullary_constructor Nullary_constructor)
 print nullary_function
 print (unary_function nullary_function)
 print (nary_function nullary_function nullary_function nullary_function)
