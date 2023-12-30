# @leetup=custom
# @leetup=info id=1531 lang=ruby slug=string-compression-ii

# [Run-length encoding][1] is a string compression method that works by replacing
# consecutive identical characters (repeated 2 or more times) with the
# concatenation of the character and the number marking the count of the
# characters (length of the run). For example, to compress the string `"aabccc"`
# we replace `"aa"` by `"a2"` and replace `"ccc"` by `"c3"`. Thus the compressed
# string becomes `"a2bc3"`.
#
# Notice that in this problem, we are not adding `'1'` after single characters.
#
# Given a string `s` and an integer `k`. You need to delete at most `k`
# characters from `s` such that the run-length encoded version of `s` has minimum
# length.
#
# Find the *minimum length of the run-length encoded version of *`s`* after
# deleting at most *`k`* characters*.
#
# Example 1:
# Input: s = "aaabcccd", k = 2
# Output: 4
# Explanation: Compressing s without deleting anything will give us "a3bc3d" of le
# ngth 6. Deleting any of the characters 'a' or 'c' would at most decrease the len
# gth of the compressed string to 5, for instance delete 2 'a' then we will have s
#  = "abcccd" which compressed is abc3d. Therefore, the optimal way is to delete '
# b' and 'd', then the compressed version of s will be "a3c3" of length 4.
#
# Example 2:
# Input: s = "aabbaa", k = 2
# Output: 2
# Explanation: If we delete both 'b' characters, the resulting compressed string w
# ould be "a4" of length 2.
#
# Example 3:
# Input: s = "aaaaaaaaaaa", k = 0
# Output: 3
# Explanation: Since k is zero, we cannot delete anything. The compressed stri
# ng is "a11" of length 3.
#
# Constraints:
# * `1 <= s.length <= 100`
# * `0 <= k <= s.length`
# * `s` contains only lowercase English letters.
#
# [1]: http://en.wikipedia.org/wiki/Run-length_encoding
# @leetup=custom
# @leetup=code

# TODO:!
# @param {Integer} chars_to_remove
# @return {Integer}
def _get_length_of_optimal_compression(s, k)
  dp = Array.new(k + 1) { Array.new(s.length) { 0 } }
  dp[0][0] = 1
  same_cons_chars = Array.new(s.length)
  s.length.times do |i|
    same_cons_chars[i] = if i > 0 && s[i] == s[i - 1]
      same_cons_chars[i - 1] + 1
    else
      1
    end
  end

  (1...s.length).each do |i|
    dp[0][i] = if [1, 2, 9, 99].include?(same_cons_chars[i])
      dp[0][i - 1] + 1
    else
      dp[0][i - 1]
    end
  end
  # Input: s = "aaabcccd", k = 2
  # index / deleted chars to min length
  #    0 1 2 3 4 5 6 7
  #    a a a b c c c d
  #    1 2 3 1 1 2 3 1 <= consequitive chars
  #    ---------------
  # 0: 1 2 2 3 4 5 5 6
  # 1: 0 1 2 2 3 4 4 5
  # 2: 0 0 1 2 2 3 3 4
  # => 4
  # Input: s = "aabbaa", k = 2
  #    a a b b a a
  #    1 2 1 2 1 2
  #    -----------
  # 0: 1 2 3 4 5 6
  # 1: 0 1 2
  # 2: 0
  (1..k).each do |i|
    (0...s.length).each do |j|
      dp[i][j] = [
        # (dp[i - 1][j - 1]), # deleting current char
        (dp[i - 1][j - 1] if [1, 2, 10, 100].include?(same_cons_chars[j])), # deleting a char could make compressed string shorter (a2 -> a, a10 -> a9 etc)
        (dp[i][j - 1] if [3, 4, 5, 6, 7, 8, 9, 11, 12, 13].include?(same_cons_chars[j])), # not deleting won't add extra char
        (dp[i][j - 1] + 1)
      ].compact.min

      print "dp[#{i}][#{j}] = #{dp[i][j]} (scc #{same_cons_chars[j]}) "
    end
    puts
  end
  dp[k][s.length - 1]
end

def compress(str)
  str.each_with_object([]) do |c, code|
    next code.last[1] += 1 if code.any? && code.last[0] == c

    code.push([c, 1])
  end.map { (_2 == 1) ? _1 : "#{_1}#{_2}" }.join
end

def memoize(func)
  memo = {}
  ->(*args) {
    return memo[args] if memo.key?(args)

    memo[args] = func.call(*args)
  }.tap { _1.define_singleton_method(:memo) { memo } }
end

def messed_up?(str)
  chars_met = Set.new
  str.size.times do |i|
    next if i > 0 && str[i] == str[i - 1]

    return true if chars_met.include?(str[i])

    chars_met.add(str[i])
  end
  false
end

def chunks(str)
  str.each_with_object([]) do |c, code|
    next code.last[0] += 1 if code.any? && code.last[1] == c

    code.push([1, c])
  end
end

def removal_priority(block_size)
  case block_size
  when 1 then 1
  when 2 then 2
  else
    block_size % 10 + 3
  end
end

def size_of_compressed(chunks)
  chunks.map { (_1 == 1) ? _2 : "#{_2}#{_1}" }.join.size
end

def greedy(s, k)
  chunks(s.each_char)
    .sort_by { removal_priority(_1[0]) }
    .each do |chunk|
      next if k.zero?

      if k > chunk[0]
        k -= chunk[0]
        chunk[0] = 0
      else
        chunk[0] -= k
        k = 0
      end
    end
    .drop_while { |chunk| chunk[0] == 0 }
    .then { size_of_compressed(_1) }
end

def get_length_of_optimal_compression(s, k)
  recur = memoize(->(before, after, to_remove) {
    return before + after if to_remove <= 0
    return before if after.empty?

    current_char, *after = after

    return recur.call(before + [current_char], after, to_remove) if before.last == current_char && current_char == after.first

    [
      recur.call(before, after, to_remove - 1),
      recur.call(before + [current_char], after, to_remove)
    ].compact.min_by { compress(_1).size }
  })

  recur.call([], s.chars, k).then { size_of_compressed(chunks(_1)) }.tap { p recur.memo }
end

# @leetup=code

# @leetup=custom
get_length_of_optimal_compression("aaabcccd", 2) => 4
get_length_of_optimal_compression("aabbaa", 2) => 2
get_length_of_optimal_compression("aaaaaaaaaaa", 0) => 3
get_length_of_optimal_compression("a" * 11 + "b" * 10 + "c" * 9, 1) => 7
get_length_of_optimal_compression("aaabbaaaaca", 2) => 4
get_length_of_optimal_compression("a" * 100, 2) => 3
get_length_of_optimal_compression("a" * 100, 1) => 3
get_length_of_optimal_compression("a" * 12 + "b" * 12, 1) => 6
get_length_of_optimal_compression("b" * 12 + "b" * 12, 24) => 0
get_length_of_optimal_compression("a" + "b" * 49, 49) => 1
get_length_of_optimal_compression("a" * 2 + "b" * 98, 95) => 2

get_length_of_optimal_compression("abcdefghijklmnopqrstuvwxyz", 16) => 10
# get_length_of_optimal_compression("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz", 16) => 36
# get_length_of_optimal_compression("abcdefghijklmnopqrstuvwxyza", 16) => 11
# get_length_of_optimal_compression("cdcbccddcaccbabdadcbda", 20) => 2
# @leetup=custom
