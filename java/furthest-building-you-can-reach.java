import java.util.*;

public class Main {
  public static void main(String[] args) {
    System.out.println(
      Solution.furthestBuilding(new int[]{4,2,7,6,9,14,12}, 5, 1)
    );
    System.out.println(
      Solution.furthestBuilding(new int[]{4,12,2,7,3,18,20,3,19}, 10, 2)
    );
  }
}

class Solution {
  public static int furthestBuilding(int[] heights, int bricks, int ladders) {
    // wall is positive diff in height (heights[i] - heights[i - 1])
    Queue<Integer> largestKWalls = new PriorityQueue<>(); // using ladders to climb the walls
    int otherWalls = 0; // using bricks to climb these heights
    for (int i = 0; i < heights.length - 1; i++) {
      int wall = heights[i + 1] - heights[i];
      if (wall <= 0) { continue; }
      largestKWalls.offer(wall);

      if (largestKWalls.size() > ladders) {
        int brickWall = largestKWalls.poll();
        otherWalls += brickWall;
        if (otherWalls > bricks) {
          return i;
        }
      }
    }
    return heights.length - 1;
  }
}
