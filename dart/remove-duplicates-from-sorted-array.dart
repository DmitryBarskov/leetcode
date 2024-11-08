class Solution {
  int removeDuplicates(List<int> nums) {
    int size = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] == nums[size - 1]) {
        continue;
      }
      nums[size] = nums[i];
      size++;
    }
    return size;
  }
}
