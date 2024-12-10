import "dart:math";
import "dart:collection";

class Solution {
  int maximumSubarraySum(List<int> nums, int k) {
    var window = HashSet<int>();
    var extraCount = new HashMap<int, int>();
    int sum = 0;
    for (int i = 0; i < k; i++) {
      if (window.contains(nums[i])) {
        extraCount.update(nums[i], (value) => value + 1, ifAbsent: () => 1);
      }
      window.add(nums[i]);
      sum += nums[i];
    }
    int maxSum = 0;
    if (extraCount.isEmpty) {
      maxSum = sum;
    }

    for (int i = k; i < nums.length; i++) {
      if (window.contains(nums[i])) {
        extraCount.update(nums[i], (value) => value + 1, ifAbsent: () => 1);
      }
      window.add(nums[i]);
      sum += nums[i];
      if (extraCount.containsKey(nums[i - k])) {
        extraCount.update(nums[i - k], (value) => value - 1);
        if (extraCount[nums[i - k]] == 0) {
          extraCount.remove(nums[i - k]);
        }
      } else {
        window.remove(nums[i - k]);
      }
      sum -= nums[i - k];
      if (extraCount.isEmpty) {
        maxSum = max(maxSum, sum);
      }
    }
    return maxSum;
  }
}
