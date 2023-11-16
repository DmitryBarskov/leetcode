// @leetup=custom
// @leetup=info id=11 lang=typescript slug=container-with-most-water

/*
 * You are given an integer array `height` of length `n`. There are `n` vertical
 * lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i,
 * height[i])`.
 *
 * Find two lines that together with the x-axis form a container, such that the
 * container contains the most water.
 *
 * Return *the maximum amount of water a container can store*.
 *
 * Notice that you may not slant the container.
 *
 * Example 1:
 * https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg
 * Input: height = [1,8,6,2,5,4,8,3,7]
 * Output: 49
 * Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,
 * 8,3,7]. In this case, the max area of water (blue section) the container can con
 * tain is 49.
 *
 * Example 2:
 *
 * Input: height = [1,1]
 * Output: 1
 *
 * Constraints:
 *
 * * `n == height.length`
 * * `2 <= n <= 105`
 * * `0 <= height[i] <= 104`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49);
  assertEquals(maxArea([1, 1]), 1);
});

Deno.test("My examples", () => {
  assertEquals(maxArea([8, 6, 2, 5, 4]), 16);
  assertEquals(maxArea([8, 6, 2, 5, 3]), 15);
});
// @leetup=custom
// @leetup=code
function maxArea(height: number[]): number {
  let lo = 0;
  let hi = height.length - 1;
  let max = 0;
  while (lo < hi) {
    let area = (hi - lo) * Math.min(height[lo], height[hi]);
    if (max < area) {
      max = area;
    }
    if (height[lo] < height[hi]) {
      lo++;
    } else {
      hi--;
    }
  }
  return max;
}
// @leetup=code
