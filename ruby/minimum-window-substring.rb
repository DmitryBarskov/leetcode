# @leetup=custom
# @leetup=info id=76 lang=ruby slug=minimum-window-substring

# Given two strings `s` and `t` of lengths `m` and `n` respectively, return *the
# minimum window* *substring of *`s`* such that every character in *`t`*
# (including duplicates) is included in the window*. If there is no such
# substring, return *the empty string *`""`.
# 
# The testcases will be generated such that the answer is unique.
# 
# Example 1:
# Input: s = "ADOBECODEBANC", t = "ABC"
# Output: "BANC"
# Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' 
# from string t.
# 
# Example 2:
# Input: s = "a", t = "a"
# Output: "a"
# Explanation: The entire string s is the minimum window.
# 
# Example 3:
# Input: s = "a", t = "aa"
# Output: ""
# Explanation: Both 'a's from t must be included in the window.
# Since the largest window of s only has one 'a', return empty string.
# 
# Constraints:
# * `m == s.length`
# * `n == t.length`
# * `1 <= m, n <= 105`
# * `s` and `t` consist of uppercase and lowercase English letters.
# 
# Follow up: Could you find an algorithm that runs in `O(m + n)` time?

# @leetup=custom
# @leetup=code

def contains?(counts_1, counts_2)
  counts_2.all? { |k, v| counts_1.fetch(k, 0) >= v }
end

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  t_count = t.each_char.group_by(&:itself).map { [_1, _2.length] }.to_h
  from = 0
  to = 0
  c_count = Hash.new(0)
  shortest_substr = nil
  while to <= s.length
    if contains?(c_count, t_count)
      if shortest_substr == nil || to - from < shortest_substr.size
        shortest_substr = from...to
      end
      c_count[s[from]] -= 1
      from += 1
    else
      c_count[s[to]] += 1
      to += 1
    end
  end
  if contains?(c_count, t_count) && (shortest_substr == nil || to - from < shortest_substr.size)
    shortest_substr = from...to
  end
 
  s[shortest_substr || (0...0)]
end
# @leetup=code
# @leetup=custom
min_window("ADOBECODEBANC", "ABC") => "BANC"
min_window("a", "a") => "a"
min_window("a", "aa") => ""
# @leetup=custom
