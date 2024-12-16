import "package:collection/collection.dart";

class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    PriorityQueue<(int, int)> queue = HeapPriorityQueue<(int, int)>(
      ((int, int) class1, (int, int) class2) =>
        brilliantStudentImpact(class2).compareTo(brilliantStudentImpact(class1))
    );
    for (final clazz in classes) {
      queue.add((clazz[0], clazz[1]));
    }
    for (int i = 0; i < extraStudents; i++) {
      var (pass, total) = queue.removeFirst();
      queue.add((pass + 1, total + 1));
    }
    double sum = 0;
    while (queue.isNotEmpty) {
      var (pass, total) = queue.removeFirst();
      sum += pass.toDouble() / total;
    }
    return sum / classes.length;
  }

  double brilliantStudentImpact((int, int) clazz) {
    var (pass, total) = clazz;
    return (pass + 1.0) / (total + 1) - pass.toDouble() / total;
  }
}
