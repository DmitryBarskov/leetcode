package main

import "testing"

func TestMyAtoi(t *testing.T) {
	var cases = []struct {
		s        string
		expected int
	}{
		{"42", 42},
		{"   -42", -42},
		{"4193 with words", 4193},
		{"-2147483648", -2147483648},
		{"-2147483649", -2147483648},
		{"2147483647", 2147483647},
		{"2147483648", 2147483647},
		{"0", 0},
		{"+0", 0},
		{"-0", 0},
		{"+42", 42},
		{"123", 123},
		{"0032", 32},
		{"words and 987", 0},
		{"-91283472332", -2147483648},
	}
	for _, testCase := range cases {
		actual := myAtoi(testCase.s)
		if actual != testCase.expected {
			t.Errorf("got %v, want %v", actual, testCase.expected)
		}
	}
}
