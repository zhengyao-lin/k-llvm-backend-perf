module benchtree10
import IO;

data Xboolean = Xtrue() | Xfalse();

data Nat = Zero() | S (Nat rec_x1_1);

data SNat = Exz() | Exone() | Exs (SNat rec_x1_1) | Explus (SNat rec_x1_2, SNat rec_x2_2) | Exmult (SNat rec_x1_3, SNat rec_x2_3) | Exexp (SNat rec_x1_4, SNat rec_x2_4);

data Xtree = Leaf (Nat rec_x1_1) | Xnode (Nat rec_x1_2, Nat rec_x2_2, Xtree rec_x3_2, Xtree rec_x4_2);

Xboolean yor (Xtrue(), Xboolean b) = Xtrue();
Xboolean yor (Xfalse(), Xboolean b) = b;

Xboolean xand (Xtrue(), Xboolean b) = b;
Xboolean xand (Xfalse(), Xboolean b) = Xfalse();

Xboolean neg (Xfalse()) = Xtrue();
Xboolean neg (Xtrue()) = Xfalse();

Nat d0() = Zero();

Nat d1() = S (d0());

Nat d2() = S (d1());

Nat d3() = S (d2());

Nat d4() = S (d3());

Nat d5() = S (d4());

Nat d6() = S (d5());

Nat d7() = S (d6());

Nat d8() = S (d7());

Nat d9() = S (d8());

Nat d10() = S (d9());

Nat d11() = S (d10());

Nat d12() = S (d11());

Nat d13() = S (d12());

Nat d14() = S (d13());

Nat d15() = S (d14());

Nat d16() = S (d15());

Nat d17() = S (d16());

SNat xone() = Exs (Exz());

SNat two() = Exs (xone());

SNat three() = Exs (two());

SNat four() = Exs (three());

SNat five() = Exs (four());

SNat six() = Exs (five());

SNat seven() = Exs (six());

SNat eight() = Exs (seven());

SNat nine() = Exs (eight());

SNat ten() = Exs (nine());

SNat eleven() = Exs (ten());

SNat twelve() = Exs (eleven());

SNat thirteen() = Exs (twelve());

SNat fourteen() = Exs (thirteen());

SNat fifteen() = Exs (fourteen());

SNat sixteen() = Exs (fifteen());

SNat seventeen() = Exs (sixteen());

SNat eighteen() = Exs (seventeen());

SNat nineteen() = Exs (eighteen());

SNat twenty() = Exs (nineteen());

SNat twentyone() = Exs (twenty());

SNat twentytwo() = Exs (twentyone());

SNat twentythree() = Exs (twentytwo());

SNat twentyfour() = Exs (twentythree());

SNat twentyfive() = Exs (twentyfour());

SNat twentysix() = Exs (twentyfive());

SNat twentyseven() = Exs (twentysix());

SNat twentyeight() = Exs (twentyseven());

SNat twentynine() = Exs (twentyeight());

SNat thirty() = Exs (twentynine());

SNat thirtyone() = Exs (thirty());

SNat thirtytwo() = Exs (thirtyone());

SNat thirtythree() = Exs (thirtytwo());

SNat thirtyfour() = Exs (thirtythree());

SNat thirtyfive() = Exs (thirtyfour());

SNat dec (Exexp (SNat xs,Exz())) = Exs (Exz());
SNat dec (Exexp (SNat xs,Exs (SNat ys))) = Exmult (Exexp (xs,ys),xs);
SNat dec (Exexp (SNat xs,Explus (SNat ys,SNat zs))) = Exmult (Exexp (xs,ys),Exexp (xs,zs));
SNat dec (Exexp (SNat xs,Exmult (SNat ys,SNat zs))) = dec (Exexp (Exexp (xs,ys),zs));
SNat dec (Exexp (SNat xs,Exexp (SNat ys,SNat zs))) = dec (Exexp (xs, dec (Exexp (ys,zs))));

Xboolean benchevalsym17 (SNat xs) = equal (eval17 (Exexp (two(), xs)), evalsym17 (Exexp (two(), xs)));

Xboolean benchevalexp17 (SNat xs) = equal (eval17 (Exexp (two(), xs)), evalexp17 (Exexp (two(), xs)));

