// @leetup=custom
// @leetup=info id=46 lang=javascript slug=permutations

/*
 * Given an array `nums` of distinct integers, return *all the possible
 * permutations*. You can return the answer in any order.
 *
 * Example 1:
 *
 * Input: nums = [1,2,3]
 * Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 *
 * Example 2:
 *
 * Input: nums = [0,1]
 * Output: [[0,1],[1,0]]
 *
 * Example 3:
 *
 * Input: nums = [1]
 * Output: [[1]]
 *
 * Constraints:
 *
 * * `1 <= nums.length <= 6`
 * * `-10 <= nums[i] <= 10`
 * * All the integers of `nums` are unique.
 */
// @leetup=custom
// @leetup=code

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function (nums) {
  if (nums.length === 0) return [];
  if (nums.length === 1) return [nums];

  const [first, ...rest] = nums;
  return permute(rest).flatMap((smallerPermutation) =>
    insert(smallerPermutation, first)
  );
};

function insert(array, item) {
  const insertions = new Array(array.length + 1);
  for (let i = 0; i < insertions.length; i++) {
    insertions[i] = [...array.slice(0, i), item, ...array.slice(i)];
  }
  return insertions;
}
// @leetup=code

import { assertArrayIncludes } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertArrayIncludes(permute([1, 2, 3]), [
    [1, 2, 3],
    [1, 3, 2],
    [2, 1, 3],
    [2, 3, 1],
    [3, 1, 2],
    [3, 2, 1],
  ]);
});

Deno.test("example 2", () => {
  assertArrayIncludes(permute([0, 1]), [[0, 1], [1, 0]]);
});

Deno.test("example 3", () => {
  assertArrayIncludes(permute([1]), [[1]]);
});
