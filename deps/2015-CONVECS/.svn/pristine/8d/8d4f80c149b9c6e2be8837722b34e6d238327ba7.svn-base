// TOM-B
import langton6.term.*;
import langton6.term.types.*;
public class Langton6 {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d0()
      | s(rec_x1_1:Xnat)
  }

  private static Xnat d1 () {
    return `s (d0());
  }

  private static Xnat d2 () {
    return `s (s (d0()));
  }

  private static Xnat d3 () {
    return `s (s (s (d0())));
  }

  private static Xnat d4 () {
    return `s (s (s (s (d0()))));
  }

  private static Xnat d5 () {
    return `s (s (s (s (s (d0())))));
  }

  private static Xnat d6 () {
    return `s (s (s (s (s (s (d0()))))));
  }

  private static Xnat d7 () {
    return `s (s (s (s (s (s (s (d0())))))));
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, d0() -> { return `X; }
      s (X), Y -> { return `s (plus (X,Y)); }
      X, s (Y) -> { return `s (plus (X,Y)); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat langton (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
      d0(),s (d0()),d0(),d0(),d0() -> { return `d2(); }
      d0(),s (s (s (s (s (s (d0())))))),d0(),d0(),d0() -> { return `d3(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),d0(),d0(),d0() -> { return `d1(); }
      d0(),X,d0(),d0(),d0() -> { return `d0(); }
      d0(),s (d0()),d0(),d0(),s (d0()) -> { return `d2(); }
      d0(),s (s (d0())),d0(),d0(),s (d0()) -> { return `d2(); }
      d0(),s (s (s (d0()))),d0(),d0(),s (d0()) -> { return `d2(); }
      d0(),s (d0()),d0(),d0(),s (s (d0())) -> { return `d2(); }
      d0(),s (s (s (s (s (s (d0())))))),d0(),d0(),s (s (d0())) -> { return `d2(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),d0(),d0(),s (s (d0())) -> { return `d2(); }
      d0(),s (s (d0())),d0(),d0(),s (s (s (s (s (d0()))))) -> { return `d5(); }
      d0(),s (s (d0())),d0(),d0(),s (s (s (s (s (s (d0())))))) -> { return `d2(); }
      d0(),s (s (d0())),d0(),d0(),s (s (s (s (s (s (s (d0()))))))) -> { return `d2(); }
      d0(),s (s (d0())),d0(),s (d0()),d0() -> { return `d2(); }
      d0(),s (s (d0())),d0(),s (s (d0())),s (d0()) -> { return `d5(); }
      d0(),s (s (d0())),d0(),s (s (d0())),s (s (s (d0()))) -> { return `d2(); }
      d0(),s (s (d0())),d0(),s (s (s (s (s (d0()))))),s (s (d0())) -> { return `d2(); }
      s (d0()),s (s (d0())),d0(),s (s (d0())),s (s (s (d0()))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (d0())),s (s (s (s (d0())))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d5(); }
      s (d0()),s (s (d0())),d0(),s (s (d0())),s (s (s (s (s (s (d0())))))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d1(); }
      s (d0()),s (s (s (s (s (d0()))))),d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (d0())))),s (s (d0())) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (d0())))),s (s (s (d0()))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (d0())))),s (s (s (s (d0())))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (d0())))),s (s (s (s (s (s (s (d0()))))))) -> { return `d1(); }
      s (d0()),s (s (s (s (s (d0()))))),d0(),s (s (s (s (s (s (d0())))))),s (s (d0())) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (s (s (s (d0()))))))),s (s (d0())) -> { return `d1(); }
      s (d0()),s (s (s (s (s (d0()))))),d0(),s (s (s (s (s (s (s (d0()))))))),s (s (d0())) -> { return `d5(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (s (s (s (d0()))))))),s (s (s (s (s (d0()))))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (s (s (s (d0()))))))),s (s (s (s (s (s (d0())))))) -> { return `d1(); }
      s (d0()),s (s (d0())),d0(),s (s (s (s (s (s (s (d0()))))))),s (s (s (s (s (s (s (d0()))))))) -> { return `d1(); }
      s (s (d0())),s (s (s (s (s (s (s (d0()))))))),d0(),s (s (s (s (s (d0()))))),s (s (d0())) -> { return `d1(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (d0()),d0(),d0() -> { return `d7(); }
      d0(),s (s (s (s (d0())))),s (d0()),d0(),s (s (d0())) -> { return `d4(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (d0()),d0(),s (s (d0())) -> { return `d7(); }
      d0(),s (s (s (s (d0())))),s (d0()),s (d0()),s (s (d0())) -> { return `d4(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (d0()),s (s (d0())) -> { return `d7(); }
      d0(),s (s (d0())),s (d0()),s (s (d0())),d0() -> { return `d6(); }
      d0(),s (s (s (s (d0())))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d4(); }
      d0(),s (s (s (s (s (s (d0())))))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d3(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d7(); }
      d0(),s (s (d0())),s (d0()),s (s (d0())),s (s (s (d0()))) -> { return `d7(); }
      d0(),s (s (d0())),s (d0()),s (s (d0())),s (s (s (s (d0())))) -> { return `d4(); }
      d0(),s (s (d0())),s (d0()),s (s (d0())),s (s (s (s (s (s (d0())))))) -> { return `d6(); }
      d0(),s (s (s (s (d0())))),s (d0()),s (s (d0())),s (s (s (s (s (s (d0())))))) -> { return `d4(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())),s (s (s (s (s (s (d0())))))) -> { return `d7(); }
      d0(),s (d0()),s (d0()),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d0(); }
      d0(),s (s (d0())),s (d0()),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d7(); }
      d0(),s (s (d0())),s (d0()),s (s (s (s (s (d0()))))),s (s (s (s (d0())))) -> { return `d7(); }
      s (d0()),s (s (s (s (d0())))),s (d0()),s (d0()),s (s (d0())) -> { return `d4(); }
      s (d0()),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (d0()),s (s (d0())) -> { return `d7(); }
      s (d0()),s (s (d0())),s (d0()),s (d0()),s (s (s (s (s (d0()))))) -> { return `d2(); }
      s (d0()),s (s (s (s (d0())))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d4(); }
      s (d0()),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d7(); }
      s (d0()),s (s (d0())),s (d0()),s (s (d0())),s (s (s (s (d0())))) -> { return `d4(); }
      s (d0()),s (s (d0())),s (d0()),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d7(); }
      s (s (d0())),s (s (s (s (d0())))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d4(); }
      s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())),s (s (d0())) -> { return `d7(); }
      s (s (d0())),s (s (s (d0()))),s (d0()),s (s (d0())),s (s (s (s (d0())))) -> { return `d4(); }
      s (s (d0())),s (s (s (s (d0())))),s (d0()),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d7(); }
      s (s (d0())),s (s (s (s (d0())))),s (d0()),s (s (s (d0()))),s (s (d0())) -> { return `d4(); }
      s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (s (d0()))),s (s (d0())) -> { return `d7(); }
      s (s (d0())),s (s (s (s (s (d0()))))),s (d0()),s (s (s (s (d0())))),s (s (d0())) -> { return `d5(); }
      s (s (d0())),s (s (s (s (s (s (d0())))))),s (d0()),s (s (s (s (d0())))),s (s (d0())) -> { return `d7(); }
      s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (s (s (s (d0()))))),s (s (d0())) -> { return `d5(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),d0(),d0() -> { return `d1(); }
      d0(),s (s (s (s (s (d0()))))),s (s (d0())),d0(),s (s (d0())) -> { return `d0(); }
      d0(),s (s (d0())),s (s (d0())),d0(),s (s (s (d0()))) -> { return `d6(); }
      d0(),s (s (d0())),s (s (d0())),d0(),s (s (s (s (d0())))) -> { return `d3(); }
      d0(),s (d0()),s (s (d0())),d0(),s (s (s (s (s (d0()))))) -> { return `d7(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),d0(),s (s (s (s (s (d0()))))) -> { return `d5(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (d0())),d0() -> { return `d3(); }
      d0(),s (s (d0())),s (s (d0())),s (s (d0())),s (s (s (d0()))) -> { return `d1(); }
      d0(),s (s (d0())),s (s (d0())),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d0(); }
      d0(),s (d0()),s (s (d0())),s (s (s (d0()))),s (s (d0())) -> { return `d6(); }
      d0(),s (s (d0())),s (s (d0())),s (s (s (d0()))),s (s (d0())) -> { return `d6(); }
      d0(),s (s (d0())),s (s (d0())),s (s (s (s (s (d0()))))),s (s (s (s (s (d0()))))) -> { return `d1(); }
      d0(),s (s (d0())),s (s (d0())),s (s (s (s (s (d0()))))),s (s (s (s (s (s (s (d0()))))))) -> { return `d5(); }
      s (d0()),s (s (s (s (s (s (d0())))))),s (s (d0())),s (d0()),s (s (d0())) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (d0()))),d0(),d0() -> { return `d2(); }
      d0(),s (s (s (s (d0())))),s (s (s (d0()))),d0(),d0() -> { return `d1(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (s (s (d0()))),d0(),d0() -> { return `d6(); }
      d0(),s (s (d0())),s (s (s (d0()))),d0(),s (s (s (s (d0())))) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (d0()))),d0(),s (s (s (s (s (s (d0())))))) -> { return `d2(); }
      d0(),s (s (d0())),s (s (s (d0()))),s (d0()),d0() -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (d0()))),s (d0()),s (s (d0())) -> { return `d0(); }
      d0(),s (d0()),s (s (s (d0()))),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (d0()),s (d0()) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (d0()),s (s (d0())) -> { return `d0(); }
      d0(),s (s (s (s (s (d0()))))),s (s (s (s (d0())))),s (d0()),s (s (d0())) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (s (d0())),s (d0()) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (s (d0())),s (s (d0())) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (s (d0())),s (s (s (d0()))) -> { return `d6(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (d0())))),s (s (s (d0()))),s (s (d0())) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),d0(),d0() -> { return `d2(); }
      d0(),s (s (s (d0()))),s (s (s (s (s (d0()))))),d0(),s (s (d0())) -> { return `d2(); }
      d0(),s (s (s (s (s (s (s (d0()))))))),s (s (s (s (s (d0()))))),d0(),s (s (d0())) -> { return `d2(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),d0(),s (s (s (s (s (d0()))))) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),d0() -> { return `d2(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (d0()) -> { return `d2(); }
      d0(),s (s (s (s (s (d0()))))),s (s (s (s (s (d0()))))),s (s (d0())),s (d0()) -> { return `d2(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (s (d0())) -> { return `d0(); }
      d0(),s (s (s (s (d0())))),s (s (s (s (s (d0()))))),s (s (d0())),s (s (d0())) -> { return `d4(); }
      d0(),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d2(); }
      s (d0()),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (d0()) -> { return `d2(); }
      s (d0()),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (s (d0())) -> { return `d0(); }
      s (d0()),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (s (s (s (d0())))) -> { return `d2(); }
      s (d0()),s (s (d0())),s (s (s (s (s (d0()))))),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d2(); }
      d0(),s (d0()),s (s (s (s (s (s (d0())))))),d0(),d0() -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (s (s (d0())))))),d0(),d0() -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (s (s (d0())))))),s (s (d0())),s (d0()) -> { return `d0(); }
      s (d0()),s (s (d0())),s (s (s (s (s (s (d0())))))),s (s (d0())),s (d0()) -> { return `d5(); }
      s (d0()),s (s (s (d0()))),s (s (s (s (s (s (d0())))))),s (s (d0())),s (d0()) -> { return `d1(); }
      s (d0()),s (s (d0())),s (s (s (s (s (s (d0())))))),s (s (d0())),s (s (d0())) -> { return `d5(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (d0()) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())) -> { return `d0(); }
      d0(),s (s (s (s (s (d0()))))),s (s (s (s (s (s (s (d0()))))))),s (d0()),s (s (d0())) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (d0()) -> { return `d0(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (d0())) -> { return `d1(); }
      d0(),s (s (s (s (s (d0()))))),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (d0())) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (s (d0()))) -> { return `d1(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (s (s (s (d0()))))) -> { return `d5(); }
      d0(),s (s (d0())),s (s (s (s (s (s (s (d0()))))))),s (s (d0())),s (s (s (s (s (s (s (d0()))))))) -> { return `d0(); }
      V, W, X, Y, Z -> { return `X; }
    }
    throw new RuntimeException ("incomplete match in function langton()");
  }

  private static Xnat next (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
    %match (Xnat rec_x1, Xnat rec_x2, Xnat rec_x3, Xnat rec_x4, Xnat rec_x5) {
      V,W,Y,Z,s (X) -> { return `plus (langton (V,W,Y,Z,s (X)),next (V,W,Y,Z,X)); }
      V,W,Y,s (X),d0() -> { return `plus (langton (V,W,Y,s (X),d0()),next (V,W,Y,X,d7())); }
      V,W,s (X),d0(),d0() -> { return `plus (langton (V,W,s (X),d0(),d0()),next (V,W,X,d7(),d7())); }
      Y,s (X),d0(),d0(),d0() -> { return `plus (langton (Y,s (X),d0(),d0(),d0()),next (Y,X,d7(),d7(),d7())); }
      s (X),d0(),d0(),d0(),d0() -> { return `plus (langton (s (X),d0(),d0(),d0(),d0()),next (X,d7(),d7(),d7(),d7())); }
      d0(),d0(),d0(),d0(),d0() -> { return `langton (d0(),d0(),d0(),d0(),d0()); }
    }
    throw new RuntimeException ("incomplete match in function next()");
  }

  public static void main (String[] args) {
    System.out.println (`next (d6(),d6(),d6(),d6(),d6()));
  }
}
