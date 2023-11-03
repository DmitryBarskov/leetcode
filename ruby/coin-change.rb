# frozen_string_literal: true

# https://leetcode.com/problems/coin-change/

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer} minimum number of coins to sum up the amount
def coin_change(coins, amount)
  # coin_change([1, 2, 5], 11)
  #  | 0 1 2 3 4 5 6 7 8 9 10 11
  # 0| 0 1 2 2 3 3 2 3 3 4 4  3
  # 1| 0 n 1 2 2 3 4 2 3 3 4  4
  # 2| 0 n n n n 1 2 2 3 3 2  3

  dp = Array.new(amount + 1) { Array.new(coins.size) }
  dp[0].fill(0)

  1.upto(amount) do |sum|
    coins.each_with_index do |coin, index|
      previous_sum_coins = sum.-(coin).negative? ? nil : dp[sum - coin]
      dp[sum][index] = previous_sum_coins&.compact&.min&.succ
    end
  end

  dp.last.compact.min || -1
end
