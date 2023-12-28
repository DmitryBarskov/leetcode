// @leetup=custom
// @leetup=info id=1578 lang=java slug=minimum-time-to-make-rope-colorful

/*
* Alice has `n` balloons arranged on a rope. You are given a 0-indexed string
* `colors` where `colors[i]` is the color of the `ith` balloon.
*
* Alice wants the rope to be colorful. She does not want two consecutive
* balloons to be of the same color, so she asks Bob for help. Bob can remove
* some balloons from the rope to make it colorful. You are given a
* 0-indexed integer array `neededTime` where `neededTime[i]` is the time (in
* seconds) that Bob needs to remove the `ith` balloon from the rope.
*
* Return *the minimum time Bob needs to make the rope colorful*.
*
* Example 1:
* Input: colors = "abaac", neededTime = [1,2,3,4,5]
* Output: 3
* Explanation: In the above image, 'a' is blue, 'b' is red, and 'c' is green.
* Bob can remove the blue balloon at index 2. This takes 3 seconds.
* There are no longer two consecutive balloons of the same color. Total time = 3.
*
* Example 2:
* Input: colors = "abc", neededTime = [1,2,3]
* Output: 0
* Explanation: The rope is already colorful. Bob does not need to remove any b
* alloons from the rope.
*
* Example 3:
* Input: colors = "aabaa", neededTime = [1,2,3,4,1]
* Output: 2
* Explanation: Bob will remove the ballons at indices 0 and 4. Each ballon tak
* es 1 second to remove.
* There are no longer two consecutive balloons of the same color. Total time = 1 +
*  1 = 2.
*
* Constraints:
* * `n == colors.length == neededTime.length`
* * `1 <= n <= 105`
* * `1 <= neededTime[i] <= 104`
* * `colors` contains only lowercase English letters.
*/
public class Main {
    public static void main(String[] args) {
        System.out.println(Solution.minCost("abaac", new int[]{1,2,3,4,5}));
        System.out.println(Solution.minCost("abc", new int[]{1,2,3}));
        System.out.println(Solution.minCost("aabaa", new int[]{1,2,3,4,1}));
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public static int minCost(String colors, int[] neededTime) {
        int i = 0;
        int totalTime = 0;
        while (i < neededTime.length) {
            long res = sumInGroupExceptMax(colors, neededTime, i);
            int timeInGroup = (int) (res >> 32);
            i = (int) res;
            totalTime += timeInGroup;
        }
        return totalTime;
    }

    static long sumInGroupExceptMax(String groups, int[] array, int from) {
        char group = groups.charAt(from);
        int max = array[from];
        int sum = 0;
        int i = from;
        for (; i < array.length && groups.charAt(i) == group; i++) {
            sum += array[i];
            if (array[i] > max) {
                max = array[i];
            }
        }
        return ((long) (sum - max) << 32) + i;
    }
}
// @leetup=code
