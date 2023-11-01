# frozen_string_literal: true

# https://leetcode.com/problems/build-array-where-you-can-find-the-maximum-exactly-k-comparisons/

# TODO: num_of_arrays fails with TLE

MODULO = (1e10 + 7).to_i

def memoize(func)
  memo = {}

  lambda do |*args|
    return memo[args] if memo.key?(args)

    memo[args] = func.call(*args)
  end
end

# @param {Integer} n - size of resulting array
# @param {Integer} m - maximum value in array (all values in range 1..m)
# @param {Integer} k - search cost
# @return {Integer}
def num_of_arrays(*)
  rec_num_of_arrays = memoize(lambda do |n, m, k|
    return 0 if n <= 0 || m <= 0 || k <= 0

    return 0 if k > n
    return m if n == 1
    return 1 if m == 1 && k == 1
    return 0 if k > m

    return (1..m).map { _1**(n - 1) }.sum if k == 1

    total_arrays = 0
    (1..n).each do |maximum_index|
      (1..m).each do |maximum_value|
        total_arrays += rec_num_of_arrays.call(
          maximum_index - 1, maximum_value - 1, k - 1
        ) * (maximum_value**(n - maximum_index))
      end
    end
    total_arrays
  end)
  rec_num_of_arrays.call(*)
end

def fact = ->(n) { (1..n).reduce(1, :*) }
def cnk = ->(n, k) { fact.call(n) / (fact.call(k) * fact.call(n - k)) }
def stars_and_bars = ->(stars, bars) { cnk.call(stars + bars, bars) }

def num_of_arrays2(n, m, k)
  stars_and_bars.call(n - 1, k - 1) * cnk.call(m, k) * (m**(n - k))
end

# [a11 a12..a1x a21 a22..a2y .. ak1 ak2..akz]
# where ai1 - creates cost++
#       aij >= ait for j > t
#       ai1 < aj1 for i < j
#
# 1 1 1 = 1
# 1 1 2 = 0 return 0 if k > n
# 1 1 3 = 0
# 1 2 1 = 2
# 1 3 1 = 3 return m if n == 1
# 1 2 2 = 0
# 2 1 1 = 1 return 1 if m == 1 && k == 1
# 2 1 2 = 0 return 0 if k > m
# 2 2 1 = 3

def test(n, m, k, expected:)
  actual = num_of_arrays2(n, m, k)

  if actual == expected
    puts "✅ num_of_arrays(#{n}, #{m}, #{k}) = #{actual}"
  else
    puts "❌ num_of_arrays(#{n}, #{m}, #{k}) = #{actual}, expected #{expected}"
  end
end

test(2, 3, 1, expected: 6)
test(2, 2, 1, expected: 3) #=> [1, 1], [2, 1], [2, 2]
test(2, 2, 2, expected: 1) #=> [1, 2]

test(5, 2, 3, expected: 0)
test(9, 1, 1, expected: 1)

test(5, 2, 1, expected: 17) #=> [1,1,1,1,1], [2,1,1,1,1], [2,1,1,1,2],
test(5, 2, 2, expected: 15) #=> [1,1,1,1,2], [1,1,1,2,2], ... [1,2,x,y,z]
test(5, 4, 3, expected: 160)

test(50, 100, 25, expected: 34_549_172)
