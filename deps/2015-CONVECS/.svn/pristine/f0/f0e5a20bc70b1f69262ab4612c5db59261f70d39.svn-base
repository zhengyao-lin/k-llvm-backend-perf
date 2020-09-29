module logic3
import IO;

data Bool3 = D0() | D1() | D2();

Bool3 a() = D0();

Bool3 b() = D1();

Bool3 c() = D2();

Bool3 d() = D0();

Bool3 e() = D1();

Bool3 f() = D2();

Bool3 g() = D0();

Bool3 h() = D1();

Bool3 succ (D0()) = D1();
Bool3 succ (D1()) = D2();
Bool3 succ (D2()) = D0();

Bool3 plus (D0(), Bool3 x) = x;
Bool3 plus (D1(), Bool3 x) = succ (x);
Bool3 plus (D2(), Bool3 x) = succ (succ (x));

Bool3 times (D0(), Bool3 x) = D0();
Bool3 times (D1(), Bool3 x) = x;
Bool3 times (D2(), D0()) = D0();
Bool3 times (D2(), D1()) = D2();
Bool3 times (D2(), D2()) = D1();

Bool3 xand (Bool3 x,Bool3 y) = plus ( times (times (x, x), times (y, y)),plus ( times (D2(), times (times (x, x), y)),plus ( times (D2(), times (times (y, y), x)),times (D2(), times (x, y)) )));

Bool3 yor (Bool3 x,Bool3 y) = plus ( times (D2(), times (times (x, x), times (y, y))),plus ( times (times (x, x), y),plus ( times (times (y, y), x),plus ( times (x, y),plus (x, y) ))));

Bool3 xnot (Bool3 x) = plus (times (D2(), x), D1());

Bool3 xeq (Bool3 x,Bool3 y) { if (x == y) return D1(); else fail; }
Bool3 xeq (Bool3 x,Bool3 y) { if (x != y) return D0(); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (xeq (xand (xand (xand (a(), b()), xand (c(), d())), xand (xand (e(), f()), xand (g(), h()))), xnot (yor (yor (yor (xnot (a()), xnot (b())), yor (xnot (c()), xnot (d()))),yor (yor (xnot (e()), xnot (f())), yor (xnot (g()), xnot (h())))))));
  return 0;
}
