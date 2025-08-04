class Solution:
    def countLargestGroup(self, n: int) -> int:
        group_sizes = {}
        max_group_size = 0
        for i in range(1, n + 1):
            digits_sum = self.sum_of_digits(i)
            if digits_sum not in group_sizes:
                group_sizes[digits_sum] = 0
            group_sizes[digits_sum] += 1
            if group_sizes[digits_sum] > max_group_size:
                max_group_size = group_sizes[digits_sum]
        largest_groups = 0
        for group_size in group_sizes.values():
            if group_size == max_group_size:
                largest_groups += 1
        return largest_groups
    
    def sum_of_digits(self, number: int) -> int:
        i = number
        digits_sum = 0
        while i > 0:
            digits_sum += i % 10
            i //= 10
        return digits_sum
