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
    """

    def calculate(self, s: str) -> int:
        print(s)
        return self.eval_tokens(list(self.parse(s)))

    def eval_tokens(self, tokens) -> int:
        sign_stack = [1, 1]
        result = 0
        print(tokens)
        for i, token in enumerate(tokens):
            if token == '(' and tokens[i + 1] in ('+', '-'):
                sign_stack.append(sign_stack[-1])
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
                sign_stack.pop()
            else:
                raise RuntimeError(f"Unhandled token {token}")
            print(f"[{i}] = {token}, {sign_stack}, {result}")
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


print(Solution().calculate("(1-(4+5-20)+3)-(-2+6+8)"))
