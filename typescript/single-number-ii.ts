// https://leetcode.com/problems/single-number-ii/description/

type TernaryDigit = 0 | 1 | 2;
type TernaryNumber = TernaryDigit[];
const TERNARY_SIZE = 24;

const invert = (num: TernaryNumber): TernaryNumber => {
  return num.map((d: TernaryDigit) => (2 - d) as TernaryDigit);
};

const zero = (length: number = TERNARY_SIZE): TernaryNumber => new Array<TernaryDigit>(length).fill(0);
const one = () => {
  const ternary = zero();
  ternary[0] = 1;
  return ternary;
};

const isZero = (num: TernaryNumber): boolean => num.every((d: TernaryDigit) => d === 0);

const isNegative = (num: TernaryNumber): boolean => num[num.length - 1] === 2;

const plus = (a: TernaryNumber, b: TernaryNumber): TernaryNumber => {
  const result: TernaryDigit[] = zero();

  let overflow: TernaryDigit = 0;
  for (let i = 0; i < result.length; i++) {
    result[i] = ((a[i] ?? 0) + (b[i] ?? 0) + overflow) % 3 as TernaryDigit;
    overflow = Math.floor(((a[i] ?? 0) + (b[i] ?? 0) + overflow) / 3) as TernaryDigit;
  }

  return result;
};

const dec = (num: TernaryNumber): TernaryNumber => plus(num, new Array<TernaryDigit>(TERNARY_SIZE).fill(2));
const inc = (num: TernaryNumber): TernaryNumber => plus(num, one());

const toTernary = (num: number): TernaryNumber => {
  const ternaryRepresentation: TernaryDigit[] = zero();

  let absoluteValue = Math.abs(num);

  for (let i = 0; absoluteValue > 0; i++) {
    ternaryRepresentation[i] = absoluteValue % 3 as TernaryDigit;
    absoluteValue = Math.floor(absoluteValue / 3);
  }

  if (num < 0) {
    return inc(invert(ternaryRepresentation));
  }

  return ternaryRepresentation;
};

const xor = (a: TernaryNumber, b: TernaryNumber): TernaryNumber => {
  const result = new Array<TernaryDigit>(Math.max(a.length, b.length));

  for (let i = 0; i < result.length; i++) {
    result[i] = ((a[i] ?? 0) + (b[i] ?? 0)) % 3 as TernaryDigit;
  }

  return result;
};

const toDecimal = (ter: TernaryNumber): number => {
  if (isNegative(ter)) {
    return -(toDecimal(invert(ter))) - 1;
  }
  return ter.reduce((dec: number, ternaryDigit: TernaryDigit, idx: number) => dec + ternaryDigit * Math.pow(3, idx), 0);
};

export function singleNumber(nums: number[]): number {
  let xorResult = zero();
  for (let i = 0; i < nums.length; i++) {
    xorResult = xor(xorResult, toTernary(nums[i]));
  }
  return toDecimal(xorResult);
}
