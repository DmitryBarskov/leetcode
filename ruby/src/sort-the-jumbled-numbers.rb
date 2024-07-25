# @param {Integer[]} mapping
# @param {Integer[]} nums
# @return {Integer[]}
def sort_jumbled(mapping, nums)
  jumble = -> (num) {
    num.digits
      .map { mapping[_1] }
      .map.with_index { |digit, i| digit * (10 ** i) }
      .sum
  }
  nums.sort_by(&jumble)
end
