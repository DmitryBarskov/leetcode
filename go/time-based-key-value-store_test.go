package main

import "testing"

func TestTimeMap(t *testing.T) {
	tm := Constructor()
	tm.Set("foo", "bar", 1)

	if actual := tm.Get("foo", 1); actual != "bar" {
		t.Errorf("%v.Get(foo, 1) expected to eq bar, got '%v'\n", tm, actual)
	}
	if actual := tm.Get("foo", 3); actual != "bar" {
		t.Errorf("%v.Get(foo, 3) expected to eq bar, got '%v'\n", tm, actual)
	}

	tm.Set("foo", "bar2", 4)
	if actual := tm.Get("foo", 4); actual != "bar2" {
		t.Errorf("%v.Get(foo, 4) expected to eq bar2, got '%v'\n", tm, actual)
	}
	if actual := tm.Get("foo", 5); actual != "bar2" {
		t.Errorf("%v.Get(foo, 5) expected to eq bar2, got '%v'\n", tm, actual)
	}

	// ["TimeMap","set","set","get","get","get","get","get"]
	// [[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]

	tm = Constructor()
	tm.Set("love", "high", 10)
	tm.Set("love", "low", 20)
	// map love =>
	//  high 10
	//  /     \
	// nil   low 20
	if actual := tm.Get("love", 5); actual != "" {
		t.Errorf("%v.Get(love, 5) expected to eq '', got '%v'\n", tm, actual)
	}
	if actual := tm.Get("love", 10); actual != "high" {
		t.Errorf("%v.Get(love, 10) expected to eq high, got '%v'\n", tm, actual)
	}
	if actual := tm.Get("love", 15); actual != "high" {
		t.Errorf("%v.Get(love, 15) expected to eq low, got '%v'\n", tm, actual)
	}
	if actual := tm.Get("love", 20); actual != "low" {
		t.Errorf("%v.Get(love, 20) expected to eq low, got '%v'\n", tm, actual)
	}
	if actual := tm.Get("love", 25); actual != "low" {
		t.Errorf("%v.Get(love, 25) expected to eq 'low', got '%v'\n", tm, actual)
	}
}
