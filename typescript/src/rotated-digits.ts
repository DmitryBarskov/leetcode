function* digits(n: number): Generator<number>  {
  while (n > 0) {
    yield n % 10;
    n = Math.floor(n / 10);
  }
}

function goodNumber(n: number): boolean {
  let hasGoodDigit = false;
  for (const digit of digits(n)) {
    if (digit === 2 || digit === 5 || digit === 6 || digit === 9) {
      hasGoodDigit = true;
    }
    if (digit === 3 || digit === 4 || digit === 7) {
      return false;
    }
  }
  return hasGoodDigit;
}

function rotatedDigits(n: number): number {
  let goodNumbers = 0;
  for (let i = 1; i <= n; i++) {
    if (goodNumber(i)) {
      goodNumbers++;
    }
  }
  return goodNumbers;
}

console.log(rotatedDigits(857)); // should be 247
console.log(rotatedDigits(90)); // should be 34
console.log(rotatedDigits(100)); // should be 40
// for (let i = 90; i <= 100; i++) {
//   console.log(i, goodNumber(i));
// }
