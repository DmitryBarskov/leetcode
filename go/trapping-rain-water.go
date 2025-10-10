func trap(height []int) int {
	highest_on_left := make([]int, len(height))
	for i := 1; i < len(height); i++ {
		if height[i - 1] > highest_on_left[i - 1] {
			highest_on_left[i] = height[i - 1]
		} else {
			highest_on_left[i] = highest_on_left[i - 1]
		}
	}

	highest_on_right := make([]int, len(height))
	for i := len(height) - 2; i >= 0; i-- {
		if height[i + 1] > highest_on_right[i + 1] {
			highest_on_right[i] = height[i + 1]
		} else {
			highest_on_right[i] = highest_on_right[i + 1]
		}
	}

	contained_water := 0
	for i := 0; i < len(height); i++ {
		contained_water += max(
			min(highest_on_right[i], highest_on_left[i]) - height[i],
			0,
		)
	}
	return contained_water
}
