import re
import functools


def minus(*args):
    if len(args) == 1:
        return -args[0]
    else:
        return functools.reduce(lambda acc, x: acc - x, args)


def plus(*args):
    return functools.reduce(lambda acc, x: acc + x, args, 0)


class Solution:
    """
    >>> Solution().calculate("(1+(4+5+2)-3)+(6+8)")
    23
    """

    operations = { '-': minus, '+': plus }

    def calculate(self, s: str) -> int:
        tree, _ = self.build_expression_tree(self.parse(s), 0)
        return self.eval_tree(tree)

    def eval_tree(self, tree):
        if type(tree) == int:
            return tree
        (operation, operands) = tree
        return operation(*map(self.eval_tree, operands))

    def build_expression_tree(self, tokens: list, start_from: int) -> list:
        i = start_from
        tree = (self.operations['+'], [])
        while i < len(tokens):
            if tokens[i] == '(':
                sub_tree, i = self.build_expression_tree(tokens, i + 1)
                tree[1].append(sub_tree)
            elif tokens[i] == ')':
                return (tree, i + 1)
            elif type(tokens[i]) == int:
                tree[1].append(tokens[i])
            elif type(tokens[i]) == tuple and tokens[i][0] == 'op':
                tree = (tokens[i][1], [tree])
            else:
                raise RuntimeError(f"Unhandled type {tokens[i]}")
            i += 1

        return (tree, i)


    def parse(self, text: str) -> list:
        tokens = []
        for t in re.compile(r'\s+|\b|(?=\()|(?<=\))').split(text):
            if t == ' ' or t == '':
                continue
            elif t in '()':
                tokens.append(t)
            elif t in self.operations:
                tokens.append(('op', self.operations[t]))
            else:
                tokens.append(int(t))
        return tokens


print(Solution().calculate("-1 + (2 - (3 + 1))"))
