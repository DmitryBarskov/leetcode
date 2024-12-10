class Solution {
  List<int> resultsArray(List<int> nums, int k) {
    if (nums.length == 1 || k == 1) { return nums; }

    int consecutiveFrom = 0;
    int r = 1;
    while (r < k - 1) {
      if (nums[r - 1] + 1 != nums[r]) {
        consecutiveFrom = r;
      }
      r++;
    }
    var results = List<int>.filled(nums.length - k + 1, 0);
    for (int l = 0; r < nums.length; l++, r++) {
      if (nums[r - 1] + 1 != nums[r]) {
        consecutiveFrom = r;
      }
      if (consecutiveFrom <= l) {
        results[l] = nums[r];
      } else {
        results[l] = -1;
      }
    }
    return results;
  }
}
