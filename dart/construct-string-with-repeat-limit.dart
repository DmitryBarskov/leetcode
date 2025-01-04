import "package:collection/collection.dart";
import "dart:collection";

class Solution {
  String repeatLimitedString(String s, int repeatLimit) {
    var greatest = PriorityQueue<String>( (s1, s2) => s2.compareTo(s1) );
    var count = HashMap<String, int>();
    for (int i = 0; i < s.length; i++) {
      if (count.containsKey(s[i])) {
        count.update(s[i], (v) => v + 1);
      } else {
        greatest.add(s[i]);
        count[s[i]] = 1;
      }
    }

    final buffer = StringBuffer();
    int repetitions = 0;
    while (greatest.isNotEmpty) {
      if (repetitions >= repeatLimit) {
        String onHold = greatest.removeFirst();
        if (greatest.isEmpty) {
          break;
        }
        buffer.write(greatest.first);
        count.update(greatest.first, (v) => v - 1);
        if (count[greatest.first]! <= 0) {
          greatest.removeFirst();
        }
        greatest.add(onHold);
        repetitions = 0;
      }
      buffer.write(greatest.first);
      count.update(greatest.first, (v) => v - 1);
      if (count[greatest.first]! <= 0) {
        greatest.removeFirst();
        repetitions = 0;
      } else {
        repetitions++;
      }
    }
    return buffer.toString();
  }
}
