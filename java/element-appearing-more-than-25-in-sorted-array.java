// @leetup=custom
// @leetup=info id=1287 lang=java slug=element-appearing-more-than-25-in-sorted-array

/*
* Given an integer array sorted in non-decreasing order, there is exactly one
* integer in the array that occurs more than 25% of the time, return that integer.
* 
* 
* Example 1:
* 
* Input: arr = [1,2,2,6,6,6,6,7,10]
* Output: 6
* 
* Example 2:
* 
* Input: arr = [1,1]
* Output: 1
* 
* 
* Constraints:
* 
* * `1 <= arr.length <= 104`
* * `0 <= arr[i] <= 105`
* 
*/
public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().findSpecialInteger(new int[]{
          1,2,3,4,5,6,7,8,9,10,11,12,12,12,12
        }));
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public int findSpecialInteger(int[] arr) {
        int quarter = arr.length / 4;
        int[] candidates = new int[]{
          arr[1*quarter], arr[2*quarter],
          arr[3*quarter], arr[arr.length - 1]
        };
        for (int candidate : candidates) {
            if (countInSortedArray(arr, candidate) > quarter) {
                return candidate;
            }
        }
        return -1;
    }

    static int countInSortedArray(int[] arr, int target) {
        int firstIndex = bSearch(arr, target);
        int lastIndex = bSearch(arr, target + 1);
        return lastIndex - firstIndex;
    }

    // predicate = item >= target
    // array [0, 1, 2, 3, 4, 5, 6, 7] with target 5 translates to
    //       [f, f, f, f, f, t, t, t]
    static int bSearch(int[] arr, int target) {
        int lo = 0;
        int hi = arr.length;

        while (lo < hi) {
            int mi = lo + (hi - lo) / 2;

            if (arr[mi] >= target) {
                hi = mi;
            } else {
                lo = mi + 1;
            }
        }

        return lo;
    }
}
// @leetup=code
