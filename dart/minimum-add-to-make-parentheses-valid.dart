import 'dart:math';

class Solution {
  int minAddToMakeValid(String s) {
    int minAdd = 0;
    int nestedness = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == "(" && nestedness < 0) {
        minAdd += nestedness.abs();
        nestedness = 1;
      } else if (s[i] == "(") {
        nestedness++;
      } else {
        nestedness--;
      }
    }
    return minAdd + nestedness.abs();
  }
}