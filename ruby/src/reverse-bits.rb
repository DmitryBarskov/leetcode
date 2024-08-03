# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  reversed = 0
  32.times do
    reversed = (reversed << 1) + (n & 1)
    n = (n >> 1)
  end
  reversed
end
