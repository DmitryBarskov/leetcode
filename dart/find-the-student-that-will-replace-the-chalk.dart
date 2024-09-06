class Solution {
  int chalkReplacer(List<int> chalk, int k) {
    k %= chalk.reduce((acc, c) => acc + c);
    for (int i = 0; i < chalk.length; i++) {
      if (k < chalk[i]) {
        return i;
      } else {
        k -= chalk[i];
      }
    }
    return -1;
  }
}
