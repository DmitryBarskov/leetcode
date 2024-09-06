import 'dart:collection';

class Solution {
  bool checkInclusion(String s1, String s2) {
    if (s2.length < s1.length) { return false; }

    Map<String, int> diff = HashMap<String, int>();
    for (int i = 0; i < s1.length; i++) {
      diff[s1[i]] = (diff[s1[i]] ?? 0) + 1;
      diff[s2[i]] = (diff[s2[i]] ?? 0) - 1;
      if (diff[s1[i]] == 0) {
        diff.remove(s1[i]);
      }
      if (diff[s2[i]] == 0) {
        diff.remove(s2[i]);
      }
    }

    for (int l = 0, r = s1.length; r < s2.length; l++, r++) {
      if (diff.isEmpty) {
        return true;
      }
      diff[s2[r]] = (diff[s2[r]] ?? 0) - 1;
      diff[s2[l]] = (diff[s2[l]] ?? 0) + 1;
      if (diff[s2[r]] == 0) {
        diff.remove(s2[r]);
      }
      if (diff[s2[l]] == 0) {
        diff.remove(s2[l]);
      }
    }
    return diff.isEmpty;
  }
}