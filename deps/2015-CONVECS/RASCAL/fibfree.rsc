module fibfree
import IO;

data Nat = D() | N0 (Nat rec_x1_1) | N1 (Nat rec_x1_2) | N2 (Nat rec_x1_3) | N3 (Nat rec_x1_4) | N4 (Nat rec_x1_5) | N5 (Nat rec_x1_6) | N6 (Nat rec_x1_7) | N7 (Nat rec_x1_8) | N8 (Nat rec_x1_9) | N9 (Nat rec_x1_10);

Nat plus (Nat x, D()) = x;
Nat plus (D(), Nat x) = x;
Nat plus (N0 (Nat x), N0 (Nat y)) = N0 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N1 (Nat y)) = N1 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N2 (Nat y)) = N2 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N3 (Nat y)) = N3 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N4 (Nat y)) = N4 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N5 (Nat y)) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N6 (Nat y)) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N7 (Nat y)) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N8 (Nat y)) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N0 (Nat x), N9 (Nat y)) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N1 (Nat y)) = N2 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N2 (Nat y)) = N3 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N3 (Nat y)) = N4 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N4 (Nat y)) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N5 (Nat y)) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N6 (Nat y)) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N7 (Nat y)) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N8 (Nat y)) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N1 (Nat x), N9 (Nat y)) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N2 (Nat x), N2 (Nat y)) = N4 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N3 (Nat y)) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N4 (Nat y)) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N5 (Nat y)) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N6 (Nat y)) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N7 (Nat y)) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat x), N8 (Nat y)) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N2 (Nat x), N9 (Nat y)) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N3 (Nat x), N3 (Nat y)) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat x), N4 (Nat y)) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat x), N5 (Nat y)) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat x), N6 (Nat y)) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat x), N7 (Nat y)) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N3 (Nat x), N8 (Nat y)) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N3 (Nat x), N9 (Nat y)) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N4 (Nat x), N4 (Nat y)) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N4 (Nat x), N5 (Nat y)) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N4 (Nat x), N6 (Nat y)) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N4 (Nat x), N7 (Nat y)) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N4 (Nat x), N8 (Nat y)) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N4 (Nat x), N9 (Nat y)) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat x), N5 (Nat y)) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat x), N6 (Nat y)) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat x), N7 (Nat y)) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat x), N8 (Nat y)) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat x), N9 (Nat y)) = N4 (plus (plus (x, y), N1 (D())));
Nat plus (N6 (Nat x), N6 (Nat y)) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N6 (Nat x), N7 (Nat y)) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N6 (Nat x), N8 (Nat y)) = N4 (plus (plus (x, y), N1 (D())));
Nat plus (N6 (Nat x), N9 (Nat y)) = N5 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat x), N7 (Nat y)) = N4 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat x), N8 (Nat y)) = N5 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat x), N9 (Nat y)) = N6 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat x), N8 (Nat y)) = N6 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat x), N9 (Nat y)) = N7 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat x), N9 (Nat y)) = N8 (plus (plus (x, y), N1 (D())));
Nat plus (N1 (Nat y), N0 (Nat x) ) = N1 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat y), N0 (Nat x) ) = N2 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat y), N0 (Nat x) ) = N3 (plus (plus (x, y), N0 (D())));
Nat plus (N4 (Nat y), N0 (Nat x) ) = N4 (plus (plus (x, y), N0 (D())));
Nat plus (N5 (Nat y), N0 (Nat x) ) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N6 (Nat y), N0 (Nat x) ) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N7 (Nat y), N0 (Nat x) ) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N8 (Nat y), N0 (Nat x) ) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N9 (Nat y), N0 (Nat x) ) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N2 (Nat y), N1 (Nat x) ) = N3 (plus (plus (x, y), N0 (D())));
Nat plus (N3 (Nat y), N1 (Nat x) ) = N4 (plus (plus (x, y), N0 (D())));
Nat plus (N4 (Nat y), N1 (Nat x) ) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N5 (Nat y), N1 (Nat x) ) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N6 (Nat y), N1 (Nat x) ) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N7 (Nat y), N1 (Nat x) ) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N8 (Nat y), N1 (Nat x) ) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N9 (Nat y), N1 (Nat x) ) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N3 (Nat y), N2 (Nat x) ) = N5 (plus (plus (x, y), N0 (D())));
Nat plus (N4 (Nat y), N2 (Nat x) ) = N6 (plus (plus (x, y), N0 (D())));
Nat plus (N5 (Nat y), N2 (Nat x) ) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N6 (Nat y), N2 (Nat x) ) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N7 (Nat y), N2 (Nat x) ) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N8 (Nat y), N2 (Nat x) ) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N2 (Nat x) ) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N4 (Nat y), N3 (Nat x) ) = N7 (plus (plus (x, y), N0 (D())));
Nat plus (N5 (Nat y), N3 (Nat x) ) = N8 (plus (plus (x, y), N0 (D())));
Nat plus (N6 (Nat y), N3 (Nat x) ) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N7 (Nat y), N3 (Nat x) ) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat y), N3 (Nat x) ) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N3 (Nat x) ) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N5 (Nat y), N4 (Nat x) ) = N9 (plus (plus (x, y), N0 (D())));
Nat plus (N6 (Nat y), N4 (Nat x) ) = N0 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat y), N4 (Nat x) ) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat y), N4 (Nat x) ) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N4 (Nat x) ) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N6 (Nat y), N5 (Nat x) ) = N1 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat y), N5 (Nat x) ) = N2 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat y), N5 (Nat x) ) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N5 (Nat x) ) = N4 (plus (plus (x, y), N1 (D())));
Nat plus (N7 (Nat y), N6 (Nat x) ) = N3 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat y), N6 (Nat x) ) = N4 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N6 (Nat x) ) = N5 (plus (plus (x, y), N1 (D())));
Nat plus (N8 (Nat y), N7 (Nat x) ) = N5 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N7 (Nat x) ) = N6 (plus (plus (x, y), N1 (D())));
Nat plus (N9 (Nat y), N8 (Nat x) ) = N7 (plus (plus (x, y), N1 (D())));

