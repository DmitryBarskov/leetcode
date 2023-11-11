// @leetup=custom
// @leetup=info id=981 lang=golang slug=time-based-key-value-store

/*
* Design a time-based key-value data structure that can store multiple values for
* the same key at different time stamps and retrieve the key's value at a certain
* timestamp.
*
* Implement the `TimeMap` class:
*
* * `TimeMap()` Initializes the object of the data structure.
* * `void set(String key, String value, int timestamp)` Stores the key `key` with
*   the value `value` at the given time `timestamp`.
* * `String get(String key, int timestamp)` Returns a value such that `set` was
*   called previously, with `timestamp_prev <= timestamp`. If there are multiple
*   such values, it returns the value associated with the largest
*   `timestamp_prev`. If there are no values, it returns `""`.
*
*
* Example 1:
*
* Input
* ["TimeMap", "set", "get", "get", "set", "get", "get"]
* [[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
* Output
* [null, null, "bar", "bar", null, "bar2", "bar2"]
*
* Explanation
* TimeMap timeMap = new TimeMap();
* timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with
*  timestamp = 1.
* timeMap.get("foo", 1);         // return "bar"
* timeMap.get("foo", 3);         // return "bar", since there is no value correspo
* nding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp
*  1 is "bar".
* timeMap.set("foo", "bar2", 4); // store the key "foo" and value "bar2" along wit
* h timestamp = 4.
* timeMap.get("foo", 4);         // return "bar2"
* timeMap.get("foo", 5);         // return "bar2"
*
*
* Constraints:
*
* * `1 <= key.length, value.length <= 100`
* * `key` and `value` consist of lowercase English letters and digits.
* * `1 <= timestamp <= 10^7`
* * All the timestamps `timestamp` of `set` are strictly increasing.
* * At most `2 * 10^5` calls will be made to `set` and `get`.
*
 */
package main

// @leetup=custom
// @leetup=code
type entry struct {
	value     string
	timestamp int
}

type TimeMap struct {
	store map[string][]entry
}

func Constructor() TimeMap {
	return TimeMap{store: make(map[string][]entry)}
}

func (timeMap *TimeMap) Set(key string, value string, timestamp int) {
	timeMap.store[key] = append(timeMap.store[key], entry{value: value, timestamp: timestamp})
}

func (timeMap *TimeMap) Get(key string, timestamp int) string {
	slice, found := timeMap.store[key]
	if !found {
		return ""
	}
	index := bSearch(slice, func(e entry) bool {
		return e.timestamp >= timestamp
	})

	for i := min(index+1, len(slice)-1); i >= 0; i-- {
		if slice[i].timestamp <= timestamp {
			return slice[i].value
		}
	}
	return ""
}

func bSearch(slice []entry, predicate func(entry) bool) int {
	lo := -1
	hi := len(slice)
	for lo+1 < hi {
		mi := lo + (hi-lo)/2

		if predicate(slice[mi]) {
			hi = mi
		} else {
			lo = mi
		}
	}
	return hi
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * obj := Constructor();
 * obj.Set(key,value,timestamp);
 * param_2 := obj.Get(key,timestamp);
 */
// @leetup=code
