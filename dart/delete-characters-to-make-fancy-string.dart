class Solution {
  String makeFancyString(String s) {
    if (s.length < 2) {
      return s;
    }
    List<String> fancy = [s[0], s[1]];
    for (int i = 2; i < s.length; i++) {
      if (fancy[fancy.length - 1] == s[i] && fancy[fancy.length - 2] == s[i]) {
        continue;
      }
      fancy.add(s[i]);
    }
    return fancy.join();
  }
}