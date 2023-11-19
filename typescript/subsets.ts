// @leetup=custom
// @leetup=info id=78 lang=typescript slug=subsets

/*
 * Given an integer array `nums` of unique elements, return *all possible*
 * *subsets* *(the power set)*.
 *
 * The solution set must not contain duplicate subsets. Return the solution in
 * any order.
 *
 * Example 1:
 *
 * Input: nums = [1,2,3]
 * Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 *
 * Example 2:
 *
 * Input: nums = [0]
 * Output: [[],[0]]
 *
 * Constraints:
 *
 * * `1 <= nums.length <= 10`
 * * `-10 <= nums[i] <= 10`
 * * All the numbers of `nums` are unique.
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(
    subsets([1, 2, 3]),
    [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]],
  );
  assertEquals(
    subsets([0]),
    [[], [0]],
  );
});

// @leetup=custom
// @leetup=code

function subsets(nums: number[]): number[][] {
  const subsetsCount = 1 << nums.length;
  const subs = new Array<Array<number>>(subsetsCount);
  for (let i = 0; i < subsetsCount; i++) {
    subs[i] = new Array<number>();
    for (let bit = 0; bit < nums.length; bit++) {
      if (((i >> bit) & 1) === 0) {
        continue;
      }
      subs[i].push(nums[bit]);
    }
  }
  return subs;
}
// @leetup=code
