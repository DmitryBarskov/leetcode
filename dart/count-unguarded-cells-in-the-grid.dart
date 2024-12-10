class Solution {
  final UNSET = 0;
  final WALL = 1;
  final GUARD = 2;
  final GUARDED_ROW = 4;
  final GUARDED_COL = 8;

  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    final grid = makeGrid(m, n);
    for (final [r, c] in walls) {
      grid[r][c] = WALL;
    }
    for (final [r, c] in guards) {
      grid[r][c] = GUARD;
      cast(grid, r, c);
    }
    print(grid);
    int countUnguarded = 0;
    for (final row in grid) {
      for (final cell in row) {
        if (cell == UNSET) {
          countUnguarded++;
        }
      }
    }
    return countUnguarded;
  }

  List<List<int>> makeGrid(int rows, int columns) {
    return List<List<int>>.generate(
      rows,
      (int _r) => List<int>.generate(columns, (int _c) => UNSET, growable: false),
      growable: false
    );
  }

  void cast(List<List<int>> grid, int row, int col) {
    // cast north
    for (int i = row - 1; i >= 0; i--) {
      if (grid[i][col] == WALL || grid[i][col] == GUARD || (grid[i][col] & GUARDED_COL) != 0) {
        break;
      }
      grid[i][col] |= GUARDED_COL;
    }
    // cast east
    for (int i = col + 1; i < grid[row].length; i++) {
      if (grid[row][i] == WALL || grid[row][i] == GUARD || (grid[row][i] & GUARDED_ROW) != 0) {
        break;
      }
      grid[row][i] |= GUARDED_ROW;
    }
    // cast south
    for (int i = row + 1; i < grid.length; i++) {
      if (grid[i][col] == WALL || grid[i][col] == GUARD || (grid[i][col] & GUARDED_COL) != 0) {
        break;
      }
      grid[i][col] |= GUARDED_COL;
    }
    // cast west
    for (int i = col - 1; i >= 0; i--) {
      if (grid[row][i] == WALL || grid[row][i] == GUARD || (grid[row][i] & GUARDED_ROW) != 0) {
        break;
      }
      grid[row][i] |= GUARDED_ROW;
    }
  }
}