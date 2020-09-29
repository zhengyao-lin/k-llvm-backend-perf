// TOM-B
import calls.term.*;
import calls.term.types.*;
public class Calls {
  %gom{
    module Term
    imports int
    abstract syntax
    S =
      | nullary_constructor()
      | unary_constructor(rec_x1_1:S)
      | nary_constructor(rec_x1_2:S, rec_x2_2:S, rec_x3_2:S)
  }

  private static S nullary_function () {
    return `nullary_constructor();
  }

  private static S unary_function (S rec_x1) {
    %match (S rec_x1) {
      x -> { return `unary_constructor (x); }
    }
    throw new RuntimeException ("incomplete match in function unary_function()");
  }

  private static S nary_function (S rec_x1, S rec_x2, S rec_x3) {
    %match (S rec_x1, S rec_x2, S rec_x3) {
      x, y, z -> { return `nary_constructor (x, y, z); }
    }
    throw new RuntimeException ("incomplete match in function nary_function()");
  }

  private static S a () {
    return `nullary_constructor();
  }

  private static S b () {
    return `unary_constructor (nullary_constructor());
  }

  private static S c () {
    return `nary_constructor (nullary_constructor(), nullary_constructor(), nullary_constructor());
  }

  private static S d () {
    return `nullary_function();
  }

  private static S e () {
    return `unary_function (nullary_function());
  }

  private static S f () {
    return `nary_function (nullary_function(), nullary_function(), nullary_function());
  }

  public static void main (String[] args) {
    System.out.println (`nullary_constructor());
    System.out.println (`unary_constructor (nullary_constructor()));
    System.out.println (`nary_constructor (nullary_constructor(), nullary_constructor(), nullary_constructor()));
    System.out.println (`nullary_function());
    System.out.println (`unary_function (nullary_function()));
    System.out.println (`nary_function (nullary_function(), nullary_function(), nullary_function()));
  }
}
