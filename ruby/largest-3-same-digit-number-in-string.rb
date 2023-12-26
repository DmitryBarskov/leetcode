# @leetup=custom
# @leetup=info id=2264 lang=ruby slug=largest-3-same-digit-number-in-string

# You are given a string `num` representing a large integer. An integer is
# good if it meets the following conditions:
#
# * It is a substring of `num` with length `3`.
# * It consists of only one unique digit.
#
# Return *the maximum good integer as a string or an empty string *`""`*
# if no such integer exists*.
#
# Note:
#
# * A substring is a contiguous sequence of characters within a string.
# * There may be leading zeroes in `num` or a good integer.
#
#
# Example 1:
#
# Input: num = "6777133339"
# Output: "777"
# Explanation: There are two distinct good integers: "777" and "333".
# "777" is the largest, so we return "777".
#
# Example 2:
#
# Input: num = "2300019"
# Output: "000"
# Explanation: "000" is the only good integer.
#
# Example 3:
#
# Input: num = "42352338"
# Output: ""
# Explanation: No substring of length 3 consists of only one unique digit. The
# refore, there are no good integers.
#
#
# Constraints:
#
# * `3 <= num.length <= 1000`
# * `num` only consists of digits.
#

# @leetup=custom
# @leetup=code

# @param {String} num
# @return {String}
def largest_good_integer(num)
  num.each_char.each_cons(3).reduce("") do |max, s|
    next max unless s[0] == s[1] && s[0] == s[2]

    [max, s.join].max
  end
end
# @leetup=code
# @leetup=custom
largest_good_integer("6777133339") => "777"
largest_good_integer("2300019") => "000"
largest_good_integer("42352338") => ""
# @leetup=custom
