// TOM-B
import dart.term.*;
import dart.term.types.*;
public class Dart {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
    Set =
      | empty()
      | singleton(rec_x1_1:Xnat)
      | union(rec_x1_2:Set, rec_x2_2:Set)
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), N -> { return `N; }
      s (N), M -> { return `s (plus (N, M)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat times (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      d0(), N -> { return `d0(); }
      s (N), M -> { return `plus (M, times (N, M)); }
    }
    throw new RuntimeException ("incomplete match in function times()");
  }

  private static Set u (Set rec_x1, Set rec_x2) {
    %match (Set rec_x1, Set rec_x2) {
      empty(), S0 -> { return `S0; }
      S0, empty() -> { return `S0; }
      S0, S1 -> { if (`S0 == `S1) { return `S0; } }
      S0, S1 -> { if (`S0 != `S1) { return `flat (S0, flat (S1, empty())); } }
    }
    throw new RuntimeException ("incomplete match in function u()");
  }

  private static Set flat (Set rec_x1, Set rec_x2) {
    %match (Set rec_x1, Set rec_x2) {
      empty(), S0 -> { return `S0; }
      singleton (I), S0 -> { return `union (singleton (I), S0); }
      union (S1, S2), S0 -> { return `flat (S1, flat (S2, S0)); }
    }
    throw new RuntimeException ("incomplete match in function flat()");
  }

  private static Set add (Set rec_x1, Set rec_x2) {
    %match (Set rec_x1, Set rec_x2) {
      empty(), S0 -> { return `S0; }
      S0, empty() -> { return `S0; }
      singleton (I), singleton (J) -> { return `singleton (plus (I, J)); }
      singleton (I), union (singleton (J), S0) -> { return `add (singleton (plus (I, J)), S0); }
      union (singleton (I), S1), S2 -> { return `u (add (singleton (I), S2), add (S1, S2)); }
    }
    throw new RuntimeException ("incomplete match in function add()");
  }

  private static Set mult (Set rec_x1, Set rec_x2) {
    %match (Set rec_x1, Set rec_x2) {
      empty(), S0 -> { return `S0; }
      S0, empty() -> { return `S0; }
      singleton (I), singleton (J) -> { return `singleton (times (I, J)); }
      union (singleton (I), S1), S2 -> { return `u (mult (singleton (I), S2), mult (S1, S2)); }
    }
    throw new RuntimeException ("incomplete match in function mult()");
  }

  private static Xnat five () {
    return `s (s (s (s (s (d0())))));
  }

  private static Xnat ten () {
    return `s (s (s (s (s (five())))));
  }

  private static Xnat fifteen () {
    return `s (s (s (s (s (ten())))));
  }

  private static Xnat twentyfive () {
    return `s (s (s (s (s (s (s (s (s (s (fifteen()))))))))));
  }

  private static Xnat fifty () {
    return `plus (twentyfive(), twentyfive());
  }

  private static Set singles () {
    return `add (singleton (s (d0())), add (singleton (s (s (d0()))), add (singleton (s (s (s (d0())))),add (singleton (s (s (s (s (d0()))))), add (singleton (five()),add (singleton (s (five())), add (singleton (s (s (five()))),add (singleton (s (s (s (five())))), add (singleton (s (s (s (s (five()))))), add (singleton (ten()), add (singleton (s (ten())), add (singleton (s (s (ten()))),add (singleton (s (s (s (ten())))), add (singleton (s (s (s (s (ten()))))), add (singleton (fifteen()),add (singleton (s (fifteen())), add (singleton (s (s (fifteen()))), add (singleton (s (s (s (fifteen())))), add (singleton (s (s (s (s (fifteen()))))), singleton (plus (five(), fifteen())))))))))))))))))))));
  }

  private static Set doubles () {
    return `mult (singles(), singleton (s (s (d0()))));
  }

  private static Set triples () {
    return `mult (singles(), singleton (s (s (s (d0())))));
  }

  private static Set allops () {
    return `u (u (u (u (u (singles(), doubles()), triples()), singleton (twentyfive())), singleton (fifty())), singleton (d0()));
  }

  private static Set finish () {
    return `add (u (doubles(), singleton (fifty())), add (allops(), allops()));
  }

  public static void main (String[] args) {
    System.out.println (`finish());
  }
}
