import "dart:collection";

typedef Board = (List<int>, int);

class Solution {
  int slidingPuzzle(List<List<int>> board) {
    Board initialState = (flatten(board), findZero(board));
    bool found = false;
    int minSteps = 0;
    bfs<Board>(initialState, (Board b) => moveZero(b), (Board b, int steps) {
      if (b.$2 == 5 && listsEqual([1, 2, 3, 4, 5, 0], b.$1)) {
        minSteps = steps;
        found = true;
      }
      return steps <= 21 && !found;
    }, (Board b) => numberFromDigits(b.$1));
    if (!found) {
      return -1;
    }
    return minSteps;
  }

  E? bfs<E>(E initialState, List<E> nextStates(E previousState), bool callback(E state, int steps), int calculateHash(E state)) {
    Queue<(E, int)> queue = Queue<(E, int)>();
    queue.addLast((initialState, 0));
    Set<int> visited = Set<int>();
    while (queue.isNotEmpty) {
      var (currentState, steps) = queue.removeFirst();
      int hash = calculateHash(currentState);
      if (visited.contains(hash)) {
        continue;
      }
      visited.add(hash);
      bool shouldContinue = callback(currentState, steps);
      if (!shouldContinue) {
        break;
      }
      nextStates(currentState).forEach((nextState) {
        queue.addLast((nextState, steps + 1));
      });
    }
  }

  int findZero(List<List<int>> board) {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == 0) {
          return i * board[0].length + j;
        }
      }
    }
    return -1;
  }

  List<int> flatten(List<List<int>> board) {
    return [
      board[0][0], board[0][1], board[0][2],
      board[1][0], board[1][1], board[1][2]
    ];
  }

  List<Board> moveZero(Board board) {
    var (array, zeroPosition) = board;
    int row = (zeroPosition / 3).floor();
    int col = zeroPosition % 3;
    return [(-1, 0), (0, -1), (1, 0), (0, 1)]
        .map(((int, int) d) => (row + d.$1, col + d.$2))
        .where(((int, int) p) => 0 <= p.$1 && p.$1 < 2 && 0 <= p.$2 && p.$2 < 3)
        .map(((int, int) p) => (swap(array, zeroPosition, p.$1 * 3 + p.$2), p.$1 * 3 + p.$2))
        .toList();
  }

  List<int> swap(List<int> array, int from, int to) {
    List<int> clone = List<int>.from(array);
    clone[from] = array[to];
    clone[to] = array[from];
    return clone;
  }

  bool listsEqual<E>(List<E> l1, List<E> l2) {
    if (l1.length != l2.length) {
      return false;
    }
    for (int i = 0; i < l1.length; i++) {
      if (l1[i] != l2[i]) {
        return false;
      }
    }
    return true;
  }

  int numberFromDigits(List<int> array) {
    int number = 0;
    for (int i = 0; i < array.length; i++) {
      number *= 10;
      number += array[i];
    }
    return number;
  }
}