/**
 * @param {number[]} arr
 * @param {number[][]} mat
 * @return {number}
 */
function firstCompleteIndex(arr, mat) {
    const index = new Array(arr.length + 1);
    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[i].length; j++) {
            index[mat[i][j]] = [i, j];
        }
    }
    const paintedRows = Array.from(mat, () => new Set());
    const paintedCols = Array.from(mat[0], () => new Set());
    for (let i = 0; i < arr.length; i++) {
        let [r, c] = index[arr[i]];
        paintedRows[r].add(c);
        paintedCols[c].add(r);
        if (paintedRows[r].size == mat[0].length ||
                paintedCols[c].size == mat.length) {
            return i;
        }
    }
}