Xboolean benchevaltree17 (SNat xs) = equal (calctree17 (xeval (xs)), getval (buildtree (xeval (xs), Zero())));

Xboolean equal (Zero(), Zero()) = Xtrue();
Xboolean equal (Zero(), S (Nat x)) = Xfalse();
Xboolean equal (S (Nat x), Zero()) = Xfalse();
Xboolean equal (S (Nat x), S (Nat y)) = equal (x, y);

Xboolean less (Zero(), Nat y) = Xtrue();
Xboolean less (S (Nat x), S (Nat y)) = less (x, y);
Xboolean less (S (Nat x), Zero()) = Xfalse();

Nat plus (Nat x, Zero()) = x;
Nat plus (Nat x, S (Nat y)) = S (plus (x, y));

Nat mult (Nat x, Zero()) = Zero();
Nat mult (Nat x, S (Nat y)) = plus (mult (x, y), x);

Nat exp (Nat x, Zero()) = S (Zero());
Nat exp (Nat x, S (Nat y)) = mult (x, exp (x, y));

Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))))) = Zero();
Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))))) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))))) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))) = S (S (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))))) = S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))) = S (S (S (S (S (S (S (S (S (S (S (Zero())))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (S (Zero())))))))))) = S (S (S (S (S (S (S (S (S (S (Zero()))))))))));
Nat succ17 (S (S (S (S (S (S (S (S (Zero()))))))))) = S (S (S (S (S (S (S (S (S (Zero())))))))));
Nat succ17 (S (S (S (S (S (S (S (Zero())))))))) = S (S (S (S (S (S (S (S (Zero()))))))));
Nat succ17 (S (S (S (S (S (S (Zero()))))))) = S (S (S (S (S (S (S (Zero())))))));
Nat succ17 (S (S (S (S (S (Zero())))))) = S (S (S (S (S (S (Zero()))))));
Nat succ17 (S (S (S (S (Zero()))))) = S (S (S (S (S (Zero())))));
Nat succ17 (S (S (S (Zero())))) = S (S (S (S (Zero()))));
Nat succ17 (S (S (Zero()))) = S (S (S (Zero())));
Nat succ17 (S (Zero())) = S (S (Zero()));
Nat succ17 (Zero()) = S (Zero());

Nat pred17 (S (Nat x)) = x;
Nat pred17 (Zero()) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (Zero()))))))))))))))));

Nat plus17 (Nat x, Zero()) = x;
Nat plus17 (Nat x, S (Nat y)) = succ17 (plus17 (x, y));

Nat mult17 (Nat x, Zero()) = Zero();
Nat mult17 (Nat x, S (Nat y)) = plus17 (x, mult17 (x, y));

Nat exp17 (Nat x, Zero()) = succ17 (Zero());
Nat exp17 (Nat x, S (Nat y)) = mult17 (x, exp17 (x, y));

Nat xeval (Exz()) = Zero();
Nat xeval (Exs (SNat xs)) = S (xeval (xs));
Nat xeval (Explus (SNat xs, SNat ys)) = plus (xeval (xs), xeval (ys));
Nat xeval (Exmult (SNat xs, SNat ys)) = mult (xeval (xs), xeval (ys));
Nat xeval (Exexp (SNat xs, SNat ys)) = exp (xeval (xs), xeval (ys));

Nat eval17 (Exz()) = Zero();
Nat eval17 (Exone()) = S (Zero());
Nat eval17 (Exs (SNat xs)) = succ17 (eval17 (xs));
Nat eval17 (Explus (SNat xs, SNat ys)) = plus17 (eval17 (xs), eval17 (ys));
Nat eval17 (Exmult (SNat xs, SNat ys)) = mult17 (eval17 (xs), eval17 (ys));
Nat eval17 (Exexp (SNat xs, SNat ys)) = exp17 (eval17 (xs), xeval (ys));

