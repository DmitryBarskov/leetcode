// https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/description/

function average(salary: number[]): number {
  const { sum, min, max } = salary.reduce(
    ({ sum, min, max}, s) => ({
      sum: sum + s,
      min: Math.min(min, s),
      max: Math.max(max, s)
    }),
    { sum: 0, min: 100_001, max: 999 }
  );

  return (sum - min - max) / (salary.length - 2);
}
