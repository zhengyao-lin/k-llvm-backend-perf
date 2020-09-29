module permutations6
import IO;

data Nat = D0() | S (Nat rec_x1_1);

data NatList = Nil() | L (Nat rec_x1_1) | Ll (NatList rec_x1_2, NatList rec_x2_2);

data NatListList = NilP() | P (NatList rec_x1_1) | Pp (NatListList rec_x1_2, NatListList rec_x2_2);

NatListList perm (D0()) = ppreduce (P (Nil()), NilP());
NatListList perm (S (D0())) = ppreduce (P (Ll (L (S (D0())), Nil())), NilP());
NatListList perm (S (Nat n)) = insert1 (S (n), perm (n));

NatListList insert1 (Nat n, Pp (P (NatList p1), NatListList ps)) = ppreduce (insert0 (n, p1), insert1 (n, ps));
NatListList insert1 (Nat n, P (NatList p1)) = insert0 (n,p1);
NatListList insert1 (Nat n, NilP()) = NilP();

NatListList insert0 (Nat n, Ll (L (Nat m), NatList p2)) = ppreduce (P (Ll (L (n), Ll (L (m), p2))), map_cons (m, insert0 (n, p2)));
NatListList insert0 (Nat n, Nil()) = ppreduce (P (Ll (L (n), Nil())), NilP());

NatListList map_cons (Nat m, Pp (P (NatList p1), NatListList ps)) = ppreduce (P (Ll (L (m), p1)), map_cons (m, ps));
NatListList map_cons (Nat m, P (NatList p1)) = P (Ll (L (m), p1));
NatListList map_cons (Nat m, NilP()) = NilP();

NatListList ppreduce (NilP(), NatListList ps2) = ps2;
NatListList ppreduce (NatListList ps1, NilP()) = ps1;
NatListList ppreduce (NatListList ps1, NatListList ps2) = ppflat (ps1, ppflat (ps2, NilP()));

NatListList ppflat (NilP(), NatListList accumulator) = accumulator;
NatListList ppflat (P (NatList p1), NatListList accumulator) = Pp (P (p1), accumulator);
NatListList ppflat (Pp (NatListList ps1, NatListList ps2), NatListList accumulator) = ppflat (ps1, ppflat (ps2, accumulator));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (perm (S (S (S (S (S (S (D0()))))))));
  return 0;
}
