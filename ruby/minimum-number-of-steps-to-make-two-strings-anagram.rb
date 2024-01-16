# @leetup=custom
# @leetup=info id=1347 lang=ruby slug=minimum-number-of-steps-to-make-two-strings-anagram

# You are given two strings of the same length `s` and `t`. In one step you can
# choose any character of `t` and replace it with another character.
#
# Return *the minimum number of steps* to make `t` an anagram of `s`.
#
# An Anagram of a string is a string that contains the same characters with a
# different (or the same) ordering.
#
# Example 1:
# Input: s = "bab", t = "aba"
# Output: 1
# Explanation: Replace the first 'a' in t with b, t = "bba" which is anagram of s.
#
# Example 2:
# Input: s = "leetcode", t = "practice"
# Output: 5
# Explanation: Replace 'p', 'r', 'a', 'i' and 'c' from t with proper character
# s to make t anagram of s.
#
# Example 3:
# Input: s = "anagram", t = "mangaar"
# Output: 0
# Explanation: "anagram" and "mangaar" are anagrams.
#
# Constraints:
# * `1 <= s.length <= 5 * 104`
# * `s.length == t.length`
# * `s` and `t` consist of lowercase English letters only.

# @leetup=custom
# @leetup=code

# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t) =
  t.each_char.tally.merge(s.each_char.tally) { _2 - _3 }.sum { _2.abs } / 2
# @leetup=code
# @leetup=custom
min_steps("bab", "aba") => 1
min_steps("leetcode", "practice") => 5
min_steps("anagram", "mangaar") => 0
# @leetup=custom
