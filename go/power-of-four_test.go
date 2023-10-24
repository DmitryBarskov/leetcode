package main

import "testing"

func TestIsPowerOfFour(t *testing.T) {
	var cases = []struct {
		n        int
		expected bool
	}{
		{n: 16, expected: true},
		{n: 5, expected: false},
		{n: 1, expected: true},
		{n: 1 << 32, expected: true},
	}
	for _, testCase := range cases {
		actual := isPowerOfFour(testCase.n)
		if actual != testCase.expected {
			t.Errorf("got %v, want %v", actual, testCase.expected)
		}
	}
}
