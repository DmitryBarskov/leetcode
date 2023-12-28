// @leetup=custom
// @leetup=info id=1155 lang=java slug=number-of-dice-rolls-with-target-sum

/*
* You have `n` dice, and each die has `k` faces numbered from `1` to `k`.
*
* Given three integers `n`, `k`, and `target`, return *the number of possible ways
* (out of the *`kn`* total ways) to roll the dice, so the sum of the face-up
* numbers equals *`target`. Since the answer may be too large, return it
* modulo `10^9 + 7`.
*
*
* Example 1:
*
* Input: n = 1, k = 6, target = 3
* Output: 1
* Explanation: You throw one die with 6 faces.
* There is only one way to get a sum of 3.
*
* Example 2:
*
* Input: n = 2, k = 6, target = 7
* Output: 6
* Explanation: You throw two dice, each with 6 faces.
* There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
*
* Example 3:
*
* Input: n = 30, k = 30, target = 500
* Output: 222616187
* Explanation: The answer must be returned modulo 10^9 + 7.
*
*
* Constraints:
*
* * `1 <= n, k <= 30`
* * `1 <= target <= 1000`
*
*/
import java.util.*;

public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().numRollsToTarget(1, 6, 3));
        System.out.println(new Solution().numRollsToTarget(2, 6, 7));
        System.out.println(new Solution().numRollsToTarget(30, 30, 500));
        System.out.println(new Solution().numRollsToTarget(3, 6, 7));
    }
}
// @leetup=custom
// @leetup=code
class Solution {
    static final int MODULO = 1_000_000_007;

    public static int numRollsToTarget(int n, int k, int target) {
        int[] prev = new int[target + 1];
        int[] dp = new int[target + 1];
        Arrays.fill(dp, 1, Math.min(k, target) + 1, 1);
        for (int dice = 1; dice <= n; dice++) {
            for (int sum = 0; sum <= target; sum++) {
                for (int i = Math.max(sum - k, 0); i < sum; i++) {
                    dp[sum] = (dp[sum] + prev[i]) % MODULO;
                }
            }
            int[] tmp = prev;
            prev = dp;
            dp = tmp;
            Arrays.fill(dp, 0);
        }
        return prev[target];
    }
}
// @leetup=code
