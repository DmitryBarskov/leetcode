function uniquePaths(m: number, n: number): number {
  if (m <= 0 || n <= 0) {
    return 0;
  }
  if (m === 1 || n === 1) {
    return 1;
  }
  if (m === 2) {
    return n;
  }
  if (n === 2) {
    return m;
  }
  let paths = new Array<Array<number>>(m);
  for (let i = 0; i < m; i++) {
    paths[i] = new Array<number>(n);
    paths[i][0] = 1;
  }
  paths[0].fill(1);
  for (let i = 1; i < m; i++) {
    for (let j = 1; j < n; j++) {
      paths[i][j] = paths[i][j-1]+paths[i-1][j];
    }
  }
  return paths[m-1][n-1];
}

let mn = new Array<Array<number>>(10);
for (let m = 0; m < mn.length; m++) {
  mn[m] = new Array<number>(10);
  for (let n = 0; n < mn[m].length; n++) {
    mn[m][n] = uniquePaths(m, n);
  }
}

console.log(mn.map(x => x.toString()));

// 0: 0
// 1: i > 0 ? 1 : 0
// 2: i
// 3: i * (i + 1) / 2
// 4: 

const T = (k: number, n: number): number => C(k, n + k - 1);
const C = (k: number, n: number): number => fact(n) / (fact(k) * fact(n - k));
const fact = (n: number, acc: number = 1): number => n < 2 ? acc : fact(n - 1, acc * n);

for (let m = 0; m < mn.length; m++) {
  mn[m] = new Array<number>(10);
  for (let n = 0; n < mn[m].length; n++) {
    mn[m][n] = T(m, n);
  }
}

console.log(mn.map(x => x.toString()));

