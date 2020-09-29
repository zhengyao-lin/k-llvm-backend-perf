module calls

import StdEnv;

:: S =
     Nullary_constructor
   | Unary_constructor !S
   | Nary_constructor !S !S !S

instance == S where
   (==) (Nullary_constructor) (Nullary_constructor) = True
   (==) (Unary_constructor rec_x1) (Unary_constructor rec_y1) = (rec_x1 == rec_y1)
   (==) (Nary_constructor rec_x1 rec_x2 rec_x3) (Nary_constructor rec_y1 rec_y2 rec_y3) = (rec_x1 == rec_y1) && (rec_x2 == rec_y2) && (rec_x3 == rec_y3)
   (==) rec_x rec_y = False

instance <<< S where
   (<<<) rec_file (Nullary_constructor) = rec_file <<< "Nullary_constructor"
   (<<<) rec_file (Unary_constructor rec_x1) = rec_file <<< "Unary_constructor" <<< " (" <<< rec_x1 <<< ")"
   (<<<) rec_file (Nary_constructor rec_x1 rec_x2 rec_x3) = rec_file <<< "Nary_constructor" <<< " (" <<< rec_x1 <<< ", " <<< rec_x2 <<< ", " <<< rec_x3 <<< ")"

nullary_function :: S
nullary_function = Nullary_constructor

unary_function :: !S -> S
unary_function x = (Unary_constructor x)

nary_function :: !S !S !S -> S
nary_function x y z = (Nary_constructor x y z)

a :: S
a = Nullary_constructor

b :: S
b = (Unary_constructor Nullary_constructor)

c :: S
c = (Nary_constructor Nullary_constructor Nullary_constructor Nullary_constructor)

d :: S
d = nullary_function

e :: S
e = (unary_function nullary_function)

f :: S
f = (nary_function nullary_function nullary_function nullary_function)

Start :: *World -> *World
Start world
   # (console, world) = stdio world
   # console = console <<< Nullary_constructor <<< "\n"
   # console = console <<< (Unary_constructor Nullary_constructor) <<< "\n"
   # console = console <<< (Nary_constructor Nullary_constructor Nullary_constructor Nullary_constructor) <<< "\n"
   # console = console <<< nullary_function <<< "\n"
   # console = console <<< (unary_function nullary_function) <<< "\n"
   # console = console <<< (nary_function nullary_function nullary_function nullary_function) <<< "\n"
   = snd (fclose console world)
