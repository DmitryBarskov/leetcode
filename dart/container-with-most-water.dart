import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    int l = 0;
    int r = height.length - 1;
    int mostWater = 0;
    while (l < r) {
      int water = (r - l) * min(height[l], height[r]);
      mostWater = max(mostWater, water);
      if (height[l] < height[r]) {
        l++;
      } else {
        r--;
      }
    }
    return mostWater;
  }
}
