extension Lcm on int {
  int lcm(int other) => (this * other) ~/ this.gcd(other);
}

class Solution {
  String largestNumber(List<int> nums) {
    List<String> strings = nums.map((x) => x.toString()).toList();
    strings.sort((a, b) => -compareStrings(a, b));
    return strings.join("").replaceFirst(RegExp(r'^0*(?!$)'), '');
  }

  int compareStrings(String a, String b) {
    int longest = a.length.lcm(b.length);
    for (int i = 0; i < longest; i++) {
      int comparison = a[i % a.length].compareTo(b[i % b.length]);
      if (comparison != 0) {
        return comparison;
      }
    }
    return 0;
  }
}
