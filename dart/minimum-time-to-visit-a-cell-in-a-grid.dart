import "dart:math";
import "package:collection/collection.dart";

class Solution {
  int minimumTime(List<List<int>> grid) {
    if (grid[0][1] > 1 && grid[1][0] > 1) { return -1; }

    final totalRows = grid.length;
    final totalCols = grid[0].length;
    final target = (totalRows - 1, totalCols - 1);

    PriorityQueue<(int, int, int)> queue = HeapPriorityQueue<(int, int, int)>(
      ((int, int, int) timeRowCol1, (int, int, int) timeRowCol2) => timeRowCol1.$1 - timeRowCol2.$1
    );

    Set<(int, int)> visited = Set<(int, int)>();
    queue.add((0, 0, 0));
    while (queue.isNotEmpty) {
      var (time, row, col) = queue.removeFirst();
      if ((row, col) == target) {
        return time;
      }
      if (visited.contains((row, col))) {
        continue;
      }
      visited.add((row, col));
      adjacentCells(row, col, totalRows, totalCols).forEach(((int, int) coords) {
        var (y, x) = coords;
        int waitTime = max(ceilToEven(grid[y][x] - 1 - time), 0);
        queue.add((time + 1 + waitTime, y, x));
      });
    }
    return -1;
  }

  Iterable<(int, int)> adjacentCells(int row, int col, int totalRows, int totalCols) {
    return [(row - 1, col), (row + 1, col), (row, col - 1), (row, col + 1)]
      .where(((int, int) coords) {
        var (y, x) = coords;
        return 0 <= y && y < totalRows && 0 <= x && x < totalCols;
      });
  }

  int ceilToEven(int number) {
    if (number.isEven) {
      return number;
    }
    return number + 1;
  }
}
