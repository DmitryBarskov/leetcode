# @leetup=custom
# @leetup=info id=1155 lang=ruby slug=number-of-dice-rolls-with-target-sum

# You have `n` dice, and each die has `k` faces numbered from `1` to `k`.
#
# Given three integers `n`, `k`, and `target`, return *the number of possible ways
# (out of the *`kn`* total ways) to roll the dice, so the sum of the face-up
# numbers equals *`target`. Since the answer may be too large, return it
# modulo `109 + 7`.
#
# Example 1:
# Input: n = 1, k = 6, target = 3
# Output: 1
# Explanation: You throw one die with 6 faces.
# There is only one way to get a sum of 3.
#
# Example 2:
# Input: n = 2, k = 6, target = 7
# Output: 6
# Explanation: You throw two dice, each with 6 faces.
# There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
#
# Example 3:
# Input: n = 30, k = 30, target = 500
# Output: 222616187
# Explanation: The answer must be returned modulo 109 + 7.
#
# Constraints:
# * `1 <= n, k <= 30`
# * `1 <= target <= 1000`

# @leetup=custom
# @leetup=code
MODULO = 1_000_000_007

def memoize(func)
  memo = {}
  ->(*args) {
    memoized_value = memo[args]
    return memoized_value if memoized_value

    memo[args] = func.call(*args)
  }
end

# @param {Integer} n
# @param {Integer} k
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(n, k, target)
  rec = memoize(->(dice, sum) {
    return 0 if sum <= 0
    return 0 if dice.zero?
    return 1 if sum <= k && dice == 1
    return 0 if dice == 1

    (1..k).reduce(0) { |acc, edge| (acc + rec.call(dice - 1, sum - edge)) % MODULO }
  })
  rec.call(n, target)
end
# @leetup=code
# @leetup=custom
num_rolls_to_target(1, 6, 3) => 1
num_rolls_to_target(2, 6, 7) => 6
num_rolls_to_target(30, 30, 500) => 222616187
# @leetup=custom
