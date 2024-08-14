# Pretend it is hardcoded
ADD_TABLE = (0..9).to_h do |a|
  [a.to_s, (0..9).to_h { |b| [b.to_s, (a + b).digits.map(&:to_s)] }]
end.freeze

MUL_TABLE = (0..9).to_h do |a|
  [a.to_s, (0..9).to_h { |b| [b.to_s, (a * b).digits.map(&:to_s)] }]
end.freeze

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  mul(num1.chars.reverse, num2.chars.reverse).reverse.join
end

# mul(%w[0 2 3], %w[8 5]) => %w[0 6 5 8 1]
# equivalent to 320 * 58 => 18560
def mul(num1, num2)
  result = ['0']
  num2.each_with_index do |digit, power|
    add!(result, multiply_by_single_digit(num1, digit), offset: power)
  end
  result.pop while result.last == '0' && result.size > 1
  result
end

# multiply_by_single_digit(['4', '2', '3'], '4') => ['6', '9', '2', '1']
# equivalent to 324 * 4 => 1296
def multiply_by_single_digit(num, factor)
  result = []
  num.each_with_index do |digit, i|
    d, carry = MUL_TABLE[num[i] || '0'][factor]
    add!(result, [d], offset: i)
    carry!(result, carry, i + 1)
  end
  result
end

# a = ['1', '2', '3']
# add!(a, ['9', '4'])
# a => ['0', '7', '3']
# equivalent to
# a = 321
# a += 49
# a => 370
def add!(sum, addend, offset: 0)
  addend.each.with_index(offset) do |digit, i|
    r, carry = ADD_TABLE[sum[i] || '0'][digit]
    sum[i] = r
    carry!(sum, carry, i + 1)
  end
end

def carry!(sum, carry, index)
  while carry != '0' && carry
    res, carry = ADD_TABLE[sum[index] || '0'][carry]
    sum[index] = res
    index += 1
  end
end
