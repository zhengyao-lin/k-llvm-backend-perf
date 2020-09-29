module langton7
import IO;

data Nat = D0() | S (Nat rec_x1_1);

Nat d1() = S (D0());

Nat d2() = S (S (D0()));

Nat d3() = S (S (S (D0())));

Nat d4() = S (S (S (S (D0()))));

Nat d5() = S (S (S (S (S (D0())))));

Nat d6() = S (S (S (S (S (S (D0()))))));

Nat d7() = S (S (S (S (S (S (S (D0())))))));

Nat plus (Nat x, D0()) = x;
Nat plus (S (Nat x), Nat y) = S (plus (x,y));
Nat plus (Nat x, S (Nat y)) = S (plus (x,y));

Nat langton (D0(),S (D0()),D0(),D0(),D0()) = d2();
Nat langton (D0(),S (S (S (S (S (S (D0())))))),D0(),D0(),D0()) = d3();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),D0(),D0(),D0()) = d1();
Nat langton (D0(),Nat x,D0(),D0(),D0()) = D0();
Nat langton (D0(),S (D0()),D0(),D0(),S (D0())) = d2();
Nat langton (D0(),S (S (D0())),D0(),D0(),S (D0())) = d2();
Nat langton (D0(),S (S (S (D0()))),D0(),D0(),S (D0())) = d2();
Nat langton (D0(),S (D0()),D0(),D0(),S (S (D0()))) = d2();
Nat langton (D0(),S (S (S (S (S (S (D0())))))),D0(),D0(),S (S (D0()))) = d2();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),D0(),D0(),S (S (D0()))) = d2();
Nat langton (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (D0())))))) = d5();
Nat langton (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (S (D0()))))))) = d2();
Nat langton (D0(),S (S (D0())),D0(),D0(),S (S (S (S (S (S (S (D0())))))))) = d2();
Nat langton (D0(),S (S (D0())),D0(),S (D0()),D0()) = d2();
Nat langton (D0(),S (S (D0())),D0(),S (S (D0())),S (D0())) = d5();
Nat langton (D0(),S (S (D0())),D0(),S (S (D0())),S (S (S (D0())))) = d2();
Nat langton (D0(),S (S (D0())),D0(),S (S (S (S (S (D0()))))),S (S (D0()))) = d2();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (D0())))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (D0()))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (D0())))))) = d5();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (S (D0()))))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d1();
Nat langton (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (D0()))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (D0())))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (S (D0()))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (D0())))),S (S (S (S (S (S (S (D0())))))))) = d1();
Nat langton (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (S (D0())))))),S (S (D0()))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0()))) = d1();
Nat langton (S (D0()),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0()))) = d5();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (D0())))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (S (D0()))))))) = d1();
Nat langton (S (D0()),S (S (D0())),D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (S (S (D0())))))))) = d1();
Nat langton (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),D0(),S (S (S (S (S (D0()))))),S (S (D0()))) = d1();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),D0(),D0()) = d7();
Nat langton (D0(),S (S (S (S (D0())))),S (D0()),D0(),S (S (D0()))) = d4();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),D0(),S (S (D0()))) = d7();
Nat langton (D0(),S (S (S (S (D0())))),S (D0()),S (D0()),S (S (D0()))) = d4();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0()),S (S (D0()))) = d7();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (D0())),D0()) = d6();
Nat langton (D0(),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) = d4();
Nat langton (D0(),S (S (S (S (S (S (D0())))))),S (D0()),S (S (D0())),S (S (D0()))) = d3();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) = d7();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (D0())))) = d7();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (D0()))))) = d4();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) = d6();
Nat langton (D0(),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) = d4();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (S (S (S (S (D0()))))))) = d7();
Nat langton (D0(),S (D0()),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = D0();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d7();
Nat langton (D0(),S (S (D0())),S (D0()),S (S (S (S (S (D0()))))),S (S (S (S (D0()))))) = d7();
Nat langton (S (D0()),S (S (S (S (D0())))),S (D0()),S (D0()),S (S (D0()))) = d4();
Nat langton (S (D0()),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0()),S (S (D0()))) = d7();
Nat langton (S (D0()),S (S (D0())),S (D0()),S (D0()),S (S (S (S (S (D0())))))) = d2();
Nat langton (S (D0()),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) = d4();
Nat langton (S (D0()),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) = d7();
Nat langton (S (D0()),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (D0()))))) = d4();
Nat langton (S (D0()),S (S (D0())),S (D0()),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d7();
Nat langton (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (D0()))) = d4();
Nat langton (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0())),S (S (D0()))) = d7();
Nat langton (S (S (D0())),S (S (S (D0()))),S (D0()),S (S (D0())),S (S (S (S (D0()))))) = d4();
Nat langton (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0())),S (S (S (S (S (D0())))))) = d7();
Nat langton (S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (S (D0()))),S (S (D0()))) = d4();
Nat langton (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (S (D0()))),S (S (D0()))) = d7();
Nat langton (S (S (D0())),S (S (S (S (S (D0()))))),S (D0()),S (S (S (S (D0())))),S (S (D0()))) = d5();
Nat langton (S (S (D0())),S (S (S (S (S (S (D0())))))),S (D0()),S (S (S (S (D0())))),S (S (D0()))) = d7();
Nat langton (S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (S (S (S (D0()))))),S (S (D0()))) = d5();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),D0(),D0()) = d1();
Nat langton (D0(),S (S (S (S (S (D0()))))),S (S (D0())),D0(),S (S (D0()))) = D0();
Nat langton (D0(),S (S (D0())),S (S (D0())),D0(),S (S (S (D0())))) = d6();
Nat langton (D0(),S (S (D0())),S (S (D0())),D0(),S (S (S (S (D0()))))) = d3();
Nat langton (D0(),S (D0()),S (S (D0())),D0(),S (S (S (S (S (D0())))))) = d7();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),D0(),S (S (S (S (S (D0())))))) = d5();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0())),D0()) = d3();
Nat langton (D0(),S (S (D0())),S (S (D0())),S (S (D0())),S (S (S (D0())))) = d1();
Nat langton (D0(),S (S (D0())),S (S (D0())),S (S (D0())),S (S (S (S (S (D0())))))) = D0();
Nat langton (D0(),S (D0()),S (S (D0())),S (S (S (D0()))),S (S (D0()))) = d6();
Nat langton (D0(),S (S (D0())),S (S (D0())),S (S (S (D0()))),S (S (D0()))) = d6();
Nat langton (D0(),S (S (D0())),S (S (D0())),S (S (S (S (S (D0()))))),S (S (S (S (S (D0())))))) = d1();
Nat langton (D0(),S (S (D0())),S (S (D0())),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0())))))))) = d5();
Nat langton (S (D0()),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0()),S (S (D0()))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (D0()))),D0(),D0()) = d2();
Nat langton (D0(),S (S (S (S (D0())))),S (S (S (D0()))),D0(),D0()) = d1();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (D0()))),D0(),D0()) = d6();
Nat langton (D0(),S (S (D0())),S (S (S (D0()))),D0(),S (S (S (S (D0()))))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (D0()))),D0(),S (S (S (S (S (S (D0()))))))) = d2();
Nat langton (D0(),S (S (D0())),S (S (S (D0()))),S (D0()),D0()) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (D0()))),S (D0()),S (S (D0()))) = D0();
Nat langton (D0(),S (D0()),S (S (S (D0()))),S (S (D0())),S (S (S (S (S (D0())))))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (D0()),S (D0())) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (D0()),S (S (D0()))) = D0();
Nat langton (D0(),S (S (S (S (S (D0()))))),S (S (S (S (D0())))),S (D0()),S (S (D0()))) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (D0())) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (D0()))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (S (D0())))) = d6();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (D0())),S (S (S (S (S (D0())))))) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (D0())))),S (S (S (D0()))),S (S (D0()))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),D0(),D0()) = d2();
Nat langton (D0(),S (S (S (D0()))),S (S (S (S (S (D0()))))),D0(),S (S (D0()))) = d2();
Nat langton (D0(),S (S (S (S (S (S (S (D0()))))))),S (S (S (S (S (D0()))))),D0(),S (S (D0()))) = d2();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),D0(),S (S (S (S (S (D0())))))) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),D0()) = d2();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) = d2();
Nat langton (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) = d2();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) = D0();
Nat langton (D0(),S (S (S (S (D0())))),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) = d4();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d2();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (D0())) = d2();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (D0()))) = D0();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (D0()))))) = d2();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (D0()))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = d2();
Nat langton (D0(),S (D0()),S (S (S (S (S (S (D0())))))),D0(),D0()) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (D0())))))),D0(),D0()) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) = D0();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) = d5();
Nat langton (S (D0()),S (S (S (D0()))),S (S (S (S (S (S (D0())))))),S (S (D0())),S (D0())) = d1();
Nat langton (S (D0()),S (S (D0())),S (S (S (S (S (S (D0())))))),S (S (D0())),S (S (D0()))) = d5();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (D0())) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0()))) = D0();
Nat langton (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0()))))))),S (D0()),S (S (D0()))) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (D0())) = D0();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0()))) = d1();
Nat langton (D0(),S (S (S (S (S (D0()))))),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (D0()))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (D0())))) = d1();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (S (S (D0())))))) = d5();
Nat langton (D0(),S (S (D0())),S (S (S (S (S (S (S (D0()))))))),S (S (D0())),S (S (S (S (S (S (S (D0())))))))) = D0();
Nat langton (Nat v, Nat w, Nat x, Nat y, Nat z) = x;

Nat next (Nat v,Nat w,Nat y,Nat z,S (Nat x)) = plus (langton (v,w,y,z,S (x)),next (v,w,y,z,x));
Nat next (Nat v,Nat w,Nat y,S (Nat x),D0()) = plus (langton (v,w,y,S (x),D0()),next (v,w,y,x,d7()));
Nat next (Nat v,Nat w,S (Nat x),D0(),D0()) = plus (langton (v,w,S (x),D0(),D0()),next (v,w,x,d7(),d7()));
Nat next (Nat y,S (Nat x),D0(),D0(),D0()) = plus (langton (y,S (x),D0(),D0(),D0()),next (y,x,d7(),d7(),d7()));
Nat next (S (Nat x),D0(),D0(),D0(),D0()) = plus (langton (S (x),D0(),D0(),D0(),D0()),next (x,d7(),d7(),d7(),d7()));
Nat next (D0(),D0(),D0(),D0(),D0()) = langton (D0(),D0(),D0(),D0(),D0());

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (next (d7(),d7(),d7(),d7(),d7()));
  return 0;
}
