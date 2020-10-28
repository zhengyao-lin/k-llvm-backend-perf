class RECEnvironment:
    def __init__(self, sorts, cons_map, opns_map, var_map):
        self.sorts = sorts
        self.cons_map = cons_map
        self.opns_map = opns_map
        self.var_map = var_map

    def find_cons(self, name):
        return self.cons_map.get(name)

    def find_op(self, name):
        return self.opns_map.get(name)

    def find_var(self, name):
        return self.var_map.get(name)


class RECAST:
    def __repr__(self):
        return str(self)


class RECSignature(RECAST):
    def __init__(self, name, input_sorts, output_sort):
        self.name = name
        self.input_sorts = input_sorts
        self.output_sort = output_sort
    
    def __str__(self):
        inputs = " ".join(self.input_sorts + [""])
        return f"{self.name}: {inputs}-> {self.output_sort}"


class RECVariable(RECAST):
    def __init__(self, symbol, sort):
        self.symbol = symbol
        self.sort = sort

    def __str__(self):
        return f"{self.symbol}:{self.sort}"

    def type_check(self):
        return self.sort

    def get_ops(self):
        return set()


class RECTerm(RECAST):
    def __init__(self, signature, arguments=[]):
        self.signature = signature
        self.arguments = arguments

    def __str__(self):
        args = ", ".join([ str(arg) for arg in self.arguments ])
        return f"{self.signature.name}({args})"

    def type_check(self):
        sorts = [ arg.type_check() for arg in self.arguments ]
        if sorts != self.signature.input_sorts:
            raise Exception(f"{self}: unmatched input sorts: {sorts} given to function {self.signature}")
        return self.signature.output_sort

    def get_ops(self):
        symbols = {self.signature.name}
        for arg in self.arguments:
            symbols = symbols.union(arg.get_ops())
        return symbols


class RECCondition(RECAST):
    def __init__(self, predicate, left, right):
        self.predicate = predicate
        self.left = left
        self.right = right

    def __str__(self):
        return f"{self.left} {self.predicate} {self.right}"

    def type_check(self):
        left_sort = self.left.type_check()
        right_sort = self.right.type_check()
        if left_sort != right_sort:
            raise Exception(f"{self}: sort of LHS does not match the sort of RHS ({left_sort} vs {right_sort})")

    def get_ops(self):
        return self.left.get_ops().union(self.right.get_ops())


class RECRule(RECAST):
    def __init__(self, left, right, conditions=[]):
        self.left = left
        self.right = right
        self.conditions = conditions

    def __str__(self):
        if len(self.conditions) == 0:
            return f"{self.left} -> {self.right}"
        else:
            conds = " and ".join([ str(cond) for cond in self.conditions ])
            return f"{self.left} -> {self.right} if {conds}"

    def type_check(self):
        left_sort = self.left.type_check()
        right_sort = self.right.type_check()
        if left_sort != right_sort:
            raise Exception(f"{self}: sort of LHS does not match the sort of RHS ({left_sort} vs {right_sort})")
