class Solution:
    def reformat(self, s: str) -> str:
        letters = []
        digits = []
        for c in s:
            if "0" <= c <= "9":
                digits.append(c)
            else:
                letters.append(c)
        if abs(len(letters) - len(digits)) > 1:
            return ""
        ans = []
        if len(digits) > len(letters):
            ans.append(digits.pop())
        while len(letters) > 0:
            ans.append(letters.pop())
            if len(digits) > 0:
                ans.append(digits.pop())
        return "".join(ans)
