# frozen_string_literal: true

# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def count_prime_set_bits(left, right)
  (left..right).count { |num| prime?(one_bits(num)) }
end

def prime?(num)
  # max number of bits is 20 according to problem constraints ;)
  case num
  when 2, 3, 5, 7, 11, 13, 17, 19 then true
  else false
  end
end

def one_bits(num)
  ones = 0
  while num.positive?
    ones += num & 1
    num >>= 1
  end
  ones
end

count_prime_set_bits(6, 10) => 4
count_prime_set_bits(10, 15) => 5
