module calls
import IO;

data S = Nullary_constructor() | Unary_constructor (S rec_x1_1) | Nary_constructor (S rec_x1_2, S rec_x2_2, S rec_x3_2);

S nullary_function() = Nullary_constructor();

S unary_function (S x) = Unary_constructor (x);

S nary_function (S x, S y, S z) = Nary_constructor (x, y, z);

S a() = Nullary_constructor();

S b() = Unary_constructor (Nullary_constructor());

S c() = Nary_constructor (Nullary_constructor(), Nullary_constructor(), Nullary_constructor());

S d() = nullary_function();

S e() = unary_function (nullary_function());

S f() = nary_function (nullary_function(), nullary_function(), nullary_function());

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (Nullary_constructor());
  println (Unary_constructor (Nullary_constructor()));
  println (Nary_constructor (Nullary_constructor(), Nullary_constructor(), Nullary_constructor()));
  println (nullary_function());
  println (unary_function (nullary_function()));
  println (nary_function (nullary_function(), nullary_function(), nullary_function()));
  return 0;
}
