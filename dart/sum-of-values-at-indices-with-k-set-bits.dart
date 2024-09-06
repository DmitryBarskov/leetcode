class Solution {
  int sumIndicesWithKSetBits(List<int> nums, int k) {
    int sum = 0;
    for (int i = 0; i < nums.length; i++) {
      if (oneBits(i) == k) {
        sum += nums[i];
      }
    }
    return sum;
  }

  int oneBits(int number) {
    int bits = 0;
    while (number > 0) {
      bits += number & 1;
      number >>= 1;
    }
    return bits;
  }
}
