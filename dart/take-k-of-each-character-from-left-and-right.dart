import "dart:collection";
import "dart:math";

class Solution {
  int takeCharacters(String s, int k) {
    Map<String, int> chars = { "a": 0, "b": 0, "c": 0 };
    for (int i = 0; i < s.length; i++) {
      chars[s[i]] = chars[s[i]]! + 1;
    }
    if (chars.values.any((value) => value < k)) {
      return -1;
    }

    int minRemoved = s.length;
    int l = 0;
    for (int r = 0; r < s.length; r++) {
      chars[s[r]] = chars[s[r]]! - 1;
      while (chars[s[r]]! < k) {
        chars[s[l]] = chars[s[l]]! + 1;
        l++;
      }
      minRemoved = min(minRemoved, s.length - (r - l + 1));
    }
    return minRemoved;
  }
}
