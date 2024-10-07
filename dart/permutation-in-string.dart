import "dart:collection";

class Solution {
  bool checkInclusion(String s1, String s2) {
    var count = countChars(s1);
    int l = 0;
    for (int r = 0; r < s2.length; r++) {
      count.update(s2[r], (c) => c - 1, ifAbsent: () => -1);
      if (count[s2[r]] == 0) {
        count.remove(s2[r]);
      }
      while ((count[s2[r]] ?? 0) < 0) {
        count.update(s2[l], (c) => c + 1, ifAbsent: () => 1);
        if (count[s2[l]] == 0) {
          count.remove(s2[l]);
        }
        l++;
      }

      if (count.isEmpty) {
        return true;
      }
    }
    return count.isEmpty;
  }

  Map<String, int> countChars(String s) {
    var count = Map<String, int>();
    for (int i = 0; i < s.length; i++) {
      count.update(s[i], (c) => c + 1, ifAbsent: () => 1);
    }
    return count;
  }
}

// docker run -it --rm -v /tmp:/tmp dart dart run %
void main() {
  print(Solution().checkInclusion("ab", "eidbaooo"));
  print(Solution().checkInclusion("ab", "eidboaoo"));
}
