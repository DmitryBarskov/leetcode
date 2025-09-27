import re


class Solution:
    """
    >>> Solution().calculate("(1+(4+5+2)-3)+(6+8)")
    23
    >>> Solution().calculate("-1")
    -1
    >>> Solution().calculate("(-1)")
    -1
    >>> Solution().calculate("-(-1)")
    1
    >>> Solution().calculate("1")
    1
    >>> Solution().calculate("(1)")
    1
    >>> Solution().calculate("(7)-(0)+(4)")
    11
    >>> Solution().calculate("-2 + 1")
    -1
    """

    def calculate(self, s: str) -> int:
        return self.eval_tokens(list(self.parse(s)))

    def eval_tokens(self, tokens) -> int:
        sign_stack = [1]
        result = 0
        for i, token in enumerate(tokens):
            if token == '(' and i > 0 and tokens[i - 1] in ('-', '+'):
                continue
            elif token == '(':
                sign_stack.append(sign_stack[-1])
            elif token == ')':
                sign_stack.pop()
            elif token == '-':
                sign_stack.append(sign_stack[-1] * -1)
            elif token == '+':
                sign_stack.append(sign_stack[-1])
            elif type(token) == int:
                result += token * sign_stack[-1]
                if i > 0 and tokens[i-1] in ('+', '-'):
                    sign_stack.pop()
        return result

    def parse(self, text: str):
        tokens = []
        for t in re.compile(r'\s+|\b|(?=\()|(?<=\()|(?<=\))').split(text):
            if t == ' ' or t == '':
                continue

            if t in '()-+':
                yield t
            else:
                yield int(t)