Nat mult0 (Nat x) = D();

Nat mult1 (Nat x) = x;

Nat mult2 (D()) = D();
Nat mult2 (N0 (Nat x)) = N0 (plus (N0 (D()), mult2 (x)));
Nat mult2 (N1 (Nat x)) = N2 (plus (N0 (D()), mult2 (x)));
Nat mult2 (N2 (Nat x)) = N4 (plus (N0 (D()), mult2 (x)));
Nat mult2 (N3 (Nat x)) = N6 (plus (N0 (D()), mult2 (x)));
Nat mult2 (N4 (Nat x)) = N8 (plus (N0 (D()), mult2 (x)));
Nat mult2 (N5 (Nat x)) = N0 (plus (N1 (D()), mult2 (x)));
Nat mult2 (N6 (Nat x)) = N2 (plus (N1 (D()), mult2 (x)));
Nat mult2 (N7 (Nat x)) = N4 (plus (N1 (D()), mult2 (x)));
Nat mult2 (N8 (Nat x)) = N6 (plus (N1 (D()), mult2 (x)));
Nat mult2 (N9 (Nat x)) = N8 (plus (N1 (D()), mult2 (x)));

Nat mult3 (D()) = D();
Nat mult3 (N0 (Nat x)) = N0 (plus (N0 (D()), mult3 (x)));
Nat mult3 (N1 (Nat x)) = N3 (plus (N0 (D()), mult3 (x)));
Nat mult3 (N2 (Nat x)) = N6 (plus (N0 (D()), mult3 (x)));
Nat mult3 (N3 (Nat x)) = N9 (plus (N0 (D()), mult3 (x)));
Nat mult3 (N4 (Nat x)) = N2 (plus (N1 (D()), mult3 (x)));
Nat mult3 (N5 (Nat x)) = N5 (plus (N1 (D()), mult3 (x)));
Nat mult3 (N6 (Nat x)) = N8 (plus (N1 (D()), mult3 (x)));
Nat mult3 (N7 (Nat x)) = N1 (plus (N2 (D()), mult3 (x)));
Nat mult3 (N8 (Nat x)) = N4 (plus (N2 (D()), mult3 (x)));
Nat mult3 (N9 (Nat x)) = N7 (plus (N2 (D()), mult3 (x)));

Nat mult4 (D()) = D();
Nat mult4 (N0 (Nat x)) = N0 (plus (N0 (D()), mult4 (x)));
Nat mult4 (N1 (Nat x)) = N4 (plus (N0 (D()), mult4 (x)));
Nat mult4 (N2 (Nat x)) = N8 (plus (N0 (D()), mult4 (x)));
Nat mult4 (N3 (Nat x)) = N2 (plus (N1 (D()), mult4 (x)));
Nat mult4 (N4 (Nat x)) = N6 (plus (N1 (D()), mult4 (x)));
Nat mult4 (N5 (Nat x)) = N0 (plus (N2 (D()), mult4 (x)));
Nat mult4 (N6 (Nat x)) = N4 (plus (N2 (D()), mult4 (x)));
Nat mult4 (N7 (Nat x)) = N8 (plus (N2 (D()), mult4 (x)));
Nat mult4 (N8 (Nat x)) = N2 (plus (N3 (D()), mult4 (x)));
Nat mult4 (N9 (Nat x)) = N6 (plus (N3 (D()), mult4 (x)));

