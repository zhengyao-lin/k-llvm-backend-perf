// TOM-B
import fibfree.term.*;
import fibfree.term.types.*;
public class Fibfree {
  %gom{
    module Term
    imports int
    abstract syntax
    Xnat =
      | d()
      | n0(rec_x1_1:Xnat)
      | n1(rec_x1_2:Xnat)
      | n2(rec_x1_3:Xnat)
      | n3(rec_x1_4:Xnat)
      | n4(rec_x1_5:Xnat)
      | n5(rec_x1_6:Xnat)
      | n6(rec_x1_7:Xnat)
      | n7(rec_x1_8:Xnat)
      | n8(rec_x1_9:Xnat)
      | n9(rec_x1_10:Xnat)
  }

  private static Xnat plus (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, d() -> { return `X; }
      d(), X -> { return `X; }
      n0 (X), n0 (Y) -> { return `n0 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n1 (Y) -> { return `n1 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n2 (Y) -> { return `n2 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n3 (Y) -> { return `n3 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n4 (Y) -> { return `n4 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n5 (Y) -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n6 (Y) -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n7 (Y) -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n8 (Y) -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n0 (X), n9 (Y) -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n1 (Y) -> { return `n2 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n2 (Y) -> { return `n3 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n3 (Y) -> { return `n4 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n4 (Y) -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n5 (Y) -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n6 (Y) -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n7 (Y) -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n8 (Y) -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n1 (X), n9 (Y) -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n2 (X), n2 (Y) -> { return `n4 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n3 (Y) -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n4 (Y) -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n5 (Y) -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n6 (Y) -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n7 (Y) -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n2 (X), n8 (Y) -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n2 (X), n9 (Y) -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n3 (X), n3 (Y) -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n3 (X), n4 (Y) -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n3 (X), n5 (Y) -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n3 (X), n6 (Y) -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n3 (X), n7 (Y) -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n3 (X), n8 (Y) -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n3 (X), n9 (Y) -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n4 (X), n4 (Y) -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n4 (X), n5 (Y) -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n4 (X), n6 (Y) -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n4 (X), n7 (Y) -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n4 (X), n8 (Y) -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n4 (X), n9 (Y) -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n5 (X), n5 (Y) -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n5 (X), n6 (Y) -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n5 (X), n7 (Y) -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n5 (X), n8 (Y) -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n5 (X), n9 (Y) -> { return `n4 (plus (plus (X, Y), n1 (d()))); }
      n6 (X), n6 (Y) -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n6 (X), n7 (Y) -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n6 (X), n8 (Y) -> { return `n4 (plus (plus (X, Y), n1 (d()))); }
      n6 (X), n9 (Y) -> { return `n5 (plus (plus (X, Y), n1 (d()))); }
      n7 (X), n7 (Y) -> { return `n4 (plus (plus (X, Y), n1 (d()))); }
      n7 (X), n8 (Y) -> { return `n5 (plus (plus (X, Y), n1 (d()))); }
      n7 (X), n9 (Y) -> { return `n6 (plus (plus (X, Y), n1 (d()))); }
      n8 (X), n8 (Y) -> { return `n6 (plus (plus (X, Y), n1 (d()))); }
      n8 (X), n9 (Y) -> { return `n7 (plus (plus (X, Y), n1 (d()))); }
      n9 (X), n9 (Y) -> { return `n8 (plus (plus (X, Y), n1 (d()))); }
      n1 (Y), n0 (X)  -> { return `n1 (plus (plus (X, Y), n0 (d()))); }
      n2 (Y), n0 (X)  -> { return `n2 (plus (plus (X, Y), n0 (d()))); }
      n3 (Y), n0 (X)  -> { return `n3 (plus (plus (X, Y), n0 (d()))); }
      n4 (Y), n0 (X)  -> { return `n4 (plus (plus (X, Y), n0 (d()))); }
      n5 (Y), n0 (X)  -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n6 (Y), n0 (X)  -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n7 (Y), n0 (X)  -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n8 (Y), n0 (X)  -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n9 (Y), n0 (X)  -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n2 (Y), n1 (X)  -> { return `n3 (plus (plus (X, Y), n0 (d()))); }
      n3 (Y), n1 (X)  -> { return `n4 (plus (plus (X, Y), n0 (d()))); }
      n4 (Y), n1 (X)  -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n5 (Y), n1 (X)  -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n6 (Y), n1 (X)  -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n7 (Y), n1 (X)  -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n8 (Y), n1 (X)  -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n9 (Y), n1 (X)  -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n3 (Y), n2 (X)  -> { return `n5 (plus (plus (X, Y), n0 (d()))); }
      n4 (Y), n2 (X)  -> { return `n6 (plus (plus (X, Y), n0 (d()))); }
      n5 (Y), n2 (X)  -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n6 (Y), n2 (X)  -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n7 (Y), n2 (X)  -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n8 (Y), n2 (X)  -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n2 (X)  -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n4 (Y), n3 (X)  -> { return `n7 (plus (plus (X, Y), n0 (d()))); }
      n5 (Y), n3 (X)  -> { return `n8 (plus (plus (X, Y), n0 (d()))); }
      n6 (Y), n3 (X)  -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n7 (Y), n3 (X)  -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n8 (Y), n3 (X)  -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n3 (X)  -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n5 (Y), n4 (X)  -> { return `n9 (plus (plus (X, Y), n0 (d()))); }
      n6 (Y), n4 (X)  -> { return `n0 (plus (plus (X, Y), n1 (d()))); }
      n7 (Y), n4 (X)  -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n8 (Y), n4 (X)  -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n4 (X)  -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n6 (Y), n5 (X)  -> { return `n1 (plus (plus (X, Y), n1 (d()))); }
      n7 (Y), n5 (X)  -> { return `n2 (plus (plus (X, Y), n1 (d()))); }
      n8 (Y), n5 (X)  -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n5 (X)  -> { return `n4 (plus (plus (X, Y), n1 (d()))); }
      n7 (Y), n6 (X)  -> { return `n3 (plus (plus (X, Y), n1 (d()))); }
      n8 (Y), n6 (X)  -> { return `n4 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n6 (X)  -> { return `n5 (plus (plus (X, Y), n1 (d()))); }
      n8 (Y), n7 (X)  -> { return `n5 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n7 (X)  -> { return `n6 (plus (plus (X, Y), n1 (d()))); }
      n9 (Y), n8 (X)  -> { return `n7 (plus (plus (X, Y), n1 (d()))); }
    }
    throw new RuntimeException ("incomplete match in function plus()");
  }

  private static Xnat mult0 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { return `d(); }
    }
    throw new RuntimeException ("incomplete match in function mult0()");
  }

  private static Xnat mult1 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { return `X; }
    }
    throw new RuntimeException ("incomplete match in function mult1()");
  }

  private static Xnat mult2 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult2 (X))); }
      n1 (X) -> { return `n2 (plus (n0 (d()), mult2 (X))); }
      n2 (X) -> { return `n4 (plus (n0 (d()), mult2 (X))); }
      n3 (X) -> { return `n6 (plus (n0 (d()), mult2 (X))); }
      n4 (X) -> { return `n8 (plus (n0 (d()), mult2 (X))); }
      n5 (X) -> { return `n0 (plus (n1 (d()), mult2 (X))); }
      n6 (X) -> { return `n2 (plus (n1 (d()), mult2 (X))); }
      n7 (X) -> { return `n4 (plus (n1 (d()), mult2 (X))); }
      n8 (X) -> { return `n6 (plus (n1 (d()), mult2 (X))); }
      n9 (X) -> { return `n8 (plus (n1 (d()), mult2 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult2()");
  }

  private static Xnat mult3 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult3 (X))); }
      n1 (X) -> { return `n3 (plus (n0 (d()), mult3 (X))); }
      n2 (X) -> { return `n6 (plus (n0 (d()), mult3 (X))); }
      n3 (X) -> { return `n9 (plus (n0 (d()), mult3 (X))); }
      n4 (X) -> { return `n2 (plus (n1 (d()), mult3 (X))); }
      n5 (X) -> { return `n5 (plus (n1 (d()), mult3 (X))); }
      n6 (X) -> { return `n8 (plus (n1 (d()), mult3 (X))); }
      n7 (X) -> { return `n1 (plus (n2 (d()), mult3 (X))); }
      n8 (X) -> { return `n4 (plus (n2 (d()), mult3 (X))); }
      n9 (X) -> { return `n7 (plus (n2 (d()), mult3 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult3()");
  }

  private static Xnat mult4 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult4 (X))); }
      n1 (X) -> { return `n4 (plus (n0 (d()), mult4 (X))); }
      n2 (X) -> { return `n8 (plus (n0 (d()), mult4 (X))); }
      n3 (X) -> { return `n2 (plus (n1 (d()), mult4 (X))); }
      n4 (X) -> { return `n6 (plus (n1 (d()), mult4 (X))); }
      n5 (X) -> { return `n0 (plus (n2 (d()), mult4 (X))); }
      n6 (X) -> { return `n4 (plus (n2 (d()), mult4 (X))); }
      n7 (X) -> { return `n8 (plus (n2 (d()), mult4 (X))); }
      n8 (X) -> { return `n2 (plus (n3 (d()), mult4 (X))); }
      n9 (X) -> { return `n6 (plus (n3 (d()), mult4 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult4()");
  }

  private static Xnat mult5 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult5 (X))); }
      n1 (X) -> { return `n5 (plus (n0 (d()), mult5 (X))); }
      n2 (X) -> { return `n0 (plus (n1 (d()), mult5 (X))); }
      n3 (X) -> { return `n5 (plus (n1 (d()), mult5 (X))); }
      n4 (X) -> { return `n0 (plus (n2 (d()), mult5 (X))); }
      n5 (X) -> { return `n5 (plus (n2 (d()), mult5 (X))); }
      n6 (X) -> { return `n0 (plus (n3 (d()), mult5 (X))); }
      n7 (X) -> { return `n5 (plus (n3 (d()), mult5 (X))); }
      n8 (X) -> { return `n0 (plus (n4 (d()), mult5 (X))); }
      n9 (X) -> { return `n5 (plus (n4 (d()), mult5 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult5()");
  }

  private static Xnat mult6 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult6 (X))); }
      n1 (X) -> { return `n6 (plus (n0 (d()), mult6 (X))); }
      n2 (X) -> { return `n2 (plus (n1 (d()), mult6 (X))); }
      n3 (X) -> { return `n8 (plus (n1 (d()), mult6 (X))); }
      n4 (X) -> { return `n4 (plus (n2 (d()), mult6 (X))); }
      n5 (X) -> { return `n0 (plus (n3 (d()), mult6 (X))); }
      n6 (X) -> { return `n6 (plus (n3 (d()), mult6 (X))); }
      n7 (X) -> { return `n2 (plus (n4 (d()), mult6 (X))); }
      n8 (X) -> { return `n8 (plus (n4 (d()), mult6 (X))); }
      n9 (X) -> { return `n4 (plus (n5 (d()), mult6 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult6()");
  }

  private static Xnat mult7 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult7 (X))); }
      n1 (X) -> { return `n7 (plus (n0 (d()), mult7 (X))); }
      n2 (X) -> { return `n4 (plus (n1 (d()), mult7 (X))); }
      n3 (X) -> { return `n1 (plus (n2 (d()), mult7 (X))); }
      n4 (X) -> { return `n8 (plus (n2 (d()), mult7 (X))); }
      n5 (X) -> { return `n5 (plus (n3 (d()), mult7 (X))); }
      n6 (X) -> { return `n2 (plus (n4 (d()), mult7 (X))); }
      n7 (X) -> { return `n9 (plus (n4 (d()), mult7 (X))); }
      n8 (X) -> { return `n6 (plus (n5 (d()), mult7 (X))); }
      n9 (X) -> { return `n3 (plus (n6 (d()), mult7 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult7()");
  }

  private static Xnat mult8 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult8 (X))); }
      n1 (X) -> { return `n8 (plus (n0 (d()), mult8 (X))); }
      n2 (X) -> { return `n6 (plus (n1 (d()), mult8 (X))); }
      n3 (X) -> { return `n4 (plus (n2 (d()), mult8 (X))); }
      n4 (X) -> { return `n2 (plus (n3 (d()), mult8 (X))); }
      n5 (X) -> { return `n0 (plus (n4 (d()), mult8 (X))); }
      n6 (X) -> { return `n8 (plus (n4 (d()), mult8 (X))); }
      n7 (X) -> { return `n6 (plus (n5 (d()), mult8 (X))); }
      n8 (X) -> { return `n4 (plus (n6 (d()), mult8 (X))); }
      n9 (X) -> { return `n2 (plus (n7 (d()), mult8 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult8()");
  }

  private static Xnat mult9 (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `n0 (plus (n0 (d()), mult9 (X))); }
      n1 (X) -> { return `n9 (plus (n0 (d()), mult9 (X))); }
      n2 (X) -> { return `n8 (plus (n1 (d()), mult9 (X))); }
      n3 (X) -> { return `n7 (plus (n2 (d()), mult9 (X))); }
      n4 (X) -> { return `n6 (plus (n3 (d()), mult9 (X))); }
      n5 (X) -> { return `n5 (plus (n4 (d()), mult9 (X))); }
      n6 (X) -> { return `n4 (plus (n5 (d()), mult9 (X))); }
      n7 (X) -> { return `n3 (plus (n6 (d()), mult9 (X))); }
      n8 (X) -> { return `n2 (plus (n7 (d()), mult9 (X))); }
      n9 (X) -> { return `n1 (plus (n8 (d()), mult9 (X))); }
    }
    throw new RuntimeException ("incomplete match in function mult9()");
  }

