// @leetup=custom
// @leetup=info id=75 lang=javascript slug=sort-colors

/*
 * Given an array `nums` with `n` objects colored red, white, or blue, sort them
 * [in-place][1] so that objects of the same color are adjacent, with the
 * colors in the order red, white, and blue.
 *
 * We will use the integers `0`, `1`, and `2` to represent the color red, white,
 * and blue, respectively.
 *
 * You must solve this problem without using the library's sort function.
 *
 * Example 1:
 *
 * Input: nums = [2,0,2,1,1,0]
 * Output: [0,0,1,1,2,2]
 *
 * Example 2:
 *
 * Input: nums = [2,0,1]
 * Output: [0,1,2]
 *
 * Constraints:
 *
 * * `n == nums.length`
 * * `1 <= n <= 300`
 * * `nums[i]` is either `0`, `1`, or `2`.
 *
 * Follow up: Could you come up with a one-pass algorithm using only constant
 * extra space?
 *
 * [1]: https://en.wikipedia.org/wiki/In-place_algorithm
 */

import { assertEquals } from "std/assert/mod.ts";

Deno.test("example", () => {
  const input = [2, 0, 2, 1, 1, 0];
  sortColors(input);
  assertEquals(input, [0, 0, 1, 1, 2, 2]);
});

Deno.test("example 2", () => {
  const input = [2, 0, 2, 1, 1, 1, 1];
  sortColors(input);
  assertEquals(input, [0, 1, 1, 1, 1, 2, 2]);
});

Deno.test("failed case", () => {
  const input = [2, 0, 1];
  sortColors(input);
  assertEquals(input, [0, 1, 2]);
});

// @leetup=custom
// @leetup=code

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
function sortColors(nums) {
  let i = 0;
  let j = nums.length - 1;
  while (i < j && nums[i] === 0) {
    i++;
  }
  while (i < j && nums[j] === 2) {
    j--;
  }
  for (let k = i; k <= j;) {
    if (nums[k] === 0) {
      [nums[i], nums[k]] = [nums[k], nums[i]];
      i++;
      k = Math.max(k, i);
    } else if (nums[k] === 2) {
      [nums[j], nums[k]] = [nums[k], nums[j]];
      j--;
    } else {
      k++;
    }
  }
}
// @leetup=code
