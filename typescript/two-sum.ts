// https://leetcode.com/problems/two-sum/

function twoSum(nums: number[], target: number): [number, number] {
  const met = new Map<number, number>();
  for (let i = 0; i < nums.length; i++) {
    const element = nums[i];
    const complement = target - element;
    if (met.has(complement)) {
      return [i, met.get(complement)!];
    } else {
      met.set(element, i);
    }
  }
  return [-1, -1];
}

import { assertArrayIncludes } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertArrayIncludes(twoSum([2, 7, 11, 15], 9), [0, 1]);
  assertArrayIncludes(twoSum([3, 2, 4], 6), [1, 2]);
  assertArrayIncludes(twoSum([3, 3], 6), [0, 1]);
});
