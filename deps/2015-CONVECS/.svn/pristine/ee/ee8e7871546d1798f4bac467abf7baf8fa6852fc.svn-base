// TOM-A
import permutations6.term.*;
import permutations6.term.types.*;
public class Permutations6 {
  %gom{
    module Term
    abstract syntax
    NatList =
      | ll(rec_x1_1:NatList, rec_x2_1:NatList)
      | l(rec_x1_2:Xnat)
      | nil()
    NatListList =
      | insert0(rec_x1_1:Xnat, rec_x2_1:NatList)
      | insert1(rec_x1_2:Xnat, rec_x2_2:NatListList)
      | map_cons(rec_x1_3:Xnat, rec_x2_3:NatListList)
      | nilP()
      | perm(rec_x1_4:Xnat)
      | p(rec_x1_5:NatList)
      | ppflat(rec_x1_6:NatListList, rec_x2_6:NatListList)
      | pp(rec_x1_7:NatListList, rec_x2_7:NatListList)
      | ppreduce(rec_x1_8:NatListList, rec_x2_8:NatListList)
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    module Term:rules() {
      perm (d0()) -> ppreduce (p (nil()), nilP())
      perm (s (d0())) -> ppreduce (p (ll (l (s (d0())), nil())), nilP())
      perm (s (N)) -> insert1 (s (N), perm (N))
      insert1 (N, pp (p (P1), Ps)) -> ppreduce (insert0 (N, P1), insert1 (N, Ps))
      insert1 (N, p (P1)) -> insert0 (N,P1)
      insert1 (N, nilP()) -> nilP()
      insert0 (N, ll (l (M), P2)) -> ppreduce (p (ll (l (N), ll (l (M), P2))), map_cons (M, insert0 (N, P2)))
      insert0 (N, nil()) -> ppreduce (p (ll (l (N), nil())), nilP())
      map_cons (M, pp (p (P1), Ps)) -> ppreduce (p (ll (l (M), P1)), map_cons (M, Ps))
      map_cons (M, p (P1)) -> p (ll (l (M), P1))
      map_cons (M, nilP()) -> nilP()
      ppreduce (nilP(), Ps2) -> Ps2
      ppreduce (Ps1, nilP()) -> Ps1
      ppreduce (Ps1, Ps2) -> ppflat (Ps1, ppflat (Ps2, nilP()))
      ppflat (nilP(), accumulator) -> accumulator
      ppflat (p (P1), accumulator) -> pp (p (P1), accumulator)
      ppflat (pp (Ps1, Ps2), accumulator) -> ppflat (Ps1, ppflat (Ps2, accumulator))
    }
  }
  public static void main (String[] args) {
    System.out.println (`perm (s (s (s (s (s (s (d0()))))))));
  }
}
