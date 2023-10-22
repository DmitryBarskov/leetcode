// https://leetcode.com/problems/minimum-cost-to-make-array-equal/description/

// TODO:

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
}
