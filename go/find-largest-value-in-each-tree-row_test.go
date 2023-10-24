package main

import "testing"

func sliceEqual(a, b []int) bool {
	if len(a) != len(b) {
		return false
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

func TestLargestValue(t *testing.T) {
	expected := []int{}
	actual := largestValues(nil)

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}

	expected = []int{1, 3, 9}
	actual = largestValues(&TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val:   3,
			Left:  &TreeNode{Val: 5},
			Right: &TreeNode{Val: 3},
		},
		Right: &TreeNode{
			Val:   2,
			Right: &TreeNode{Val: 9},
		},
	})

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}

	expected = []int{1, 3}
	actual = largestValues(&TreeNode{
		Val:   1,
		Left:  &TreeNode{Val: 2},
		Right: &TreeNode{Val: 3},
	})

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}
}
