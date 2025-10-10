func maxArea(height []int) (most_water int) {
	l := 0
	r := len(height) - 1
	most_water = 0
	for ; l < r; {
		water := min(height[l], height[r]) * (r - l)
		most_water = max(most_water, water)
		if height[l] < height[r] {
			l += 1
		} else {
			r -= 1
		}
	}
	return
}
