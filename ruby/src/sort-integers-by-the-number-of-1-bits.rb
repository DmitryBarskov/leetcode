# @param {Integer[]} arr
# @return {Integer[]}
def sort_by_bits(arr)
  arr.sort_by { [_1.digits(2).count(1), _1] }
end
