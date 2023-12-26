# @leetup=custom
# @leetup=info id=1160 lang=ruby slug=find-words-that-can-be-formed-by-characters

# You are given an array of strings `words` and a string `chars`.
#
# A string is good if it can be formed by characters from chars (each
# character can only be used once).
#
# Return *the sum of lengths of all good strings in words*.
#
#
# Example 1:
#
# Input: words = ["cat","bt","hat","tree"], chars = "atach"
# Output: 6
# Explanation: The strings that can be formed are "cat" and "hat" so the answe
# r is 3 + 3 = 6.
#
# Example 2:
#
# Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
# Output: 10
# Explanation: The strings that can be formed are "hello" and "world" so the a
# nswer is 5 + 5 = 10.
#
#
# Constraints:
#
# * `1 <= words.length <= 1000`
# * `1 <= words[i].length, chars.length <= 100`
# * `words[i]` and `chars` consist of lowercase English letters.
#

# @leetup=custom
# @leetup=code
def count_chars(str)
  str.each_char.each_with_object(Hash.new(0)) { |c, count| count[c] += 1 }
end

# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
  chars_count = count_chars(chars)
  words.filter_map do |word|
    word.length if count_chars(word).all? { _2 <= chars_count[_1] }
  end.sum
end
# @leetup=code
# @leetup=custom
count_characters(["cat", "bt", "hat", "tree"], "atach") => 6
count_characters(["hello", "world", "leetcode"], "welldonehoneyr") => 10
# @leetup=custom
