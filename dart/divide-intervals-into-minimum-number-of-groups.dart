import 'dart:math';
import 'package:collection/collection.dart';

class Solution {
  int minGroups(List<List<int>> intervals) {
    intervals.sort((a, b) => a[0].compareTo(b[0]));
    var endings = HeapPriorityQueue<int>();
    int minGroups = 0;
    for (int i = 0; i < intervals.length; i++) {
      while (endings.isNotEmpty && endings.first < intervals[i][0]) {
        endings.removeFirst();
      }
      endings.add(intervals[i][1]);
      minGroups = max(minGroups, endings.length);
    }
    return minGroups;
  }
}