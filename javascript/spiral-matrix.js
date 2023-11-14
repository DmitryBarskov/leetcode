// @leetup=custom
// @leetup=info id=54 lang=javascript slug=spiral-matrix

/*
 * Given an `m x n` `matrix`, return *all elements of the* `matrix` *in spiral
 * order*.
 *
 * Example 1:
 *
 * Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 * Output: [1,2,3,6,9,8,7,4,5]
 *
 * Example 2:
 *
 * Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 * Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 *
 * Constraints:
 *
 * * `m == matrix.length`
 * * `n == matrix[i].length`
 * * `1 <= m, n <= 10`
 * * `-100 <= matrix[i][j] <= 100`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), [
    1,
    2,
    3,
    6,
    9,
    8,
    7,
    4,
    5,
  ]);
  assertEquals(spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]), [
    1,
    2,
    3,
    4,
    8,
    12,
    11,
    10,
    9,
    5,
    6,
    7,
  ]);
});
// @leetup=custom
// @leetup=code

/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
function spiralOrder(matrix) {
  let upperBound = 0;
  let lowerBound = matrix.length - 1;
  let leftBound = 0;
  let rightBound = matrix[0].length - 1;

  const output = [];
  while (leftBound <= rightBound && upperBound <= lowerBound) {
    for (let i = leftBound; i <= rightBound; i++) {
      output.push(matrix[upperBound][i]);
    }
    upperBound++;
    for (let j = upperBound; j <= lowerBound; j++) {
      output.push(matrix[j][rightBound]);
    }
    rightBound--;
    if (leftBound > rightBound || upperBound > lowerBound) {
      break;
    }
    for (let i = rightBound; i >= leftBound; i--) {
      output.push(matrix[lowerBound][i]);
    }
    lowerBound--;
    for (let j = lowerBound; j >= upperBound; j--) {
      output.push(matrix[j][leftBound]);
    }
    leftBound++;
  }
  return output;
}
// @leetup=code
