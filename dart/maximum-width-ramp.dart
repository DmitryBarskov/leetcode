import 'dart:math';

class Solution {
  int maxWidthRamp(List<int> nums) {
    List<int> maxOnRight = List<int>.filled(nums.length, 0);
    maxOnRight.last = nums.last;
    for (int i = nums.length - 2; i >= 0; i--) {
      maxOnRight[i] = max(nums[i], maxOnRight[i + 1]);
    }
    print(maxOnRight);

    int longestRamp = -1;
    int l = 0;
    for (int r = 0; r < nums.length; r++) {
      while (maxOnRight[r] < nums[l]) {
        l++;
      }
      longestRamp = max(longestRamp, r - l);
    }
    if (longestRamp == -1) {
      return 0;
    }
    return longestRamp;
  }
}