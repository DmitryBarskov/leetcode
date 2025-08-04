class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        without_outer: list[str] = []
        depth: int = 0
        for p in s:
            if p == '(':
                depth += 1
            else:
                depth -= 1
            if depth == 1 and p == '(' or depth == 0 and p == ')':
                continue
            without_outer.append(p)
        return ''.join(without_outer)
