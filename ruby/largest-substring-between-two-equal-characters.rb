# @leetup=custom
# @leetup=info id=1624 lang=ruby slug=largest-substring-between-two-equal-characters

# Given a string `s`, return *the length of the longest substring between two
# equal characters, excluding the two characters.* If there is no such substring
# return `-1`.
#
# A substring is a contiguous sequence of characters within a string.
#
# Example 1:
# Input: s = "aa"
# Output: 0
# Explanation: The optimal substring here is an empty substring between the tw
# o `'a's`.
#
# Example 2:
# Input: s = "abca"
# Output: 2
# Explanation: The optimal substring here is "bc".
#
# Example 3:
# Input: s = "cbzxy"
# Output: -1
# Explanation: There are no characters that appear twice in s.
#
#
# Constraints:
# * `1 <= s.length <= 300`
# * `s` contains only lowercase English letters.

# @leetup=custom
# @leetup=code

def max_length_between_equal_characters(s) =
  s.each_char.with_index.with_object({}) { |c, h|
    h[c[0]] ||= c[1]
    h[:max] = [h[:max], c[1] - h[c[0]] - 1].compact.max
  }[:max]

# @leetup=code
# @leetup=custom
max_length_between_equal_characters("aa") => 0
max_length_between_equal_characters("abca") => 2
max_length_between_equal_characters("cbzxy") => -1
# @leetup=custom
