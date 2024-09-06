class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    Set<String> chars = <String>{};
    for (int l = 0, r = 0; r < s.length; r++) {
      while (chars.contains(s[r])) {
        chars.remove(s[l]);
        l++;
      }
      chars.add(s[r]);
      maxLength = max(chars.length, maxLength);
    }
    return maxLength;
  }
}