// TOM-B
import permutations7.term.*;
import permutations7.term.types.*;
public class Permutations7 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    NatList =
      | nil()
      | l(rec_x1_1:Xnat)
      | ll(rec_x1_2:NatList, rec_x2_2:NatList)
    NatListList =
      | nilP()
      | p(rec_x1_1:NatList)
      | pp(rec_x1_2:NatListList, rec_x2_2:NatListList)
  }

  private static NatListList perm (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d0() -> { return `ppreduce (p (nil()), nilP()); }
      s (d0()) -> { return `ppreduce (p (ll (l (s (d0())), nil())), nilP()); }
      s (N) -> { return `insert1 (s (N), perm (N)); }
    }
    throw new RuntimeException ("incomplete match in function perm()");
  }

  private static NatListList insert1 (Xnat rec_x1, NatListList rec_x2) {
    %match (Xnat rec_x1, NatListList rec_x2) {
      N, pp (p (P1), Ps) -> { return `ppreduce (insert0 (N, P1), insert1 (N, Ps)); }
      N, p (P1) -> { return `insert0 (N,P1); }
      N, nilP() -> { return `nilP(); }
    }
    throw new RuntimeException ("incomplete match in function insert1()");
  }

  private static NatListList insert0 (Xnat rec_x1, NatList rec_x2) {
    %match (Xnat rec_x1, NatList rec_x2) {
      N, ll (l (M), P2) -> { return `ppreduce (p (ll (l (N), ll (l (M), P2))), map_cons (M, insert0 (N, P2))); }
      N, nil() -> { return `ppreduce (p (ll (l (N), nil())), nilP()); }
    }
    throw new RuntimeException ("incomplete match in function insert0()");
  }

  private static NatListList map_cons (Xnat rec_x1, NatListList rec_x2) {
    %match (Xnat rec_x1, NatListList rec_x2) {
      M, pp (p (P1), Ps) -> { return `ppreduce (p (ll (l (M), P1)), map_cons (M, Ps)); }
      M, p (P1) -> { return `p (ll (l (M), P1)); }
      M, nilP() -> { return `nilP(); }
    }
    throw new RuntimeException ("incomplete match in function map_cons()");
  }

  private static NatListList ppreduce (NatListList rec_x1, NatListList rec_x2) {
    %match (NatListList rec_x1, NatListList rec_x2) {
      nilP(), Ps2 -> { return `Ps2; }
      Ps1, nilP() -> { return `Ps1; }
      Ps1, Ps2 -> { return `ppflat (Ps1, ppflat (Ps2, nilP())); }
    }
    throw new RuntimeException ("incomplete match in function ppreduce()");
  }

  private static NatListList ppflat (NatListList rec_x1, NatListList rec_x2) {
    %match (NatListList rec_x1, NatListList rec_x2) {
      nilP(), accumulator -> { return `accumulator; }
      p (P1), accumulator -> { return `pp (p (P1), accumulator); }
      pp (Ps1, Ps2), accumulator -> { return `ppflat (Ps1, ppflat (Ps2, accumulator)); }
    }
    throw new RuntimeException ("incomplete match in function ppflat()");
  }

  public static void main (String[] args) {
    System.out.println (`perm (s (s (s (s (s (s (s (d0())))))))));
  }
}
