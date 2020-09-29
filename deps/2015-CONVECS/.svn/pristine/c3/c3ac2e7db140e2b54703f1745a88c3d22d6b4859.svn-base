// TOM-B
import missionaries3.term.*;
import missionaries3.term.types.*;
public class Missionaries3 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xbool =
      | Xtrue()
      | Xfalse()
    Xint =
      | d0()
      | s(rec_x1_1:Xint)
      | p(rec_x1_2:Xint)
    Bank =
      | west()
      | east()
    Text =
      | missionary_rows_east()
      | two_missionaries_row_east()
      | missionary_and_cannibal_row_east()
      | cannibal_rows_east()
      | two_cannibals_row_east()
      | missionary_rows_west()
      | two_missionaries_row_west()
      | missionary_and_cannibal_row_west()
      | cannibal_rows_west()
      | two_cannibals_row_west()
    Position =
      | pos(rec_x1_1:Bank, rec_x2_1:Xint, rec_x3_1:Xint, rec_x4_1:Xint, rec_x5_1:Xint)
    Move =
      | mov(rec_x1_1:Text, rec_x2_1:Xint, rec_x3_1:Xint, rec_x4_1:Xint, rec_x5_1:Xint, rec_x6_1:Bank)
    MoveList =
      | nil_ml()
      | cm(rec_x1_1:Move, rec_x2_1:MoveList)
    PosList =
      | nil_pl()
      | cp(rec_x1_1:Position, rec_x2_1:PosList)
    TextList =
      | nil_tl()
      | fail()
      | ct(rec_x1_1:Text, rec_x2_1:TextList)
  }

  private static Xbool and (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      L, Xtrue() -> { return `L; }
      L, Xfalse() -> { return `Xfalse(); }
    }
    throw new RuntimeException ("incomplete match in function and()");
  }

  private static Xbool or (Xbool rec_x1, Xbool rec_x2) {
    %match (Xbool rec_x1, Xbool rec_x2) {
      L, Xtrue() -> { return `Xtrue(); }
      L, Xfalse() -> { return `L; }
    }
    throw new RuntimeException ("incomplete match in function or()");
  }

  private static Xint plus (Xint rec_x1, Xint rec_x2) {
    %match (Xint rec_x1, Xint rec_x2) {
      X, d0() -> { return `X; }
      d0(), Y -> { return `Y; }
      s (X), s (Y) -> { return `s (s (plus (X, Y))); }
      p (X), p (Y) -> { return `p (p (plus (X, Y))); }
      s (X), p (Y) -> { return `plus (X, Y); }
      p (X), s (Y) -> { return `plus (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xbool gte (Xint rec_x1, Xint rec_x2) {
    %match (Xint rec_x1, Xint rec_x2) {
      d0(), d0() -> { return `Xtrue(); }
      d0(), s (Y) -> { return `Xfalse(); }
      d0(), p (Y) -> { return `Xtrue(); }
      s (X), d0() -> { return `Xtrue(); }
      s (X), s (Y) -> { return `gte (X, Y); }
      s (X), p (Y) -> { return `Xtrue(); }
      p (X), d0() -> { return `Xfalse(); }
      p (X), s (Y) -> { return `Xfalse(); }
      p (X), p (Y) -> { return `gte (X, Y); }
    }
    throw new RuntimeException ("incomplete match in function gte()");
  }

  private static Xbool equal (Xint rec_x1, Xint rec_x2) {
    %match (Xint rec_x1, Xint rec_x2) {
      X, Y -> { return `and (gte (X, Y), gte (Y, X)); }
    }
    throw new RuntimeException ("incomplete match in function equal()");
  }

  private static Xint d1 () {
    return `s (d0());
  }

  private static Xint d2 () {
    return `s (s (d0()));
  }

  private static Xint d3 () {
    return `s (s (s (d0())));
  }

  private static Xint m1 () {
    return `p (d0());
  }

  private static Xint m2 () {
    return `p (p (d0()));
  }

  private static MoveList moves () {
    return `cm (mov (missionary_rows_east(), m1(), d0(), d1(), d0(), east()),cm (mov (two_missionaries_row_east(), m2(), d0(), d2(), d0(), east()),cm (mov (missionary_and_cannibal_row_east(), m1(), m1(), d1(), d1(), east()),cm (mov (cannibal_rows_east(), d0(), m1(), d0(), d1(), east()),cm (mov (two_cannibals_row_east(), d0(), m2(), d0(), d2(), east()),cm (mov (missionary_rows_west(), d1(), d0(), m1(), d0(), west()),cm (mov (two_missionaries_row_west(), d2(), d0(), m2(), d0(), west()),cm (mov (missionary_and_cannibal_row_west(), d1(), d1(), m1(), m1(), west()),cm (mov (cannibal_rows_west(), d0(), d1(), d0(), m1(), west()),cm (mov (two_cannibals_row_west(), d0(), d2(), d0(), m2(), west()), nil_ml()))))))))));
  }

  private static Xbool member (Position rec_x1, PosList rec_x2) {
    %match (Position rec_x1, PosList rec_x2) {
      NP, nil_pl() -> { return `Xfalse(); }
      NP, cp (Posi, Prev) -> { if (`NP == `Posi) { return `Xtrue(); } }
      NP, cp (Posi, Prev) -> { if (`NP != `Posi) { return `member (NP, Prev); } }
    }
    throw new RuntimeException ("incomplete match in function member()");
  }

  private static TextList evalct (Text rec_x1, TextList rec_x2) {
    %match (Text rec_x1, TextList rec_x2) {
      T, fail() -> { return `fail(); }
      T, TL -> { if (`TL != `fail()) { return `ct (T,TL); } }
    }
    throw new RuntimeException ("incomplete match in function evalct()");
  }

  private static Xbool gte_tl (TextList rec_x1, TextList rec_x2) {
    %match (TextList rec_x1, TextList rec_x2) {
      TL, nil_tl() -> { return `Xtrue(); }
      nil_tl(), ct (T, TL) -> { return `Xfalse(); }
      ct (T, TL), ct (T2, TL2) -> { return `gte_tl (TL, TL2); }
    }
    throw new RuntimeException ("incomplete match in function gte_tl()");
  }

  private static TextList best (TextList rec_x1, TextList rec_x2) {
    %match (TextList rec_x1, TextList rec_x2) {
      fail(), TL -> { return `TL; }
      TL, fail() -> { return `TL; }
      TL, TL2 -> { if (`gte_tl (TL, TL2) == `Xtrue() && `TL != `fail() && `TL2 != `fail()) { return `TL2; } }
      TL, TL2 -> { if (`gte_tl (TL, TL2) == `Xfalse() && `TL != `fail() && `TL2 != `fail()) { return `TL; } }
    }
    throw new RuntimeException ("incomplete match in function best()");
  }

  private static TextList solve (Position rec_x1, Position rec_x2, PosList rec_x3) {
    %match (Position rec_x1, Position rec_x2, PosList rec_x3) {
      Posi, Final, Prev -> { if (`Posi == `Final) { return `nil_tl(); } }
      Posi, Final, Prev -> { if (`Posi != `Final) { return `Xtry (moves(), Posi, Final, Prev); } }
    }
    throw new RuntimeException ("incomplete match in function solve()");
  }

  private static TextList Xtry (MoveList rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
    %match (MoveList rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
      nil_ml(), Posi, Final, Prev -> { return `fail(); }
      cm (M, ML), Posi, Final, Prev -> { return `best (apply (M, Posi, Final, Prev), Xtry (ML, Posi, Final, Prev)); }
    }
    throw new RuntimeException ("incomplete match in function Xtry()");
  }

  private static TextList apply (Move rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
    %match (Move rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
      mov (T, DMW, DCW, DME, DCE, D), pos (B, MW, CW, ME, CE), Final, Prev -> { if (`D != `B) { return `check (T, pos (D, plus (MW, DMW), plus (CW, DCW), plus (ME, DME), plus (CE, DCE)), Final, Prev); } }
      mov (T, DMW, DCW, DME, DCE, D), pos (B, MW, CW, ME, CE), Final, Prev -> { if (`D == `B) { return `fail(); } }
    }
    throw new RuntimeException ("incomplete match in function apply()");
  }

  private static TextList check (Text rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
    %match (Text rec_x1, Position rec_x2, Position rec_x3, PosList rec_x4) {
      T, NP, Final, Prev -> { if (`member (NP, Prev) == `Xfalse() && `valid (NP) == `Xtrue()) { return `evalct (T, solve (NP, Final, cp (NP, Prev))); } }
      T, NP, Final, Prev -> { if (`member (NP, Prev) == `Xtrue()) { return `fail(); } }
      T, NP, Final, Prev -> { if (`valid (NP) == `Xfalse()) { return `fail(); } }
    }
    throw new RuntimeException ("incomplete match in function check()");
  }

  private static Xbool valid (Position rec_x1) {
    %match (Position rec_x1) {
      pos (B, MW, CW, ME, CE) -> { return `and (gte (MW, d0()), and (gte (CW, d0()), and (gte (ME, d0()), and (gte (CE, d0()), and (or (equal (MW, d0()), gte (MW, CW)), or (equal (ME, d0()), gte (ME, CE))))))); }
    }
    throw new RuntimeException ("incomplete match in function valid()");
  }

  public static void main (String[] args) {
    System.out.println (`solve (pos (west(), d3(), d3(), d0(), d0()), pos (east(), d0(), d0(), d3(), d3()), nil_pl()));
  }
}
