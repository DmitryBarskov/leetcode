class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        if not str1.startswith(str2) and not str2.startswith(str1):
            return ""
        if str2 == "":
            return str1
        return self.gcdOfStrings(str2, str1.removeprefix(str2))
