// TOM-A
import missionaries3.term.*;
import missionaries3.term.types.*;
public class Missionaries3 {
  %gom{
    module Term
    abstract syntax
    Bank =
      | east()
      | west()
    Move =
      | mov(rec_x1_1:Text, rec_x2_1:Xint, rec_x3_1:Xint, rec_x4_1:Xint, rec_x5_1:Xint, rec_x6_1:Bank)
    MoveList =
      | cm(rec_x1_1:Move, rec_x2_1:MoveList)
      | moves()
      | nil_ml()
    Position =
      | pos(rec_x1_1:Bank, rec_x2_1:Xint, rec_x3_1:Xint, rec_x4_1:Xint, rec_x5_1:Xint)
    PosList =
      | cp(rec_x1_1:Position, rec_x2_1:PosList)
      | nil_pl()
    Text =
      | cannibal_rows_east()
      | cannibal_rows_west()
      | missionary_and_cannibal_row_east()
      | missionary_and_cannibal_row_west()
      | missionary_rows_east()
      | missionary_rows_west()
      | two_cannibals_row_east()
      | two_cannibals_row_west()
      | two_missionaries_row_east()
      | two_missionaries_row_west()
    TextList =
      | apply(rec_x1_1:Move, rec_x2_1:Position, rec_x3_1:Position, rec_x4_1:PosList)
      | best(rec_x1_2:TextList, rec_x2_2:TextList)
      | check(rec_x1_3:Text, rec_x2_3:Position, rec_x3_3:Position, rec_x4_3:PosList)
      | ct(rec_x1_4:Text, rec_x2_4:TextList)
      | evalct(rec_x1_5:Text, rec_x2_5:TextList)
      | fail()
      | nil_tl()
      | solve(rec_x1_6:Position, rec_x2_6:Position, rec_x3_6:PosList)
      | Xtry(rec_x1_7:MoveList, rec_x2_7:Position, rec_x3_7:Position, rec_x4_7:PosList)
    Xbool =
      | and(rec_x1_1:Xbool, rec_x2_1:Xbool)
      | equal(rec_x1_2:Xint, rec_x2_2:Xint)
      | gte_tl(rec_x1_3:TextList, rec_x2_3:TextList)
      | gte(rec_x1_4:Xint, rec_x2_4:Xint)
      | member(rec_x1_5:Position, rec_x2_5:PosList)
      | or(rec_x1_6:Xbool, rec_x2_6:Xbool)
      | valid(rec_x1_7:Position)
      | Xfalse()
      | Xtrue()
    Xint =
      | d0()
      | d1()
      | d2()
      | d3()
      | m1()
      | m2()
      | plus(rec_x1_1:Xint, rec_x2_1:Xint)
      | p(rec_x1_2:Xint)
      | s(rec_x1_3:Xint)
    module Term:rules() {
      and (L, Xtrue()) -> L
      and (L, Xfalse()) -> Xfalse()
      or (L, Xtrue()) -> Xtrue()
      or (L, Xfalse()) -> L
      plus (X, d0()) -> X
      plus (d0(), Y) -> Y
      plus (s (X), s (Y)) -> s (s (plus (X, Y)))
      plus (p (X), p (Y)) -> p (p (plus (X, Y)))
      plus (s (X), p (Y)) -> plus (X, Y)
      plus (p (X), s (Y)) -> plus (X, Y)
      gte (d0(), d0()) -> Xtrue()
      gte (d0(), s (Y)) -> Xfalse()
      gte (d0(), p (Y)) -> Xtrue()
      gte (s (X), d0()) -> Xtrue()
      gte (s (X), s (Y)) -> gte (X, Y)
      gte (s (X), p (Y)) -> Xtrue()
      gte (p (X), d0()) -> Xfalse()
      gte (p (X), s (Y)) -> Xfalse()
      gte (p (X), p (Y)) -> gte (X, Y)
      equal (X, Y) -> and (gte (X, Y), gte (Y, X))
      d1() -> s (d0())
      d2() -> s (s (d0()))
      d3() -> s (s (s (d0())))
      m1() -> p (d0())
      m2() -> p (p (d0()))
      moves() -> cm (mov (missionary_rows_east(), m1(), d0(), d1(), d0(), east()),cm (mov (two_missionaries_row_east(), m2(), d0(), d2(), d0(), east()),cm (mov (missionary_and_cannibal_row_east(), m1(), m1(), d1(), d1(), east()),cm (mov (cannibal_rows_east(), d0(), m1(), d0(), d1(), east()),cm (mov (two_cannibals_row_east(), d0(), m2(), d0(), d2(), east()),cm (mov (missionary_rows_west(), d1(), d0(), m1(), d0(), west()),cm (mov (two_missionaries_row_west(), d2(), d0(), m2(), d0(), west()),cm (mov (missionary_and_cannibal_row_west(), d1(), d1(), m1(), m1(), west()),cm (mov (cannibal_rows_west(), d0(), d1(), d0(), m1(), west()),cm (mov (two_cannibals_row_west(), d0(), d2(), d0(), m2(), west()), nil_ml()))))))))))
      member (NP, nil_pl()) -> Xfalse()
      member (NP, cp (Posi, Prev)) -> Xtrue() if NP == Posi
      member (NP, cp (Posi, Prev)) -> member (NP, Prev) if NP != Posi
      evalct (T, fail()) -> fail()
      evalct (T, TL) -> ct (T,TL) if TL != fail()
      gte_tl (TL, nil_tl()) -> Xtrue()
      gte_tl (nil_tl(), ct (T, TL)) -> Xfalse()
      gte_tl (ct (T, TL), ct (T2, TL2)) -> gte_tl (TL, TL2)
      best (fail(), TL) -> TL
      best (TL, fail()) -> TL
      best (TL, TL2) -> TL2 if gte_tl (TL, TL2) == Xtrue() && TL != fail() && TL2 != fail()
      best (TL, TL2) -> TL if gte_tl (TL, TL2) == Xfalse() && TL != fail() && TL2 != fail()
      solve (Posi, Final, Prev) -> nil_tl() if Posi == Final
      solve (Posi, Final, Prev) -> Xtry (moves(), Posi, Final, Prev) if Posi != Final
      Xtry (nil_ml(), Posi, Final, Prev) -> fail()
      Xtry (cm (M, ML), Posi, Final, Prev) -> best (apply (M, Posi, Final, Prev), Xtry (ML, Posi, Final, Prev))
      apply (mov (T, DMW, DCW, DME, DCE, D), pos (B, MW, CW, ME, CE), Final, Prev) -> check (T, pos (D, plus (MW, DMW), plus (CW, DCW), plus (ME, DME), plus (CE, DCE)), Final, Prev) if D != B
      apply (mov (T, DMW, DCW, DME, DCE, D), pos (B, MW, CW, ME, CE), Final, Prev) -> fail() if D == B
      check (T, NP, Final, Prev) -> evalct (T, solve (NP, Final, cp (NP, Prev))) if member (NP, Prev) == Xfalse() && valid (NP) == Xtrue()
      check (T, NP, Final, Prev) -> fail() if member (NP, Prev) == Xtrue()
      check (T, NP, Final, Prev) -> fail() if valid (NP) == Xfalse()
      valid (pos (B, MW, CW, ME, CE)) -> and (gte (MW, d0()), and (gte (CW, d0()), and (gte (ME, d0()), and (gte (CE, d0()), and (or (equal (MW, d0()), gte (MW, CW)), or (equal (ME, d0()), gte (ME, CE)))))))
    }
  }
  public static void main (String[] args) {
    System.out.println (`solve (pos (west(), d3(), d3(), d0(), d0()), pos (east(), d0(), d0(), d3(), d3()), nil_pl()));
  }
}
