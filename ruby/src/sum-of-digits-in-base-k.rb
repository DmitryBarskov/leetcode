# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def sum_base(n, k)
  sum = 0
  while n > 0
    sum += n % k
    n /= k
  end
  sum
end
