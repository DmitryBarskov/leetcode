import "dart:collection";
import "package:collection/collection.dart";

class Solution {
  int minimumObstacles(List<List<int>> grid) {
    final totalRows = grid.length;
    final totalCols = grid[0].length;
    final target = (totalRows - 1, totalCols - 1);
    PriorityQueue<(int, int, int)> queue = HeapPriorityQueue<(int, int, int)>(
      ((int, int, int) distRowCol1, (int, int, int) distRowCol2) => distRowCol1.$1 - distRowCol2.$1
    );
    Set<(int, int)> visited = Set<(int, int)>();
    queue.add((0, 0, 0));
    while (queue.isNotEmpty) {
      var (dist, row, col) = queue.removeFirst();
      if ((row, col) == target) {
        return dist;
      }
      if (visited.contains((row, col))) {
        continue;
      }
      visited.add((row, col));
      adjacentCells(row, col, totalRows, totalCols).forEach(((int, int) coords) {
        queue.add((dist + grid[coords.$1][coords.$2], coords.$1, coords.$2));
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
}
