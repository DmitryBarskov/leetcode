# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  recur(prices, Array.new(prices.size) { Array.new(2) }, 0, 1)
end

def recur(prices, cache, i, can_buy)
  return 0 if i >= prices.size
  cache[i][can_buy] ||= begin
    if can_buy == 1
      bought = recur(prices, cache, i + 1, 0) - prices[i]
      cooled = recur(prices, cache, i + 1, 1)
      [bought, cooled].max
    else
      sold = recur(prices, cache, i + 2, 1) + prices[i]
      cooled = recur(prices, cache, i + 1, 0)
      [sold, cooled].max
    end
  end
end
