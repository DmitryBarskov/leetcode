// @leetup=custom
// @leetup=info id=242 lang=java slug=valid-anagram

/*
* Given two strings `s` and `t`, return `true` *if* `t` *is an anagram of* `s`*,
* and* `false` *otherwise*.
* 
* An Anagram is a word or phrase formed by rearranging the letters of a
* different word or phrase, typically using all the original letters exactly once.
* 
* 
* Example 1:
* 
* Input: s = "anagram", t = "nagaram"
* Output: true
* 
* Example 2:
* 
* Input: s = "rat", t = "car"
* Output: false
* 
* 
* Constraints:
* 
* * `1 <= s.length, t.length <= 5 * 104`
* * `s` and `t` consist of lowercase English letters.
* 
* 
* Follow up: What if the inputs contain Unicode characters? How would you
* adapt your solution to such a case?
* 
*/
// @leetup=custom
// @leetup=code

class Solution {
    public static boolean isAnagram(String s, String t) {
        if (s.length() != t.length()) {
            return false;
        }
        int[] sLetters = countLetters(s);
        int[] tLetters = countLetters(t);
        for (int i = 0; i < sLetters.length; i++) {
            if (sLetters[i] != tLetters[i]) {
                return false;
            }
        }
        return true;
    }

    static int[] countLetters(String s) {
        int[] letters = new int[26];
        for (int i = 0; i < s.length(); i++) {
            letters[s.charAt(i) - 'a']++;
        }
        return letters;
    }        
}
// @leetup=code
