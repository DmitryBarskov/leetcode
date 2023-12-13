// @leetup=custom
// @leetup=info id=1903 lang=java slug=largest-odd-number-in-string

/*
* You are given a string `num`, representing a large integer. Return *the
* largest-valued odd integer (as a string) that is a non-empty substring
* of *`num`*, or an empty string *`""`* if no odd integer exists*.
* 
* A substring is a contiguous sequence of characters within a string.
* 
* 
* Example 1:
* 
* Input: num = "52"
* Output: "5"
* Explanation: The only non-empty substrings are "5", "2", and "52". "5" is th
* e only odd number.
* 
* Example 2:
* 
* Input: num = "4206"
* Output: ""
* Explanation: There are no odd numbers in "4206".
* 
* Example 3:
* 
* Input: num = "35427"
* Output: "35427"
* Explanation: "35427" is already an odd number.
* 
* 
* Constraints:
* 
* * `1 <= num.length <= 105`
* * `num` only consists of digits and does not contain any leading zeros.
* 
*/
class Main {
    static <T> void assertEquals(T actual, T expected) {
        assert actual.equals(expected) : String.format("Expected '%s' to equal to '%s'", actual, expected);
    }
    public static void main(String[] args) {
        assertEquals(new Solution().largestOddNumber("35427"), "35427");
        assertEquals(new Solution().largestOddNumber(""), "");
        assertEquals(new Solution().largestOddNumber("4206"), "");
        assertEquals(new Solution().largestOddNumber("52"), "5");
    }
}
// @leetup=custom
// @leetup=code
class Solution {
    public String largestOddNumber(String num) {
        return num.substring(0, lastIndexOfOdd(num) + 1);
    }

    static int lastIndexOfOdd(String num) {
        for (int i = num.length() - 1; i >= 0; i--) {
            if (odd(num.charAt(i))) {
                return i;
            }
        }
        return -1;
    }

    static boolean odd(char c) {
        return c == '1' || c == '3' || c == '5' || c == '7' || c == '9';
    }
}
// @leetup=code
