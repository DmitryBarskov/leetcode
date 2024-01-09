// @leetup=custom
// @leetup=info id=1235 lang=java slug=maximum-profit-in-job-scheduling

/*
* We have `n` jobs, where every job is scheduled to be done from `startTime[i]` to
* `endTime[i]`, obtaining a profit of `profit[i]`.
* 
* You're given the `startTime`, `endTime` and `profit` arrays, return the maximum
* profit you can take such that there are no two jobs in the subset with
* overlapping time range.
* 
* If you choose a job that ends at time `X` you will be able to start another job
* that starts at time `X`.
* 
* Example 1:
* https://assets.leetcode.com/uploads/2019/10/10/sample1_1584.png
* Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
* Output: 120
* Explanation: The subset chosen is the first and fourth job. 
* Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.
* 
* Example 2:
* https://assets.leetcode.com/uploads/2019/10/10/sample22_1584.png
* Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,
* 70,60]
* Output: 150
* Explanation: The subset chosen is the first, fourth and fifth job. 
* Profit obtained 150 = 20 + 70 + 60.
* 
* Example 3:
* https://assets.leetcode.com/uploads/2019/10/10/sample3_1584.png
* Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
* Output: 6
* 
* Constraints:
* * `1 <= startTime.length == endTime.length == profit.length <= 5 * 104`
* * `1 <= startTime[i] < endTime[i] <= 109`
* * `1 <= profit[i] <= 104`
*/
import java.util.*;
import java.util.function.*;

public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().jobScheduling(new int[]{1,2,3,3}, new int[]{3,4,5,6}, new int[]{50,10,40,70}));
        System.out.println(new Solution().jobScheduling(new int[]{1,2,3,4,6}, new int[]{3,5,10,6,9}, new int[]{20,20,100,70,60}));
        System.out.println(new Solution().jobScheduling(new int[]{1,1,1}, new int[]{2,3,4}, new int[]{5,6,4}));
        System.out.println(new Solution().jobScheduling(new int[]{6,15,7,11,1,3,16,2}, new int[]{19,18,19,16,10,8,19,8}, new int[]{2,9,1,19,5,7,3,19}));
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    static record Job(int startTime, int endTime, int profit) {}
    static ArrayList<Job> jobsFrom(int[] startTime, int[] endTime, int[] profit) {
        ArrayList<Job> jobs = new ArrayList<>(startTime.length);
        for (int i = 0; i < startTime.length; i++) {
            jobs.add(new Job(startTime[i], endTime[i], profit[i]));
        }
        return jobs;
    }

    public static int jobScheduling(int[] startTime, int[] endTime, int[] profit) {
        ArrayList<Job> jobs = jobsFrom(startTime, endTime, profit);
        jobs.sort(Comparator.comparing(Job::startTime));
        int[] results = new int[jobs.size()];
        return recur(jobs, 0, results);
    }

    static int recur(ArrayList<Job> jobs, int currentJobIndex, int[] memo) {
        if (currentJobIndex >= jobs.size()) {
            return 0;
        }
        if (memo[currentJobIndex] != 0) {
            return memo[currentJobIndex];
        }
        int profitSkippingCurrentJob = recur(jobs, currentJobIndex + 1, memo);
        Job currentJob = jobs.get(currentJobIndex);
        int currentJobEnd = currentJob.endTime();
        int profitWithCurrentJob = currentJob.profit() + recur(jobs, bsearch(jobs, (other) -> other.startTime() >= currentJobEnd, currentJobIndex, jobs.size()), memo);
        memo[currentJobIndex] = Math.max(profitSkippingCurrentJob, profitWithCurrentJob);
        return memo[currentJobIndex];
    }

    static <T, L extends RandomAccess & List<T>> int bsearch(L array, Predicate<T> predicate, int from, int to) {
        int lo = Math.max(from, 0);
        int hi = Math.max(to, array.size());
        while (lo < hi) {
            int mi = lo + (hi - lo) / 2;
            if (predicate.test(array.get(mi))) {
                hi = mi;
            } else {
                lo = mi + 1;
            }
        }
        return lo;
    }
}
// @leetup=code
