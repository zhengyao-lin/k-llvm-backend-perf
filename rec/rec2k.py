"""
module <id>-SYNTAX

syntax SORT1
syntax SORT2
...

syntax SORT1 ::= <cons/op>(SORT2, SORT2, SORT1, ...) [function]

...

endmodule

module <id>

configuration <k> $PGM:K </k>

rule <term> => <term>
  requires <conditions>

...

endmodule
"""

from io import TextIOBase

from spec import RECSpec
from rec import RECTerm, RECVariable

class RECToKTranspiler:
    EVAL_LIST_PRELUDE = """\
syntax KItem
syntax EvalItem ::= eval(KItem)
syntax EvalList ::= List{EvalItem, ""}
"""

    def encode_ident(self, ident):
        return ident.replace("'", "_prime_").replace("\"", "_second_")

    def wrap_sort_name(self, sort):
        return "REC" + self.encode_ident(sort).replace("_", "")

    def wrap_function_name(self, name):
        return "rec" + self.encode_ident(name).replace("_", "")

    def wrap_variable_name(self, name):
        return "REC_V_" + self.encode_ident(name)

    def write_signature(self, out, signature, is_function=False):
        args = ", ".join([ self.wrap_sort_name(sort) for sort in signature.input_sorts ])
        out.write(f"syntax {self.wrap_sort_name(signature.output_sort)} ::= {self.wrap_function_name(signature.name)}({args})")
        if is_function:
            out.write(" [function]\n")
        else:
            out.write("\n")

    def write_term(self, out, term):
        if isinstance(term, RECTerm):
            out.write(f"{self.wrap_function_name(term.signature.name)}(")
            for i, arg in enumerate(term.arguments):
                if i != 0: out.write(", ")
                self.write_term(out, arg)
            out.write(")")
        elif isinstance(term, RECVariable):
            out.write(f"{self.wrap_variable_name(term.symbol)}:{self.wrap_sort_name(term.sort)}")
        else:
            raise Exception(f"cannot transpile {term}")

    def write_condition(self, out, condition):
        assert condition.predicate in [ "eq", "neq" ]
        self.write_term(out, condition.left)
        if condition.predicate == "eq":
            out.write(" ==K ")
        elif condition.predicate == "neq":
            out.write(" =/=K ")
        self.write_term(out, condition.right)

    def write_rule(self, out, rule):
        out.write("rule ")
        self.write_term(out, rule.left)
        out.write(" => ")
        self.write_term(out, rule.right)
        out.write("\n")

        if len(rule.conditions):
            for i, condition in enumerate(rule.conditions):
                if i == 0:
                    out.write("  requires ")
                else:
                    out.write("   andBool ")
                self.write_condition(out, condition)
                out.write("\n")

    def transpile(self, out: TextIOBase, spec: RECSpec):
        # define syntax module
        out.write(f"module {spec.name.upper()}-SYNTAX\n\n")

        for sort in spec.env.sorts:
            out.write(f"syntax {self.wrap_sort_name(sort)}\n")

        out.write(f"\n")

        for cons_name in spec.env.cons_map:
            signature = spec.env.cons_map[cons_name]
            self.write_signature(out, signature, False)

        for op_name in spec.env.opns_map:
            signature = spec.env.opns_map[op_name]
            self.write_signature(out, signature, True)

        out.write(f"\nendmodule\n\n")

        # define main module
        out.write(f"module {spec.name.upper()}\n")

        out.write(f"imports K-EQUAL\n")
        out.write(f"imports {spec.name.upper()}-SYNTAX\n\n")

        for rule in spec.rules:
            self.write_rule(out, rule)

        # write terms to evaluate in a EvalList

        out.write("\n")
        out.write(f"syntax KItem ::= then(KItem, KItem)\n")

        out.write("configuration <k>\n")
        for i, term in enumerate(spec.evals):
            if i < len(spec.evals) - 1:
                out.write("  then(")
            else:
                out.write("       ")

            self.write_term(out, term)
    
            if i < len(spec.evals) - 1:
                out.write(",\n")
            else:
                out.write("\n")

        out.write("  " + ")" * (len(spec.evals) - 1) + "\n")
        out.write("</k>\n")

        out.write(f"\nendmodule\n\n")
