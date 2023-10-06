function minCost(nums: number[], cost: number[]): number {
  let minCost = -1;

  minimumFinding:
  for (let i = 0; i < nums.length; i++) {
    let totalCost = 0;
    for (let j = 0; j < nums.length; j++) {
      totalCost += cost[j] * Math.abs(nums[j] - nums[i]);
      if (minCost !== -1 && totalCost > minCost) {
        continue minimumFinding;
      }
    }
    if (minCost === -1 || totalCost < minCost) {
      minCost = totalCost;
    }
  }
  return minCost;
};


const nums = new Array(100_000);
const cost = new Array(100_000);

for (let i = 0; i < 100_000; i++) {
  nums[i] = i + 1;
  cost[i] = 100_000;
}

const measure = (func: () => void) => {
  const start = performance.now();

  func();

  const end = performance.now();
  console.log(`Execution time: ${end - start} ms`);
};

measure(() => {
  minCost(nums, cost);
});
