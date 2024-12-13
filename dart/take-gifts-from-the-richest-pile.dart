import "dart:math";
import "package:collection/collection.dart";

class Solution {
  int pickGifts(List<int> gifts, int k) {
    var q = HeapPriorityQueue<int>((a, b) => b - a);
    q.addAll(gifts);
    for (int i = 0; i < k; i++) {
      int largest = q.removeFirst();
      q.add(sqrt(largest).floor());
    }
    return q.unorderedElements.fold<int>(0, (acc, x) => acc + x);
  }
}
