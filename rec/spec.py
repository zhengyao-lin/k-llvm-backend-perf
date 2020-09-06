from rec import RECEnvironment


class RECSpec:
    def __init__(self, name, env, rules, evals):
        self.name = name
        self.env = env
        self.rules = rules
        self.evals = evals

    def __str__(self):
        return f"{self.name}: {len(self.env.sorts)} sort(s), {len(self.env.cons_map)} constructor(s), {len(self.env.opns_map)} operator(s), {len(self.rules)} rule(s), {len(self.evals)} eval(s)"
