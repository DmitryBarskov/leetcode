import 'package:collection/collection.dart';

class Solution {
  int maxKelements(List<int> nums, int k) {
    var heap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));
    heap.addAll(nums);
    int score = 0;
    for (int i = 0; i < k; i++) {
      int number = heap.removeFirst();
      score += number;
      heap.add((number / 3.0).ceil());
    }
    return score;
  }
}