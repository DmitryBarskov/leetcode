package main

func findArray(pref []int) []int {
	original := make([]int, 0, len(pref))
	xor := 0
	for i := 0; i < len(pref); i++ {
		original = append(original, xor^pref[i])
		xor = xor ^ original[len(original)-1]
	}
	return original
}
