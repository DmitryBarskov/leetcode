# @param {Integer} x
# @return {Integer}
def reverse(x)
  (x <=> 0) * (x.abs.digits.reduce(I32.from_integer(0)) { |acc, d| acc * 10 + d }.to_i)
rescue ArgumentError
  0
end

class I32
  def self.from_integer(int)
    bits = Array.new(32) do |i|
      (int & (1 << i)) != 0 ? 1 : 0
    end
    bits[31] = int.negative? ? 1 : 0
    new(bits)
  end

  def initialize(bits)
    @bits = bits
  end

  def negative? = @bits.last == 1
  def negate = invert + I32.from_integer(1)
  def invert = I32.new(@bits.map { _1 ^ 1 })
  def [](i) = @bits[i]

  def +(other)
    result_bits = Array.new(32, 0)
    rem = 0
    32.times do |i|
      result_bits[i] = self[i] ^ other[i] ^ rem
      rem = (self[i] & other[i]) | (self[i] & rem) | (other[i] & rem)
      raise ArgumentError, "Overflow" if rem > 0 && i >= 30
    end

    I32.new(result_bits)
  end

  def *(other)
    result = I32.new(Array.new(32, 0))
    other.times do
      result += self
    end
    result
  end

  def to_i
    return 1 - negate.to_i if negative?

    @bits.reverse_each.reduce(0) { |acc, b| (acc << 1) | b }
  end
end