  private static Xnat times (Xnat rec_x1, Xnat rec_x2) {
    %match (Xnat rec_x1, Xnat rec_x2) {
      X, d() -> { return `d(); }
      n0 (X), Y -> { return `plus (n0 (times (X, Y)), mult0 (Y)); }
      n1 (X), Y -> { return `plus (n0 (times (X, Y)), mult1 (Y)); }
      n2 (X), Y -> { return `plus (n0 (times (X, Y)), mult2 (Y)); }
      n3 (X), Y -> { return `plus (n0 (times (X, Y)), mult3 (Y)); }
      n4 (X), Y -> { return `plus (n0 (times (X, Y)), mult4 (Y)); }
      n5 (X), Y -> { return `plus (n0 (times (X, Y)), mult5 (Y)); }
      n6 (X), Y -> { return `plus (n0 (times (X, Y)), mult6 (Y)); }
      n7 (X), Y -> { return `plus (n0 (times (X, Y)), mult7 (Y)); }
      n8 (X), Y -> { return `plus (n0 (times (X, Y)), mult8 (Y)); }
      n9 (X), Y -> { return `plus (n0 (times (X, Y)), mult9 (Y)); }
      d(), X -> { return `d(); }
    }
    throw new RuntimeException ("incomplete match in function times()");
  }

