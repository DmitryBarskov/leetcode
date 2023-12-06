// @leetup=custom
// @leetup=info id=1727 lang=typescript slug=largest-submatrix-with-rearrangements

/*
 * You are given a binary matrix `matrix` of size `m x n`, and you are allowed to
 * rearrange the columns of the `matrix` in any order.
 *
 * Return *the area of the largest submatrix within *`matrix`* where every
 * element of the submatrix is *`1`* after reordering the columns optimally.*
 *
 * Example 1:
 * https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40536-pm.png
 * Input: matrix = [[0,0,1],[1,1,1],[1,0,1]]
 * Output: 4
 * Explanation: You can rearrange the columns as shown above.
 * The largest submatrix of 1s, in bold, has an area of 4.
 *
 * Example 2:
 * https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40852-pm.png
 * Input: matrix = [[1,0,1,0,1]]
 * Output: 3
 * Explanation: You can rearrange the columns as shown above.
 * The largest submatrix of 1s, in bold, has an area of 3.
 *
 * Example 3:
 *
 * Input: matrix = [[1,1,0],[1,0,1]]
 * Output: 2
 * Explanation: Notice that you must rearrange entire columns, and there is no
 * way to make a submatrix of 1s larger than an area of 2.
 *
 * Constraints:
 *
 * * `m == matrix.length`
 * * `n == matrix[i].length`
 * * `1 <= m * n <= 10^5`
 * * `matrix[i][j]` is either `0` or `1`.
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(
    largestSubmatrix(
      [
        [0, 0, 1],
        [1, 1, 1],
        [1, 0, 1],
      ],
    ),
    4,
  );
});

Deno.test("example 2", () => {
  assertEquals(largestSubmatrix([[1, 0, 1, 0, 1]]), 3);
});

Deno.test("example 3", () => {
  assertEquals(largestSubmatrix([[1, 1, 0], [1, 0, 1]]), 2);
});
// @leetup=custom
// @leetup=code

function largestSubmatrix(matrix: number[][]): number {
  const ones = new Array<Array<number>>(matrix.length);
  for (let r = 0; r < ones.length; r++) {
    ones[r] = new Array<number>(matrix[r].length);
  }

  for (let r = 0; r < ones.length; r++) {
    for (let c = 0; c < ones[r].length; c++) {
      ones[r][c] = matrix[r][c] === 1 ? (ones[r - 1]?.[c] ?? 0) + 1 : 0;
    }
  }

  let maxArea = 0;
  for (let r = 0; r < ones.length; r++) {
    ones[r].sort((a, b) => b - a);
    for (let c = 0; c < ones[r].length; c++) {
      maxArea = Math.max(maxArea, ones[r][c] * (c + 1));
    }
  }
  return maxArea;
}

// @leetup=code
