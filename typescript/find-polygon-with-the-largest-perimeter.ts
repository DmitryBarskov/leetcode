function largestPerimeter(nums: number[]): number {
  nums.sort((a, b) => a - b);
  const sum = new Array<number>(nums.length);
  sum[0] = nums[0];
  for (let i = 1; i < sum.length; i++) {
    sum[i] = sum[i - 1] + nums[i];
  }

  let maxPerimeter = -1;

  for (let i = nums.length - 1; i >= 2; i--) {
    if (sum[i - 1] > nums[i]) {
      maxPerimeter = sum[i];
      break;
    }
  }

  return maxPerimeter;
}

import { expect, test } from "bun:test";

test("examples", () => {
  expect(largestPerimeter([5, 5, 5])).toEqual(15);
  expect(largestPerimeter([1,12,1,2,5,50,3])).toEqual(12);
  expect(largestPerimeter([5, 5, 50])).toEqual(-1);
});
