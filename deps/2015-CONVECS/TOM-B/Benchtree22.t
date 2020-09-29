// TOM-B
import benchtree22.term.*;
import benchtree22.term.types.*;
public class Benchtree22 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xboolean =
      | Xtrue()
      | Xfalse()
    Xnat =
      | zero()
      | s(rec_x1_1:Xnat)
    SNat =
      | exz()
      | exone()
      | exs(rec_x1_1:SNat)
      | explus(rec_x1_2:SNat, rec_x2_2:SNat)
      | exmult(rec_x1_3:SNat, rec_x2_3:SNat)
      | exexp(rec_x1_4:SNat, rec_x2_4:SNat)
    Tree =
      | leaf(rec_x1_1:Xnat)
      | node(rec_x1_2:Xnat, rec_x2_2:Xnat, rec_x3_2:Tree, rec_x4_2:Tree)
  }

  private static Xboolean or (Xboolean rec_x1, Xboolean rec_x2) {
    %match (Xboolean rec_x1, Xboolean rec_x2) {
      Xtrue(), B -> { return `Xtrue(); }
      Xfalse(), B -> { return `B; }
    }
    throw new RuntimeException ("incomplete match in function or()");
  }

  private static Xboolean and (Xboolean rec_x1, Xboolean rec_x2) {
    %match (Xboolean rec_x1, Xboolean rec_x2) {
      Xtrue(), B -> { return `B; }
      Xfalse(), B -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Xboolean neg (Xboolean rec_x1) {
    %match (Xboolean rec_x1) {
      Xfalse() -> { return `Xtrue(); }
      Xtrue() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function neg()");
  }

  private static Xnat d0 () {
    return `zero();
  }

  private static Xnat d1 () {
    return `s (d0());
  }

  private static Xnat d2 () {
    return `s (d1());
  }

  private static Xnat d3 () {
    return `s (d2());
  }

  private static Xnat d4 () {
    return `s (d3());
  }

  private static Xnat d5 () {
    return `s (d4());
  }

  private static Xnat d6 () {
    return `s (d5());
  }

  private static Xnat d7 () {
    return `s (d6());
  }

  private static Xnat d8 () {
    return `s (d7());
  }

  private static Xnat d9 () {
    return `s (d8());
  }

  private static Xnat d10 () {
    return `s (d9());
  }

  private static Xnat d11 () {
    return `s (d10());
  }

  private static Xnat d12 () {
    return `s (d11());
  }

  private static Xnat d13 () {
    return `s (d12());
  }

  private static Xnat d14 () {
    return `s (d13());
  }

  private static Xnat d15 () {
    return `s (d14());
  }

  private static Xnat d16 () {
    return `s (d15());
  }

  private static Xnat d17 () {
    return `s (d16());
  }

  private static SNat one () {
    return `exs (exz());
  }

  private static SNat two () {
    return `exs (one());
  }

  private static SNat three () {
    return `exs (two());
  }

  private static SNat four () {
    return `exs (three());
  }

  private static SNat five () {
    return `exs (four());
  }

  private static SNat six () {
    return `exs (five());
  }

  private static SNat seven () {
    return `exs (six());
  }

  private static SNat eight () {
    return `exs (seven());
  }

  private static SNat nine () {
    return `exs (eight());
  }

  private static SNat ten () {
    return `exs (nine());
  }

  private static SNat eleven () {
    return `exs (ten());
  }

  private static SNat twelve () {
    return `exs (eleven());
  }

  private static SNat thirteen () {
    return `exs (twelve());
  }

  private static SNat fourteen () {
    return `exs (thirteen());
  }

  private static SNat fifteen () {
    return `exs (fourteen());
  }

  private static SNat sixteen () {
    return `exs (fifteen());
  }

  private static SNat seventeen () {
    return `exs (sixteen());
  }

  private static SNat eighteen () {
    return `exs (seventeen());
  }

  private static SNat nineteen () {
    return `exs (eighteen());
  }

  private static SNat twenty () {
    return `exs (nineteen());
  }

  private static SNat twentyone () {
    return `exs (twenty());
  }

  private static SNat twentytwo () {
    return `exs (twentyone());
  }

  private static SNat twentythree () {
    return `exs (twentytwo());
  }

  private static SNat twentyfour () {
    return `exs (twentythree());
  }

  private static SNat twentyfive () {
    return `exs (twentyfour());
  }

  private static SNat twentysix () {
    return `exs (twentyfive());
  }

  private static SNat twentyseven () {
    return `exs (twentysix());
  }

  private static SNat twentyeight () {
    return `exs (twentyseven());
  }

  private static SNat twentynine () {
    return `exs (twentyeight());
  }

  private static SNat thirty () {
    return `exs (twentynine());
  }

  private static SNat thirtyone () {
    return `exs (thirty());
  }

  private static SNat thirtytwo () {
    return `exs (thirtyone());
  }

  private static SNat thirtythree () {
    return `exs (thirtytwo());
  }

  private static SNat thirtyfour () {
    return `exs (thirtythree());
  }

  private static SNat thirtyfive () {
    return `exs (thirtyfour());
  }

  private static SNat dec (SNat rec_x1) {
    %match (SNat rec_x1) {
      exexp (Xs,exz()) -> { return `exs (exz()); }
      exexp (Xs,exs (Ys)) -> { return `exmult (exexp (Xs,Ys),Xs); }
      exexp (Xs,explus (Ys,Zs)) -> { return `exmult (exexp (Xs,Ys),exexp (Xs,Zs)); }
      exexp (Xs,exmult (Ys,Zs)) -> { return `dec (exexp (exexp (Xs,Ys),Zs)); }
      exexp (Xs,exexp (Ys,Zs)) -> { return `dec (exexp (Xs, dec (exexp (Ys,Zs)))); }
    }
    throw new RuntimeException ("incomplete match in function dec()");
  }

  private static Xboolean benchevalsym17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      Xs -> { return `equal (eval17 (exexp (two(), Xs)), evalsym17 (exexp (two(), Xs))); }
    }
    throw new RuntimeException ("incomplete match in function benchevalsym17()");
  }

  private static Xboolean benchevalexp17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      Xs -> { return `equal (eval17 (exexp (two(), Xs)), evalexp17 (exexp (two(), Xs))); }
    }
    throw new RuntimeException ("incomplete match in function benchevalexp17()");
  }

  private static Xboolean benchevaltree17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      Xs -> { return `equal (calctree17 (eval (Xs)), getval (buildtree (eval (Xs), zero()))); }
    }
    throw new RuntimeException ("incomplete match in function benchevaltree17()");
  }

  private static Xboolean equal (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      zero(), zero() -> { return `Xtrue(); }
      zero(), s (X) -> { return `Xfalse(); }
      s (X), zero() -> { return `Xfalse(); }
      s (X), s (Y) -> { return `equal (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function equal()");
  }

  private static Xboolean less (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      zero(), Y -> { return `Xtrue(); }
      s (X), s (Y) -> { return `less (X, Y); }
      s (X), zero() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function less()");
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `X; }
      X, s (Y) -> { return `s (plus (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat mult (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `zero(); }
      X, s (Y) -> { return `plus (mult (X, Y), X); }
    }
    throw new RuntimeException ("incomplete match in function mult()");
  }

  private static Xnat exp (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `s (zero()); }
      X, s (Y) -> { return `mult (X, exp (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function exp()");
  }

  private static Xnat succ17 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))))))) -> { return `zero(); }
      s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))))))); }
      s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))))))); }
      s (s (s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))))); }
      s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))))); }
      s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))); }
      s (s (s (s (s (s (s (s (s (s (zero())))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (s (zero()))))))))))); }
      s (s (s (s (s (s (s (s (s (zero()))))))))) -> { return `s (s (s (s (s (s (s (s (s (s (zero())))))))))); }
      s (s (s (s (s (s (s (s (zero())))))))) -> { return `s (s (s (s (s (s (s (s (s (zero()))))))))); }
      s (s (s (s (s (s (s (zero()))))))) -> { return `s (s (s (s (s (s (s (s (zero())))))))); }
      s (s (s (s (s (s (zero())))))) -> { return `s (s (s (s (s (s (s (zero()))))))); }
      s (s (s (s (s (zero()))))) -> { return `s (s (s (s (s (s (zero())))))); }
      s (s (s (s (zero())))) -> { return `s (s (s (s (s (zero()))))); }
      s (s (s (zero()))) -> { return `s (s (s (s (zero())))); }
      s (s (zero())) -> { return `s (s (s (zero()))); }
      s (zero()) -> { return `s (s (zero())); }
      zero() -> { return `s (zero()); }
    }
    throw new RuntimeException ("incomplete match in function succ17()");
  }

  private static Xnat pred17 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      s (X) -> { return `X; }
      zero() -> { return `s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (s (zero())))))))))))))))); }
    }
    throw new RuntimeException ("incomplete match in function pred17()");
  }

  private static Xnat plus17 (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `X; }
      X, s (Y) -> { return `succ17 (plus17 (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function plus17()");
  }

  private static Xnat mult17 (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `zero(); }
      X, s (Y) -> { return `plus17 (X, mult17 (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function mult17()");
  }

  private static Xnat exp17 (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, zero() -> { return `succ17 (zero()); }
      X, s (Y) -> { return `mult17 (X, exp17 (X, Y)); }
    }
    throw new RuntimeException ("incomplete match in function exp17()");
  }

  private static Xnat eval (SNat rec_x1) {
    %match (SNat rec_x1) {
      exz() -> { return `zero(); }
      exs (Xs) -> { return `s (eval (Xs)); }
      explus (Xs, Ys) -> { return `plus (eval (Xs), eval (Ys)); }
      exmult (Xs, Ys) -> { return `mult (eval (Xs), eval (Ys)); }
      exexp (Xs, Ys) -> { return `exp (eval (Xs), eval (Ys)); }
    }
    throw new RuntimeException ("incomplete match in function eval()");
  }

  private static Xnat eval17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      exz() -> { return `zero(); }
      exone() -> { return `s (zero()); }
      exs (Xs) -> { return `succ17 (eval17 (Xs)); }
      explus (Xs, Ys) -> { return `plus17 (eval17 (Xs), eval17 (Ys)); }
      exmult (Xs, Ys) -> { return `mult17 (eval17 (Xs), eval17 (Ys)); }
      exexp (Xs, Ys) -> { return `exp17 (eval17 (Xs), eval (Ys)); }
    }
    throw new RuntimeException ("incomplete match in function eval17()");
  }

  private static Xnat evalsym17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      exz() -> { return `zero(); }
      exs (Xs) -> { return `succ17 (evalsym17 (Xs)); }
      explus (Xs, Ys) -> { return `plus17 (evalsym17 (Xs), evalsym17 (Ys)); }
      exmult (Xs, exz()) -> { return `zero(); }
      exmult (Xs, exs (Ys)) -> { return `evalsym17 (explus (exmult (Xs, Ys), Xs)); }
      exmult (Xs, explus (Ys, Zs)) -> { return `evalsym17 (explus (exmult (Xs, Ys), exmult (Xs, Zs))); }
      exmult (Xs, exmult (Ys, Zs)) -> { return `evalsym17 (exmult (exmult (Xs, Ys), Zs)); }
      exmult (Xs, exexp (Ys, Zs)) -> { return `evalsym17 (exmult (Xs, dec (exexp (Ys, Zs)))); }
      exexp (Xs, exz()) -> { return `succ17 (zero()); }
      exexp (Xs, exs (Ys)) -> { return `evalsym17 (exmult (exexp (Xs, Ys), Xs)); }
      exexp (Xs, explus (Ys, Zs)) -> { return `evalsym17 (exmult (exexp (Xs, Ys), exexp (Xs, Zs))); }
      exexp (Xs, exmult (Ys, Zs)) -> { return `evalsym17 (exexp (exexp (Xs, Ys), Zs)); }
      exexp (Xs, exexp (Ys, Zs)) -> { return `evalsym17 (exexp (Xs, dec (exexp (Ys, Zs)))); }
    }
    throw new RuntimeException ("incomplete match in function evalsym17()");
  }

  private static Xnat evalexp17 (SNat rec_x1) {
    %match (SNat rec_x1) {
      Xs -> { return `eval17 (expand (Xs)); }
    }
    throw new RuntimeException ("incomplete match in function evalexp17()");
  }

  private static Xnat getval (Tree rec_x1) {
    %match (Tree rec_x1) {
      leaf (Val) -> { return `Val; }
      node (Val, Max, Left, Right) -> { return `Val; }
    }
    throw new RuntimeException ("incomplete match in function getval()");
  }

  private static Xnat getmax (Tree rec_x1) {
    %match (Tree rec_x1) {
      leaf (Val) -> { return `Val; }
      node (Val, Max, Left, Right) -> { return `Max; }
    }
    throw new RuntimeException ("incomplete match in function getmax()");
  }

  private static Xnat calctree17 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { return `mult17 (exp17 (s (s (zero())), pred17 (X)), pred17 (exp17 (s (s (zero())), X))); }
    }
    throw new RuntimeException ("incomplete match in function calctree17()");
  }

  private static SNat nat2sym (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      zero() -> { return `exz(); }
      s (X) -> { return `exs (nat2sym (X)); }
    }
    throw new RuntimeException ("incomplete match in function nat2sym()");
  }

  private static SNat expand (SNat rec_x1) {
    %match (SNat rec_x1) {
      exz() -> { return `exz(); }
      exone() -> { return `exone(); }
      exs (Xs) -> { return `explus (exone(), expand (Xs)); }
      explus (Xs, Ys) -> { return `explus (expand (Xs), expand (Ys)); }
      exmult (Xs, exz()) -> { return `exz(); }
      exmult (Xs, exone()) -> { return `expand (Xs); }
      exmult (Xs, explus (Ys, Zs)) -> { return `expand (explus (exmult (Xs, Ys), exmult (Xs, Zs))); }
      exmult (Xs, exs (Ys)) -> { return `expand (exmult (Xs, expand (exs (Ys)))); }
      exmult (Xs, exmult (Ys,Zs)) -> { return `expand (exmult (Xs, expand (exmult (Ys,Zs)))); }
      exmult (Xs, exexp (Ys,Zs)) -> { return `expand (exmult (Xs, expand (exexp (Ys,Zs)))); }
      exexp (Xs, exz()) -> { return `exone(); }
      exexp (Xs, exone()) -> { return `expand (Xs); }
      exexp (Xs, explus (Ys, Zs)) -> { return `expand (exmult (exexp (Xs, Ys), exexp (Xs, Zs))); }
      exexp (Xs, exs (Ys)) -> { return `expand (exexp (Xs, expand (exs (Ys)))); }
      exexp (Xs, exmult (Ys,Zs)) -> { return `expand (exexp (Xs, expand (exmult (Ys,Zs)))); }
      exexp (Xs, exexp (Ys,Zs)) -> { return `expand (exexp (Xs, expand (exexp (Ys,Zs)))); }
    }
    throw new RuntimeException ("incomplete match in function expand()");
  }

  private static Tree buildtree (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      zero(), Val -> { return `leaf (Val); }
      s (X), Y -> { return `node (plus17 (getval (buildtree (X, Y)),getval (buildtree (X, succ17 (getmax (buildtree (X, Y)))))), getmax (buildtree (X, succ17 (getmax (buildtree (X, Y))))), buildtree (X, Y),buildtree (X, succ17 (getmax (buildtree (X, Y))))); }
    }
    throw new RuntimeException ("incomplete match in function buildtree()");
  }

  public static void main (String[] args) {
    System.out.println (`benchevaltree17 (twentytwo()));
  }
}
