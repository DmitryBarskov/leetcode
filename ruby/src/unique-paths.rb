# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(n - 1, 1)
  (m - 1).times do
    (0...n - 1).each do |i|
      dp[i] += i == 0 ? 1 : dp[i - 1]
    end
  end
  dp.last || 1
end
