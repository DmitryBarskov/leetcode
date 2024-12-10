class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int shortest = nums.length + 1;
    int sum = 0;
    for (int l = 0, r = 0; r < nums.length; r++) {
      sum += nums[r];
      while (sum >= target) {
        shortest = min(r - l + 1, shortest);
        sum -= nums[l];
        l++;
      }
    }
    if (shortest == nums.length + 1) {
      return 0;
    }
    return shortest;
  }
}