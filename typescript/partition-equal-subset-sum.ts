// @leetup=custom
// @leetup=info id=416 lang=typescript slug=partition-equal-subset-sum

/*
 * Given an integer array `nums`, return `true` *if you can partition the array
 * into two subsets such that the sum of the elements in both subsets is equal or
 * *`false`* otherwise*.
 *
 * Example 1:
 *
 * Input: nums = [1,5,11,5]
 * Output: true
 * Explanation: The array can be partitioned as [1, 5, 5] and [11].
 *
 * Example 2:
 *
 * Input: nums = [1,2,3,5]
 * Output: false
 * Explanation: The array cannot be partitioned into equal sum subsets.
 *
 * Constraints:
 *
 * * `1 <= nums.length <= 200`
 * * `1 <= nums[i] <= 100`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(canPartition([1, 5, 11, 5]), true);
  assertEquals(canPartition([1, 2, 3, 5]), false);
});
// @leetup=custom
// @leetup=code

function canPartition(nums: number[]): boolean {
  const sum = nums.reduce((a, b) => a + b, 0);
  if (sum % 2 !== 0) {
    return false;
  }
  const target = Math.trunc(sum / 2);
  const dp = new Array<Array<number>>(nums.length);

  // nums = 1,2,3,8, sum=14
  // target=7,  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
  //            0
  // [0]: 1      1  0  0
  // [1]: 2      1  1  0
  // [2]: 3      1  1  0
  // [3]: 8      1  0  0
}
// @leetup=code
