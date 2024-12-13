import "dart:math";

class Solution {
  int maximumBeauty(List<int> nums, int k) {
    nums.sort();
    int maximumBeauty = 1;
    int l = 0;
    for (int r = 0; r < nums.length; r++) {
        while (l < r && nums[r] - nums[l] > 2 * k) {
            l++;
        }
        maximumBeauty = max(maximumBeauty, r - l + 1);
    }
    return maximumBeauty;
  }
}
