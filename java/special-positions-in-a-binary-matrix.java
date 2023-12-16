// @leetup=custom
// @leetup=info id=1582 lang=java slug=special-positions-in-a-binary-matrix

/*
* Given an `m x n` binary matrix `mat`, return *the number of special positions in
* *`mat`*.*
* 
* A position `(i, j)` is called special if `mat[i][j] == 1` and all other
* elements in row `i` and column `j` are `0` (rows and columns are 0-indexed).
* 
* 
* Example 1:
* 
* Input: mat = [[1,0,0],[0,0,1],[1,0,0]]
* Output: 1
* Explanation: (1, 2) is a special position because mat[1][2] == 1 and all oth
* er elements in row 1 and column 2 are 0.
* 
* Example 2:
* 
* Input: mat = [[1,0,0],[0,1,0],[0,0,1]]
* Output: 3
* Explanation: (0, 0), (1, 1) and (2, 2) are special positions.
* 
* 
* Constraints:
* 
* * `m == mat.length`
* * `n == mat[i].length`
* * `1 <= m, n <= 100`
* * `mat[i][j]` is either `0` or `1`.
* 
*/
import java.util.HashSet;

public class Main {
    public static void main(String[] args) {
        int[][] mat = new int[][] {
            new int[]{1, 0, 0},
            new int[]{0, 0, 1},
            new int[]{1, 0, 0}
        };
        System.out.println(new Solution().numSpecial(mat));
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public static int numSpecial(int[][] mat) {
        int[] rowCount = new int[mat.length];
        int[] colCount = new int[mat[0].length];
        for (int i = 0; i < mat.length; i++) {
            for (int j = 0; j < mat[i].length; j++) {
                if (mat[i][j] == 1) {
                    rowCount[i]++;
                    colCount[j]++;
                }
            }
        }
        int specialCount = 0;
        for (int i = 0; i < mat.length; i++) {
            for (int j = 0; j < mat[i].length; j++) {
                if (mat[i][j] == 1 && rowCount[i] == 1 && colCount[j] == 1) {
                  specialCount++;
                }
            }
        }
        return specialCount;
    }
}
// @leetup=code
