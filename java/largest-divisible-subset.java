import java.util.*;

public class Main {
    public static void main(String[] args) {
        System.out.println(
            new Solution().largestDivisibleSubset(new int[]{3,4,16,8})
        );
        System.out.println(
            new Solution().largestDivisibleSubset(
                new int[]{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
            )
        );
        System.out.println(
            new Solution().largestDivisibleSubset(
                new int[]{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
            )
        );
        System.out.println(
            new Solution().largestDivisibleSubset(
                new int[]{2,4,6,9,19,81,729}
            )
        );
    }
}

class Solution {
    static class LList implements Iterable<Integer> {
        final int head;
        final LList rest;
        final int size;

        public LList(int head, LList rest) {
            this.head = head;
            this.rest = rest;
            this.size = rest == null ? 1 : rest.size + 1;
        }

        public int size() { return this.size; }

        @Override public Iterator<Integer> iterator() {
            LList current = this;
            return new Iterator<>() {
                LList remaining = current;

                @Override public boolean hasNext() {
                    return remaining != null;
                }

                @Override public Integer next() {
                    Integer head = remaining.head;
                    this.remaining = remaining.rest;
                    return head;
                }
            };
        }

        public ArrayList<Integer> toList() {
            ArrayList<Integer> list = new ArrayList<>();
            this.iterator().forEachRemaining(list::add);
            return list;
        }
        public String toString() {
            return toList().toString();
        }
    }

    public List<Integer> largestDivisibleSubset(int[] nums) {
        Arrays.sort(nums);
        ArrayList<ArrayList<LList>> memo = new ArrayList<>(nums.length);
        memo.add(new ArrayList<>());
        memo.get(0).add(new LList(nums[0], null));
        for (int i = 1; i < nums.length; i++) {
            // I have to find LARGEST subsets with all divisibles for memo[i]
            // For this I have to check all previous memo[j] subsets
            // if one of memo[j] can contain another nums[i] value
            // and this subset memo[j][k] + nums[i] is larger than any other
            // I should store it ...
            ArrayList<LList> largestSubsets = new ArrayList<>();
            for (int j = 0; j < i; j++) {
                for (int k = 0; k < memo.get(j).size(); k++) {
                    LList subset = memo.get(j).get(k);
                    while (subset != null && !divisible(subset.head, nums[i])) {
                        subset = subset.rest;
                    }
                    subset = new LList(nums[i], subset);
                    if (largestSubsets.size() == 0) {
                        largestSubsets.add(subset);
                    } else if (subset.size > largestSubsets.get(0).size) {
                        largestSubsets = new ArrayList<>();
                        largestSubsets.add(subset);
                    } else if (subset.size == largestSubsets.get(0).size) {
                        largestSubsets.add(subset);
                    }
                }
            }
            memo.add(largestSubsets);
        }
        System.out.println(memo);
        return memo.get(memo.size() - 1).get(0).toList();
    }

    static boolean divisible(int first, int second) {
        return first % second == 0 || second % first == 0;
    }

    static LList longest(LList l1, LList l2) {
        if (l1 == null) { return l2; }
        if (l2 == null) { return l1; }
        if (l1.size() >= l2.size()) {
            return l1;
        }
        return l2;
    }
}
