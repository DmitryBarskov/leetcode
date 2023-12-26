# @leetup=custom
# @leetup=info id=438 lang=ruby slug=find-all-anagrams-in-a-string

# Given two strings `s` and `p`, return *an array of all the start indices of
# *`p`*'s anagrams in *`s`. You may return the answer in any order.
#
# An Anagram is a word or phrase formed by rearranging the letters of a
# different word or phrase, typically using all the original letters exactly once.
#
# Example 1:
#
# Input: s = "cbaebabacd", p = "abc"
# Output: [0,6]
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".
#
# Example 2:
#
# Input: s = "abab", p = "ab"
# Output: [0,1,2]
# Explanation:
# The substring with start index = 0 is "ab", which is an anagram of "ab".
# The substring with start index = 1 is "ba", which is an anagram of "ab".
# The substring with start index = 2 is "ab", which is an anagram of "ab".
#
# Constraints:
# * `1 <= s.length, p.length <= 3 * 10^4`
# * `s` and `p` consist of lowercase English letters.

# @leetup=custom
# @leetup=code

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if p.size > s.size

  window = Hash.new(0)
  (0...p.size).each do |i|
    window[s[i]] += 1
  end

  anagrams = []
  chars = count_chars(p)
  anagrams.push(0) if chars == window

  (p.size..s.size).each do |i|
    window[s[i]] += 1
    window[s[i - p.size]] -= 1
    window.delete(s[i - p.size]) if window[s[i - p.size]].zero?

    anagrams.push(i - p.size + 1) if window == chars
  end

  anagrams
end

def count_chars(str)
  str.each_char.each_with_object(Hash.new(0)) do |char, counts|
    counts[char] += 1
  end
end
# @leetup=code
# @leetup=custom
find_anagrams("cbaebabacd", "abc") => [0, 6]
find_anagrams("abab", "ab") => [0, 1, 2]
# @leetup=custom
