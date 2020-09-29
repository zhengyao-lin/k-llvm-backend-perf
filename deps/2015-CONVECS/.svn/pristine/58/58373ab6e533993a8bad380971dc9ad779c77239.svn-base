// TOM-A
import calls.term.*;
import calls.term.types.*;
public class Calls {
  %gom{
    module Term
    abstract syntax
    S =
      | a()
      | b()
      | c()
      | d()
      | e()
      | f()
      | nary_constructor(rec_x1_1:S, rec_x2_1:S, rec_x3_1:S)
      | nary_function(rec_x1_2:S, rec_x2_2:S, rec_x3_2:S)
      | nullary_constructor()
      | nullary_function()
      | unary_constructor(rec_x1_3:S)
      | unary_function(rec_x1_4:S)
    module Term:rules() {
      nullary_function() -> nullary_constructor()
      unary_function (x) -> unary_constructor (x)
      nary_function (x, y, z) -> nary_constructor (x, y, z)
      a() -> nullary_constructor()
      b() -> unary_constructor (nullary_constructor())
      c() -> nary_constructor (nullary_constructor(), nullary_constructor(), nullary_constructor())
      d() -> nullary_function()
      e() -> unary_function (nullary_function())
      f() -> nary_function (nullary_function(), nullary_function(), nullary_function())
    }
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
