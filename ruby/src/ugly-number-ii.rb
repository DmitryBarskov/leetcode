# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  next_min = { 2 => 0, 3 => 0, 5 => 0 }
  ugly_numbers = Array.new(n)
  ugly_numbers[0] = 1
  (1...n).each do |i|
    next_factor, prev_ugly = next_min.min_by { |k, j| k * ugly_numbers[j] }
    ugly_numbers[i] = next_factor * ugly_numbers[prev_ugly]
    next_min.each do |k, v|
      next_min[k] += 1 if ugly_numbers[v] * k == ugly_numbers[i]
    end
  end
  ugly_numbers.last
end
