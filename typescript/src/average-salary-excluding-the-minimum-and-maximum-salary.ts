function average(salary: number[]): number {
  let { sum, min, max } = salary.reduce(
    ({ sum, min, max}, s) => ({
      sum: sum + s,
      min: Math.min(min, s),
      max: Math.max(max, s)
    }),
    { sum: 0, min: 100_001, max: 999 }
  );

  return (sum - min - max) / (salary.length - 2);
}

console.log(average([4000,3000,1000,2000]));
