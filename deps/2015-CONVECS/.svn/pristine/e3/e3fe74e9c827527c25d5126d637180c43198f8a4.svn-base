module missionaries2
import IO;

data Xbool = Xtrue() | Xfalse();

data Int = D0() | S (Int rec_x1_1) | P (Int rec_x1_2);

data Bank = West() | East();

data Xtext = Missionary_rows_east() | Two_missionaries_row_east() | Missionary_and_cannibal_row_east() | Cannibal_rows_east() | Two_cannibals_row_east() | Missionary_rows_west() | Two_missionaries_row_west() | Missionary_and_cannibal_row_west() | Cannibal_rows_west() | Two_cannibals_row_west();

data Position = Pos (Bank rec_x1_1, Int rec_x2_1, Int rec_x3_1, Int rec_x4_1, Int rec_x5_1);

data Move = Mov (Xtext rec_x1_1, Int rec_x2_1, Int rec_x3_1, Int rec_x4_1, Int rec_x5_1, Bank rec_x6_1);

data MoveList = Nil_ml() | Cm (Move rec_x1_1, MoveList rec_x2_1);

data PosList = Nil_pl() | Cp (Position rec_x1_1, PosList rec_x2_1);

data TextList = Nil_tl() | Xfail() | Ct (Xtext rec_x1_1, TextList rec_x2_1);

Xbool xand (Xbool l, Xtrue()) = l;
Xbool xand (Xbool l, Xfalse()) = Xfalse();

Xbool yor (Xbool l, Xtrue()) = Xtrue();
Xbool yor (Xbool l, Xfalse()) = l;

Int plus (Int x, D0()) = x;
Int plus (D0(), Int y) = y;
Int plus (S (Int x), S (Int y)) = S (S (plus (x, y)));
Int plus (P (Int x), P (Int y)) = P (P (plus (x, y)));
Int plus (S (Int x), P (Int y)) = plus (x, y);
Int plus (P (Int x), S (Int y)) = plus (x, y);

Xbool gte (D0(), D0()) = Xtrue();
Xbool gte (D0(), S (Int y)) = Xfalse();
Xbool gte (D0(), P (Int y)) = Xtrue();
Xbool gte (S (Int x), D0()) = Xtrue();
Xbool gte (S (Int x), S (Int y)) = gte (x, y);
Xbool gte (S (Int x), P (Int y)) = Xtrue();
Xbool gte (P (Int x), D0()) = Xfalse();
Xbool gte (P (Int x), S (Int y)) = Xfalse();
Xbool gte (P (Int x), P (Int y)) = gte (x, y);

Xbool equal (Int x, Int y) = xand (gte (x, y), gte (y, x));

Int d1() = S (D0());

Int d2() = S (S (D0()));

Int d3() = S (S (S (D0())));

Int m1() = P (D0());

Int m2() = P (P (D0()));

MoveList moves() = Cm (Mov (Missionary_rows_east(), m1(), D0(), d1(), D0(), East()),Cm (Mov (Two_missionaries_row_east(), m2(), D0(), d2(), D0(), East()),Cm (Mov (Missionary_and_cannibal_row_east(), m1(), m1(), d1(), d1(), East()),Cm (Mov (Cannibal_rows_east(), D0(), m1(), D0(), d1(), East()),Cm (Mov (Two_cannibals_row_east(), D0(), m2(), D0(), d2(), East()),Cm (Mov (Missionary_rows_west(), d1(), D0(), m1(), D0(), West()),Cm (Mov (Two_missionaries_row_west(), d2(), D0(), m2(), D0(), West()),Cm (Mov (Missionary_and_cannibal_row_west(), d1(), d1(), m1(), m1(), West()),Cm (Mov (Cannibal_rows_west(), D0(), d1(), D0(), m1(), West()),Cm (Mov (Two_cannibals_row_west(), D0(), d2(), D0(), m2(), West()), Nil_ml()))))))))));

Xbool member (Position nP, Nil_pl()) = Xfalse();
Xbool member (Position nP, Cp (Position posi, PosList prev)) { if (nP == posi) return Xtrue(); else fail; }
Xbool member (Position nP, Cp (Position posi, PosList prev)) { if (nP != posi) return member (nP, prev); else fail; }

TextList evalct (Xtext t, Xfail()) = Xfail();
TextList evalct (Xtext t, TextList tL) { if (tL != Xfail()) return Ct (t,tL); else fail; }

Xbool gte_tl (TextList tL, Nil_tl()) = Xtrue();
Xbool gte_tl (Nil_tl(), Ct (Xtext t, TextList tL)) = Xfalse();
Xbool gte_tl (Ct (Xtext t, TextList tL), Ct (Xtext t2, TextList tL2)) = gte_tl (tL, tL2);

TextList best (Xfail(), TextList tL) = tL;
TextList best (TextList tL, Xfail()) = tL;
TextList best (TextList tL, TextList tL2) { if (gte_tl (tL, tL2) == Xtrue() && tL != Xfail() && tL2 != Xfail()) return tL2; else fail; }
TextList best (TextList tL, TextList tL2) { if (gte_tl (tL, tL2) == Xfalse() && tL != Xfail() && tL2 != Xfail()) return tL; else fail; }

TextList xsolve (Position posi, Position final, PosList prev) { if (posi == final) return Nil_tl(); else fail; }
TextList xsolve (Position posi, Position final, PosList prev) { if (posi != final) return xtry (moves(), posi, final, prev); else fail; }

TextList xtry (Nil_ml(), Position posi, Position final, PosList prev) = Xfail();
TextList xtry (Cm (Move m, MoveList mL), Position posi, Position final, PosList prev) = best (apply (m, posi, final, prev), xtry (mL, posi, final, prev));

TextList apply (Mov (Xtext t, Int dMW, Int dCW, Int dME, Int dCE, Bank d), Pos (Bank b, Int mW, Int cW, Int mE, Int cE), Position final, PosList prev) { if (d != b) return check (t, Pos (d, plus (mW, dMW), plus (cW, dCW), plus (mE, dME), plus (cE, dCE)), final, prev); else fail; }
TextList apply (Mov (Xtext t, Int dMW, Int dCW, Int dME, Int dCE, Bank d), Pos (Bank b, Int mW, Int cW, Int mE, Int cE), Position final, PosList prev) { if (d == b) return Xfail(); else fail; }

TextList check (Xtext t, Position nP, Position final, PosList prev) { if (member (nP, prev) == Xfalse() && valid (nP) == Xtrue()) return evalct (t, xsolve (nP, final, Cp (nP, prev))); else fail; }
TextList check (Xtext t, Position nP, Position final, PosList prev) { if (member (nP, prev) == Xtrue()) return Xfail(); else fail; }
TextList check (Xtext t, Position nP, Position final, PosList prev) { if (valid (nP) == Xfalse()) return Xfail(); else fail; }

Xbool valid (Pos (Bank b, Int mW, Int cW, Int mE, Int cE)) = xand (gte (mW, D0()), xand (gte (cW, D0()), xand (gte (mE, D0()), xand (gte (cE, D0()), xand (yor (equal (mW, D0()), gte (mW, cW)), yor (equal (mE, D0()), gte (mE, cE)))))));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (xsolve (Pos (West(), d2(), d2(), D0(), D0()), Pos (East(), D0(), D0(), d2(), d2()), Nil_pl()));
  return 0;
}
