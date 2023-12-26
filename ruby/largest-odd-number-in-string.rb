# @leetup=custom
# @leetup=info id=1903 lang=ruby slug=largest-odd-number-in-string

# You are given a string `num`, representing a large integer. Return *the
# largest-valued odd integer (as a string) that is a non-empty substring
# of *`num`*, or an empty string *`""`* if no odd integer exists*.
#
# A substring is a contiguous sequence of characters within a string.
#
#
# Example 1:
#
# Input: num = "52"
# Output: "5"
# Explanation: The only non-empty substrings are "5", "2", and "52". "5" is th
# e only odd number.
#
# Example 2:
#
# Input: num = "4206"
# Output: ""
# Explanation: There are no odd numbers in "4206".
#
# Example 3:
#
# Input: num = "35427"
# Output: "35427"
# Explanation: "35427" is already an odd number.
#
#
# Constraints:
#
# * `1 <= num.length <= 105`
# * `num` only consists of digits and does not contain any leading zeros.
#

# @leetup=custom
# @leetup=code

# @param {String} num
# @return {String}
def largest_odd_number(num)
  num.slice(0, num.rindex(/[13579]/)&.succ || -1) || ""
end
# @leetup=code

# @leetup=custom
largest_odd_number("52") => "5"
largest_odd_number("4206") => ""
largest_odd_number("35427") => "35427"
largest_odd_number("") => ""
largest_odd_number("1") => "1"
largest_odd_number("2") => ""
largest_odd_number("99998") => "9999"
largest_odd_number("99899") => "99899"
# @leetup=custom
