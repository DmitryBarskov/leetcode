function oddCells(m: number, n: number, indices: number[][]): number {
  const rowIncrements = new Map<number, number>();
  const colIncrements = new Map<number, number>();

  indices.forEach(([row, col]) => {
    rowIncrements.set(row, (rowIncrements.get(row) ?? 0) + 1);
    colIncrements.set(col, (colIncrements.get(col) ?? 0) + 1);
  });

  let oddRows = 0;
  rowIncrements.forEach((amount, _row) => {
    if (amount % 2 === 1) {
      oddRows += 1;
    }
  });

  let oddCols = 0;
  colIncrements.forEach((amount, _col) => {
    if (amount % 2 === 1) {
      oddCols += 1;
    }
  });

  console.log({ m, n, oddRows, oddCols, rowIncrements, colIncrements });

  return oddRows * n + oddCols * m - 2 * oddRows * oddCols;
}

let result = oddCells(2, 3, [[0,1],[1,1]]);
console.log({ result })
