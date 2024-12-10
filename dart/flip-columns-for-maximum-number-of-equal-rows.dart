import "dart:math";

class Solution {
  int maxEqualRowsAfterFlips(List<List<int>> matrix) {
    List<List<List<int>>> groups = [];
    for (final row in matrix) {
      List<List<int>>? group = find(groups, (group) => equal(group.first, row));
      if (group == null) {
        groups.add([row]);
      } else {
        group.add(row);
      }
    }
    return groups.fold<int>(1, (acc, group) => max(acc, group.length));
  }

  E? find<E>(List<E> list, bool predicate(E item)) {
    for (final item in list) {
      if (predicate(item)) {
        return item;
      }
    }
    return null;
  }

  bool equal(List<int> l1, List<int> l2) {
    bool inverted = l1[0] != l2[0];
    for (int i = 0; i < l1.length; i++) {
      if (inverted && l1[i] == l2[i]) {
        return false;
      }
      if (!inverted && l1[i] != l2[i]) {

        return false;
      }
    }
    return true;
  }
}