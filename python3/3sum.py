from collections import defaultdict

class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        positives = defaultdict(int)
        negatives = defaultdict(int)
        zero_count = 0
        for n in nums:
            if n < 0:
                negatives[n] += 1
            elif n > 0:
                positives[n] += 1
            else:
                zero_count += 1
        ans = []
        if zero_count >= 3:
            ans.append([0, 0, 0])
        if zero_count > 0:
            for p in positives:
                if -p in negatives:
                    ans.append([-p, 0, p])
        for p1 in positives:
            for p2 in positives:
                if p1 < p2 or p1 == p2 and positives[p1] <= 1:
                    continue
                if -(p1 + p2) in negatives:
                    ans.append([-(p1 + p2), p1, p2])
        for n1 in negatives:
            for n2 in negatives:
                if n1 < n2 or n1 == n2 and negatives[n1] <= 1:
                    continue
                if -(n1 + n2) in positives:
                    ans.append([n1, n2, -(n1 + n2)])
        return ans
