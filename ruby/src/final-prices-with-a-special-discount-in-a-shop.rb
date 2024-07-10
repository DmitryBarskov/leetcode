# @param {Integer[]} prices
# @return {Integer[]}
def final_prices(prices)
  stack = []
  final = Array.new(prices.size)
  (prices.length - 1).downto(0) do |i|
    while stack.any? && stack.last > prices[i]
      stack.pop
    end
    final[i] = prices[i] - (stack.last || 0)
    stack.push(prices[i])
  end
  final
end

final_prices([8,4,6,2,3]) => [4,2,4,2,3]
final_prices([1,2,3,4,5]) => [1,2,3,4,5]
final_prices([10,1,1,6]) => [9,0,1,6]
