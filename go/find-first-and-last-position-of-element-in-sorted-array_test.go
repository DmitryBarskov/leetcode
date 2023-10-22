package main

import (
	"testing"
)

type testResult struct {
	expected []int
	actual   []int
}

func TestSearchRange(t *testing.T) {
	var results = []testResult{
		{expected: []int{3, 4}, actual: searchRange([]int{5, 7, 7, 8, 8, 10}, 8)},
		{expected: []int{-1, -1}, actual: searchRange([]int{5, 7, 7, 8, 8, 10}, 6)},
		{expected: []int{-1, -1}, actual: searchRange([]int{}, 6)},
	}
	for _, result := range results {
		if result.expected[0] != result.actual[0] || result.expected[1] != result.actual[1] {
			t.Errorf("got %q, want %q", result.actual, result.expected)
		}
	}
}
