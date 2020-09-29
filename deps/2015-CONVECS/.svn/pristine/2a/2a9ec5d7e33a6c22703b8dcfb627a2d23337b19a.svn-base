module confluence
import IO;

data S = D0() | G (S rec_x1_1);

S f (G (S x)) { if (x == D0()) return x; else fail; }
S f (G (G (S x))) = f (G (x));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (G (G (D0()))));
  return 0;
}
