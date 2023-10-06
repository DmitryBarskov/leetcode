// https://leetcode.com/problems/k-radius-subarray-averages
function getAverages(nums: number[], k: number): number[] {
  let averages: Array<number> = new Array(nums.length);

  if (2 * k + 1 > nums.length) {
    return averages.fill(-1);
  }

  for (let i = 0; i < k; i++) {
    averages[i] = -1;
    averages[averages.length - 1 - i] = -1;
  }

  let windowSize = 2 * k + 1;
  let windowSum = 0;
  for (let i = 0; i < windowSize; i++) {
    windowSum += nums[i];
  }

  let lastWindowIndex = nums.length - k - 1;
  for (let i = k; i <= lastWindowIndex; i++) {
    averages[i] = Math.floor(windowSum / windowSize);
    windowSum = windowSum - nums[i - k] + nums[i + k + 1];
  }

  return averages;
};

console.log({
  result: getAverages(
    [7,4,3,9,1,8,5,2,6],
    3
  )
});