  private static Xnat prec (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { return `d(); }
      n1 (X) -> { return `n0 (X); }
      n2 (X) -> { return `n1 (X); }
      n3 (X) -> { return `n2 (X); }
      n4 (X) -> { return `n3 (X); }
      n5 (X) -> { return `n4 (X); }
      n6 (X) -> { return `n5 (X); }
      n7 (X) -> { return `n6 (X); }
      n8 (X) -> { return `n7 (X); }
      n9 (X) -> { return `n8 (X); }
    }
    throw new RuntimeException ("incomplete match in function prec()");
  }

  private static Xnat fact (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { if (`X == `d()) { return `n1 (d()); } }
      X -> { if (`X != `d()) { return `times (X, fact (prec (X))); } }
    }
    throw new RuntimeException ("incomplete match in function fact()");
  }

  private static Xnat fib (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      X -> { if (`X == `d()) { return `n1 (d()); } }
      X -> { if (`X != `d() && `X == `n1 (d())) { return `n1 (d()); } }
      X -> { if (`X != `d() && `X != `n1 (d())) { return `plus (fib (prec (X)), fib (prec (prec (X)))); } }
    }
    throw new RuntimeException ("incomplete match in function fib()");
  }

  private static Xnat reduce (Xnat rec_x1) {
    %match (Xnat rec_x1) {
      d() -> { return `d(); }
      n0 (X) -> { if (`reduce (X) == `d()) { return `d(); } }
      n0 (X) -> { if (`reduce (X) != `d()) { return `n0 (reduce (X)); } }
      n1 (X) -> { return `n1 (reduce (X)); }
      n2 (X) -> { return `n2 (reduce (X)); }
      n3 (X) -> { return `n3 (reduce (X)); }
      n4 (X) -> { return `n4 (reduce (X)); }
      n5 (X) -> { return `n5 (reduce (X)); }
      n6 (X) -> { return `n6 (reduce (X)); }
      n7 (X) -> { return `n7 (reduce (X)); }
      n8 (X) -> { return `n8 (reduce (X)); }
      n9 (X) -> { return `n9 (reduce (X)); }
    }
    throw new RuntimeException ("incomplete match in function reduce()");
  }

  public static void main (String[] args) {
    System.out.println (`reduce (fib (n6 (n1 (d())))));
    System.out.println (`reduce (fib (n7 (n5 (d())))));
  }
}
