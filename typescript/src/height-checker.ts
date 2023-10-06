// https://leetcode.com/problems/height-checker/

function heightChecker(heights: number[]): number {
  return zip(
    heights,
    [...heights].sort((a, b) => a - b)
  ).reduce((acc, [actual, expected]) => actual === expected ? acc : acc + 1, 0);
}

function zip<T, V>(array1: Array<T>, array2: Array<V>): Array<[T, V]> {
  return array1.map((array1_i, index) => [array1_i, array2[index]]);
}
