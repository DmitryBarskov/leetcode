// @leetup=custom
// @leetup=info id=1743 lang=javascript slug=restore-the-array-from-adjacent-pairs

/*
 * There is an integer array `nums` that consists of `n` unique elements, but
 * you have forgotten it. However, you do remember every pair of adjacent elements
 * in `nums`.
 *
 * You are given a 2D integer array `adjacentPairs` of size `n - 1` where each
 * `adjacentPairs[i] = [ui, vi]` indicates that the elements `ui` and `vi` are
 * adjacent in `nums`.
 *
 * It is guaranteed that every adjacent pair of elements `nums[i]` and `nums[i+1]`
 * will exist in `adjacentPairs`, either as `[nums[i], nums[i+1]]` or `[nums[i+1],
 * nums[i]]`. The pairs can appear in any order.
 *
 * Return *the original array *`nums`*. If there are multiple solutions, return
 * any of them*.
 *
 * Example 1:
 *
 * Input: adjacentPairs = [[2,1],[3,4],[3,2]]
 * Output: [1,2,3,4]
 * Explanation: This array has all its adjacent pairs in adjacentPairs.
 * Notice that adjacentPairs[i] may not be in left-to-right order.
 *
 * Example 2:
 *
 * Input: adjacentPairs = [[4,-2],[1,4],[-3,1]]
 * Output: [-2,4,1,-3]
 * Explanation: There can be negative numbers.
 * Another solution is [-3,1,4,-2], which would also be accepted.
 *
 * Example 3:
 *
 * Input: adjacentPairs = [[100000,-100000]]
 * Output: [100000,-100000]
 *
 * Constraints:
 *
 * * `nums.length == n`
 * * `adjacentPairs.length == n - 1`
 * * `adjacentPairs[i].length == 2`
 * * `2 <= n <= 10^5`
 * * `-10^5 <= nums[i], ui, vi <= 10^5`
 * * There exists some `nums` that has `adjacentPairs` as its pairs.
 */

import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(restoreArray([[2, 1], [3, 4], [3, 2]]), [1, 2, 3, 4]);
  assertEquals(restoreArray([[4, -2], [1, 4], [-3, 1]]), [-2, 4, 1, -3]);
  assertEquals(restoreArray([[100000, -100000]]), [-100000, 100000]);
});

// @leetup=custom
// @leetup=code

/**
 * @param {number[][]} adjacentPairs
 * @return {number[]}
 */
function restoreArray(adjacentPairs) {
  const adjacent = new Map();
  for (let i = 0; i < adjacentPairs.length; i++) {
    let [a, b] = adjacentPairs[i];

    if (!adjacent.has(a)) adjacent.set(a, []);
    adjacent.get(a).push(b);
    if (!adjacent.has(b)) adjacent.set(b, []);
    adjacent.get(b).push(a);
  }

  const firstItem = findSingleValue(adjacent);

  const array = new Array(adjacentPairs.length + 1);
  array[0] = firstItem;
  for (let i = 1; i < array.length; i++) {
    array[i] = adjacent.get(array[i - 1])?.find((x) => x !== array[i - 2]);
  }
  return array;
}

function findSingleValue(map) {
  for (const [k, v] of map) {
    if (v.length === 1) {
      return k;
    }
  }
}
// @leetup=code
