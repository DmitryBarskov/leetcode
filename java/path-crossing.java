// @leetup=custom
// @leetup=info id=1496 lang=java slug=path-crossing

/*
* Given a string `path`, where `path[i] = 'N'`, `'S'`, `'E'` or `'W'`, each
* representing moving one unit north, south, east, or west, respectively. You
* start at the origin `(0, 0)` on a 2D plane and walk on the path specified by
* `path`.
*
* Return `true` *if the path crosses itself at any point, that is, if at any time
* you are on a location you have previously visited*. Return `false` otherwise.
*
*
* Example 1:
*
* Input: path = "NES"
* Output: false
* Explanation: Notice that the path doesn't cross any point more than once.
*
* Example 2:
*
* Input: path = "NESWW"
* Output: true
* Explanation: Notice that the path visits the origin twice.
*
*
* Constraints:
*
* * `1 <= path.length <= 104`
* * `path[i]` is either `'N'`, `'S'`, `'E'`, or `'W'`.
*
*/
import java.util.*;
// @leetup=custom
// @leetup=code

class Solution {
    public static boolean isPathCrossing(String path) {
        HashSet<List<Integer>> points = new HashSet<>();
        int currentX = 0;
        int currentY = 0;
        points.add(List.of(currentX, currentY));
        for (int i = 0; i < path.length(); i++) {
            switch (path.charAt(i)) {
                case 'N' -> currentY++;
                case 'S' -> currentY--;
                case 'E' -> currentX++;
                case 'W' -> currentX--;
                default -> {}
            }
            boolean added = points.add(List.of(currentX, currentY));
            if (!added) {
                return false;
            }
        }
        return false;
    }
}
// @leetup=code
