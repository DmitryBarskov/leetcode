// @leetup=custom
// @leetup=info id=1897 lang=java slug=redistribute-characters-to-make-all-strings-equal

/*
* You are given an array of strings `words` (0-indexed).
* 
* In one operation, pick two distinct indices `i` and `j`, where `words[i]` is
* a non-empty string, and move any character from `words[i]` to any
* position in `words[j]`.
* 
* Return `true` *if you can make every string in *`words`* equal using
* any number of operations*,* and *`false` *otherwise*.
* 
* 
* Example 1:
* 
* Input: words = ["abc","aabc","bc"]
* Output: true
* Explanation: Move the first 'a' in `words[1] to the front of words[2],
* to make ``words[1]` = "abc" and words[2] = "abc".
* All the strings are now equal to "abc", so return `true`.
* 
* Example 2:
* 
* Input: words = ["ab","a"]
* Output: false
* Explanation: It is impossible to make all the strings equal using the operat
* ion.
* 
* 
* Constraints:
* 
* * `1 <= words.length <= 100`
* * `1 <= words[i].length <= 100`
* * `words[i]` consists of lowercase English letters.
* 
*/
// @leetup=custom
// @leetup=code

class Solution {
    public static boolean makeEqual(String[] words) {
        int[] charsCount = new int[26];
        for (int i = 0; i < words.length; i++) {
            for (int j = 0; j < words[i].length(); j++) {
                charsCount[words[i].charAt(j) - 'a']++;
            }
        }
        for (int i = 0; i < charsCount.length; i++) {
            if (charsCount[i] % words.length != 0) {
                return false;
            }
        }
        return true;
    }
}
// @leetup=code
