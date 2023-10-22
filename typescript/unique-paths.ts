// https://leetcode.com/problems/unique-paths/

const fact = memoize((n: number): number => n < 2 ? 1 : n * fact(n - 1));
const ckn = (k: number, n: number): number => fact(n) / (fact(k) * fact(n - k));
const tkn = (k: number, n: number): number => ckn(k, n + k - 1);

function memoize(f: (x: number) => number): (x: number) => number {
  const memo = [
                   1,                  1,
                   2,                  6,
                  24,                120,
                 720,               5040,
               40320,             362880,
             3628800,           39916800,
           479001600,         6227020800,
         87178291200,      1307674368000,
      20922789888000,    355687428096000,
    6402373705728000,
  ];
  return (x: number): number => {
    if (memo[x] != null) {
      return memo[x];
    } else {
      memo[x] = f(x);
      return memo[x];
    }
  };
}

function uniquePaths(m: number, n: number): number {
  return tkn(n - 1, m);
}
