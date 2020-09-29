module tautologyhard
import IO;

data Prop = Tt() | Ff();

Prop xand (Prop p, Tt()) = p;
Prop xand (Prop p, Ff()) = Ff();

Prop xor (Prop p, Ff()) = p;
Prop xor (Ff(), Tt()) = Tt();
Prop xor (Tt(), Tt()) = Ff();

Prop xnot (Prop p) = xor (p, Tt());

Prop yor (Prop p, Prop q) = xor (xand (p, q), xor (p, q));

Prop implies (Prop p, Prop q) = xnot (xor (p, xand (p, q)));

Prop iff (Prop p, Prop q) = xnot (xor (p, q));

Prop a() = Ff();

Prop b() = Tt();

Prop c() = Ff();

Prop d() = Tt();

Prop e() = Ff();

Prop a1() = Tt();

Prop a2() = Ff();

Prop a3() = Tt();

Prop a4() = Ff();

Prop a5() = Tt();

Prop a6() = Ff();

Prop a7() = Tt();

Prop a8() = Ff();

Prop a9() = Tt();

Prop a10() = Ff();

Prop a11() = Tt();

Prop a12() = Ff();

Prop a13() = Tt();

Prop a14() = Ff();

Prop a15() = Tt();

Prop a16() = Ff();

Prop a17() = Tt();

Prop a18() = Ff();

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (implies (xand (iff (iff (yor (a1(), a2()), yor (xnot (a3()), iff (xor (a4(), a5()),xnot (xnot (xnot (a6())))))), xnot (xand (xand (a7(), a8()), xnot (xor (xor (yor (a9(), xand (a10(),a11())), a2()), xand (xand (a11(), xor (a2(), iff (a5(), a5()))), xor (xor (a7(), a7()),iff (a9(), a4())))))))), implies (iff (iff (yor (a1(), a2()), yor (xnot (a3()),iff (xor (a4(), a5()), xnot (xnot (xnot (a6())))))), xnot (xand (xand (a7(), a8()),xnot (xor (xor (yor (a9(), xand (a10(), a11())), a2()), xand (xand (a11(), xor (a2(), iff (a5(),a5()))), xor (xor (a7(), a7()), iff (a9(), a4())))))))), xnot (xand (implies (xand (a1(),a2()), xnot (xor (yor (yor (xor (implies (xand (a3(), a4()), implies (a5(), a6())), yor (a7(),a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(), a2()), a7())), iff (yor (a4(), a9()),xor (xnot (a6()), a6()))))), xnot (iff (xnot (a11()), xnot (a9()))))))),xnot (xand (implies (xand (a1(), a2()), xnot (xor (yor (yor (xor (implies (xand (a3(), a4()),implies (a5(), a6())), yor (a7(), a8())), xor (iff (a9(), a10()), a11())), xor (xor (a2(),a2()), a7())), iff (yor (a4(), a9()), xor (xnot (a6()), a6()))))), xnot (iff (xnot (a11()),xnot (a9())))))));
  println (implies (xand (xnot (xand (xor (a1(), xor (yor (a2(), a3()), a4())), xor (iff (xor (xnot (a5()),yor (xor (iff (a6(), a7()), iff (a8(), a9())), xand (a10(), a9()))), iff (xnot (xnot (a2())),implies (yor (a9(), a6()), yor (a10(), a5())))), xnot (yor (a9(), implies (xnot (a8()), yor (a4(),a9()))))))), implies (xnot (xand (xor (a1(), xor (yor (a2(), a3()), a4())),xor (iff (xor (xnot (a5()), yor (xor (iff (a6(), a7()), iff (a8(), a9())), xand (a10(), a9()))),iff (xnot (xnot (a2())), implies (yor (a9(), a6()), yor (a10(), a5())))), xnot (yor (a9(),implies (xnot (a8()), yor (a4(), a9()))))))), xnot (implies (implies (xand (yor (a1(),xor (xor (a2(), a3()), xnot (a4()))), xnot (xor (a5(), xand (a6(), a7())))),implies (xor (implies (a8(), a9()), a10()), xor (xand (a4(), yor (a4(), a1())), a2()))),yor (yor (xor (yor (a4(), a7()), a2()), xand (a8(), a1())), xnot (xnot (xnot (a6())))))))),xnot (implies (implies (xand (yor (a1(), xor (xor (a2(), a3()), xnot (a4()))), xnot (xor (a5(),xand (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (xand (a4(), yor (a4(),a1())), a2()))), yor (yor (xor (yor (a4(), a7()), a2()), xand (a8(), a1())),xnot (xnot (xnot (a6()))))))));
  println (implies (xand (xnot (xand (xor (a1(), xor (yor (a2(), a3()), a4())), xor (iff (xor (xnot (a5()),yor (xor (iff (a6(), a7()), iff (a8(), a9())), xand (a10(), a11()))), implies (yor (a4(),xand (a3(), iff (a1(), a2()))), xnot (xnot (a4())))), xor (implies (implies (a6(), a1()),xnot (a1())), xnot (a9()))))), implies (xnot (xand (xor (a1(), xor (yor (a2(), a3()), a4())),xor (iff (xor (xnot (a5()), yor (xor (iff (a6(), a7()), iff (a8(), a9())), xand (a10(),a11()))), implies (yor (a4(), xand (a3(), iff (a1(), a2()))), xnot (xnot (a4())))),xor (implies (implies (a6(), a1()), xnot (a1())), xnot (a9()))))),xnot (implies (implies (xand (yor (a1(), xor (xor (a2(), a3()), xnot (a4()))), xnot (xor (a5(),xand (a6(), a7())))), implies (xor (implies (a8(), a9()), a10()), xor (xand (a11(),implies (a2(), a8())), a8()))), xnot (yor (implies (yor (a5(), yor (a8(), xand (a8(), a9()))),xnot (a2())), xnot (a7()))))))), xnot (implies (implies (xand (yor (a1(), xor (xor (a2(),a3()), xnot (a4()))), xnot (xor (a5(), xand (a6(), a7())))), implies (xor (implies (a8(),a9()), a10()), xor (xand (a11(), implies (a2(), a8())), a8()))), xnot (yor (implies (yor (a5(),yor (a8(), xand (a8(), a9()))), xnot (a2())), xnot (a7())))))));
  return 0;
}
