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

Deno.test("example 1", () => {
  assertEquals(canPartition([1, 5, 11, 5]), true);
});

Deno.test("example 2", () => {
  assertEquals(canPartition([1, 2, 3, 5]), false);
});

Deno.test("my example", () => {
  assertEquals(canPartition([1, 2, 3, 6]), true);
});

Deno.test("my negative example", () => {
  assertEquals(canPartition([1, 2, 3, 8]), false);
});

Deno.test("failed case", () => {
  assertEquals(canPartition([3,3,3,4,5]), true);
});

Deno.test("tle", () => {
  assertEquals(
    canPartition(
      [
        4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,12,12,12,12,12,12,12,12,16,16,16,16,16,16,16,16,20,20,20,20,20,20,20,20,24,24,24,24,24,24,24,24,28,28,28,28,28,28,28,28,32,32,32,32,32,32,32,32,36,36,36,36,36,36,36,36,40,40,40,40,40,40,40,40,44,44,44,44,44,44,44,44,48,48,48,48,48,48,48,48,52,52,52,52,52,52,52,52,56,56,56,56,56,56,56,56,60,60,60,60,60,60,60,60,64,64,64,64,64,64,64,64,68,68,68,68,68,68,68,68,72,72,72,72,72,72,72,72,76,76,76,76,76,76,76,76,80,80,80,80,80,80,80,80,84,84,84,84,84,84,84,84,88,88,88,88,88,88,88,88,92,92,92,92,92,92,92,92,96,96,96,96,96,96,96,96,97,99
      ]
    ),
    false
  );
});
// @leetup=custom
// @leetup=code

function canPartition(nums: number[]): boolean {
  const sum = nums.reduce((a, b) => a + b, 0);
  if (sum % 2 !== 0) {
    return false;
  }
  const target = Math.trunc(sum / 2);
  let dpPreviousRow = new Array<number>(target + 1).fill(0);

  for (let i = 0; i < nums.length; i++) {
    const dp = new Array<number>(target + 1).fill(0);
    for (let sum = 0; sum <= target; sum++) {
      if (sum - nums[i] === 0) {
        dp[sum] = 1;
      } else if (dpPreviousRow[sum] === 1) {
        dp[sum] = 1;
      } else if (dpPreviousRow[sum - nums[i]] === 1) {
        dp[sum] = 1;
      }
    }
    dpPreviousRow = dp;
  }

  if (dpPreviousRow[target] === 1) {
    return true;
  }


  return false;
  // nums = 1,2,3,8, sum=14
  // target=7,  0, 1, 2, 3, 4, 5, 6, 7
  // [0]: 1     0  1  0  0  0  0  0  0
  // [1]: 2     0  0  1  1  0  0  0  0
  // [2]: 3     0  0  0  1  1  1  1  0
  // [3]: 8     0  0  0  0  0  0  0  0

  // nums = 1, 5, 5, 11, sum=22, target=11
  //         0 1 2 3 4 5 6 7 8 9 10 11
  // [0]: 1  0 1 0 0 0 0 0 0 0 0  0  0
  // [1]: 5  0 0 0 0 0 1 1 0 0 0  0  0
  // [2]: 5  0 0 0 0 0 1 1 0 0 0  1  1
  // [3]: 11 0 0 0 0 0 0 0 0 0 0  0  1
  // order changed
  // [3]: 11 0 0 0 0 0 0 0 0 0 0  0  1
  // [2]: 5  0 0 0 0 0 1 0 0 0 0  0  0
  // [1]: 5  0 0 0 0 0 1 0 0 0 0  1  0
  // [0]: 1  0 0 0 0 0 0 0 0 0 0  0  1

  // nums = [3,3,3,4,5], sum = 18, target = 9
  //        0 1 2 3 4 5 6 7 8 9
  // [0]: 3 0 0 0 1 0 0 0 0 0 0
  // [1]: 3 0 0 0 1 0 0 1 0 0 0
  // [2]: 3 0 0 0 1 0 0 1 0 0 1
  // [3]: 4 0 0 0 1 1 0 1 1 0 1
  // [4]: 5 0 0 0 1 1 1 1 1 1 1
}
// @leetup=code
