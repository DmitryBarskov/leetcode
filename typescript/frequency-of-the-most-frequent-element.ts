// @leetup=custom
// @leetup=info id=1838 lang=typescript slug=frequency-of-the-most-frequent-element

/*
 * The frequency of an element is the number of times it occurs in an array.
 *
 * You are given an integer array `nums` and an integer `k`. In one operation, you
 * can choose an index of `nums` and increment the element at that index by `1`.
 *
 * Return *the maximum possible frequency of an element after performing at
 * most *`k`* operations*.
 *
 * Example 1:
 *
 * Input: nums = [1,2,4], k = 5
 * Output: 3
 * Explanation: Increment the first element three times and the second element tw
 * o times to make nums = [4,4,4].
 * 4 has a frequency of 3.
 *
 * Example 2:
 *
 * Input: nums = [1,4,8,13], k = 5
 * Output: 2
 * Explanation: There are multiple optimal solutions:
 * - Increment the first element three times to make nums = [4,4,8,13]. 4 has a fre
 * quency of 2.
 * - Increment the second element four times to make nums = [1,8,8,13]. 8 has a fre
 * quency of 2.
 * - Increment the third element five times to make nums = [1,4,13,13]. 13 has a fr
 * equency of 2.
 *
 * Example 3:
 *
 * Input: nums = [3,9,6], k = 2
 * Output: 1
 *
 * Constraints:
 *
 * * `1 <= nums.length <= 10^5`
 * * `1 <= nums[i] <= 105`
 * * `1 <= k <= 10^5`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(maxFrequency([1, 2, 4], 5), 3);
  assertEquals(maxFrequency([1, 4, 8, 13], 5), 2);
  assertEquals(maxFrequency([3, 9, 6], 2), 1);
});
// @leetup=custom
// @leetup=code
function maxFrequency(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  let operations = 0;
  let maxFreq = 1;
  let j = 0;
  for (let i = 1; i < nums.length; i++) {
    operations += (nums[i] - nums[i - 1]) * (i - j);
    while (j < i && operations > k) {
      operations -= (nums[i] - nums[j]);
      j++;
    }
    const freq  = i - j + 1;
    maxFreq = Math.max(freq, maxFreq);
  }
  return maxFreq;
}
// @leetup=code
