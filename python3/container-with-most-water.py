class Solution:
    def maxArea(self, height: list[int]) -> int:
        l = 0
        r = len(height) - 1
        most_water = 0
        while l < r:
            water = min(height[l], height[r]) * (r - l)
            most_water = max(most_water, water)
            if height[l] < height[r]:
                l += 1
            else:
                r -= 1
        return most_water
