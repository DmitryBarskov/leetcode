class Solution {
  String reverseOnlyLetters(String s) {
    var reversed = StringBuffer();
    int j = s.length - 1;
    for (int i = 0; i < s.length; i++) {
      if (isLetter(s.codeUnitAt(i))) {
        while (!isLetter(s.codeUnitAt(j))) {
          j--;
        }
        reversed.write(s[j]);
        j--;
      } else {
        reversed.write(s[i]);
      }
    }
    return reversed.toString();
  }

  final a = 97;
  final z = 122;
  final A = 65;
  final Z = 90;

  bool isLetter(int char) {
    return a <= char && char <= z || A <= char && char <= Z;
  }
}
