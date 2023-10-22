// https://leetcode.com/problems/maximum-69-number/description/

function maximum69Number(num: number): number {
  const digits = digitsFromNumber(num);
  const last6 = findLastIndex(digits, digit => digit === 6);
  return numberFromDigits(digits.map((value, index) => index === last6 ? 9 : value));
}

function findLastIndex<T>(array: T[], predicate: (t: T) => boolean): number {
  for (let i = array.length - 1; i >= 0; i--) {
    if (predicate(array[i])) {
      return i;
    }
  }
  return -1;
}

function numberFromDigits(digits: number[]): number {
  return digits.reduceRight((num, digit) => num * 10 + digit, 0);
}

function digitsFromNumber(num: number): number[] {
  if (num === 0) {
    return [0];
  }

  let remainder = num;
  const digits = new Array<number>();
  while (remainder > 0) {
    digits.push(remainder % 10);
    remainder = Math.floor(remainder / 10);
  }
  return digits;
}

console.log(maximum69Number(9669));
