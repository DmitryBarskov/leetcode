import 'dart:math';

class Solution {
  final Map<String, int> index = const {'a': 0, 'e': 1, 'i': 2, 'o': 3, 'u': 4};

  int findTheLongestSubstring(String s) {
    List<int> prefix = List<int>.filled(s.length + 1, 0);
    for (int i = 0; i < s.length; i++) {
      prefix[i + 1] = prefix[i];
      if (!index.containsKey(s[i])) {
        continue;
      }
      prefix[i + 1] ^= 1 << index[s[i]]!;
    }
    List<int> minPrefix = List<int>.filled(32, -1);
    int maxLength = 0;
    for (int i = 0; i < prefix.length; i++) {
      if (minPrefix[prefix[i]] == -1) {
        minPrefix[prefix[i]] = i;
      } else {
        maxLength = max(maxLength, i - minPrefix[prefix[i]]);
      }
    }
    return maxLength;
  }
}

void main() {
  print(Solution().findTheLongestSubstring("eleetminicoworoep"));
  print("Must be 13");
}
