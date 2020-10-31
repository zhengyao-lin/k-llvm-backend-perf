import re
import os
import sys

from lark import Lark, Transformer
from rec.ast import RECEnvironment, RECTerm, RECCondition, RECSignature, RECRule, RECVariable
from rec.spec import RECSpec

sys.setrecursionlimit(4096)


class TreeToRECTransformer(Transformer):
    def __init__(self, env):
        self.env = env

    def term(self, arg):
        name, *rest = arg

        signature = self.env.find_cons(name) or self.env.find_op(name)
        if signature is not None:
            return RECTerm(signature, *rest)

        var = self.env.find_var(name)
        if var is not None:
            return var

        raise Exception(f"{name} is not a valid constructor/operator/variable name")
    
    def term_list(self, arg):
        return arg

    def eq(self, arg):
        left, right = arg
        return RECCondition("eq", left, right)

    def neq(self, arg):
        left, right = arg
        return RECCondition("neq", left, right)

    def condition(self, arg):
        return arg

    def conditions(self, arg):
        return arg

    def rule(self, arg):
        left, right, *condition = arg
        return RECRule(left, right, *condition)


class RECSpecParser:
    INCLUDE = r"#include \"(?P<file>.*)\""

    COMMENT = r"%.*"
    
    OUTLINE = r"""\s*REC-SPEC (?P<id>[a-zA-Z0-9]+)[\n\s]*
SORTS[\n\s]*(?P<sorts>(?:.|[\n])*)
CONS[\n\s]*(?P<cons>(?:.|[\n])*)
OPNS[\n\s]*(?P<opns>(?:.|[\n])*)
VARS[\n\s]*(?P<vars>(?:.|[\n])*)
RULES[\n\s]*(?P<rules>(?:.|[\n])*)
EVAL[\n\s]*(?P<eval>(?:.|[\n])*)
END-SPEC[\n\s]*
"""

    IDENTIFIER = r"[a-zA-Z][a-zA-Z0-9_'\"]*"

    SYNTAX = r"""
        %ignore /[ \t\f\r]+/

        IDENTIFIER: /[a-zA-Z][a-zA-Z0-9_'\"]*/

        term_list: [term ((","|";") term)*]

        term: IDENTIFIER
            | IDENTIFIER "(" term_list ")"

        condition: term "-><-" term                  -> eq
                 | term "->/<-" term                 -> neq
        
        conditions: [condition ("and-if" condition)*]

        rule: term "->" term
            | term "->" term "if" conditions
    """

    RULE_PARSER = Lark(SYNTAX, start="rule", parser="lalr")
    TERM_PARSER = Lark(SYNTAX, start="term", parser="lalr")

    def remove_comments(self, src):
        return re.sub(RECSpecParser.COMMENT, "", src)

    def gen_regex_for_sort(self, sorts):
        return "(?:" + "|".join([ re.escape(sort) for sort in sorts ]) + ")"

    def gen_regex_for_signature(self, sorts):
        any_sort = self.gen_regex_for_sort(sorts)
        return r"^(?P<name>" + RECSpecParser.IDENTIFIER + r")\s*:\s*(?P<inputs>(?:\s*" + any_sort + r"(?=\s|->)\s*)*)\s*->\s*(?P<output>" + any_sort + r")$"

    def gen_regex_for_var_decl(self, sorts):
        any_sort = self.gen_regex_for_sort(sorts)
        return r"^(?P<names>(:?\s*" + RECSpecParser.IDENTIFIER + r"(?=\s|:)\s*)+)\s*:\s*(?P<sort>" + any_sort + r")$"

    ################################
    # helper parsers
    ################################
    
    def parse_signatures(self, sorts, src):
        signature_regex = self.gen_regex_for_signature(sorts)
        signatures = {}

        for line in src.split("\n"):
            line = line.strip()
            if line == "": continue
            
            match = re.match(signature_regex, line)
            assert match is not None

            name = match.group("name")
            input_sorts = [ sort.strip() for sort in match.group("inputs").split() ]
            output_sort = match.group("output")

            signatures[name] = RECSignature(name, input_sorts, output_sort)
        
        return signatures

    def parse_vars(self, sorts, src):
        var_decl_regex = self.gen_regex_for_var_decl(sorts)

        var_map = {}

        for line in src.split("\n"):
            line = line.strip()
            if line == "": continue

            match = re.match(var_decl_regex, line)
            assert match is not None

            var_names = [ name.strip() for name in match.group("names").split() ]
            sort = match.group("sort")
            assert sort in sorts

            for var_name in var_names:
                var_map[var_name] = RECVariable(var_name, sort)

        return var_map

    def parse_rules(self, env, src):
        transformer = TreeToRECTransformer(env)
        rules = []

        for line in src.split("\n"):
            line = line.strip()
            if line == "": continue

            tree = RECSpecParser.RULE_PARSER.parse(line)
            rule = transformer.transform(tree)
            rule.type_check()
            rules.append(rule)

        return rules

    def parse_evals(self, env, src):
        transformer = TreeToRECTransformer(env)
        terms = []

        for line in src.split("\n"):
            line = line.strip()
            if line == "": continue

            tree = RECSpecParser.TERM_PARSER.parse(line)
            term = transformer.transform(tree)
            term.type_check()
            terms.append(term)

        return terms

    ################################
    # main parser and loader
    ################################

    def parse(self, src):
        # do some preprocessing and split the source into five sections
        src = self.remove_comments(src)
        outline = re.search(RECSpecParser.OUTLINE, src)

        # get the set of sorts
        sorts = [ sort.strip() for sort in outline.group("sorts").split() ]
        assert len(sorts) > 0
        
        cons_map = self.parse_signatures(sorts, outline.group("cons"))
        opns_map = self.parse_signatures(sorts, outline.group("opns"))
        var_map = self.parse_vars(sorts, outline.group("vars"))

        # print(sorts)
        # print(cons_map)
        # print(opns_map)
        # print(var_map)

        env = RECEnvironment(sorts, cons_map, opns_map, var_map)

        rules = self.parse_rules(env, outline.group("rules"))
        evals = self.parse_evals(env, outline.group("eval"))

        return RECSpec(outline.group("id"), env, rules, evals)

    def load_and_resolve_include(self, path, trace=[]):
        if path in trace:
            raise Exception(f"recursive loading of {path}")

        with open(path) as f:
            src = f.read()
            while True:
                match = re.search(RECSpecParser.INCLUDE, src)
                if match is None:
                    break

                include_file = match.group("file")
                for include_path in [ os.path.dirname(path) ] + self.include_path:
                    complete_path = os.path.join(include_path, include_file)
                    if os.path.isfile(complete_path):
                        include_src = self.load_and_resolve_include(complete_path, trace + [ path ])
                        src = src[:match.start()] + include_src + src[match.end():]
                        break
                else:
                    raise Exception(f"include file {include_file} not found in paths {self.include_path}")

            return src

    # load (including resolving #include directives)
    def load(self, path):
        src = self.load_and_resolve_include(path)
        return self.parse(src)

    def __init__(self, include_path=[]):
        self.include_path = include_path
