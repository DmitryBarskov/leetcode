// @leetup=custom
// @leetup=info id=79 lang=java slug=word-search

/*
* Given an `m x n` grid of characters `board` and a string `word`, return `true`
* *if* `word` *exists in the grid*.
* 
* The word can be constructed from letters of sequentially adjacent cells, where
* adjacent cells are horizontally or vertically neighboring. The same letter cell
* may not be used more than once.
* 
* 
* Example 1:
* 
* Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word
*  = "ABCCED"
* Output: true
* 
* Example 2:
* 
* Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word
*  = "SEE"
* Output: true
* 
* Example 3:
* 
* Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word
*  = "ABCB"
* Output: false
* 
* 
* Constraints:
* 
* * `m == board.length`
* * `n = board[i].length`
* * `1 <= m, n <= 6`
* * `1 <= word.length <= 15`
* * `board` and `word` consists of only lowercase and uppercase English letters.
* 
* 
* Follow up: Could you use search pruning to make your solution faster with a
* larger `board`?
* 
*/
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        System.out.println(
            new Solution().exist(
                new char[][] {
                    {'A','B','C','E'},
                    {'S','F','C','S'},
                    {'A','D','E','E'}
                },
                "ABCCED"
            )
        );
        System.out.println(
            new Solution().exist(
                new char[][] {
                    {'A','B','C','E'},
                    {'S','F','C','S'},
                    {'A','D','E','E'}
                },
                "SEE"
            )
        );
        System.out.println(
            new Solution().exist(
                new char[][] {
                    {'A','B','C','E'},
                    {'S','F','C','S'},
                    {'A','D','E','E'}
                },
                "ABCB"
            )
        );
        System.out.println(
            new Solution().exist(
                new char[][] {
                    {'A','A','A','A','A','A'},
                    {'A','A','A','A','A','A'},
                    {'A','A','A','A','A','A'},
                    {'A','A','A','A','A','A'},
                    {'A','A','A','A','A','A'},
                    {'A','A','A','A','A','A'}
                },
                "AAAAAAAAAAAAAAa"
            )
        );
        System.out.println(
            new Solution().exist(
                new char[][] {
                    {'A','B','C','E'},
                    {'S','F','E','S'},
                    {'A','D','E','E'}
                },
                "ABCESEEEFS"
            )
        );
    }
}
// @leetup=custom
// @leetup=code
class Solution {
    public static boolean exist(char[][] board, String word) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                if (existInPosition(board, i, j, word, 0)) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean existInPosition(
            char[][] board, int row, int col,
            String word, int strIndex
    ) {
        if (strIndex >= word.length()) {
            return true;
        }
        if (row < 0 || row >= board.length) {
            return false;
        }
        if (col < 0 || col >= board[row].length) {
            return false;
        }
        if (board[row][col] != word.charAt(strIndex)) {
            return false;
        }
        char visited = board[row][col];
        board[row][col] = '.';
        var result = 
            existInPosition(board, row + 1, col, word, strIndex + 1) ||
            existInPosition(board, row - 1, col, word, strIndex + 1) ||
            existInPosition(board, row, col + 1, word, strIndex + 1) ||
            existInPosition(board, row, col - 1, word, strIndex + 1);
        board[row][col] = visited;
        return result;
    }
}
// @leetup=code
