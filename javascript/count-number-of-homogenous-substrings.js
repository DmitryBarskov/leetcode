// @leetup=custom
// @leetup=info id=1759 lang=javascript slug=count-number-of-homogenous-substrings

/*
* Given a string `s`, return *the number of homogenous substrings of *`s`*.*
* Since the answer may be too large, return it modulo `10^9 + 7`.
* 
* A string is homogenous if all the characters of the string are the same.
* 
* A substring is a contiguous sequence of characters within a string.
* 
* 
* Example 1:
* 
* Input: s = "abbcccaa"
* Output: 13
* Explanation: The homogenous substrings are listed as below:
* "a"   appears 3 times.
* "aa"  appears 1 time.
* "b"   appears 2 times.
* "bb"  appears 1 time.
* "c"   appears 3 times.
* "cc"  appears 2 times.
* "ccc" appears 1 time.
* 3 + 1 + 2 + 1 + 3 + 2 + 1 = 13.
* 
* Example 2:
* 
* Input: s = "xy"
* Output: 2
* Explanation: The homogenous substrings are "x" and "y".
* 
* Example 3:
* 
* Input: s = "zzzzz"
* Output: 15
* 
* 
* Constraints:
* 
* * `1 <= s.length <= 10^5`
* * `s` consists of lowercase letters.
*/

import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(countHomogenous("abbcccaa"), 13);
  assertEquals(countHomogenous("xy"), 2);
  assertEquals(countHomogenous("zzzzz"), 15);
});

Deno.test("largest", () => {
  const str = "a".repeat(1e5);
  assertEquals(countHomogenous(str), 49965.0);
});
// @leetup=custom
// @leetup=code
const MOD = 1_000_000_007;

/**
 * @param {string} s
 * @return {number}
 */
function countHomogenous(s) {
  const countInCluster = (size) => (1 + clusterSize) / 2 * clusterSize % MOD;

  let homogenousSubstrings = 0;
  let clusterSize = 1;
  for (let i = 1; i < s.length; i++) {
    if (s[i] === s[i - 1]) {
      clusterSize++;
    } else {
      homogenousSubstrings = (homogenousSubstrings + countInCluster(clusterSize)) % MOD;
      clusterSize = 1;
    }
  }
  homogenousSubstrings = (homogenousSubstrings + countInCluster(clusterSize)) % MOD;
  return homogenousSubstrings;
}

// @leetup=code
