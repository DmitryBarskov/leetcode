extension BinarySearch<T> on List<T> {
  int binarySearch(Function predicate) {
    int lo = -1;
    int hi = this.length;
    while (lo + 1 < hi) {
      int mi = (lo + hi) ~/ 2;
      if (predicate(this[mi])) {
        hi = mi;
      } else {
        lo = mi;
      }
    }
    return hi;
  }
}

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int row = matrix.binarySearch((row) => row[0] >= target);
    if (row < 0) {
      return false;
    }
    if (row >= matrix.length || matrix[row][0] > target) {
      row -= 1;
    }
    if (row < 0 || row >= matrix.length) {
      return false;
    }
    if (matrix[row][0] == target) {
      return true;
    }
    int column = matrix[row].binarySearch((item) => item >= target);
    if (column < 0 || column >= matrix[row].length) {
      return false;
    }
    return matrix[row][column] == target;
  }
}
