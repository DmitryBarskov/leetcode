import "dart:collection";
import "package:collection/collection.dart";

class Solution {
  int continuousSubarrays(List<int> nums) {
    PriorityQueue<int> mins = HeapPriorityQueue<int>((a, b) => a - b);
    PriorityQueue<int> maxes = HeapPriorityQueue<int>((a, b) => b - a);
    Map<int, int> count = HashMap<int, int>();
    int subarrays = 0;
    for (int l = 0, r = 0; r < nums.length; r++) {
      maxes.add(nums[r]);
      mins.add(nums[r]);
      count.update(nums[r], (v) => v + 1, ifAbsent: () => 1);
      while (maxes.first - mins.first > 2) {
        count[nums[l]] = count[nums[l]]! - 1;
        if (count[nums[l]] == 0) {
          count.remove(nums[l]);
          while (maxes.first == nums[l]) {
            maxes.removeFirst();
          }
          while (mins.first == nums[l]) {
            mins.removeFirst();
          }
        }
        l++;
      }
      subarrays += r - l + 1;
    }
    return subarrays;
  }
}