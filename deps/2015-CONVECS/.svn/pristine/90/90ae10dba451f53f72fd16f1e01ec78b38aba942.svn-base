module hanoi8
import IO;

data Disk = D0() | D1() | D2() | D3() | D4() | D5() | D6() | D7() | D8() | D9() | D10() | D11() | D12() | D13() | D14() | D15() | D16() | D17() | D18() | D19() | D20();

data Tower = A() | B() | C();

data Move = Movedisk (Disk rec_x1_1, Tower rec_x2_1, Tower rec_x3_1);

data List = Nil() | Cons (Move rec_x1_1, List rec_x2_1);

Disk dec (D20()) = D19();
Disk dec (D19()) = D18();
Disk dec (D18()) = D17();
Disk dec (D17()) = D16();
Disk dec (D16()) = D15();
Disk dec (D15()) = D14();
Disk dec (D14()) = D13();
Disk dec (D13()) = D12();
Disk dec (D12()) = D11();
Disk dec (D11()) = D10();
Disk dec (D10()) = D9();
Disk dec (D9()) = D8();
Disk dec (D8()) = D7();
Disk dec (D7()) = D6();
Disk dec (D6()) = D5();
Disk dec (D5()) = D4();
Disk dec (D4()) = D3();
Disk dec (D3()) = D2();
Disk dec (D2()) = D1();
Disk dec (D1()) = D0();

Tower other (A(), B()) = C();
Tower other (B(), A()) = C();
Tower other (A(), C()) = B();
Tower other (C(), A()) = B();
Tower other (B(), C()) = A();
Tower other (C(), B()) = A();

List conc (Nil(), List l) = l;
List conc (List l, Nil()) = l;
List conc (Cons (Move h, List t), List l) = Cons (h, conc (t, l));

List xsolve (Tower oRG, Tower dEST, D0()) = Nil();
List xsolve (Tower oRG, Tower dEST, Disk d) { if (d != D0()) return conc (xsolve (oRG, other (oRG, dEST), dec (d)), Cons (Movedisk (d, oRG, dEST), xsolve (other (oRG, dEST), dEST, dec (d)))); else fail; }

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (xsolve (A(), B(), D8()));
  return 0;
}
