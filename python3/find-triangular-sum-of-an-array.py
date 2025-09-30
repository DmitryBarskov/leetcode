class Solution:
    def triangularSum(self, nums: list[int]) -> int:
        row = [x for x in nums]
        while len(row) > 1:
            for i in range(len(row) - 1):
                row[i] += row[i + 1]
                row[i] %= 10
            row.pop()
        return row[0]

