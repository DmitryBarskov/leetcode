POWERS_OF_TWO = (0..30).map { |x| 1 << x }.to_set

# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  POWERS_OF_TWO.include?(n)
end
