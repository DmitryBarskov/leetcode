// @leetup=custom
// @leetup=info id=2610 lang=java slug=convert-an-array-into-a-2d-array-with-conditions

/*
* You are given an integer array `nums`. You need to create a 2D array from `nums`
* satisfying the following conditions:
* 
* * The 2D array should contain only the elements of the array `nums`.
* * Each row in the 2D array contains distinct integers.
* * The number of rows in the 2D array should be minimal.
* 
* Return *the resulting array*. If there are multiple answers, return any of them.
* 
* Note that the 2D array can have a different number of elements on each row.
* 
* 
* Example 1:
* 
* Input: nums = [1,3,4,1,2,3,1]
* Output: [[1,3,4,2],[1,3],[1]]
* Explanation: We can create a 2D array that contains the following rows:
* - 1,3,4,2
* - 1,3
* - 1
* All elements of nums were used, and each row of the 2D array contains distinct i
* ntegers, so it is a valid answer.
* It can be shown that we cannot have less than 3 rows in a valid array.
* 
* Example 2:
* 
* Input: nums = [1,2,3,4]
* Output: [[4,3,2,1]]
* Explanation: All elements of the array are distinct, so we can keep all of t
* hem in the first row of the 2D array.
* 
* 
* Constraints:
* 
* * `1 <= nums.length <= 200`
* * `1 <= nums[i] <= nums.length`
* 
*/
import java.util.*;
// @leetup=custom
// @leetup=code

class Solution {
    public List<List<Integer>> findMatrix(int[] nums) {
        List<Set<Integer>> sets = new ArrayList<>();
        List<List<Integer>> matrix = new ArrayList<>();
        nextNum: for (int num : nums) {
            for (int i = 0; i < sets.size(); i++) {
                if (!sets.get(i).contains(num)) {
                    sets.get(i).add(num);
                    matrix.get(i).add(num);
                    continue nextNum;
                }
            }
            sets.add(new HashSet<>());
            sets.get(sets.size() - 1).add(num);
            matrix.add(new ArrayList<>());
            matrix.get(matrix.size() - 1).add(num);
        }
        return matrix;
    }
}
// @leetup=code
