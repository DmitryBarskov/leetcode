# @leetup=custom
# @leetup=info id=1662 lang=ruby slug=check-if-two-string-arrays-are-equivalent


# Given two string arrays `word1` and `word2`, return* *`true`* if the two arrays
# represent the same string, and *`false`* otherwise.*
#
# A string is represented by an array if the array elements concatenated in
# order forms the string.
#
#
# Example 1:
#
# Input: word1 = ["ab", "c"], word2 = ["a", "bc"]
# Output: true
# Explanation:
# word1 represents string "ab" + "c" -> "abc"
# word2 represents string "a" + "bc" -> "abc"
# The strings are the same, so return true.
#
# Example 2:
#
# Input: word1 = ["a", "cb"], word2 = ["ab", "c"]
# Output: false
#
# Example 3:
#
# Input: word1  = ["abc", "d", "defg"], word2 = ["abcddefg"]
# Output: true
#
#
# Constraints:
#
# * `1 <= word1.length, word2.length <= 103`
# * `1 <= word1[i].length, word2[i].length <= 103`
# * `1 <= sum(word1[i].length), sum(word2[i].length) <= 103`
# * `word1[i]` and `word2[i]` consist of lowercase letters.
#

# @leetup=custom
# @leetup=code
def enumerate_string_array(array_of_string)
  Enumerator.new do |enum|
    array_of_string.each do |str|
      str.each_char do |c|
        enum.yield(c)
      end
    end
  end
end

def zip(*enums)
  Enumerator.new do |enumerator|
    has_next = enums.map { true }

    while has_next.any?
      zipped = enums.map.with_index do |enum, idx|
        next nil unless has_next[idx]

        enum.next
      rescue StopIteration
        has_next[idx] = false
        nil
      end
      enumerator.yield(zipped)
    end
  end
end

# @param {String[]} word1
# @param {String[]} word2
# @return {Boolean}
def array_strings_are_equal(word1, word2)
  zip(enumerate_string_array(word1), enumerate_string_array(word2)).each do |c1, c2|
    return false if c1 != c2
  end
  true
end
# @leetup=code
# @leetup=custom
array_strings_are_equal(["ab", "c"], ["a", "bc"]) => true
array_strings_are_equal(["a", "cb"], ["ab", "c"]) => false
array_strings_are_equal(["abc", "d", "defg"], ["abcddefg"]) => true
# @leetup=custom
