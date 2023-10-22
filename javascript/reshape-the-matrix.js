//https://leetcode.com/problems/reshape-the-matrix/
/**
 * @param {number[][]} mat
 * @param {number} r
 * @param {number} c
 * @return {number[][]}
 */
var matrixReshape = function(mat, rows, cols) {
  if (mat.length * mat[0].length !== rows * cols) {
    return mat;
  }

  let reshaped = new Array(rows);
  for (let r = 0; r < rows; r++) {
    reshaped[r] = new Array(cols);

    for (let c = 0; c < cols; c++) {
      let order = r * cols + c;
      let oldRow = Math.floor(order / mat[0].length);
      let oldCol = order % mat[0].length;
      try {
        reshaped[r][c] = mat[oldRow][oldCol];
      } catch (err) {
        console.log({ r, c, order, oldRow, oldCol });
        throw err;
      }
    }
  }

  return reshaped;
};

console.log(
  matrixReshape([[1,2],[3,4]], 1, 4)
)