Nat mult5 (D()) = D();
Nat mult5 (N0 (Nat x)) = N0 (plus (N0 (D()), mult5 (x)));
Nat mult5 (N1 (Nat x)) = N5 (plus (N0 (D()), mult5 (x)));
Nat mult5 (N2 (Nat x)) = N0 (plus (N1 (D()), mult5 (x)));
Nat mult5 (N3 (Nat x)) = N5 (plus (N1 (D()), mult5 (x)));
Nat mult5 (N4 (Nat x)) = N0 (plus (N2 (D()), mult5 (x)));
Nat mult5 (N5 (Nat x)) = N5 (plus (N2 (D()), mult5 (x)));
Nat mult5 (N6 (Nat x)) = N0 (plus (N3 (D()), mult5 (x)));
Nat mult5 (N7 (Nat x)) = N5 (plus (N3 (D()), mult5 (x)));
Nat mult5 (N8 (Nat x)) = N0 (plus (N4 (D()), mult5 (x)));
Nat mult5 (N9 (Nat x)) = N5 (plus (N4 (D()), mult5 (x)));

Nat mult6 (D()) = D();
Nat mult6 (N0 (Nat x)) = N0 (plus (N0 (D()), mult6 (x)));
Nat mult6 (N1 (Nat x)) = N6 (plus (N0 (D()), mult6 (x)));
Nat mult6 (N2 (Nat x)) = N2 (plus (N1 (D()), mult6 (x)));
Nat mult6 (N3 (Nat x)) = N8 (plus (N1 (D()), mult6 (x)));
Nat mult6 (N4 (Nat x)) = N4 (plus (N2 (D()), mult6 (x)));
Nat mult6 (N5 (Nat x)) = N0 (plus (N3 (D()), mult6 (x)));
Nat mult6 (N6 (Nat x)) = N6 (plus (N3 (D()), mult6 (x)));
Nat mult6 (N7 (Nat x)) = N2 (plus (N4 (D()), mult6 (x)));
Nat mult6 (N8 (Nat x)) = N8 (plus (N4 (D()), mult6 (x)));
Nat mult6 (N9 (Nat x)) = N4 (plus (N5 (D()), mult6 (x)));

Nat mult7 (D()) = D();
Nat mult7 (N0 (Nat x)) = N0 (plus (N0 (D()), mult7 (x)));
Nat mult7 (N1 (Nat x)) = N7 (plus (N0 (D()), mult7 (x)));
Nat mult7 (N2 (Nat x)) = N4 (plus (N1 (D()), mult7 (x)));
Nat mult7 (N3 (Nat x)) = N1 (plus (N2 (D()), mult7 (x)));
Nat mult7 (N4 (Nat x)) = N8 (plus (N2 (D()), mult7 (x)));
Nat mult7 (N5 (Nat x)) = N5 (plus (N3 (D()), mult7 (x)));
Nat mult7 (N6 (Nat x)) = N2 (plus (N4 (D()), mult7 (x)));
Nat mult7 (N7 (Nat x)) = N9 (plus (N4 (D()), mult7 (x)));
Nat mult7 (N8 (Nat x)) = N6 (plus (N5 (D()), mult7 (x)));
Nat mult7 (N9 (Nat x)) = N3 (plus (N6 (D()), mult7 (x)));

Nat mult8 (D()) = D();
Nat mult8 (N0 (Nat x)) = N0 (plus (N0 (D()), mult8 (x)));
Nat mult8 (N1 (Nat x)) = N8 (plus (N0 (D()), mult8 (x)));
Nat mult8 (N2 (Nat x)) = N6 (plus (N1 (D()), mult8 (x)));
Nat mult8 (N3 (Nat x)) = N4 (plus (N2 (D()), mult8 (x)));
Nat mult8 (N4 (Nat x)) = N2 (plus (N3 (D()), mult8 (x)));
Nat mult8 (N5 (Nat x)) = N0 (plus (N4 (D()), mult8 (x)));
Nat mult8 (N6 (Nat x)) = N8 (plus (N4 (D()), mult8 (x)));
Nat mult8 (N7 (Nat x)) = N6 (plus (N5 (D()), mult8 (x)));
Nat mult8 (N8 (Nat x)) = N4 (plus (N6 (D()), mult8 (x)));
Nat mult8 (N9 (Nat x)) = N2 (plus (N7 (D()), mult8 (x)));

