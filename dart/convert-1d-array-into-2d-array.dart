class Solution {
  List<List<int>> construct2DArray(List<int> original, int m, int n) {
    if (m * n != original.length) {
        return [];
    }
    int k = 0;
    var array = List<List<int>>.filled(m, []);
    for (int i = 0; i < m; i++) {
      array[i] = List<int>.filled(n, 0);
      for (int j = 0; j < n; j++) {
        array[i][j] = original[k];
        k++;
      }
    }
    return array;
  }
}
