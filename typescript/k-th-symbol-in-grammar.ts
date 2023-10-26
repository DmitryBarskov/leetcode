// https://leetcode.com/problems/k-th-symbol-in-grammar

// ind12345678901234567890
// 1: 0
// 2: 01
// 3: 0110
// 4: 01101001
// 5: 0110100110010110
function kthGrammar(n: number, k: number): number {
  if (n <= 1) {
    return 0;
  }
  const previousRowBit = kthGrammar(n - 1, Math.ceil(k / 2));

  if (previousRowBit === 0) {
    return [0, 1][(k-1) % 2];
  } else {
    return [1, 0][(k-1) % 2];
  }
}

for (let n = 1; n <= 5; n++) {
  const row = [];
  for (let k = 1; k <= 1<<(n-1); k++) {
    row.push(kthGrammar(n, k));
  }
  console.log(row.join(''));
}
