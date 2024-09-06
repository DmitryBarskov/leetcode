class Solution {
  int trap(List<int> height) {
    // highest point on the left of each point
    // height [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1] ->
    // maxLeft[0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]
    var maxLeft = List<int>.filled(height.length, 0);
    for (int i = 1; i < maxLeft.length; i++) {
      maxLeft[i] = max(maxLeft[i - 1], height[i - 1]);
    }
    var maxRight = List<int>.filled(height.length, 0);
    for (int i = maxRight.length - 2; i >= 0; i--) {
      maxRight[i] = max(maxRight[i + 1], height[i + 1]);
    }

    int trappedWater = 0;
    for (int i = 0; i < height.length; i++) {
      // for each point we find amount of water above it
      trappedWater += max(0, min(maxLeft[i], maxRight[i]) - height[i]);
    }
    return trappedWater;
  }
}