Nat mult9 (D()) = D();
Nat mult9 (N0 (Nat x)) = N0 (plus (N0 (D()), mult9 (x)));
Nat mult9 (N1 (Nat x)) = N9 (plus (N0 (D()), mult9 (x)));
Nat mult9 (N2 (Nat x)) = N8 (plus (N1 (D()), mult9 (x)));
Nat mult9 (N3 (Nat x)) = N7 (plus (N2 (D()), mult9 (x)));
Nat mult9 (N4 (Nat x)) = N6 (plus (N3 (D()), mult9 (x)));
Nat mult9 (N5 (Nat x)) = N5 (plus (N4 (D()), mult9 (x)));
Nat mult9 (N6 (Nat x)) = N4 (plus (N5 (D()), mult9 (x)));
Nat mult9 (N7 (Nat x)) = N3 (plus (N6 (D()), mult9 (x)));
Nat mult9 (N8 (Nat x)) = N2 (plus (N7 (D()), mult9 (x)));
Nat mult9 (N9 (Nat x)) = N1 (plus (N8 (D()), mult9 (x)));

Nat times (Nat x, D()) = D();
Nat times (N0 (Nat x), Nat y) = plus (N0 (times (x, y)), mult0 (y));
Nat times (N1 (Nat x), Nat y) = plus (N0 (times (x, y)), mult1 (y));
Nat times (N2 (Nat x), Nat y) = plus (N0 (times (x, y)), mult2 (y));
Nat times (N3 (Nat x), Nat y) = plus (N0 (times (x, y)), mult3 (y));
Nat times (N4 (Nat x), Nat y) = plus (N0 (times (x, y)), mult4 (y));
Nat times (N5 (Nat x), Nat y) = plus (N0 (times (x, y)), mult5 (y));
Nat times (N6 (Nat x), Nat y) = plus (N0 (times (x, y)), mult6 (y));
Nat times (N7 (Nat x), Nat y) = plus (N0 (times (x, y)), mult7 (y));
Nat times (N8 (Nat x), Nat y) = plus (N0 (times (x, y)), mult8 (y));
Nat times (N9 (Nat x), Nat y) = plus (N0 (times (x, y)), mult9 (y));
Nat times (D(), Nat x) = D();

Nat prec (D()) = D();
Nat prec (N0 (Nat x)) = D();
Nat prec (N1 (Nat x)) = N0 (x);
Nat prec (N2 (Nat x)) = N1 (x);
Nat prec (N3 (Nat x)) = N2 (x);
Nat prec (N4 (Nat x)) = N3 (x);
Nat prec (N5 (Nat x)) = N4 (x);
Nat prec (N6 (Nat x)) = N5 (x);
Nat prec (N7 (Nat x)) = N6 (x);
Nat prec (N8 (Nat x)) = N7 (x);
Nat prec (N9 (Nat x)) = N8 (x);

Nat fact (Nat x) { if (x == D()) return N1 (D()); else fail; }
Nat fact (Nat x) { if (x != D()) return times (x, fact (prec (x))); else fail; }

Nat fib (Nat x) { if (x == D()) return N1 (D()); else fail; }
Nat fib (Nat x) { if (x != D() && x == N1 (D())) return N1 (D()); else fail; }
Nat fib (Nat x) { if (x != D() && x != N1 (D())) return plus (fib (prec (x)), fib (prec (prec (x)))); else fail; }

Nat reduce (D()) = D();
Nat reduce (N0 (Nat x)) { if (reduce (x) == D()) return D(); else fail; }
Nat reduce (N0 (Nat x)) { if (reduce (x) != D()) return N0 (reduce (x)); else fail; }
Nat reduce (N1 (Nat x)) = N1 (reduce (x));
Nat reduce (N2 (Nat x)) = N2 (reduce (x));
Nat reduce (N3 (Nat x)) = N3 (reduce (x));
Nat reduce (N4 (Nat x)) = N4 (reduce (x));
Nat reduce (N5 (Nat x)) = N5 (reduce (x));
Nat reduce (N6 (Nat x)) = N6 (reduce (x));
Nat reduce (N7 (Nat x)) = N7 (reduce (x));
Nat reduce (N8 (Nat x)) = N8 (reduce (x));
Nat reduce (N9 (Nat x)) = N9 (reduce (x));

void main([]) { // entry point for the RASCAL interpreter
  main();
}

int main() { // entry point for the RASCAL compiler
  println (reduce (fib (N6 (N1 (D())))));
  println (reduce (fib (N7 (N5 (D())))));
  return 0;
}
