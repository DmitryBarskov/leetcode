import java.util.*;

class Solution {
    public static int longestSubarray(int[] nums, int limit) {
        int windowStart = 0;
        int windowEnd = 0;
        final SortedMap<Integer, Integer> values = new TreeMap<>();

        int longestSubarray = 0;

        while (windowEnd < nums.length) {
            while (windowEnd < nums.length) {
                values.compute(nums[windowEnd], (_k, v) -> v == null ? 1 : v + 1);
                windowEnd++;
                if (values.lastKey() - values.firstKey() <= limit) {
                    longestSubarray = Math.max(longestSubarray, windowEnd - windowStart);
                } else {
                    break;
                }
            }

            while (values.lastKey() - values.firstKey() > limit) {
                int count = values.compute(nums[windowStart], (_k, v) -> v - 1);
                if (count == 0) {
                    values.remove(nums[windowStart]);
                }
                windowStart++;
            }
        }

        return longestSubarray;
    }
}
