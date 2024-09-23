class Solution {
  List<int> rowAndMaximumOnes(List<List<int>> mat) {
    int maxOnes = -1;
    int maxOnesRow = -1;
    for (int r = 0; r < mat.length; r++) {
      int ones = 0;
      for (int c = 0; c < mat[r].length; c++) {
        if (mat[r][c] == 1) {
          ones++;
        }
      }
      if (ones > maxOnes) {
        maxOnesRow = r;
        maxOnes = ones;
      }
    }
    return [maxOnesRow, maxOnes];
  }
}