Nat evalsym17 (Exz()) = Zero();
Nat evalsym17 (Exs (SNat xs)) = succ17 (evalsym17 (xs));
Nat evalsym17 (Explus (SNat xs, SNat ys)) = plus17 (evalsym17 (xs), evalsym17 (ys));
Nat evalsym17 (Exmult (SNat xs, Exz())) = Zero();
Nat evalsym17 (Exmult (SNat xs, Exs (SNat ys))) = evalsym17 (Explus (Exmult (xs, ys), xs));
Nat evalsym17 (Exmult (SNat xs, Explus (SNat ys, SNat zs))) = evalsym17 (Explus (Exmult (xs, ys), Exmult (xs, zs)));
Nat evalsym17 (Exmult (SNat xs, Exmult (SNat ys, SNat zs))) = evalsym17 (Exmult (Exmult (xs, ys), zs));
Nat evalsym17 (Exmult (SNat xs, Exexp (SNat ys, SNat zs))) = evalsym17 (Exmult (xs, dec (Exexp (ys, zs))));
Nat evalsym17 (Exexp (SNat xs, Exz())) = succ17 (Zero());
Nat evalsym17 (Exexp (SNat xs, Exs (SNat ys))) = evalsym17 (Exmult (Exexp (xs, ys), xs));
Nat evalsym17 (Exexp (SNat xs, Explus (SNat ys, SNat zs))) = evalsym17 (Exmult (Exexp (xs, ys), Exexp (xs, zs)));
Nat evalsym17 (Exexp (SNat xs, Exmult (SNat ys, SNat zs))) = evalsym17 (Exexp (Exexp (xs, ys), zs));
Nat evalsym17 (Exexp (SNat xs, Exexp (SNat ys, SNat zs))) = evalsym17 (Exexp (xs, dec (Exexp (ys, zs))));

Nat evalexp17 (SNat xs) = eval17 (expand (xs));

Nat getval (Leaf (Nat val)) = val;
Nat getval (Xnode (Nat val, Nat xmax, Xtree xleft, Xtree xright)) = val;

Nat getmax (Leaf (Nat val)) = val;
Nat getmax (Xnode (Nat val, Nat xmax, Xtree xleft, Xtree xright)) = xmax;

Nat calctree17 (Nat x) = mult17 (exp17 (S (S (Zero())), pred17 (x)), pred17 (exp17 (S (S (Zero())), x)));

SNat nat2sym (Zero()) = Exz();
SNat nat2sym (S (Nat x)) = Exs (nat2sym (x));

SNat expand (Exz()) = Exz();
SNat expand (Exone()) = Exone();
SNat expand (Exs (SNat xs)) = Explus (Exone(), expand (xs));
SNat expand (Explus (SNat xs, SNat ys)) = Explus (expand (xs), expand (ys));
SNat expand (Exmult (SNat xs, Exz())) = Exz();
SNat expand (Exmult (SNat xs, Exone())) = expand (xs);
SNat expand (Exmult (SNat xs, Explus (SNat ys, SNat zs))) = expand (Explus (Exmult (xs, ys), Exmult (xs, zs)));
SNat expand (Exmult (SNat xs, Exs (SNat ys))) = expand (Exmult (xs, expand (Exs (ys))));
SNat expand (Exmult (SNat xs, Exmult (SNat ys,SNat zs))) = expand (Exmult (xs, expand (Exmult (ys,zs))));
SNat expand (Exmult (SNat xs, Exexp (SNat ys,SNat zs))) = expand (Exmult (xs, expand (Exexp (ys,zs))));
SNat expand (Exexp (SNat xs, Exz())) = Exone();
SNat expand (Exexp (SNat xs, Exone())) = expand (xs);
SNat expand (Exexp (SNat xs, Explus (SNat ys, SNat zs))) = expand (Exmult (Exexp (xs, ys), Exexp (xs, zs)));
SNat expand (Exexp (SNat xs, Exs (SNat ys))) = expand (Exexp (xs, expand (Exs (ys))));
SNat expand (Exexp (SNat xs, Exmult (SNat ys,SNat zs))) = expand (Exexp (xs, expand (Exmult (ys,zs))));
SNat expand (Exexp (SNat xs, Exexp (SNat ys,SNat zs))) = expand (Exexp (xs, expand (Exexp (ys,zs))));

Xtree buildtree (Zero(), Nat val) = Leaf (val);
Xtree buildtree (S (Nat x), Nat y) = Xnode (plus17 (getval (buildtree (x, y)),getval (buildtree (x, succ17 (getmax (buildtree (x, y)))))), getmax (buildtree (x, succ17 (getmax (buildtree (x, y))))), buildtree (x, y),buildtree (x, succ17 (getmax (buildtree (x, y)))));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (benchevaltree17 (ten()));
  return 0;
}
