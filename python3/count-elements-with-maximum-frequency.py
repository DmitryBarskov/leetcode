class Solution:
    def maxFrequencyElements(self, nums: list[int]) -> int:
        freq = {}
        for num in nums:
            if num not in freq:
                freq[num] = 0
            freq[num] += 1
        max_freq = 0
        total_elements = 0
        for count in freq.values():
            if count > max_freq:
                max_freq = count
                total_elements = count
            elif count == max_freq:
                total_elements += count
        return total_elements
