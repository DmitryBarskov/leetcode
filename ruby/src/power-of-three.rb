# frozen_string_literal: true

# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  [1, 3, 9, 27, 81, 243, 729, 2187, 6561, 19_683, 59_049, 177_147, 531_441, 1_594_323, 4_782_969, 14_348_907, 43_046_721,
   129_140_163, 387_420_489, 1_162_261_467].include?(n)
end
