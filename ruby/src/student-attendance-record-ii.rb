MOD = 1_000_000_007

# @param {Integer} n
# @return {Integer}
def check_record(n)
  dp = [
  # 0, 1, 2 = L
    1, 1, 0, # A = 0
    1, 0, 0, # A = 1
  ]

  (n - 1).times do
    dp = [
      (dp[0] + dp[1] + dp[2]) % MOD, dp[0], dp[1],
      dp.sum % MOD, dp[3], dp[4]
    ]
  end
  dp.sum % MOD
end

check_record(2) => 8
check_record(1) => 3
check_record(28) => 530803311
check_record(29) => 9569297
check_record(10101) => 183236316
check_record(99997) => 296857007
