// https://leetcode.com/problems/single-number-iii/description/
// TODO:

export function singleNumber3(nums: number[]): number[] {
  let xor = 0;
  let xorn = 0;

  nums.forEach(num => {
    xor ^= num;
    xorn ^= num << 1;
  });

  return [xor, xorn>>1, (xorn>>1) ^ xor];
}

console.log([1,2,1,3,2,5], singleNumber3([1,2,1,3,2,5]).map(x => [x, x.toString(2)]));
console.log([12, 10, 13, 10, 12, 11], singleNumber3([13, 12, 10, 10, 12, 11]).map(x => [x, x.toString(2)]));
console.log([-1,0], singleNumber3([-1,0]).map(x => [x, x.toString(2)]));
console.log([0,1], singleNumber3([0,1]).map(x => [x, x.toString(2)]));
