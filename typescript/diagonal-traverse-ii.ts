// @leetup=custom
// @leetup=info id=1424 lang=typescript slug=diagonal-traverse-ii
/*
 * Given a 2D integer array `nums`, return *all elements of *`nums`* in diagonal
 * order as shown in the below images*.
 *
 * Example 1:
 * Input: nums = [[1,2,3],[4,5,6],[7,8,9]]
 * Output: [1,4,2,7,5,3,8,6,9]
 *
 * Example 2:
 * Input: nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
 * Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
 *
 * Constraints:
 * * `1 <= nums.length <= 105`
 * * `1 <= nums[i].length <= 105`
 * * `1 <= sum(nums[i].length) <= 105`
 * * `1 <= nums[i][j] <= 105`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(
    findDiagonalOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]),
    [1, 4, 2, 7, 5, 3, 8, 6, 9],
  );
});

Deno.test("example 2", () => {
  assertEquals(
    findDiagonalOrder(
      [[1, 2, 3, 4, 5], [6, 7], [8], [9, 10, 11], [12, 13, 14, 15, 16]],
    ),
    [1, 6, 2, 8, 7, 3, 9, 4, 12, 10, 5, 13, 11, 14, 15, 16],
  );
});

Deno.test("failed", () => {
  assertEquals(
    findDiagonalOrder(
      [[14, 12, 19, 16, 9], [13, 14, 15, 8, 11], [11, 13, 1]],
    ),
    [14, 13, 12, 11, 14, 19, 13, 15, 16, 1, 8, 9, 11],
  );
});

Deno.test("my case", () => {
  assertEquals(
    findDiagonalOrder(
      [[0, 2, 5], [1, 4, 6, 7, 8], [3]],
    ),
    [0, 1, 2, 3, 4, 5, 6, 7, 8],
  );
});
// @leetup=custom
// @leetup=code
function findDiagonalOrder(nums: number[][]): number[] {
  const traverse = new Array<number>();
  let diagonal = 0;
  while (true) {
    let anyInserted = false;
    for (let row = diagonal, col = 0; row >= 0; row--, col++) {
      if (row < nums.length && col < nums[row].length) {
        anyInserted = true;
        traverse.push(nums[row][col]);
      }
    }
    if (!anyInserted) {
      break;
    }
    diagonal++;
  }
  return traverse;
}
// @leetup=code
