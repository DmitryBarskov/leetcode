# @leetup=custom
# @leetup=info id=1716 lang=ruby slug=calculate-money-in-leetcode-bank


# Hercy wants to save money for his first car. He puts money in the Leetcode bank
# every day.
#
# He starts by putting in `$1` on Monday, the first day. Every day from Tuesday to
# Sunday, he will put in `$1` more than the day before. On every subsequent
# Monday, he will put in `$1` more than the previous Monday.
#
# Given `n`, return *the total amount of money he will have in the Leetcode bank
# at the end of the *`nth`* day.*
#
#
# Example 1:
#
# Input: n = 4
# Output: 10
# Explanation: After the 4th day, the total is 1 + 2 + 3 + 4 = 10.
#
# Example 2:
#
# Input: n = 10
# Output: 37
# Explanation: After the 10th day, the total is (1 + 2 + 3 + 4 + 5 + 6 + 7) +
# (2 + 3 + 4) = 37. Notice that on the 2nd Monday, Hercy only puts in $2.
#
# Example 3:
#
# Input: n = 20
# Output: 96
# Explanation: After the 20th day, the total is (1 + 2 + 3 + 4 + 5 + 6 + 7) +
# (2 + 3 + 4 + 5 + 6 + 7 + 8) + (3 + 4 + 5 + 6 + 7 + 8) = 96.
#
#
# Constraints:
#
# * `1 <= n <= 1000`
#

# @leetup=custom
# @leetup=code
def sum(first, count, diff)
  first * count + diff * (count - 1) * count / 2
end

# @param {Integer} n
# @return {Integer}
def total_money(n)
  whole_week_days = n - n % 7

  sum(28, whole_week_days / 7, 7) + sum(whole_week_days / 7 + 1, n % 7, 1)
end
# @leetup=code

# @leetup=custom
total_money(4) => 10
total_money(10) => 37
total_money(20) => 96
# @leetup=custom
