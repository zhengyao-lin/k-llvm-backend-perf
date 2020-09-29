module soundnessofparallelengines
import IO;

data N = D0() | S (N rec_x1_1) | G (N rec_x1_2);

N f (G (D0())) = D0();
N f (G (S (N x))) = f (G (x));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (f (G (S (D0()))));
  return 0;
}
