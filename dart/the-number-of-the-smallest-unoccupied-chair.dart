import 'package:collection/collection.dart';

class Solution {
  int smallestChair(List<List<int>> times, int targetFriend) {
    int targetArrival = times[targetFriend][0];
    times.sort((t1, t2) => t1[0].compareTo(t2[0]));

    // pairs (leaveTime, chair)
    var nextToLeave = HeapPriorityQueue<(int, int)>(
      (f1, f2) => f1.$1.compareTo(f2.$1)
    );
    var freeChairs = HeapPriorityQueue<int>((c1, c2) => c1.compareTo(c2));

    for (int i = 0; i < times.length && times[i][0] <= targetArrival; i++) {
      freeChairs.add(i);
      while (nextToLeave.isNotEmpty && nextToLeave.first.$1 <= times[i][0]) {
        var left = nextToLeave.removeFirst();
        freeChairs.add(left.$2);
      }
      int nextChair = freeChairs.removeFirst();
      if (times[i][0] == targetArrival) {
        return nextChair;
      }
      nextToLeave.add((times[i][1], nextChair));
    }
    return -1;
  }
}
