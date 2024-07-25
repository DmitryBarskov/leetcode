# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
  coins.sort! { _2 <=> _1 }
  cache = Array.new(coins.size) { Array.new(amount + 1) }
  recur(coins, cache, amount, 0)
end

def recur(coins, cache, amount, i)
  return 1 if amount.zero?
  return 0 if amount.negative?
  return 0 if i >= coins.size

  cache[i][amount] ||= (i...coins.size).sum do |next_i|
    recur(coins, cache, amount - coins[next_i], next_ix)
  end
end
