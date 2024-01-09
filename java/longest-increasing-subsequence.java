// @leetup=custom
// @leetup=info id=300 lang=java slug=longest-increasing-subsequence

/*
* Given an integer array `nums`, return *the length of the longest strictly
* increasing subsequence*.
* 
* Example 1:
* Input: nums = [10,9,2,5,3,7,101,18]
* Output: 4
* Explanation: The longest increasing subsequence is [2,3,7,101], therefore th
* e length is 4.
* 
* Example 2:
* Input: nums = [0,1,0,3,2,3]
* Output: 4
* 
* Example 3:
* Input: nums = [7,7,7,7,7,7,7]
* Output: 1
* 
* Constraints:
* * `1 <= nums.length <= 2500`
* * `-104 <= nums[i] <= 104`
* 
* Follow up: Can you come up with an algorithm that runs in `O(n log(n))` time
* complexity?
*/
public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().lengthOfLIS(new int[]{10,9,2,5,3,7,101,18}));
        System.out.println(new Solution().lengthOfLIS(new int[]{0,1,0,3,2,3}));
        System.out.println(new Solution().lengthOfLIS(new int[]{7,7,7,7,7,7}));
        System.out.println(new Solution().lengthOfLIS(new int[]{1,3,6,7,9,4,10,5,6}));
        System.out.println("Must be 6: 1,3,6,7,9,10");
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public static int lengthOfLIS(int[] nums) {
        int[] lengthOfLisEndingAt = new int[nums.length];
        lengthOfLisEndingAt[0] = 1;
        for (int i = 1; i < lengthOfLisEndingAt.length; i++) {
            lengthOfLisEndingAt[i] = 1;
            for (int j = 0; j < i; j++) {
                if (nums[j] < nums[i] && lengthOfLisEndingAt[j] + 1 > lengthOfLisEndingAt[i]) {
                    lengthOfLisEndingAt[i] = lengthOfLisEndingAt[j] + 1;
                }
            }
        }
        int max = 1;
        for (int i = 0; i < lengthOfLisEndingAt.length; i++) {
            if (lengthOfLisEndingAt[i] > max) {
                max = lengthOfLisEndingAt[i];
            }
        }
        return max;
    }
}
// @leetup=code
