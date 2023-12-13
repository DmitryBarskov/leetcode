# @leetup=custom
# @leetup=info id=17 lang=ruby slug=letter-combinations-of-a-phone-number

# Given a string containing digits from `2-9` inclusive, return all possible
# letter combinations that the number could represent. Return the answer in any
# order.
#
# A mapping of digits to letters (just like on the telephone buttons) is given
# below. Note that 1 does not map to any letters.
#
#
# Example 1:
#
# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
#
# Example 2:
#
# Input: digits = ""
# Output: []
#
# Example 3:
#
# Input: digits = "2"
# Output: ["a","b","c"]
#
#
# Constraints:
#
# * `0 <= digits.length <= 4`
# * `digits[i]` is a digit in the range `['2', '9']`.
#

# @leetup=custom
# @leetup=code
KEYPAD = {
  "2": "abc",
  "3": "def",
  "4": "ghi",
  "5": "jkl",
  "6": "mno",
  "7": "pqrs",
  "8": "tuv",
  "9": "wxyz"
}.map { |d, ls| [d.to_s, ls.split("")] }.to_h.freeze

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?

  digits.each_char.reduce([""]) do |arr, digit|
    arr.flat_map do |previous_chars|
      KEYPAD[digit].map { |letter| previous_chars + letter }
    end
  end
end
# @leetup=code

# @leetup=code
letter_combinations("23") => ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
letter_combinations("") => []
letter_combinations("2") => ["a", "b", "c"]
# @leetup=code
