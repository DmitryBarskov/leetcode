from collections import Counter

class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        for occur in Counter(Counter(arr).values()).values():
            if occur != 1:
                return False
        return True
