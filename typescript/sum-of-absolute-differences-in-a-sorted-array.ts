// @leetup=custom
// @leetup=info id=1685 lang=typescript slug=sum-of-absolute-differences-in-a-sorted-array

/*
 * You are given an integer array `nums` sorted in non-decreasing order.
 *
 * Build and return *an integer array *`result`* with the same length as *`nums`*
 * such that *`result[i]`* is equal to the summation of absolute differences
 * between *`nums[i]`* and all the other elements in the array.*
 *
 * In other words, `result[i]` is equal to `sum(|nums[i]-nums[j]|)` where `0 <= j <
 * nums.length` and `j != i` (0-indexed).
 *
 * Example 1:
 * Input: nums = [2,3,5]
 * Output: [4,3,5]
 * Explanation: Assuming the arrays are 0-indexed, then
 * result[0] = |2-2| + |2-3| + |2-5| = 0 + 1 + 3 = 4,
 * result[1] = |3-2| + |3-3| + |3-5| = 1 + 0 + 2 = 3,
 * result[2] = |5-2| + |5-3| + |5-5| = 3 + 2 + 0 = 5.
 *
 * Example 2:
 * Input: nums = [1,4,6,8,10]
 * Output: [24,15,13,15,21]
 * result[0] = |1-1| + |1-4| + |1-6| + |1-8| + |1-10|      = 0 + 3 + 5 + 7 + 9 = 24
 * result[1] = |4-1| + |4-4| + |4-6| + |4-8| + |4-10|      = 3 + 0 + 2 + 4 + 6 = 15
 * result[2] = |6-1| + |6-4| + |6-6| + |6-8| + |6-10|      = 5 + 2 + 0 + 2 + 4 = 13
 * result[3] = |8-1| + |8-4| + |8-6| + |8-8| + |8-10|      = 7 + 4 + 2 + 0 + 2 = 15
 * result[4] = |10-1| + |10-4| + |10-6| + |10-8| + |10-10| = 9 + 6 + 4 + 2 + 0 = 21
 *
 * Constraints:
 * * `2 <= nums.length <= 10^5`
 * * `1 <= nums[i] <= nums[i + 1] <= 10^4`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example", () => {
  assertEquals(getSumAbsoluteDifferences([2, 3, 5]), [4, 3, 5]);
});

Deno.test("example 2", () => {
  assertEquals(getSumAbsoluteDifferences([1, 4, 6, 8, 10]), [24, 15, 13, 15, 21]);
});
// @leetup=custom
// @leetup=code
function getSumAbsoluteDifferences(nums: number[]): number[] {
  const differences = new Array<number>(nums.length);
  differences[0] = nums.reduce((acc, item) => acc + Math.abs(nums[0] - item), 0);

  for (let i = 1; i < differences.length; i++) {
    differences[i] = differences[i - 1];
    differences[i] += i * (nums[i] - nums[i - 1]);
    differences[i] -= (nums.length - i) * (nums[i] - nums[i - 1]);
  }

  return differences;
}
// @leetup=code
