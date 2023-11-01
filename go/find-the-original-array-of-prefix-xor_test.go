package main

import "testing"

func TestFindArray(t *testing.T) {
	expected := []int{13}
	actual := findArray([]int{13})

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}

	expected = []int{5, 7, 2, 3, 2}
	actual = findArray([]int{5, 2, 0, 3, 1})

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}

	expected = []int{1, 3}
	actual = findArray([]int{1, 2})

	if !sliceEqual(expected, actual) {
		t.Errorf("got %v, want %v", actual, expected)
	}
}
