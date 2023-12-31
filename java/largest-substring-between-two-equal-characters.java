// @leetup=custom
// @leetup=info id=1624 lang=java slug=largest-substring-between-two-equal-characters

/*
* Given a string `s`, return *the length of the longest substring between two
* equal characters, excluding the two characters.* If there is no such substring
* return `-1`.
* 
* A substring is a contiguous sequence of characters within a string.
* 
* Example 1:
* Input: s = "aa"
* Output: 0
* Explanation: The optimal substring here is an empty substring between the tw
* o `'a's`.
* 
* Example 2:
* Input: s = "abca"
* Output: 2
* Explanation: The optimal substring here is "bc".
* 
* Example 3:
* Input: s = "cbzxy"
* Output: -1
* Explanation: There are no characters that appear twice in s.
* 
* 
* Constraints:
* * `1 <= s.length <= 300`
* * `s` contains only lowercase English letters.
*/
import java.util.*;
// @leetup=custom
// @leetup=code

class Solution {
    public int maxLengthBetweenEqualCharacters(String s) {
        int[] firstIndex = new int[26];
        Arrays.fill(firstIndex, -1);
        int maxLength = -1;
        for (int i = 0; i < s.length(); i++) {
            int code = s.charAt(i) - 'a';
            if (firstIndex[code] == -1) {
              firstIndex[code] = i;
            }
            maxLength = Math.max(maxLength, i - firstIndex[code] - 1);
        }
        return maxLength;
    }
}
// @leetup=code
