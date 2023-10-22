// https://www.codewars.com/kata/52a382ee44408cea2500074c

function slice(m: number[][], row: number, col: number): number[][] {
  let sliced = new Array<Array<number>>(m.length - 1);
  for (let i1 = 0, i2 = 0; i1 < m.length; i1++) {
    if (i1 === row) {
      continue;
    }
    sliced[i2] = new Array<number>(m[i1].length - 1);
    for (let j1 = 0, j2 = 0; j1 < m[i1].length; j1++) {
      if (j1 === col) {
        continue;
      }
      sliced[i2][j2] = m[i1][j1];
      j2++;
    }
    i2++;
  }
  return sliced;
}

const sign = (columnNumber: number) => columnNumber % 2 === 0 ? 1 : -1

const sum = (a: number, b: number) => a + b;

export function determinant(m: number[][]): number {
  if (m.length === 1) {
    return m[0][0];
  }
  return m[0].map((x, i) => x * determinant(slice(m, 0, i)) * sign(i)).reduce(sum);
}
const m2 = [[2, 5, 3], [1, -2, -1], [1, 3, 4]];

console.log(slice(m2, 0, 0))
