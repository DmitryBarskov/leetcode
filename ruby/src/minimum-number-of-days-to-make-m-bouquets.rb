# frozen_string_literal: true

# @param {Integer[]} bloom_day
# @param {Integer} m bouquets needed
# @param {Integer} k flowers in a bouquet
# @return {Integer}
def min_days(bloom_day, m, k)
  return -1 if m * k > bloom_day.size

  lo, hi = bloom_day.minmax
  lo -= 1
  hi += 1

  (lo..hi).bsearch do |day|
    number_of_bouquets(bloom_day, day, k) >= m
  end || -1
end

def number_of_bouquets(bloom_day, day, flowers_needed)
  bouquets = 0
  flowers_in_a_row = 0
  bloom_day.each do |flower|
    if flower <= day
      flowers_in_a_row += 1
    else
      flowers_in_a_row = 0
    end
    if flowers_in_a_row >= flowers_needed
      flowers_in_a_row = 0
      bouquets += 1
    end
  end
  bouquets
end

min_days([1,10,3,10,2], 3, 1) => 3
min_days([1,10,3,10,2], 3, 2) => -1
min_days([7,7,7,7,12,7,7], 2, 3) => 12
