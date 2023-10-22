package main

func searchRange(nums []int, target int) []int {
	if len(nums) == 0 {
		return []int{-1, -1}
	}
	var firstIndex int = bsearch(nums, func(x int) bool { return x >= target })
	if firstIndex < 0 || firstIndex >= len(nums) || nums[firstIndex] != target {
		return []int{-1, -1}
	}
	return []int{
		firstIndex,
		bsearch(nums, func(x int) bool { return x > target }) - 1,
	}
}

type predicate func(int) bool

func bsearch(nums []int, pr predicate) int {
	var lo = 0
	var hi = len(nums)

	for lo < hi {
		var mi = (lo + hi) / 2

		if pr(nums[mi]) {
			hi = mi
		} else {
			lo = mi + 1
		}
	}

	return lo
}
